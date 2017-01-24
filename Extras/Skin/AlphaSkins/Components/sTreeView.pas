unit sTreeView;
{$I sDefs.inc}
//{$DEFINE LOGGED}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, ComCtrls, Commctrl,
  {$IFNDEF DELPHI5} Types, {$ENDIF}
  {$IFDEF DELPHI_XE2} UITypes, {$ENDIF}
  {$IFDEF TNTUNICODE} TntComCtrls, {$ENDIF}
  sConst, sCommonData, sMessages, acSBUtils;


type
{$IFDEF DELPHI_XE3}[ComponentPlatformsAttribute(pidWin32 or pidWin64)]{$ENDIF}
{$IFDEF TNTUNICODE}
  TsTreeView = class(TTntTreeView)
{$ELSE}
  TsTreeView = class(TTreeView)
{$ENDIF}
{$IFNDEF NOTFORHELP}
  private
    FLastHoverItem: TTreeNode;
    FBoundLabel: TsBoundLabel;
    FCommonData: TsScrollWndData;
    FOldDrawItem: TTVAdvancedCustomDrawItemEvent;
  protected
    procedure WndProc(var Message: TMessage); override;
{$IFDEF DELPHI7UP}
    function IsCustomDrawn(Target: TCustomDrawTarget; Stage: TCustomDrawStage): Boolean; override;
{$ENDIF}
    procedure Loaded; override;
    procedure InitEvents; virtual;
    procedure SkinCustomDrawItem(Sender: TCustomTreeView; Node: TTreeNode; State: TCustomDrawState; Stage: TCustomDrawStage; var PaintImages, DefaultDraw: Boolean);
  public
    ListSW: TacScrollWnd;
    FRightNode: TTreeNode;
    constructor Create(AOwner: TComponent); override;
    procedure AfterConstruction; override;
    destructor Destroy; override;
    procedure UpdateLastHoverNode;
  published
{$ENDIF} // NOTFORHELP
    property BoundLabel: TsBoundLabel read FBoundLabel write FBoundLabel;
    property SkinData: TsScrollWndData read FCommonData write FCommonData;
  end;


{$IFDEF DELPHI_XE3}[ComponentPlatformsAttribute(pidWin32 or pidWin64)]{$ENDIF}
  TsTreeViewEx = class(TsTreeView)
{$IFNDEF NOTFORHELP}
  private
    FCheckboxes,
    FAutoChildCheck: boolean;

    LastBottom: integer;
    procedure SetCheckboxes(const Value: boolean);
    procedure PaintItems(DC: hdc);
    procedure WMPaint     (var Message: TWMPaint); message WM_PAINT;
    procedure WMEraseBkGnd(var Message: TWMPaint);
    procedure WMNCPaint(var Message: TMessage);
  protected
    procedure UpdateColors;
    procedure InitEvents; override;
    procedure DrawItem(aDC: hdc; Node: TTreeNode; State: TCustomDrawState);
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
  public
    constructor Create(AOwner: TComponent); override;
    procedure CreateWnd; override;
    procedure WndProc(var Message: TMessage); override;
    function GetChecked(Node: TTreeNode): Boolean;
    procedure SetChecked(Node: TTreeNode; Checked: Boolean);
  published
{$ENDIF} // NOTFORHELP
    property AutoChildCheck: boolean read FAutoChildCheck write FAutoChildCheck default False;
    property Checkboxes: boolean read FCheckboxes write SetCheckboxes default False;
  end;


function GetNodeByText(const TreeView: TCustomTreeView; const s: acString): TTreeNode;

implementation

uses
  StdCtrls, math,
  {$IFDEF LOGGED}sDebugMsgs, {$ENDIF}
  sVclUtils, sStyleSimply, acntUtils, sGraphUtils, sAlphaGraph, sSkinProps, sSkinManager;


function GetNodeByText(const TreeView: TCustomTreeView; const s: acString): TTreeNode;
var
  i, l: integer;
begin
  Result := nil;
  with TTreeView(TreeView) do begin
    l := Items.Count - 1;
    for i := 0 to l do
      if acSameText(Items[i].Text, s) then begin
        Result := Items[i];
        Break;
      end;
  end;
end;


procedure TsTreeView.AfterConstruction;
begin
  inherited;
  FCommonData.Loaded(False);
  if HandleAllocated then
    RefreshTreeScrolls(SkinData, ListSW, Self is TsTreeViewEx);
end;


constructor TsTreeView.Create(AOwner: TComponent);
begin
  FCommonData := TsScrollWndData.Create(Self, True);
  FCommonData.COC := COC_TsTreeView;
  inherited;
  FBoundLabel := TsBoundLabel.Create(Self, FCommonData);
  FLastHoverItem := nil;
  FOldDrawItem := nil;
  FRightNode := nil;
end;


destructor TsTreeView.Destroy;
begin
  if ListSW <> nil then
    FreeAndNil(ListSW);

  inherited Destroy;
  FreeAndNil(FBoundLabel);
  FreeAndNil(FCommonData);
end;


procedure TsTreeView.InitEvents;
var
  TempEvent: TTVAdvancedCustomDrawItemEvent;
begin
  if not (csDesigning in ComponentState) then begin
    if Assigned(OnAdvancedCustomDrawItem) and not Assigned(FOldDrawItem) then begin
      TempEvent := SkinCustomDrawItem;
      if addr(TempEvent) <> addr(OnAdvancedCustomDrawItem) then
        FOldDrawItem := OnAdvancedCustomDrawItem;
    end;
    OnAdvancedCustomDrawItem := SkinCustomDrawItem;
  end;
end;


{$IFDEF DELPHI7UP}
function TsTreeView.IsCustomDrawn(Target: TCustomDrawTarget; Stage: TCustomDrawStage): Boolean;
begin
  if (SkinData <> nil) and (SkinData.FUpdateCount > 0) then
    Result := False
  else
    Result := inherited IsCustomDrawn(Target, Stage);
end;
{$ENDIF}


procedure TsTreeView.Loaded;
begin
  inherited Loaded;
  FCommonData.Loaded(False);
  RefreshTreeScrolls(SkinData, ListSW, Self is TsTreeViewEx);
  InitEvents;
end;


const
  TVIS_CHECKED = $2000;

  LT_FIRST  = 1;
  LT_MIDDLE = 2;
  LT_LAST   = 4;
  LT_LINEALL = LT_FIRST or LT_MIDDLE or LT_LAST;

  BtnSize = 9;

type
  TtvLineType = (ltNone, ltFirst, Closed, ltOpened, ltChild);
  TBtnArray = array [0..BtnSize - 1, 0..BtnSize - 1] of byte;


const
  BArrayClosed: TBtnArray = (
    ($D0, $D0, $D0, $D0, $D0, $D0, $D0, $D0, $D0),
    ($D0,   0,   0,   0,   0,   0,   0,   0, $D0),
    ($D0,   0,   0,   0, $FF,   0,   0,   0, $D0),
    ($D0,   0,   0,   0, $FF,   5,   0,   0, $D0),
    ($D0,   0, $FF, $FF, $FF, $FF, $FF,   0, $D0),
    ($D0,   0,   0,   0, $FF,   5,   0,   0, $D0),
    ($D0,   0,   0,   0, $FF,   0,   0,   0, $D0),
    ($D0,   0,   0,   0,   0,   0,   0,   0, $D0),
    ($D0, $D0, $D0, $D0, $D0, $D0, $D0, $D0, $D0)
  );
  BArrayOpened: TBtnArray = (
    ($D0, $D0, $D0, $D0, $D0, $D0, $D0, $D0, $D0),
    ($D0,   0,   0,   0,   0,   0,   0,   0, $D0),
    ($D0,   0,   0,   0,   0,   0,   0,   0, $D0),
    ($D0,   0,   0,   0,   0,   5,   0,   0, $D0),
    ($D0,   0, $FF, $FF, $FF, $FF, $FF,   0, $D0),
    ($D0,   0,   0,   0,   0,   5,   0,   0, $D0),
    ($D0,   0,   0,   0,   0,   0,   0,   0, $D0),
    ($D0,   0,   0,   0,   0,   0,   0,   0, $D0),
    ($D0, $D0, $D0, $D0, $D0, $D0, $D0, $D0, $D0)
  );


procedure TsTreeView.SkinCustomDrawItem(Sender: TCustomTreeView; Node: TTreeNode; State: TCustomDrawState; Stage: TCustomDrawStage; var PaintImages, DefaultDraw: Boolean);
var
  RowBmp, TmpBmp, Bmp: TBitmap;
  DisabledKind: TsDisabledKind;
  fRect, nRect, aRect: TRect;
  b, bSelected: boolean;
  NodeAtPos: TTreeNode;
  DrawStyle: Cardinal;
  cx, sNdx: integer;
  CI: TCacheInfo;
  p: TPoint;

  procedure CallEvents;
  begin
    DefaultDraw := True;
    if Assigned(FOldDrawItem) then
      FOldDrawItem(Sender, Node, State, Stage, PaintImages, DefaultDraw);

    if Assigned(OnCustomDrawItem) then
      OnCustomDrawItem(Sender, Node, State, DefaultDraw);
  end;

  procedure PaintBtn(aPoint: TPoint; aClosed: boolean; CI: TCacheInfo);
  var
    Rct: TRect;
    Col: TsColor;
    BtnArray: TBtnArray;
    S, S0: PRGBAArray_S;
    D, D0: PRGBAArray_D;
    X, Y, DeltaS, DeltaD, DeltaX: integer;
  begin
    Rct.Left := aPoint.X - BtnSize div 2;
    Rct.Top  := aPoint.Y - BtnSize div 2;
    Rct.Right := Rct.Left + BtnSize;
    Rct.Bottom := Rct.Top + BtnSize;
    Col.C := SkinData.SkinManager.GetHighLightFontColor(Focused);;

    if aClosed then
      BtnArray := BArrayClosed
    else
      BtnArray := BArrayOpened;

    if Rct.Left < 0 then begin
      DeltaX := BtnSize + Rct.Left;
      Rct.Left := 0;
    end
    else
      DeltaX := BtnSize;

    if InitLine(RowBmp, Pointer(D0), DeltaD) and InitLine(Ci.Bmp, Pointer(S0), DeltaS) then
      for Y := 0 to BtnSize - 1 do
        if Rct.Top + Y + CI.Y < CI.Bmp.Height then begin
          D := Pointer(LongInt(D0) + DeltaD * (Rct.Top + Y));
          S := Pointer(LongInt(S0) + DeltaS * (Rct.Top + Y + CI.Y));
          for X := 0 to DeltaX - 1 do
            with D[Rct.Left + X], S[Rct.Left + X + CI.X], Col do begin
              DR := ((R - SR) * BtnArray[Y, X] + SR shl 8) shr 8;
              DG := ((G - SG) * BtnArray[Y, X] + SG shl 8) shr 8;
              DB := ((B - SB) * BtnArray[Y, X] + SB shl 8) shr 8;
            end;
        end;
  end;

begin
  if not (csDesigning in ComponentState) and DefaultDraw and (Node <> nil) then
    if SkinData.Skinned then begin
      // Init color and font properties
      Canvas.Brush.Color := Color;
      Canvas.Font.Color := Font.Color;
      CallEvents;
      if cdPostPaint = Stage then begin
        if not DefaultDraw then
          Exit;

        DefaultDraw := False;

        p := ScreenToClient(acMousePos);
{$IFDEF DELPHI6UP}
        NodeAtPos := GetNodeAt(p.X, p.Y);
        if (DragMode = dmAutomatic) and (GetCapture <> 0) and (NodeAtPos <> nil) and HotTrack then begin
          bSelected := NodeAtPos = Node;
          if GetCapture <> 0 then
            FLastHoverItem := NodeAtPos;
        end
        else
{$ENDIF}
        begin
          NodeAtPos := nil;
          bSelected := ((((cdsSelected in State) or (Selected = Node)) ) or HotTrack and (cdsHot in State)) and (Focused or not HideSelection) or (FRightNode = Node);
        end;

        nRect := Node.DisplayRect(True);
        if IsRectEmpty(nRect) or not RectInRect(ClientRect, nRect, False) then
          Exit;

        if RowSelect and not ShowLines and bSelected then begin
          RowBmp := CreateBmp32(Node.DisplayRect(False));
          fRect := Node.DisplayRect(False);
        end
        else begin
          RowBmp := nil;
          fRect := nRect;
        end;

        if (HotTrack or (RowSelect and bSelected)) and (Images <> nil) then begin // Fix of glyphs painting std bug
          cx := 5 + Images.Width;
          dec(nRect.Left, cx);
        end
        else
          cx := 0;

        Bmp := CreateBmp32(nRect);
        aRect := MkRect(Bmp);
        CI.Bmp := nil;
        CI.Ready := False;
        CI.FillColor := ColorToRGB(Canvas.Brush.Color);
        if bSelected then begin
          sNdx := SkinData.SkinManager.ConstData.Sections[ssSelection];

          if RowBmp <> nil then
            TmpBmp := RowBmp
          else
            TmpBmp := Bmp;

          if sNdx < 0 then
            FillDC(TmpBmp.Canvas.Handle, MkRect(TmpBmp), SkinData.SkinManager.GetHighLightColor((cdsFocused in State) and bSelected))
          else
            PaintItem(sNdx, CI, True, integer(Focused and bSelected or (NodeAtPos <> nil)), MkRect(TmpBmp), MkPoint, TmpBmp, SkinData.SkinManager);

          if HotTrack and (cdsHot in State) and (Selected <> Node) then begin
            DisabledKind := [dkBlended];
            BmpDisabledKind(TmpBmp, DisabledKind, Parent, CI, Point(3, nRect.Top + 3));
          end;
          if RowBmp <> nil then begin
            if Node.HasChildren then begin
              p.X := nRect.Left - 5 - BtnSize div 2;
              p.Y := HeightOf(nRect) div 2;
              PaintBtn(p, not Node.Expanded, MakeCacheInfo(RowBmp, 0, 0));
            end;
            BitBlt(Bmp.Canvas.Handle, 0, 0, Bmp.Width, Bmp.Height, RowBmp.Canvas.Handle, nRect.Left - fRect.Left, 0, SRCCOPY);
          end;
        end
        else begin
          sNdx := -1;
          FillDC(Bmp.Canvas.Handle, aRect, CI.FillColor)
        end;
        if (HotTrack or (RowBmp <> nil) or RowSelect and bSelected) and (Images <> nil) then  // Fix of glyphs painting std bug
          Images.Draw(Bmp.Canvas, 2, (Bmp.Height - Images.Height) div 2, Node.ImageIndex);

        Bmp.Canvas.Font.Assign(Canvas.Font);
        InflateRect(aRect, -1, 0);
        aRect.Left := aRect.Left + 1 + cx;
        DrawStyle := DT_NOPREFIX or DT_EXPANDTABS or DT_SINGLELINE or DT_VCENTER or DT_NOCLIP;
        if sNdx < 0 then begin
          if bSelected then
            Bmp.Canvas.Font.Color := SkinData.SkinManager.GetHighLightFontColor(cdsFocused in State);

          Bmp.Canvas.Brush.Style := bsClear;
          AcDrawText(Bmp.Canvas.Handle, {$IFDEF TNTUNICODE}TTntTreeNode{$ENDIF}(Node).Text, aRect, DrawStyle);
        end
        else
          acWriteTextEx(Bmp.Canvas, PacChar({$IFDEF TNTUNICODE}TTntTreeNode{$ENDIF}(Node).Text), True, aRect, DrawStyle, sNdx, Focused or SkinData.FMouseAbove and MayBeHot(SkinData), SkinData.SkinManager);

        if Focused and (sNdx < 0) and bSelected then begin
          InflateRect(aRect, 1, 0);
          aRect.Left := 0;
          DrawFocusRect(Bmp.Canvas.Handle, aRect);
        end;
        if not Enabled then begin
          DisabledKind := [dkBlended];
          BmpDisabledKind(Bmp, DisabledKind, Parent, CI, Point(nRect.Left + 3, nRect.Top + 3));
        end;
        if RowBmp <> nil then begin
          BitBlt(RowBmp.Canvas.Handle, nRect.Left - fRect.Left, 0, Bmp.Width, Bmp.Height, Bmp.Canvas.Handle, 0, 0, SRCCOPY);
          BitBlt(Sender.Canvas.Handle, fRect.Left, fRect.Top, RowBmp.Width, RowBmp.Height, RowBmp.Canvas.Handle, 0, 0, SRCCOPY);
        end
        else
          BitBlt(Sender.Canvas.Handle, nRect.Left, nRect.Top, Bmp.Width, Bmp.Height, Bmp.Canvas.Handle, 0, 0, SRCCOPY);

        Bmp.Free;
        DefaultDraw := False;
      end
      else
        if RowSelect and not HotTrack and (GetCapture = Handle) then
          if (ListSW = nil) or not ListSW.fThumbTracking then begin
            b := True;
            SkinCustomDrawItem(Self, Node, [cdsSelected], cdPostPaint, b, b);
            DefaultDraw := False;
          end;
    end
    else
      CallEvents;
end;


procedure TsTreeView.UpdateLastHoverNode;
var
  b: Boolean;
begin
  if FLastHoverItem <> nil then begin
    if Selected = FLastHoverItem then
      SkinCustomDrawItem(Self, FLastHoverItem, [cdsSelected], cdPostPaint, b, b)
    else
      SkinCustomDrawItem(Self, FLastHoverItem, [], cdPostPaint, b, b);

    FLastHoverItem := nil;
  end;
end;


procedure TsTreeView.WndProc(var Message: TMessage);
var
  PS: TPaintStruct;
  i: integer;
  b: boolean;
begin
{$IFDEF LOGGED}
  AddToLog(Message);
{$ENDIF}
  case Message.Msg of
    SM_ALPHACMD:
      case Message.WParamHi of
        AC_CTRLHANDLED: begin
          Message.Result := 1;
          Exit;
        end;

        AC_SETSCALE:
          if SkinData.SkinManager <> nil then begin
            i := TreeView_GetItemHeight(Handle);
            i := MulDiv(i, Message.LParam, SkinData.ScalePercent);
            TreeView_SetItemHeight(Handle, i);
            RecreateWnd;
            Exit;
          end;

        AC_REMOVESKIN:
          if ACUInt(Message.LParam) = ACUInt(SkinData.SkinManager) then begin
            if ListSW <> nil then
              FreeAndNil(ListSW);

            Exit;
          end;

        AC_SETNEWSKIN:
          if ACUInt(Message.LParam) = ACUInt(SkinData.SkinManager) then begin
            CommonWndProc(Message, FCommonData);
            Exit;
          end;

        AC_REFRESH:
          if ACUInt(Message.LParam) = ACUInt(SkinData.SkinManager) then begin
            RefreshTreeScrolls(SkinData, ListSW, Self is TsTreeViewEx);
            if FCommonData.Skinned then begin
              if not FCommonData.CustomColor then
{$IFNDEF DELPHI6UP}
                TreeView_SetBkColor(Handle, ColorToRGB(FCommonData.SkinManager.gd[FCommonData.SkinIndex].Props[0].Color))
{$ELSE}
                Color := FCommonData.SkinManager.gd[FCommonData.SkinIndex].Props[0].Color
{$ENDIF}
              else
                if ListSW <> nil then
                  TacTreeViewWnd(ListSW).Color := Color;
            end;
            SetWindowPos(Handle, 0, 0, 0, 0, 0, SWPA_FRAMECHANGED);
            Exit;
          end;

        AC_PREPARECACHE: begin
          CommonMessage(Message, SkinData);
          Exit;
        end;

        AC_GETDEFINDEX: begin
          if FCommonData.SkinManager <> nil then
            Message.Result := FCommonData.SkinManager.ConstData.Sections[ssEdit] + 1;

          Exit;
        end

        else
          CommonMessage(Message, SkinData);
      end;
  end;

  if not ControlIsReady(Self) or not FCommonData.Skinned then
    inherited
  else begin
    case Message.Msg of
      CM_VISIBLECHANGED, CM_ENABLEDCHANGED, WM_MOVE:
        FCommonData.BGChanged := True;

      WM_NCPAINT, WM_ERASEBKGND:
        if InUpdating(SkinData) then
          Exit;

      WM_PAINT:
        if InUpdating(SkinData) then begin
          BeginPaint(Handle, PS);
          EndPaint(Handle, PS);
          Exit;
        end;

      WM_SETREDRAW:
        FCommonData.FUpdating := Message.WParam <> 1;

      CM_MOUSEENTER:
        if ac_AllowHotEdits and MayBeHot(SkinData) and (Color <> SkinData.SkinManager.gd[SkinData.SkinIndex].Props[1].Color) and not SkinData.CustomColor then begin
          SkinData.BGChanged := True;
          SkinData.FMouseAbove := True;
          Color := SkinData.SkinManager.gd[SkinData.SkinIndex].Props[1].Color;
          TreeView_SetBkColor(Handle, ColorToRGB(Color));
          Application.ProcessMessages;
          Repaint;
        end;

      WM_RBUTTONDOWN:
        if RightClickSelect then
          if (FRightNode <> Selected) and HandleAllocated then begin
            FRightNode := GetNodeAt(TWMNCHitMessage(Message).XCursor, TWMNCHitMessage(Message).YCursor);
            if Selected <> nil then
              SkinCustomDrawItem(Self, Selected, [], cdPostPaint, b, b);

            if FRightNode <> nil then
              SkinCustomDrawItem(Self, FRightNode, [cdsSelected], cdPostPaint, b, b);
          end;

      WM_SETFONT:
        if SkinData.CtrlSkinState and ACS_CHANGING <> 0 then
          Exit;

      WM_NCHITTEST:
        if RightClickSelect and (FRightNode <> nil) then begin
          SkinCustomDrawItem(Self, FRightNode, [], cdPostPaint, b, b);
          FRightNode := nil;
          if Selected <> nil then
            SkinCustomDrawItem(Self, Selected, [cdsSelected], cdPostPaint, b, b);
        end;
    end;
    if CommonWndProc(Message, FCommonData) then
      Exit;

    inherited;
    case Message.Msg of
      CM_SHOWINGCHANGED:
        RefreshTreeScrolls(SkinData, ListSW, Self is TsTreeViewEx);
    end;
  end;
  if Assigned(BoundLabel) then
    BoundLabel.HandleOwnerMsg(Message, Self);
end;


constructor TsTreeViewEx.Create(AOwner: TComponent);
begin
  inherited;
  FAutoChildCheck := False;
  FCheckboxes := False;
end;


procedure TsTreeViewEx.CreateWnd;
begin
  inherited;
  SetCheckBoxes(FCheckBoxes);
  if HandleAllocated then
    RefreshTreeScrolls(SkinData, ListSW, Self is TsTreeViewEx);
end;


procedure TsTreeViewEx.DrawItem(aDC: hdc; Node: TTreeNode; State: TCustomDrawState);
var
  DC: hdc;
  p: TPoint;
  Bmp: TBitmap;

  CI: TCacheInfo;
  lType: Cardinal;
  bFocused: boolean;
  DrawStyle: Cardinal;
  nRect, aRect, rText: TRect;
  w, h, bw, cx, sNdx: integer;
  DisabledKind: TsDisabledKind;
  LastItem, NodeAtPos: TTreeNode;
  bSelected, DefaultDraw: boolean;

  NewPen: TPen;
  PenHandle: HPEN;
  BrushStyle: tagLOGBRUSH;

  procedure CallEvents;
  begin
    DefaultDraw := True;
    if Assigned(OnCustomDrawItem) then
      OnCustomDrawItem(Self, Node, State, DefaultDraw);
  end;

  function HasNode(ANode, Child: TTreeNode): boolean;
  begin
    if Child <> nil then begin
      Result := (ANode = Child) or (ANode = Child.Parent);
      if not Result then
        Result := HasNode(ANode, Child.Parent);
    end
    else
      Result := False;
  end;

  function LineType: Cardinal;
  begin
    if ShowLines and (ShowRoot or (Node.Parent <> nil)) then
{$IFDEF DELPHI6UP}
      if Node.IsFirstNode then
{$ELSE}
      if not Node.Deleting and (Node.Parent = nil) and (Node.GetPrevSibling = nil) then
{$ENDIF}
        Result := LT_FIRST
      else begin
        if (TreeView_GetNextSibling(Handle, Node.ItemId) = nil) or HasNode(Node, LastItem) then
          Result := LT_LAST
        else
          Result := LT_MIDDLE
      end
    else
      Result := 0;
  end;

  procedure DrawParentLine(ANode: TTreeNode; Pos: TPoint);
  var
    NewPos: TPoint;
  begin
    if (ANode <> nil) and not HasNode(ANode, LastItem) then begin
      NewPos := Point(Pos.X - 8 - 11, 0);
      if (ANode.Parent = nil) or (ANode.Parent.Count > ANode.Index + 1) then begin
        Bmp.Canvas.MoveTo(NewPos.X, 0);
        Bmp.Canvas.LineTo(NewPos.X, Bmp.Height);
      end;
      DrawParentLine(ANode.Parent, NewPos);
    end;
  end;

  procedure PaintBtn(aPoint: TPoint; aClosed: boolean; CI: TCacheInfo);
  var
    Rct: TRect;
    Col: TsColor;
    BtnArray: TBtnArray;
    S, S0: PRGBAArray_S;
    D, D0: PRGBAArray_D;
    X, Y, DeltaS, DeltaD, DeltaX: integer;
  begin
    Rct.Left := aPoint.X - BtnSize div 2;
    Rct.Top  := aPoint.Y - BtnSize div 2;
    Rct.Right := Rct.Left + BtnSize;
    Rct.Bottom := Rct.Top + BtnSize;
    Col.C := BrushStyle.lbColor;

    if aClosed then
      BtnArray := BArrayClosed
    else
      BtnArray := BArrayOpened;

    if Rct.Left < 0 then begin
      DeltaX := BtnSize + Rct.Left;
      Rct.Left := 0;
    end
    else
      DeltaX := BtnSize;

    if InitLine(Bmp, Pointer(D0), DeltaD) and InitLine(Ci.Bmp, Pointer(S0), DeltaS) then
      for Y := 0 to BtnSize - 1 do
        if Rct.Top + Y + CI.Y < CI.Bmp.Height then begin
          D := Pointer(LongInt(D0) + DeltaD * (Rct.Top + Y));
          S := Pointer(LongInt(S0) + DeltaS * (Rct.Top + Y + CI.Y));
          for X := 0 to DeltaX - 1 do
            with D[Rct.Left + X], S[Rct.Left + X + CI.X], Col do begin
              DR := ((R - SR) * BtnArray[Y, X] + SR shl 8) shr 8;
              DG := ((G - SG) * BtnArray[Y, X] + SG shl 8) shr 8;
              DB := ((B - SB) * BtnArray[Y, X] + SB shl 8) shr 8;
            end;
        end;
  end;

begin
  if Node <> nil then begin
    bFocused := Focused;
    if aDC = 0 then
      DC := GetDC(Handle)
    else
      DC := aDC;

    if ListSW <> nil then
      bw := ListSW.cxLeftEdge
    else
      bw := 3 * integer(BorderStyle = bsSingle);

    Canvas.Handle := DC;
    // Init color and font properties
    Canvas.Brush.Color := Color;
    Canvas.Font.Assign(Font);
    CallEvents;
    nRect := Node.DisplayRect(False);
    LastBottom := nRect.Bottom;
    if DefaultDraw then begin
      rText := Node.DisplayRect(True);
      if nRect.Right < rText.Right + 1 then
        nRect.Right := rText.Right + 1;

      OffsetRect(rText, 0, - nRect.Top);
      if HotTrack and (Images <> nil) then begin // Fix of glyphs painting std bug
        cx := 5 + Images.Width;
        dec(nRect.Left, cx);
      end
      else
        cx := 0;

      Bmp := CreateBmp32(nRect);
      Bmp.Canvas.Font.Assign(Canvas.Font);
      aRect := MkRect(Bmp);
      CI.Bmp := SkinData.FCacheBmp;
      CI.Ready := True;
      CI.FillColor := ColorToRGB(Canvas.Brush.Color);
      CI.X := 0;
      CI.Y := 0;
      p := ScreenToClient(acMousePos);
{$IFDEF DELPHI6UP}
      if (DragMode = dmAutomatic) and Mouse.IsDragging and PtInRect(MkRect(Self), p) and HotTrack then begin
        NodeAtPos := GetNodeAt(p.X, p.Y);
        bSelected := NodeAtPos = Node;
      end
      else
{$ENDIF}
      begin
        NodeAtPos := nil;
        if (Selected = Node) then
          bSelected := True
        else
          if (FRightNode = Node) then
            bSelected := True
          else
            if HotTrack then begin
              NodeAtPos := GetNodeAt(p.X, p.Y);
              bSelected := NodeAtPos = Node;
            end
            else
              bSelected := False;
      end;
      BitBlt(Bmp.Canvas.Handle, 0, 0, Bmp.Width, Bmp.Height, SkinData.FCacheBmp.Canvas.Handle, nRect.Left + bw, nRect.Top + bw, SRCCOPY);
      OffsetRect(rText, 2, 0);
      if bSelected or (HotTrack and (NodeAtPos = Node)) then begin
        sNdx := SkinData.SkinManager.ConstData.Sections[ssSelection];
        InflateRect(rText, 1, 0);
        if sNdx < 0 then
          FillDC(Bmp.Canvas.Handle, rText, SkinData.SkinManager.GetHighLightColor(bFocused{(cdsFocused in State)} and bSelected))
        else
          PaintItem(sNdx, CI, True, integer(bFocused and bSelected or (HotTrack and (NodeAtPos <> nil))),
                     Rect(rText.Left, rText.Top, min(rText.Right, SkinData.FCacheBmp.Width), rText.Bottom),
                     nRect.TopLeft, Bmp, SkinData.SkinManager);

        if HotTrack and ((cdsHot in State) or (NodeAtPos = Node)) and (Selected <> Node) then
          BlendTransRectangle(Bmp, 0, 0, CI.Bmp, MkRect(Bmp), Byte(180));

        InflateRect(rText, -1, 0);
      end
      else
        sNdx := -1;

      if HotTrack and (Images <> nil) then // Fix of glyphs painting std bug
        Images.Draw(Bmp.Canvas, 2, (Bmp.Height - Images.Height) div 2, Node.ImageIndex);

      Bmp.Canvas.Font.Assign(Canvas.Font);

      aRect.Left := aRect.Left + 1 + cx;
      inc(rText.Left, 2);
      DrawStyle := DT_NOPREFIX or DT_EXPANDTABS or DT_SINGLELINE or DT_VCENTER or DT_NOCLIP;
      if sNdx < 0 then begin
        if bSelected then
          Bmp.Canvas.Font.Color := SkinData.SkinManager.GetHighLightFontColor(bFocused);

        Bmp.Canvas.Brush.Style := bsClear;
        AcDrawText(Bmp.Canvas.Handle, {$IFDEF TNTUNICODE}TTntTreeNode{$ENDIF}(Node).Text, rText, DrawStyle);
      end
      else
        acWriteTextEx(Bmp.Canvas, PacChar({$IFDEF TNTUNICODE}TTntTreeNode{$ENDIF}(Node).Text), True, rText, DrawStyle, sNdx, bFocused or (SkinData.FMouseAbove or (NodeAtPos = Node)) {and MayBeHot(SkinData)}, SkinData.SkinManager);

      dec(rText.Left, 2);
      OffsetRect(rText, -2, 0);
      p := Point(rText.Left - 8, HeightOf(rText) div 2);
      aRect.Right := rText.Left;
      if Images <> nil then begin
        aRect.Left := aRect.Right - Images.Width - 3;
        dec(p.X, Images.Width + 3);
        if IsValidIndex(Node.ImageIndex, Images.Count) then
          Images.Draw(Bmp.Canvas, aRect.Left, (Bmp.Height - Images.Height) div 2, Node.ImageIndex);

        aRect.Right := aRect.Left;
      end;
      if Checkboxes then begin
        w := FCheckWidth;
        h := FCheckHeight;
        aRect.Top := (HeightOf(nRect) - h) div 2 + (HeightOf(nRect) - h) mod 2;
        aRect.Left := aRect.Right - w;
        aRect.Bottom := aRect.Top + h;
        acDrawCheck(aRect, CheckBoxStates[integer(GetChecked(Node))], True, Bmp, CI, SkinData.SkinManager);
        dec(p.X, w);
      end;

      LastItem := Items.GetNode(TreeView_GetLastVisible(Handle));
      lType := LineType;
      if lType and LT_LINEALL <> 0 then begin
        Bmp.Canvas.Pen.Style := psDot;
        BrushStyle.lbStyle := BS_SOLID;
        BrushStyle.lbColor := BlendColors(ColorToRGB(Color), ColorToRGB(Bmp.Canvas.Font.Color), 102);
        BrushStyle.lbHatch := 0;
        PenHandle := ExtCreatePen(PS_GEOMETRIC or PS_DOT, Bmp.Canvas.Pen.Width, BrushStyle, 0, nil);
        NewPen := TPen.Create;
        NewPen.Handle := PenHandle;
        Bmp.Canvas.Pen := NewPen;
        Bmp.Canvas.MoveTo(p.X + 8, p.Y);
        Bmp.Canvas.LineTo(p.X, p.Y);
        Bmp.Canvas.Brush.Color := 0;
        case lType and LT_LINEALL of
          LT_FIRST: begin
            Bmp.Canvas.MoveTo(p.X, p.Y + 1);
            Bmp.Canvas.LineTo(p.X, Bmp.Height);
          end;

          LT_LAST: begin
            Bmp.Canvas.MoveTo(p.X, 0);
            Bmp.Canvas.LineTo(p.X, p.Y);
            DrawParentLine(Node.Parent, Point(p.X, p.Y));
          end;

          LT_MIDDLE: begin
            Bmp.Canvas.MoveTo(p.X, 0);
            Bmp.Canvas.LineTo(p.X, Bmp.Height);
            DrawParentLine(Node.Parent, Point(p.X, p.Y));
          end;
        end;
        if Node.HasChildren then
          PaintBtn(p, not Node.Expanded, MakeCacheInfo(SkinData.FCacheBmp, nRect.Left, nRect.Top));

        NewPen.Free;
      end;
      if bFocused and (sNdx < 0) and bSelected then begin
        InflateRect(aRect, 1, 0);
        aRect.Left := 0;
        DrawFocusRect(Bmp.Canvas.Handle, rText);
      end;
      if not Enabled then begin
        DisabledKind := [dkBlended];
        BmpDisabledKind(Bmp, DisabledKind, Parent, CI, Point(nRect.Left + bw, nRect.Top + bw));
      end;
      BitBlt(DC, nRect.Left, nRect.Top, Bmp.Width, Bmp.Height, Bmp.Canvas.Handle, 0, 0, SRCCOPY);
      FreeAndNil(Bmp);
      if aDC = 0 then
        ReleaseDC(Handle, DC);
    end
  end
end;


function TsTreeViewEx.GetChecked(Node: TTreeNode): Boolean;
var
  Item: TTVItem;
begin
  Item.Mask := TVIF_STATE;
  Item.hItem := Node.ItemId;
  TreeView_GetItem(Node.TreeView.Handle, Item);
  Result := Item.State and TVIS_CHECKED = TVIS_CHECKED;
end;


procedure CheckSubNode(Sender: TsTreeViewEx; Node: TTreeNode);
var
  Flag: boolean;
begin
  if Node.HasChildren then begin
    Flag := Sender.GetChecked(Node);
    Node := Node.GetFirstChild;
    while Assigned(Node) do begin
      Sender.SetChecked(Node, flag);
      CheckSubNode(Sender, Node);
      Node := Node.GetNextChild(Node);
    end;
  end;
end;


procedure TsTreeViewEx.InitEvents;
begin
  // Do nothing
end;


procedure TsTreeViewEx.UpdateColors;
var
  i: integer;
begin
  i := GetFontIndex(Self, SkinData.SkinIndex, SkinData.SkinManager);
  if i >= 0 then
    Font.Color := FCommonData.SkinManager.gd[i].Props[0].FontColor.Color
  else
    Font.Color := FCommonData.SkinManager.gd[FCommonData.SkinIndex].Props[0].FontColor.Color;

  if HandleAllocated then
    TreeView_SetTextColor(Handle, Font.Color);
end;


procedure TsTreeViewEx.MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  Node: TTreeNode;
begin
  inherited;
  if FAutoChildCheck then begin
    Node := GetNodeAt(X, Y);
    if (Node <> nil) and (GetHitTestInfoAt(X, Y) = [htOnItem, htOnStateIcon]) then
      CheckSubNode(Self, Node);
  end;
end;


procedure TsTreeViewEx.PaintItems(DC: hdc);
var
  SavedDC: hdc;
  Item: HTreeItem;
  Node: TTreeNode;
begin
  Item := TreeView_GetFirstVisible(Handle);
  Node := Items.GetNode(Item);
  LastBottom := 0;
  if Node <> nil then
    while True do begin
      SavedDC := SaveDC(DC);
      try
        if (ListSW <> nil) and (ListSW.sBarHorz <> nil) and ListSW.sBarHorz.fScrollVisible then
          if ListSW.sBarHorz.ScrollInfo.nPos > 0 then
            MoveWindowOrg(DC, -ListSW.sBarHorz.ScrollInfo.nPos + ListSW.cxLeftEdge, 0);

        DrawItem(DC, Node, []);
        Item := TreeView_GetNextVisible(Handle, Item);
        Node := Items.GetNode(Item);
      finally
        RestoreDC(DC, SavedDC);
      end;
      if Node = nil then
        Break;
    end;

  BitBlt(DC, 0, LastBottom, Width, Height, SkinData.FCacheBmp.Canvas.Handle, ListSW.cxLeftEdge, ListSW.cyTopEdge + LastBottom, SRCCOPY);
end;

var
  CheckRemoving: boolean = False;


procedure TsTreeViewEx.SetCheckboxes(const Value: boolean);
var
  Flags: Cardinal;
begin
  if ((FCheckboxes <> Value) or Value) and not CheckRemoving then begin
    FCheckboxes := Value;
    Flags := GetWindowLong(Handle, GWL_STYLE);
    if FCheckboxes then
      SetWindowLong(Handle, GWL_STYLE, Flags or TVS_CHECKBOXES)
    else begin
      CheckRemoving := True;  
      SetWindowLong(Handle, GWL_STYLE, Flags and not TVS_CHECKBOXES);
      RecreateWnd;
      CheckRemoving := False;  
    end;

    Repaint;
  end;
end;


procedure TsTreeViewEx.SetChecked(Node: TTreeNode; Checked: Boolean);
var
  Item: TTVItem;
begin
  FillChar(Item, SizeOf(TTVItem), 0);
  with Item do begin
    hItem := Node.ItemId;
    Mask := TVIF_STATE;
    StateMask := TVIS_STATEIMAGEMASK;
    if Checked then
      Item.State := TVIS_CHECKED
    else
      Item.State := TVIS_CHECKED shr 1;

    TreeView_SetItem(Node.TreeView.Handle, Item);
  end;
end;


procedure TsTreeViewEx.WMEraseBkGnd(var Message: TWMPaint);
var
  R: TRect;
  Item: HTreeItem;
  Node: TTreeNode;
  SavedDC, DC: hdc;
begin
  if not InUpdating(SkinData) then begin
    if Message.DC <> 0 then
      DC := Message.DC
    else
      DC := GetWindowDC(Handle);

    SavedDC := SaveDC(DC);
    try
      if SkinData.BGChanged then
        PrepareCache(SkinData, Handle);

      Item := TreeView_GetFirstVisible(Handle);
      Node := Items.GetNode(Item);
      if Node <> nil then begin
        R := Node.DisplayRect(False);
        ExcludeClipRect(DC, R.Left, R.Top, R.Right, R.Bottom);
        while True do begin
          Item := TreeView_GetNextVisible(Handle, Item);
          Node := Items.GetNode(Item);
          if Node = nil then
            Break;

          R := Node.DisplayRect(False);
          ExcludeClipRect(DC, R.Left, R.Top, R.Right, R.Bottom);
        end;
      end;

      BitBlt(DC, 0, 0, SkinData.FCacheBmp.Width, SkinData.FCacheBmp.Height, SkinData.FCacheBmp.Canvas.Handle, ListSW.cxLeftEdge, ListSW.cyTopEdge, SRCCOPY);
    finally
      RestoreDC(DC, SavedDC);
      if Message.DC = 0 then
        ReleaseDC(Handle, DC);
    end;
  end;
end;


procedure TsTreeViewEx.WMNCPaint(var Message: TMessage);
var
  bw: integer;
  DC: hdc;
begin
  if not InUpdating(SkinData) then begin
    if ListSW <> nil then
      bw := ListSW.cxLeftEdge
    else
      bw := 3 * integer(BorderStyle = bsSingle);

    if bw > 0 then begin
      DC := GetWindowDC(Handle);
      try
        if SkinData.BGChanged then
          PrepareCache(SkinData, Handle);

        BitBltBorder(DC, 0, 0, SkinData.FCacheBmp.Width, SkinData.FCacheBmp.Height, SkinData.FCacheBmp.Canvas.Handle, 0, 0, bw);
      finally
        ReleaseDC(Handle, DC);
      end;
    end;
  end;
end;


procedure TsTreeViewEx.WMPaint(var Message: TWMPaint);
var
  DC: hdc;
  PS: TPaintStruct;
begin
  if SkinData.Skinned then begin
    UpdateColors;
    BeginPaint(Handle, PS);
    if not InUpdating(SkinData) then begin
      if Message.DC <> 0 then
        DC := Message.DC
      else
        DC := GetDC(Handle);

      try
        PaintItems(DC);
      finally
        if Message.DC = 0 then
          ReleaseDC(Handle, DC);
      end;
    end;
    EndPaint(Handle, PS);
  end
  else
    inherited;
end;


procedure TsTreeViewEx.WndProc(var Message: TMessage);
var
  bw: integer;
  DC, SavedDC: hdc;
begin
  if ControlIsReady(Self) and FCommonData.Skinned then
    case Message.Msg of
      WM_ERASEBKGND: begin
        WMEraseBkGnd(TWMPaint(Message));
        Exit;
      end;

      WM_NCPAINT: begin
        WMNCPaint(Message);
        Exit;
      end;

      WM_PRINT: begin
        SkinData.Updating := False;
        SkinData.BGChanged := True;
        DC := TWMPaint(Message).DC;
        PrepareCache(SkinData, Handle);
        UpdateCorners(SkinData, 0);
        if ListSW <> nil then
          bw := ListSW.cxLeftEdge
        else
          bw := 3 * integer(BorderStyle = bsSingle);

        SavedDC := SaveDC(DC);
        try
          MoveWindowOrg(DC, bw, bw);
          if IsCached(SkinData) then
            with SkinData.FCacheBmp do
              if PRF_CLIENT and Message.LParam = PRF_CLIENT then // Patch for using with BE
                BitBlt(DC, 0, 0, Width, Height, Canvas.Handle, 0, 0, SRCCOPY)
              else
                BitBlt(DC, 0, 0, Width, Height, Canvas.Handle, bw, bw, SRCCOPY)
          else
            FillDC(DC, MkRect(Self), Color);

{$IFNDEF D2005}
          if SkinData.FOwnerControl is TCustomListBox then begin // Fix empty ListBox drawing bug, fixed in latest Delphi versions
            if TCustomListBox(SkinData.FOwnerControl).Items.Count <> 0 then
              SendMessage(Handle, WM_PAINT, WPARAM(DC), 0);
          end
          else
{$ENDIF}
            SendMessage(Handle, WM_PAINT, WPARAM(DC), 0);
        finally
          RestoreDC(DC, SavedDC);
        end;
        if ListSW <> nil then begin
          BitBltBorder(DC, 0, 0, SkinData.FCacheBmp.Width, SkinData.FCacheBmp.Height, SkinData.FCacheBmp.Canvas.Handle, 0, 0, ListSW.cxLeftEdge);
          Ac_NCDraw(ListSW, Handle, -1, DC);
        end;
        Message.Result := 2; // Processed already
        Exit;
      end;

      WM_SIZE:
        SkinData.BGChanged := True;

      WM_PAINT: begin
        WMPaint(TWMPaint(Message));
        Exit;
      end;
    end;

  inherited;
  case Message.Msg of
    SM_ALPHACMD:
      case Message.WParamHi of
        AC_REMOVESKIN: begin
          if ACUInt(Message.LParam) = ACUInt(SkinData.SkinManager) then
            if HandleAllocated then begin
              if not SkinData.CustomColor then
                TreeView_SetBkColor(Handle, ColorToRGB(Color));

              if not SkinData.CustomColor then
                TreeView_SetTextColor(Handle, ColorToRGB(Font.Color));
            end;
        end;
      end;
  end;
end;

end.
