unit sListBox;
{$I sDefs.inc}
//{$DEFINE LOGGED}

interface

uses
  StdCtrls, controls, classes, forms, graphics, messages, windows, sysutils,
  {$IFDEF LOGGED} sDebugMsgs, {$ENDIF}
  {$IFNDEF DELPHI5} Types, {$ENDIF}
  {$IFDEF DELPHI_XE2} UITypes, {$ENDIF}
  {$IFDEF TNTUNICODE} TntStdCtrls, TntClasses, {$ENDIF}
  acSBUtils, sConst, sDefaults, sCommonData;


type
{$IFNDEF NOTFORHELP}
{$IFDEF TNTUNICODE}
  TsCustomListBox = class(TTntListBox)
{$ELSE}
  TsCustomListBox = class(TListBox)
{$ENDIF}
  private
    FOnMouseEnter,
    FOnMouseLeave: TNotifyEvent;
    FBoundLabel: TsBoundLabel;
    FOnVScroll: TNotifyEvent;
    FullPaint: boolean;
    procedure SetDisabledKind(const Value: TsDisabledKind);
    procedure CNDrawItem  (var Message: TWMDrawItem); message CN_DRAWITEM;
    procedure WMPaint     (var Message: TWMPaint);    message WM_PAINT;
    procedure WMEraseBkGnd(var Message: TWMPaint);
{$IFDEF DELPHI6UP}
    function GetItemTextDirect(AIndex: integer): acString;
{$ENDIF}
  protected
    FAutoHideScroll: boolean;
    FCommonData: TsScrollWndData;
    FAutoCompleteDelay: Word;
    FDisabledKind: TsDisabledKind;
    procedure SetAutoHideScroll(const Value: boolean);
    procedure DrawItem(Index: Integer; Rect: TRect; State: TOwnerDrawState); override;
    procedure CreateParams(var Params: TCreateParams); override;
    procedure ChangeScale(M, D: Integer); override;
  public
    ListSW: TacScrollWnd;
    constructor Create(AOwner: TComponent); override;
    procedure CreateWnd; override;
    procedure Loaded; override;
    destructor Destroy; override;
    procedure WndProc(var Message: TMessage); override;
{$IFNDEF DELPHI6UP}
    function Count: integer;
{$ENDIF}
  published
    property AutoCompleteDelay: Word read FAutoCompleteDelay write FAutoCompleteDelay default 500;
    property AutoHideScroll: boolean read FAutoHideScroll write SetAutoHideScroll default True;
    property BoundLabel: TsBoundLabel read FBoundLabel write FBoundLabel;
    property DisabledKind: TsDisabledKind read FDisabledKind write SetDisabledKind default DefDisabledKind;
    property SkinData: TsScrollWndData read FCommonData write FCommonData;
    property OnMouseEnter: TNotifyEvent read FOnMouseEnter write FOnMouseEnter;
    property OnMouseLeave: TNotifyEvent read FOnMouseLeave write FOnMouseLeave;
    property OnVScroll:    TNotifyEvent read FOnVScroll    write FOnVScroll;
  end;
{$ENDIF} // NOTFORHELP

{$IFDEF DELPHI_XE3}[ComponentPlatformsAttribute(pidWin32 or pidWin64)]{$ENDIF}
  TsListBox = class(TsCustomListBox);


implementation

uses math,
  sVCLUtils, sMessages, sGraphUtils, sAlphaGraph, sSkinProps, acntUtils, sStyleSimply;


procedure TsCustomListBox.ChangeScale(M, D: Integer);
begin
  inherited ChangeScale(M, D);
  ItemHeight := MulDiv(ItemHeight, M, D);
end;


procedure TsCustomListBox.CNDrawItem(var Message: TWMDrawItem);
var
  State: TOwnerDrawState;
  XOffset: integer;
begin
//  if not InAnimationProcess then
  if SkinData.SkinIndex >= 0 then
    with Message.DrawItemStruct^ do begin
      State := TOwnerDrawState(LongRec(itemState).Lo);
      if Message.Result = 0 then begin // If received not from WM_PAINT handler
        if (Columns = 0) and (ListSW <> nil) and (ListSW.sBarHorz <> nil) and FullPaint then
          XOffset := ListSW.sBarHorz.ScrollInfo.nPos
        else
          XOffset := 0;

        OffsetRect(rcItem, XOffset, 0);
        State := State + [odReserved1];
      end;
      DrawItem(integer(itemID), rcItem, State);
    end
  else
    inherited;
end;


constructor TsCustomListBox.Create(AOwner: TComponent);
begin
  FCommonData := TsScrollWndData.Create(Self, True);
  FCommonData.COC := COC_TsListBox;
  inherited Create(AOwner);
  ControlStyle := ControlStyle - [csOpaque];
  FAutoCompleteDelay := 500;
  FAutoHideScroll := True;
//  if FCommonData.SkinSection = '' then
//    FCommonData.SkinSection := s_Edit;

  FDisabledKind := DefDisabledKind;
  FBoundLabel := TsBoundLabel.Create(Self, FCommonData);
  DoubleBuffered := False;
end;


procedure TsCustomListBox.CreateParams(var Params: TCreateParams);
begin
  inherited;
  if Style = lbStandard then
    Params.Style := Params.Style or LBS_OWNERDRAWFIXED and not LBS_OWNERDRAWVARIABLE;

  if not FAutoHideScroll then
    Params.Style := Params.Style or LBS_DISABLENOSCROLL;
end;


procedure TsCustomListBox.CreateWnd;
begin
  inherited;
  FCommonData.Loaded(False);
  if HandleAllocated then
    RefreshEditScrolls(SkinData, ListSW);
end;


destructor TsCustomListBox.Destroy;
begin
  if ListSW <> nil then
    FreeAndNil(ListSW);

  inherited Destroy;
  FreeAndNil(FCommonData);
  FreeAndNil(FBoundLabel);
end;


procedure TsCustomListBox.DrawItem(Index: Integer; Rect: TRect; State: TOwnerDrawState);
var
  w, h, XOffset, sNdx, l: integer;
  Bmp: Graphics.TBitmap;
  DrawStyle: Cardinal;
  bSelected: boolean;
  TmpColor: TColor;
  fs: TFontStyles;
  CI: TCacheInfo;
  SavedDC: hdc;
  aRect: TRect;
  s: PACChar;
begin
  if Index >= 0 then begin
    DrawStyle := DT_NOPREFIX or DT_EXPANDTABS or DT_SINGLELINE or DT_VCENTER or DT_NOCLIP;
    if UseRightToLeftReading then
      DrawStyle := DrawStyle or DT_RTLREADING or DT_RIGHT;

{$IFDEF DELPHI6UP}
    s := PacChar({$IFDEF TNTUNICODE}TTntStrings{$ENDIF}GetItemTextDirect(Index){(Items)[Index]});
{$ELSE}
    s := PacChar({$IFDEF TNTUNICODE}TTntStrings{$ENDIF}(Items)[Index]);
{$ENDIF}
    l := Items.Count;
    bSelected := (odSelected in State);
    if SkinData.Skinned then begin
      w := WidthOf (Rect, True);
      h := HeightOf(Rect, True);
      if (w > 0) and (h > 0) then begin
        Bmp := CreateBmp32(w, h);
        if (BorderStyle <> bsNone) and (ListSW <> nil) then
          CI := MakeCacheInfo(SkinData.FCacheBmp, ListSW.cxLeftEdge, ListSW.cxLeftEdge)
        else
          CI := MakeCacheInfo(SkinData.FCacheBmp);

        if (Columns = 0) and (ListSW <> nil) and (ListSW.sBarHorz <> nil) then
          XOffset := ListSW.sBarHorz.ScrollInfo.nPos
        else
          XOffset := 0;

        if odReserved1 in State then
          BitBlt(Bmp.Canvas.Handle, 0, 0, Bmp.Width, Bmp.Height, SkinData.FCacheBmp.Canvas.Handle, Rect.Left + CI.X - 2 * XOffset, Rect.Top + CI.Y, SRCCOPY)
        else
          BitBlt(Bmp.Canvas.Handle, 0, 0, Bmp.Width, Bmp.Height, SkinData.FCacheBmp.Canvas.Handle, Rect.Left + CI.X - XOffset, Rect.Top + CI.Y, SRCCOPY);

        if Assigned(OnDrawItem) then begin
          BitBlt(Canvas.Handle, Rect.Left - XOffset, Rect.Top, Bmp.Width, Bmp.Height, Bmp.Canvas.Handle, 0, 0, SRCCOPY);
          if bSelected then begin
            Canvas.Brush.Color := SkinData.SkinManager.GetHighLightColor(odFocused in State);
            Canvas.Font.Color := SkinData.SkinManager.GetHighLightFontColor(odFocused in State);
          end
          else begin
            Canvas.Brush.Color := Color;
            Canvas.Font.Color := Font.Color;
          end;
          SavedDC := SaveDC(Canvas.Handle);
          fs := Canvas.Font.Style;
          OnDrawItem(Self, Index, Rect, State);
          Canvas.Font.Style := fs;
          RestoreDC(Canvas.Handle, SavedDC);
          FreeAndNil(Bmp);
          Exit;
        end
        else begin
          if bSelected then begin
            sNdx := SkinData.SkinManager.ConstData.Sections[ssSelection];
            if sNdx < 0 then
              FillDC(Bmp.Canvas.Handle, MkRect(Bmp), SkinData.SkinManager.GetHighLightColor)
            else
              PaintItem(sNdx, CI, True, integer(odFocused in State), MkRect(Bmp), Rect.TopLeft, Bmp, SkinData.SkinManager)
          end
          else
            sNdx := -1;

          if IsValidIndex(Index, l) then begin
            Bmp.Canvas.Font.Assign(Font);
            aRect := MkRect(Bmp);
            InflateRect(aRect, -1, 0);
            if (ListSW <> nil) and (ListSW.cxLeftEdge < integer(BorderStyle = bsSingle) * (1 + integer(Ctl3D))) then
              inc(aRect.Left);

            if sNdx < 0 then begin
              if bSelected then
                Bmp.Canvas.Font.Color := SkinData.SkinManager.GetHighLightFontColor(odFocused in State)
              else
                if not SkinData.CustomFont then
                  with SkinData.SkinManager.gd[SkinData.SkinIndex] do
                    Bmp.Canvas.Font.Color := Props[integer(ControlIsActive(SkinData) and (States > 1))].FontColor.Color
                else
                  Bmp.Canvas.Font.Color := Font.Color;

              if odDisabled in State then
                Bmp.Canvas.Font.Color := BlendColors(Bmp.Canvas.Font.Color, Color, DefBlendDisabled);

              Bmp.Canvas.Brush.Style := bsClear;
              AcDrawText(Bmp.Canvas.Handle, s, aRect, DrawStyle);
            end
            else
              acWriteTextEx(Bmp.Canvas, PacChar(s), not (odDisabled in State), aRect, DrawStyle, sNdx, (odFocused in State), SkinData.SkinManager);

            if (odFocused in State) and (sNdx < 0) and bSelected then begin
              InflateRect(aRect, 1, 0);
              DrawFocusRect(Bmp.Canvas.Handle, aRect);
            end;
          end;
          if not Enabled then
            BmpDisabledKind(Bmp, DisabledKind, Parent, CI, Rect.TopLeft);
        end;
        BitBlt(Canvas.Handle, Rect.Left - XOffset, Rect.Top, Bmp.Width, Bmp.Height, Bmp.Canvas.Handle, 0, 0, SRCCOPY);
        FreeAndNil(Bmp);
      end;
    end
    else begin
      Canvas.Font.Assign(Font);
      if bSelected then begin
        TmpColor := ColorToRGB(clHighLight);
        Canvas.Font.Color := ColorToRGB(clHighLightText);
      end
      else begin
        TmpColor := ColorToRGB(Color);
        Canvas.Font.Color := ColorToRGB(Font.Color);
      end;
      FillDC(Canvas.Handle, Rect, TmpColor);
      Canvas.Brush.Color := TmpColor;
      if odDisabled in State then
        Canvas.Font.Color := BlendColors(ColortoRGB(Canvas.Font.Color), TmpColor, DefBlendDisabled);

      if Assigned(OnDrawItem) then begin
        OnDrawItem(Self, Index, Rect, State);
        if odFocused in State then begin
          InflateRect(Rect, 1, 0);
          DrawFocusRect(Canvas.Handle, Rect);
        end;
      end
      else begin
        InflateRect(Rect, -1, 0);
        if IsValidIndex(Index, Items.Count) then begin
          Canvas.Brush.Style := bsClear;
          AcDrawText(Canvas.Handle, s, Rect, DrawStyle);
          if odFocused in State then begin
            InflateRect(Rect, 1, 0);
            DrawFocusRect(Canvas.Handle, Rect);
          end;
        end;
      end;
    end;
  end;
end;

{$IFDEF DELPHI6UP}
function TsCustomListBox.GetItemTextDirect(AIndex: integer): acString;
var
  Len: Integer;
begin
  if Style in [lbVirtual, lbVirtualOwnerDraw] then
    Result := DoGetData(AIndex)
  else begin
    Len := TrySendMessage(Handle, LB_GETTEXTLEN, AIndex, 0);
    if Len <> LB_ERR then begin
      SetLength(Result, Len);
      if Len <> 0 then begin
        Len := TrySendMessage(Handle, LB_GETTEXT, AIndex, LPARAM(PChar(Result)));
        SetLength(Result, Len);
      end;
    end;
  end;
end;
{$ENDIF}


procedure TsCustomListBox.SetAutoHideScroll(const Value: boolean);
begin
  if FAutoHideScroll <> Value then begin
    FAutoHideScroll := Value;
    if not (csLoading in ComponentState) then
      RecreateWnd;
  end;
end;


procedure TsCustomListBox.SetDisabledKind(const Value: TsDisabledKind);
begin
  if FDisabledKind <> Value then begin
    FDisabledKind := Value;
    FCommonData.Invalidate;
  end;
end;


procedure TsCustomListBox.WMEraseBkGnd(var Message: TWMPaint);
begin
  Message.Result := 1;
end;


procedure TsCustomListBox.WMPaint(var Message: TWMPaint);
var
  PS: TPaintStruct;
  bw: integer;
  DC: hdc;

  procedure PaintListBox;
  var
    R: TRect;
    DrawItemMsg: TWMDrawItem;
    DrawItemStruct: TDrawItemStruct;
    MaxBottom, MaxRight, i: Integer;
    MeasureItemStruct: TMeasureItemStruct;
  begin
    FullPaint := True;
    R := MkRect(Width, 0);
    MaxBottom := 0;
    MaxRight := 0;
    for i := max(0, TopIndex) to Items.Count - 1 do begin
      R := ItemRect(i);
      if RectIsVisible(ClientRect, R) then begin
        MaxBottom := Max(R.Bottom, MaxBottom);
        MaxRight := Max(R.Right, MaxRight);
        DrawItemMsg.Msg := CN_DRAWITEM;
        DrawItemMsg.DrawItemStruct := @DrawItemStruct;
        DrawItemMsg.Ctl := Handle;
        DrawItemMsg.Result := 1;
        DrawItemStruct.CtlType := ODT_LISTBOX;
        DrawItemStruct.itemAction := ODA_DRAWENTIRE;
        if MultiSelect then begin
          DrawItemStruct.itemState := iff(Selected[i], ODS_SELECTED, 0);
          if (ItemIndex = i) and Focused then
            DrawItemStruct.itemState := DrawItemStruct.itemState or ODS_FOCUS;
        end
        else
          if ItemIndex = i then begin
            DrawItemStruct.itemState := ODS_SELECTED;
            if Focused then
              DrawItemStruct.itemState := DrawItemStruct.itemState or ODS_FOCUS;
          end
          else
            DrawItemStruct.itemState := 0;

        DrawItemStruct.hDC := DC;
        DrawItemStruct.CtlID := Handle;
        DrawItemStruct.hwndItem := Handle;
        DrawItemStruct.rcItem := R;

        MeasureItemStruct.itemWidth := WidthOf(R);
        MeasureItemStruct.itemHeight := ItemHeight;
        if IsValidIndex(i, Items.Count) and (GetItemData(i) <> LB_ERR) then
          DrawItemStruct.itemData := DWORD(Pointer(Items.Objects[I]))
        else
          DrawItemStruct.itemData := 0;
          
        DrawItemStruct.itemID := I;
        Dispatch(DrawItemMsg);
      end
      else
        Break;
    end;
    if R.Bottom < Height - 4 then
      BitBlt(DC, R.Left, R.Bottom, Width, Height - R.Bottom - bw, FCommonData.FCacheBmp.Canvas.Handle, R.Left + bw, R.Bottom + bw, SRCCOPY);

    if R.Right < Width - 4 then
      BitBlt(DC, R.Right, 0, Width - bw - R.Right, R.Bottom, FCommonData.FCacheBmp.Canvas.Handle, R.Right, bw, SRCCOPY);

    if R.Left > 2 then
      BitBlt(DC, 0, MaxBottom, R.Left, Height - MaxBottom - bw, FCommonData.FCacheBmp.Canvas.Handle, bw, MaxBottom + bw, SRCCOPY);

    if (R.Right > Width - 6) then
      BitBlt(DC, MaxRight, 0, Width - MaxRight - bw, R.Bottom, FCommonData.FCacheBmp.Canvas.Handle, MaxRight + bw, bw, SRCCOPY);

    FullPaint := False;
  end;

begin
{  if InAnimationProcess then begin
    BeginPaint(Handle, PS);
    EndPaint(Handle, PS);
  end
  else}
    if (SkinData.Skinned or (Style in [{lbOwnerDrawFixed, }lbOwnerDrawVariable])) then begin
      if Message.DC <> 0 then
        DC := Message.DC
      else begin
        BeginPaint(Handle, PS);
        DC := GetDC(Handle);
      end;
      if not InUpdating(SkinData) then begin
        if (BorderStyle <> bsNone) and (ListSW <> nil) then
          bw := iff(Ctl3d, ListSW.cxLeftEdge, 1)
        else
          bw := 0;

        Canvas.Handle := DC;
        Canvas.Lock;
        Canvas.Font.Assign(Font);
        PaintListBox;
        Canvas.UnLock;
        Canvas.Handle := 0;
      end;
      if Message.DC <> DC then begin
        ReleaseDC(Handle, DC);
        EndPaint(Handle, PS);
      end;
    end
    else
      inherited;
end;


procedure TsCustomListBox.WndProc(var Message: TMessage);
var
  M: TMessage;
begin
{$IFDEF LOGGED}
  AddToLog(Message);
{$ENDIF}
  case Message.Msg of
    SM_ALPHACMD: begin
      case Message.WParamHi of
        AC_CTRLHANDLED:
          Message.Result := 1;

        AC_REMOVESKIN:
          if ACUInt(Message.LParam) = ACUInt(SkinData.SkinManager) then
            if ListSW <> nil then
              FreeAndNil(ListSW);

        AC_REFRESH:
          if ACUInt(Message.LParam) = ACUInt(SkinData.SkinManager) then begin
            if HandleAllocated then
              RefreshEditScrolls(SkinData, ListSW);

            CommonMessage(Message, FCommonData);
            if not InAnimationProcess then
              RedrawWindow(Handle, nil, 0, RDWA_REPAINT);
          end;

        AC_SETNEWSKIN:
          if ACUInt(Message.LParam) = ACUInt(SkinData.SkinManager) then
            CommonMessage(Message, FCommonData);

        AC_GETCONTROLCOLOR:
          if not FCommonData.Skinned then
            Message.Result := ColorToRGB(Color);

        AC_ENDUPDATE:
          Perform(CM_INVALIDATE, 0, 0);

        AC_GETDEFINDEX: begin
          if FCommonData.SkinManager <> nil then
            Message.Result := FCommonData.SkinManager.ConstData.Sections[ssEdit] + 1;

          Exit;
        end
      end;
      if SkinData.Skinned then // Do not call it again
        Exit;
    end;

    CM_MOUSEENTER, CM_MOUSELEAVE: begin
      CommonWndProc(Message, FCommonData);
      inherited;
      if Enabled and not (csDesigning in ComponentState) then
        case SkinData.FMouseAbove of
          True:  if Assigned(FOnMouseEnter) then FOnMouseEnter(Self);
          False: if Assigned(FOnMouseLeave) then FOnMouseLeave(Self);
        end;

      Exit;
    end;

    WM_PRINT:
      if (Style <> lbStandard) and (TWMPaint(Message).DC <> 0) then begin
        Canvas.Handle := TWMPaint(Message).DC;
        M := MakeMessage(WM_PAINT, Message.WParam, Message.LParam, 0);
        WMPaint(TWMPaint(M));
        Ac_NCDraw(ListSW, Handle, -1, TWMPaint(Message).DC);
        Exit;
      end;
  end;

  if not ControlIsReady(Self) or not FCommonData.Skinned then
    inherited
  else begin
    case Message.Msg of
      WM_VSCROLL, WM_HSCROLL: begin
        SendMessage(Handle, WM_SETREDRAW, 0, 0);
        SkinData.FUpdating := True;
      end;

      WM_ERASEBKGND: begin
        if SkinData.FUpdating then
          Exit;

        if TWMPaint(Message).DC <> 0 then
          WMEraseBkGnd(TWMPaint(Message));

        if Message.Result = 1 then
          Exit;
      end;

      WM_MOUSEWHEEL:
        SendMessage(Handle, WM_SETREDRAW, 0, 0);
    end;
    CommonWndProc(Message, FCommonData);
    inherited;
    case Message.Msg of
      WM_MOUSEWHEEL: begin
        SendMessage(Handle, WM_SETREDRAW, 1, 0);
        InvalidateRect(Handle, nil, False);
      end;

      WM_VSCROLL, WM_HSCROLL: begin
        SendMessage(Handle, WM_SETREDRAW, 1, 0);
        SkinData.FUpdating := False;
        if Message.Msg = WM_HSCROLL then
          Invalidate
        else
          RedrawWindow(Handle, nil, 0, RDW_INVALIDATE or RDW_UPDATENOW);
      end;

      WM_ENABLE:
        if Visible and not (csLoading in ComponentState) then begin
          FCommonData.BGChanged := True;
          RedrawWindow(Handle, nil, 0, RDW_INVALIDATE or RDW_UPDATENOW or RDW_ERASE);
        end;
    end;
  end;
  // Aligning of the bound label
  case Message.Msg of
    WM_SIZE, WM_WINDOWPOSCHANGED:
      if not (csDestroying in ComponentState) and Assigned(BoundLabel) and Assigned(BoundLabel.FtheLabel) then
        BoundLabel.AlignLabel;

    CM_VISIBLECHANGED:
      if Assigned(BoundLabel) and Assigned(BoundLabel.FtheLabel) then begin
        BoundLabel.FtheLabel.Visible := Visible;
        BoundLabel.AlignLabel
      end;

    CM_ENABLEDCHANGED:
      if Assigned(BoundLabel) and Assigned(BoundLabel.FtheLabel) then begin
        BoundLabel.FtheLabel.Enabled := Enabled or not (dkBlended in DisabledKind);
        BoundLabel.AlignLabel
      end;

    CM_BIDIMODECHANGED:
      if Assigned(BoundLabel) and Assigned(BoundLabel.FtheLabel) then begin
        BoundLabel.FtheLabel.BiDiMode := BiDiMode;
        BoundLabel.AlignLabel
      end;

    CM_FONTCHANGED:
      if (Style = lbStandard) and ([csLoading, csFreeNotification] * ComponentState = []) and
           HandleAllocated and IsWindowVisible(Handle) and (SkinData.CtrlSkinState and ACS_CHANGING = 0) then begin
        Canvas.Font.Assign(Font);
        ItemHeight := Canvas.TextHeight('Ag') + 3;
      end;

    WM_VSCROLL:
      if Assigned(FOnVScroll) then
        FOnVScroll(Self);
  end;
end;


{$IFNDEF DELPHI6UP}
function TsCustomListBox.Count: integer;
begin
  Result := Items.Count;
end;
{$ENDIF}


procedure TsCustomListBox.Loaded;
begin
  inherited;
  FCommonData.Loaded(False);
  if HandleAllocated then
    RefreshEditScrolls(SkinData, ListSW);
end;

end.

