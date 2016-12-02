unit sPanel;
{$I sDefs.inc}
//{$DEFINE LOGGED}
//+

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, ExtCtrls,
  {$IFNDEF DELPHI5} Types, {$ENDIF}
  {$IFDEF TNTUNICODE} TntExtCtrls, {$ENDIF}
  sCommonData, sConst;


type
{$IFDEF DELPHI_XE3}[ComponentPlatformsAttribute(pidWin32 or pidWin64)]{$ENDIF}
{$IFDEF TNTUNICODE}
  TsPanel = class(TTntPanel)
{$ELSE}
  TsPanel = class(TPanel)
{$ENDIF}
{$IFNDEF NOTFORHELP}
  private
    FCommonData: TsCtrlSkinData;
    FOldBevel: TPanelBevel;
    FOnPaint: TPaintEvent;
{$IFNDEF D2010}
    FOnMouseLeave,
    FOnMouseEnter: TNotifyEvent;
{$ENDIF}
  protected
    procedure CopyCache(DC: hdc); virtual;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure AfterConstruction; override;
    procedure Loaded; override;
    procedure Paint; override;
    procedure OurPaint(DC: HDC = 0; SendUpdated: boolean = True); virtual;
    function PrepareCache: boolean; virtual;
    procedure PaintDragPanel(DC: hdc);
    procedure WndProc(var Message: TMessage); override;
    procedure WriteText(R: TRect; aCanvas: TCanvas = nil; aDC: hdc = 0);
    procedure PaintWindow(DC: HDC); override;
  published
{$ENDIF} // NOTFORHELP
    property SkinData: TsCtrlSkinData read FCommonData write FCommonData;
    property OnPaint: TPaintEvent read FOnPaint write FOnPaint;
{$IFNDEF D2010}
    property OnMouseEnter: TNotifyEvent read FOnMouseEnter write FOnMouseEnter;
    property OnMouseLeave: TNotifyEvent read FOnMouseLeave write FOnMouseLeave;
{$ENDIF}
  end;


{$IFDEF DELPHI_XE3}[ComponentPlatformsAttribute(pidWin32 or pidWin64)]{$ENDIF}
  TsDragBar = class(TsPanel)
{$IFNDEF NOTFORHELP}
  private
    FDraggedControl: TControl;
    procedure WMActivateApp(var Message: TWMActivateApp); message WM_ACTIVATEAPP;
  protected
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
  public
    procedure Loaded; override;
    procedure ReadState(Reader: TReader); override;
    constructor Create(AOwner: TComponent); override;
    procedure WndProc(var Message: TMessage); override;
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
  published
    property Alignment;
    property Align default alTop;
    property Color default clActiveCaption;
{$ENDIF} // NOTFORHELP
    property DraggedControl: TControl read FDraggedControl write FDraggedControl;
  end;


{$IFNDEF NOTFORHELP}
  TsContainer = class(TsPanel);


  TsGrip = class(TsPanel)
  public
    Transparent: boolean;
    LinkedControl: TWinControl;
    constructor Create(AOwner: TComponent); override;
    procedure Paint; override;
  end;


  TsColInfo = record
    ciColor: TColor;
    ciRect: TRect;
  end;


{$IFDEF DELPHI_XE3}[ComponentPlatformsAttribute(pidWin32 or pidWin64)]{$ENDIF}
  TsColorsPanel = class(TsPanel)
  private
    FItemIndex,
    FItemWidth,
    FItemHeight,
    FItemMargin,
    FColCount,
    FRowCount: integer;

    FColors: TStrings;
    FOnChange: TNotifyEvent;
    procedure SetColors (const Value: TStrings);
    procedure SetInteger(const Index, Value: integer);
  public
    OldSelected: integer;
    ColorsArray: array of TsColInfo;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure GenerateColors;
    procedure AfterConstruction; override;
    procedure ChangeScale(M, D: Integer); override;
    procedure Loaded; override;
    procedure OurPaint(DC: HDC = 0; SendUpdated: boolean = True); override;
    procedure PaintColors(const DC: hdc);
    function Count: integer;
    function GetItemByCoord(p: TPoint): integer;
    procedure WndProc(var Message: TMessage); override;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    function ColorValue: TColor;
  published
    property Colors: TStrings read FColors write SetColors;
    property ColCount:   integer index 0 read FColCount   write SetInteger default 5;
    property ItemIndex:  integer index 1 read FItemIndex  write SetInteger default -1;
    property ItemHeight: integer index 2 read FItemHeight write SetInteger default 21;
    property ItemWidth:  integer index 3 read FItemWidth  write SetInteger default 21;
    property ItemMargin: integer index 4 read FItemMargin write SetInteger default 6;
    property RowCount:   integer index 5 read FRowCount   write SetInteger default 2;
    property Height default 60;
    property Width default 140;
    property OnChange: TNotifyEvent read FOnChange write FOnChange;
  end;


  TsGradientPanel = class;
  TacGradPaintData = class;

  TacColorData1 = class(TPersistent)
  private
    FOwner: TacGradPaintData;
    FUseSkinColor: boolean;
    FColor: TColor;
    procedure SetUseSkinColor(const Value: boolean);
    procedure SetColor(const Value: TColor);
  public
    constructor Create(AOwner: TacGradPaintData);
    procedure Invalidate;
  published
    property Color: TColor read FColor write SetColor default clWhite;
    property UseSkinColor: boolean read FUseSkinColor write SetUseSkinColor default False;
  end;


  TacColorData2 = class(TacColorData1)
  public
    constructor Create(AOwner: TacGradPaintData);
  published
    property Color default clBtnFace;
    property UseSkinColor default True;
  end;


  TacGradPaintData = class(TPersistent)
  private
    FIsVertical: boolean;
    FOwner: TsGradientPanel;
    FColor1: TacColorData1;
    FColor2: TacColorData2;
    FCustomGradient: string;
    procedure SetIsVertical(const Value: boolean);
    procedure SetColor1(const Value: TacColorData1);
    procedure SetColor2(const Value: TacColorData2);
    procedure SetCustomGradient(const Value: string);
  public
    constructor Create(AOwner: TsGradientPanel);
    destructor Destroy; override;
    procedure Invalidate;
  published
    property IsVertical: boolean read FIsVertical write SetIsVertical default True;
    property Color1: TacColorData1 read FColor1 write SetColor1;
    property Color2: TacColorData2 read FColor2 write SetColor2;
    property CustomGradient: string read FCustomGradient write SetCustomGradient;
  end;


{$IFDEF DELPHI_XE3}[ComponentPlatformsAttribute(pidWin32 or pidWin64)]{$ENDIF}
  TsGradientPanel = class(TPanel)
{$IFNDEF NOTFORHELP}
  private
    FOnPaint: TPaintEvent;
    FPaintData: TacGradPaintData;
{$IFNDEF D2010}
    FOnMouseLeave,
    FOnMouseEnter: TNotifyEvent;
{$ENDIF}
  protected
    FCacheBmp: TBitmap;
    procedure CopyCache(DC: hdc); virtual;
  public
    BGChanged: boolean;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure AfterConstruction; override;
    procedure Loaded; override;
    procedure Paint; override;
    procedure UpdatePalette;
    procedure OurPaint(DC: HDC = 0; SendUpdated: boolean = True); virtual;
    function PrepareCache: boolean; virtual;
    procedure WndProc(var Message: TMessage); override;
    procedure WriteText(R: TRect; aCanvas: TCanvas = nil; aDC: hdc = 0);
    procedure PaintWindow(DC: HDC); override;
  published
{$ENDIF} // NOTFORHELP
    property PaintData: TacGradPaintData read FPaintData write FPaintData;
    property OnPaint: TPaintEvent read FOnPaint write FOnPaint;
{$IFNDEF D2010}
    property OnMouseEnter: TNotifyEvent read FOnMouseEnter write FOnMouseEnter;
    property OnMouseLeave: TNotifyEvent read FOnMouseLeave write FOnMouseLeave;
{$ENDIF}
  end;


  TsStdColorsPanel = class(TsColorsPanel);
{$ENDIF} // NOTFORHELP

implementation


uses
  math, TypInfo,
  {$IFDEF LOGGED} sDebugMsgs, {$ENDIF}
  {$IFNDEF ALITE} sSplitter, {$ENDIF}
  sSkinProps, sMessages, sGraphUtils, sVCLUtils, sSkinManager, sBorders, acntUtils, sMaskData, sAlphaGraph, sStyleSimply,
  sGradient;


procedure TsPanel.AfterConstruction;
begin
  inherited;
  FCommonData.Loaded;
end;


procedure TsPanel.CopyCache(DC: hdc);
begin
  CopyWinControlCache(Self, FCommonData, MkRect, MkRect(Self), DC, False);
end;


constructor TsPanel.Create(AOwner: TComponent);
begin
  FCommonData := TsCtrlSkinData.Create(Self, True);
  FCommonData.COC := COC_TsPanel;
  inherited Create(AOwner);
end;


destructor TsPanel.Destroy;
begin
  FreeAndNil(FCommonData);
  inherited Destroy;
end;


procedure TsPanel.Loaded;
begin
  inherited;
  FCommonData.Loaded;
  FOldBevel := BevelOuter;
end;


procedure TsPanel.OurPaint;
var
  R: TRect;
  C: TColor;
  i: integer;
  b: boolean;
  TmpCanvas: TCanvas;
  SavedDC, NewDC: HDC;
  ParentBG: TacBGInfo;
begin
  if Showing and FCommonData.Skinned then begin
    if DC <> 0 then
      NewDC := DC
    else
      NewDC := Canvas.Handle;

    if IsCached(FCommonData) and not SkinData.CustomColor or (Self is TsColorsPanel) or InAnimationProcess then begin
      i := GetClipBox(NewDC, R);
      if (i = 0) {or IsRectEmpty(R) is not redrawn while resizing }then
        Exit;

      if not InUpdating(FCommonData) or (csPaintCopy in ControlState) then begin
        // If transparent and parent is resized
        b := FCommonData.HalfVisible or FCommonData.BGChanged;
        if SkinData.RepaintIfMoved and not (csPaintCopy in ControlState) then
          FCommonData.HalfVisible := (WidthOf(R, True) <> Width) or (HeightOf(R, True) <> Height)
        else
          FCommonData.HalfVisible := False;

        if b and not PrepareCache and FCommonData.BGChanged then
          Exit;

        CopyCache(NewDC);
        sVCLUtils.PaintControls(NewDC, Self, b and SkinData.RepaintIfMoved, MkPoint);
      end;
    end
    else begin
      R := MkRect(Width, Height);
      FCommonData.FUpdating := False;
      i := SkinBorderMaxWidth(FCommonData);
      SavedDC := SaveDC(NewDC);
      ExcludeControls(NewDC, Self, 0, 0);
      if not SkinData.CustomColor then begin
        ParentBG.PleaseDraw := False;
        GetBGInfo(@ParentBG, Self.Parent);
        if ParentBG.BgType = btNotReady then begin
          SkinData.FUpdating := True;
          Exit;
        end;
      end
      else begin
        ParentBG.Color := ColorToRGB(Color);
        ParentBG.BgType := btFill;
      end;
      if (FCommonData.SkinManager.gd[FCommonData.SkinIndex].Props[0].Transparency = 100) and (ParentBG.BgType = btCache) then begin
        if not InUpdating(FCommonData) then
          if i = 0 then
            BitBlt(NewDC, 0, 0, Width, Height, ParentBG.Bmp.Canvas.Handle, ParentBG.Offset.X + Left, ParentBG.Offset.Y + Top, SRCCOPY)
          else begin
            if FCommonData.FCacheBmp = nil then
              FCommonData.FCacheBmp := CreateBmp32(Width, Height);

            R := PaintBorderFast(NewDC, R, i, FCommonData, 0);
            if FCommonData.SkinManager.gd[FCommonData.SkinIndex].Props[0].Transparency = 100 then
              FillDC(NewDC, R, ParentBG.Color)
            else
              FillDC(NewDC, R, GetBGColor(SkinData, 0));

            if i > 0 then
              BitBltBorder(NewDC, 0, 0, Width, Height, FCommonData.FCacheBmp.Canvas.Handle, 0, 0, i);

            BitBlt(NewDC, i, i, Width - 2 * i, Height - 2 * i, ParentBG.Bmp.Canvas.Handle, ParentBG.Offset.X + i, ParentBG.Offset.Y + i, SRCCOPY);
          end;
      end
      else begin
        case FCommonData.SkinManager.gd[FCommonData.SkinIndex].Props[0].Transparency of
          100: C := ParentBG.Color;
          0:   C := iff(FCommonData.CustomColor, Color, FCommonData.SkinManager.gd[FCommonData.SkinIndex].Props[0].Color)
          else C := BlendColors(ParentBG.Color,
                              iff(FCommonData.CustomColor, ColorToRGB(Color), FCommonData.SkinManager.gd[FCommonData.SkinIndex].Props[0].Color),
                              FCommonData.SkinManager.gd[FCommonData.SkinIndex].Props[0].Transparency * MaxByte div 100);
        end;
        if i = 0 then
          FillDC(DC, R, C)
        else begin
          if FCommonData.FCacheBmp = nil then
            FCommonData.FCacheBmp := CreateBmp32(Width, Height);

          if (FCommonData.SkinManager.gd[FCommonData.SkinIndex].Props[0].Transparency <> 100) or
               FCommonData.SkinManager.IsValidImgIndex(FCommonData.BorderIndex) and
                 (FCommonData.SkinManager.ma[FCommonData.BorderIndex].DrawMode and BDM_FILL = 0) then begin
            R := PaintBorderFast(NewDC, R, i, FCommonData, 0);
            FillDC(NewDC, R, C);
            BitBltBorder(NewDC, 0, 0, Width, Height, FCommonData.FCacheBmp.Canvas.Handle, 0, 0, i);
          end
          else begin // If filled by BorderMask
            PaintBorderFast(NewDC, R, 0, FCommonData, 0);
            BitBlt(NewDC, 0, 0, Width, Height, FCommonData.FCacheBmp.Canvas.Handle, 0, 0, SRCCOPY);
          end;
        end;
      end;
      R := ClientRect;
      i := BorderWidth + (integer(BevelInner <> bvNone) + integer(BevelOuter <> bvNone)) * BevelWidth;
      InflateRect(R, -i, -i);
      if DC = 0 then
        TmpCanvas := Canvas
      else begin
        TmpCanvas := TCanvas.Create;
        TmpCanvas.Handle := DC;
        TmpCanvas.Font.Assign(Font);
        TmpCanvas.Brush.Style := bsClear;
      end;
      WriteText(R, TmpCanvas);
      if Assigned(FOnPaint) then
        FOnPaint(Self, TmpCanvas);

      if DC <> 0 then
        FreeAndNil(TmpCanvas);

      FCommonData.BGChanged := False;
      RestoreDC(NewDC, SavedDC);
      sVCLUtils.PaintControls(NewDC, Self, True, MkPoint);
    end;
    if SendUpdated and not (csPaintCopy in ControlState) {and not InUpdating(FCommonData) test in Beta } then
      SetParentUpdated(Self);
  end;
end;


procedure TsPanel.Paint;
begin
  inherited;
  if Showing and Assigned(FOnPaint) then
    FOnPaint(Self, Canvas)
end;


procedure TsPanel.PaintDragPanel(DC: hdc);
var
  DragSize, i, Ndx, dHeight, dWidth: integer;
  Captioned: boolean;
  CI: TCacheInfo;
  dRatio: real;
  Bmp: TBitmap;
  gR, R: TRect;
  s: string;
begin
  if (DockManager <> nil) and (VisibleDockClientCount > 0) then begin
    Captioned := DefaultDockTreeClass.ClassName = 'TCaptionedDockTree';
    DragSize := iff(Captioned, 23, 12);
    for i := 0 to DockClientCount - 1 do
      if DockClients[i].Visible then begin
        R := DockClients[i].BoundsRect;
        OffsetRect(R, 0, -DragSize);
        R.Bottom := R.Top + DragSize;
        Bmp := CreateBmp32(WidthOf(R), DragSize);
        try
          if Captioned then
            if SkinData.SkinManager.ConstData.Sections[ssDragBar] < 0 then
              Ndx := SkinData.SkinManager.ConstData.Sections[ssPanel]
            else
              Ndx := SkinData.SkinManager.ConstData.Sections[ssDragBar]
          else
            if SkinData.SkinManager.ConstData.Sections[ssGripV] < 0 then
              Ndx := SkinData.SkinManager.ConstData.Sections[ssGripH]
            else
              Ndx := SkinData.SkinManager.ConstData.Sections[ssGripV];

          if Ndx >= 0 then begin
            CI := MakeCacheInfo(SkinData.FCacheBmp);
            PaintItem(Ndx, CI, True, 0, R, MkPoint, SkinData.FCacheBmp);
            if Captioned and HasProperty(DockClients[i], 'Caption') then begin
              s := GetStrProp(DockClients[i], 'Caption');
              gR := R;
              InflateRect(gR, -5, -5);
              dec(gR.Right, 18);
              acWriteTextEx(SkinData.FCacheBmp.Canvas, PAcChar(s), True, gR, DT_LEFT or DT_VCENTER or DT_END_ELLIPSIS, Ndx, False);
            end;
          end;

          Ndx := SkinData.SkinManager.ConstData.TitleGlyphs[tgSmallClose];
          if Ndx >= 0 then begin
            Bmp.Width  := SkinData.SkinManager.ma[Ndx].Width;
            Bmp.Height := SkinData.SkinManager.ma[Ndx].Height;
            if Bmp.Height > DragSize then
              dRatio := DragSize / Bmp.Height
            else
              dRatio := 1;

            dWidth  := Round(Bmp.Width  * dRatio);
            dHeight := Round(Bmp.Height * dRatio);

            gR.Top := R.Top + (DragSize - dHeight) div 2;
            gR.Bottom := gR.Top + dHeight;
            gR.Right := R.Right - (gR.Top - R.Top);
            gR.Left := gR.Right - dWidth;

            CI := MakeCacheInfo(SkinData.FCacheBmp, gR.Left, gR.Top);

            if dRatio = 1 then begin
              BitBlt(Bmp.Canvas.Handle, 0, 0, Bmp.Width, Bmp.Height, SkinData.FCacheBmp.Canvas.Handle, gR.Left, gR.Top, SRCCOPY);
              DrawSkinGlyph(Bmp, MkPoint, 0, 1, SkinData.SkinManager.ma[Ndx], CI);
              BitBlt(DC, gR.Left, gR.Top, Bmp.Width, Bmp.Height, Bmp.Canvas.Handle, 0, 0, SRCCOPY);
            end
            else begin
              StretchBlt(Bmp.Canvas.Handle, 0, 0, Bmp.Width, Bmp.Height, SkinData.FCacheBmp.Canvas.Handle, gR.Left, gR.Top, WidthOf(gR), HeightOf(gR), SRCCOPY);
              DrawSkinGlyph(Bmp, MkPoint, 0, 1, SkinData.SkinManager.ma[Ndx], CI);
              StretchBlt(DC, gR.Left, gR.Top, WidthOf(gR), HeightOf(gR), Bmp.Canvas.Handle, 0, 0, Bmp.Width, Bmp.Height, SRCCOPY);
            end;
          end;
        finally
          Bmp.Free
        end;
      end;
  end;
end;


procedure TsPanel.PaintWindow(DC: HDC);
begin
  if not (csPaintCopy in ControlState) or not SkinData.Skinned then
    inherited;

  OurPaint(DC);
end;


function TsPanel.PrepareCache: boolean;
var
  w: integer;
  R: TRect;
begin
  if IsCached(FCommonData) or InAnimationProcess or (Self is TsColorsPanel) then begin
    InitCacheBmp(SkinData);
    if not PaintSkinControl(FCommonData, Parent, True, 0, MkRect(Self), Point(Left, Top), FCommonData.FCacheBMP, True) then begin
      SkinData.FUpdating := True;
      Result := False;
    end
    else begin
      R := ClientRect;
      w := BorderWidth + integer(BevelInner <> bvNone) * BevelWidth + integer(BevelOuter <> bvNone) * BevelWidth;
      InflateRect(R, -w, -w);
      UpdateBmpColors(FCommonData.FCacheBmp, SkinData, True, 0);
      SkinData.PaintOuterEffects(Self, MkPoint);
      WriteText(R, FCommonData.FCacheBmp.Canvas);
      if Assigned(FOnPaint) then
        FOnPaint(Self, FCommonData.FCacheBmp.Canvas);

      if DockSite then
        PaintDragPanel(FCommonData.FCacheBmp.Canvas.Handle);

      FCommonData.BGChanged := False;
      Result := True;
    end;
  end
  else
    Result := False;
end;


const
  BevelSections: array [TBevelCut] of TacSection = (ssTransparent, ssPanelLow, ssPanel, ssTransparent);


procedure TsPanel.WndProc(var Message: TMessage);
var
  SaveIndex: Integer;
  PS: TPaintStruct;
  DC: HDC;
begin
{$IFDEF LOGGED}
  AddToLog(Message);
{$ENDIF}
  if Message.Msg = SM_ALPHACMD then
    case Message.WParamHi of
      AC_CTRLHANDLED: begin
        Message.Result := 1;
        Exit;
      end;

      AC_REMOVESKIN: begin
        ControlStyle := ControlStyle - [csOpaque];
        if ACUInt(Message.LParam) = ACUInt(SkinData.SkinManager) then begin
          CommonMessage(Message, FCommonData);
          Invalidate;
        end;
        AlphaBroadCast(Self, Message);
        Exit;
      end;

      AC_SETNEWSKIN: begin
        ControlStyle := ControlStyle - [csOpaque];
        AlphaBroadCast(Self, Message);
        if ACUInt(Message.LParam) = ACUInt(SkinData.SkinManager) then
          CommonMessage(Message, FCommonData);

        Exit;
      end;

      AC_REFRESH: begin
        if ACUInt(Message.LParam) = ACUInt(SkinData.SkinManager) then begin
          CommonMessage(Message, FCommonData);
          if Assigned(OnPaint) or DockSite then
            SkinData.CtrlSkinState := SkinData.CtrlSkinState and not ACS_FAST;

          if HandleAllocated and not (csLoading in ComponentState) and Visible then begin
            InvalidateRect(Handle, nil, True);
            RedrawWindow(Handle, nil, 0, RDWA_NOCHILDRENNOW);
            AlphaBroadCast(Self, Message);
          end;
        end
        else
          AlphaBroadCast(Self, Message);

        Exit;
      end;

      AC_GETBG:
        if (SkinData.SkinManager <> nil) and SkinData.SkinManager.IsValidSkinIndex(SkinData.SkinIndex) then begin
          if Assigned(OnPaint) or DockSite then
            SkinData.CtrlSkinState := SkinData.CtrlSkinState and not ACS_FAST;

          InitBGInfo(FCommonData, PacBGInfo(Message.LParam), 0);
          if not (PacBGInfo(Message.LParam)^.BgType in [btNotReady, btFill]) then
            with PacBGInfo(Message.LParam)^ do begin
              // If BG is not ready yet
              if SkinData.BGChanged and ((SkinData.FCacheBmp.Width <> Width) or (SkinData.FCacheBmp.Height <> Height)) and not SkinData.Updating then
                if (Parent = nil) or not Parent.HandleAllocated or GetBoolMsg(Parent.Handle, ac_CtrlHandled) then begin // If parent is skinned
                  BgType := btNotReady;
                  Exit;
                end;

              if (WidthOf(ClientRect) <> Width) and (BgType = btCache) and not PleaseDraw then begin
                SaveIndex := BorderWidth + BevelWidth * (integer(BevelInner <> bvNone) + integer(BevelOuter <> bvNone));
                inc(Offset.X, SaveIndex);
                inc(Offset.Y, SaveIndex);
              end;
            end;

          Exit;
        end;

      AC_GETDEFINDEX: begin
        if FCommonData.SkinManager <> nil then
          with FCommonData.SkinManager.ConstData, Message do
            case BevelOuter of
              bvRaised:  Result := 1 + Sections[ssPanel];
              bvLowered: Result := 1 + Sections[ssPanelLow];
              bvSpace:   Result := 1 + Sections[ssGroupBox];
              bvNone:    Result := 1 + Sections[ssTransparent];
            end;

        Exit;
      end;
    end;

  if not ControlIsReady(Self) or not FCommonData.Skinned then
    case Message.Msg of
      WM_PRINT:
        if Assigned(OnPaint) then begin
          OnPaint(Self, Canvas);
          if TWMPaint(Message).DC <> 0 then
            BitBlt(TWMPaint(Message).DC, 0, 0, Width, Height, Canvas.Handle, 0, 0, SRCCOPY);
        end
        else
          Perform(WM_PAINT, Message.WParam, Message.LParam);

      WM_ERASEBKGND:
        if not Assigned(FOnPaint) then
          inherited;

      else
        inherited;
    end
  else begin
    case Message.Msg of
      SM_ALPHACMD:
        case Message.WParamHi of
          AC_ENDPARENTUPDATE: begin
            if FCommonData.FUpdating then begin
              if not InUpdating(FCommonData, True) then
                if ((Width <> FCommonData.FCacheBmp.Width) or (Height <> FCommonData.FCacheBmp.Height)) and Assigned(OnResize) then begin
                  Repaint;
                  OnResize(Self);
                end
                else
                  Repaint;

              SetParentUpdated(Self);
            end
            else
              if SkinData.CtrlSkinState and ACS_FAST <> 0 then
                SetParentUpdated(Self);

            Exit;
          end;

          AC_PREPARECACHE: begin
            if not DockSite then
              if not InUpdating(SkinData) and not PrepareCache then
                SkinData.FUpdating := True;

            Exit;
          end

          else
            if CommonMessage(Message, FCommonData) then
              Exit;
        end;

      WM_PRINT: begin
        FCommonData.FUpdating := False;
        FCommonData.HalfVisible := False;
        if ControlIsReady(Self) then begin
          if not (IsCached(FCommonData) or (Self is TsColorsPanel)) and not Assigned(FCommonData.FCacheBMP) then
            FCommonData.FCacheBMP := CreateBmp32;

          DC := TWMPaint(Message).DC;
          if not IsCached(FCommonData) or SkinData.CustomColor or FCommonData.BGChanged then
            PrepareCache;

          OurPaint(DC, False);
        end;
        Exit;
      end;

      WM_PAINT:
        if Visible or (csDesigning in ComponentState) then begin
          DC := BeginPaint(Handle, PS);
          if IsCached(SkinData) then begin
            if not InUpdating(FCommonData) then begin
              if TWMPAINT(Message).DC = 0 then
                DC := GetDC(Handle)
              else
                DC := TWMPAINT(Message).DC;

              try
                SaveIndex := SaveDC(DC);
                ControlState := ControlState + [csCustomPaint];
                Canvas.Lock;
                Canvas.Handle := DC;
                try
                  TControlCanvas(Canvas).UpdateTextFlags;
                  OurPaint(DC);
                finally
                  Canvas.Handle := 0;
                  Canvas.Unlock;
                end;
                RestoreDC(DC, SaveIndex);
              finally
                ControlState := ControlState - [csCustomPaint];
                if TWMPaint(Message).DC = 0 then
                  ReleaseDC(Handle, DC);
              end;
            end;
          end
          else
//{$IFDEF DELPHI7UP}
//            if not ParentBackground then begin// If BG is not redrawn automatically
//{$ENDIF}
              OurPaint(DC); // Repainting of graphic controls

          EndPaint(Handle, PS);
          Message.Result := 0;
          Exit;
        end;

      CM_UNDOCKCLIENT, CM_CONTROLLISTCHANGE, WM_CAPTURECHANGED:
        if DockSite then
          FCommonData.BGChanged := True;

      CM_TEXTCHANGED: begin
        if Parent <> nil then
          FCommonData.Invalidate;

        Exit;
      end;

      WM_ERASEBKGND: begin
        if not (csPaintCopy in ControlState) and (Message.WParam <> WParam(Message.LParam) {PerformEraseBackground, TntSpeedButtons}) then begin
          if not InUpdating(FCommonData) and not IsCached(SkinData) then
            OurPaint(TWMPaint(Message).DC)
          else
            if csDesigning in ComponentState then
              inherited;
        end
        else
          if Message.WParam <> 0 then begin // From PaintTo
            if FCommonData.BGChanged then
              PrepareCache;

            if not FCommonData.BGChanged then
              if IsCached(FCommonData) then
                BitBlt(TWMPaint(Message).DC, 0, 0, Width, Height, FCommonData.FCacheBmp.Canvas.Handle, 0, 0, SRCCOPY)
              else
                FillDC(TWMPaint(Message).DC, MkRect(Self), GetControlColor(Handle));
          end;

        Message.Result := 1;
        Exit;
      end;

      CM_VISIBLECHANGED: begin
        FCommonData.BGChanged := True;
        FCommonData.FUpdating := False;
        if Visible then begin
          PrepareCache;
          inherited;
          SetParentUpdated(Self);
        end
        else
          inherited;

        Exit;
      end;

      CM_INVALIDATE:
        if FOldBevel <> BevelOuter then begin
          FCommonData.UpdateIndexes;
          FOldBevel := BevelOuter;
        end;

      CM_COLORCHANGED:
        if SkinData.CustomColor then
          SkinData.BGChanged := True;

      WM_KILLFOCUS, WM_SETFOCUS: begin
        inherited;
        Exit
      end;

      CM_SHOWINGCHANGED:
        if {(SkinData.SkinManager.Options.OptimizingPriority = opMemory) and} Visible then
          FCommonData.FUpdating := False;

      WM_WINDOWPOSCHANGING:
        if (SkinData.SkinManager.gd[SkinData.SkinIndex].Props[0].Transparency <> 0) then
          if (TWMWindowPosChanging(Message).WindowPos.flags and SWP_NOMOVE = 0) then
            FCommonData.BGChanged := True;

      WM_SIZE:
        FCommonData.BGChanged := True;
    end;
    CommonWndProc(Message, FCommonData);
    inherited;
    case Message.Msg of
      WM_WINDOWPOSCHANGED, WM_SIZE:
        if not InUpdating(FCommonData) then begin
//          if FCommonData.BGChanged then
//            Repaint;

          if Assigned(OnResize) and (Message.Msg = WM_SIZE) then
            OnResize(Self);
        end;

      CM_ENABLEDCHANGED:
        FCommonData.Invalidate;

      WM_SETFONT:
        if Caption <> '' then begin
          FCommonData.BGChanged := True;
          Repaint;
        end;
    end;
  end;
{$IFNDEF D2010}
  case Message.Msg of
    CM_MOUSEENTER: if Assigned(FOnMouseEnter) then FOnMouseEnter(Self);
    CM_MOUSELEAVE: if Assigned(FOnMouseLeave) then FOnMouseLeave(Self);
  end;
{$ENDIF}
end;


procedure TsPanel.WriteText(R: TRect; aCanvas: TCanvas = nil; aDC: hdc = 0);
var
  C: TCanvas;
  TmpRect: TRect;
  Flags: Cardinal;
begin
{$IFDEF D2009}
  if not ShowCaption then
    Exit;
{$ENDIF}
  if Caption <> '' then begin
    if aCanvas = nil then
      if aDC <> 0 then begin
        C := TCanvas.Create;
        C.Handle := aDC;
      end
      else
        Exit
    else
      C := aCanvas;

    TmpRect := R;
    C.Font.Assign(Font);
{$IFDEF D2005}
    if VerticalAlignment <> taVerticalCenter then begin
      Flags := GetStringFlags(Self, alignment) or DT_SINGLELINE;
      Flags := Flags and not DT_VCENTER and not DT_WORDBREAK;
      if VerticalAlignment = taAlignBottom then
        Flags := Flags or DT_BOTTOM;

      acWriteTextEx(C, PacChar(Caption), Enabled, R, Flags, FCommonData, False);
    end
    else
{$ENDIF}
    begin
      Flags := GetStringFlags(Self, alignment) or DT_WORDBREAK;
      acDrawText(C.Handle, Caption, TmpRect, Flags or DT_CALCRECT);
      R.Top := R.Top + (HeightOf(R) - HeightOf(TmpRect, True)) div 2 + BorderWidth;
      R.Bottom := R.Top + HeightOf(TmpRect, True);
      acWriteTextEx(C, PacChar(Caption), Enabled, R, Flags, FCommonData, False);
    end;
    if (aCanvas = nil) and (C <> nil) then
      FreeAndNil(C);
  end;
end;


constructor TsDragBar.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  SkinData.COC := COC_TsDragBar;
  Caption := s_Space;
  Align := alTop;
  Height := 20;
  Color := clActiveCaption;
  Cursor := crHandPoint;
{$IFDEF DELPHI7UP}
  ParentBackGround := False;
{$ENDIF}
end;


procedure TsDragBar.Loaded;
begin
  inherited;
  if not ParentFont then begin
    if not SkinData.Skinned then
      Font.Color := clCaptionText;

    Font.Style := [fsBold];
  end;
end;


procedure TsDragBar.MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited MouseDown(Button, Shift, x, y);
  if (Button = mbLeft) and (FDraggedControl <> nil) then begin
    ReleaseCapture;
    FDraggedControl.Perform(WM_SYSCOMMAND, SC_DRAGMOVE, 0);
    if Assigned(OnClick) then
      OnClick(Self);

    if Assigned(OnMouseUp) then
      OnMouseUp(Self, Button, Shift, X, Y);
  end
end;


procedure TsDragBar.Notification(AComponent: TComponent; Operation: TOperation);
begin
  inherited;
  if Operation = opRemove then
    if AComponent = DraggedControl then
      DraggedControl := nil
end;


procedure TsDragBar.ReadState(Reader: TReader);
begin
  if (Reader.Parent <> nil) and (DraggedControl = nil) then
    DraggedControl := GetParentForm(TControl(Reader.Parent));

  inherited ReadState(Reader);
end;


procedure TsDragBar.WMActivateApp(var Message: TWMActivateApp);
begin
  Font.Color := iff(Message.Active, clActiveCaption, clInActiveCaption);
end;


procedure TsDragBar.WndProc(var Message: TMessage);
begin
  inherited;
  if Message.Msg = SM_ALPHACMD then
    case Message.WParamHi of
      AC_REMOVESKIN: begin
        Color := clActiveCaption;
        Font.Color := clCaptionText;
{$IFDEF DELPHI7UP}
        ParentBackGround := False;
{$ENDIF}
      end;
    end;
end;


constructor TsGrip.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Caption := s_Space;
  Transparent := False;
  SkinData.SkinSection := s_Transparent;
  Align := alNone;
  Height := 20;
  Width := 20;
end;


procedure TsGrip.Paint;
var
  CI: TCacheInfo;
  BG: TacBGInfo;
begin
  if ControlIsReady(Self) then begin
    SkinData.BGChanged := False;
    CI.Ready := False;
    if Transparent and (LinkedControl <> nil) then begin
      BG.PleaseDraw := False;
      GetBGInfo(@BG, LinkedControl);
      CI := BGInfoToCI(@BG);
    end;
    if CI.Ready then
      BitBlt(Canvas.Handle, 0, 0, Width, Height, CI.Bmp.Canvas.Handle, CI.Bmp.Width - Width + CI.X, CI.Bmp.Height - Height + CI.Y, SRCCOPY)
    else
      FillDC(Canvas.Handle, MkRect(Width, Height), CI.FillColor);
  end;
end;


procedure TsColorsPanel.AfterConstruction;
begin
  inherited;
  GenerateColors;
end;


procedure TsColorsPanel.ChangeScale(M, D: Integer);
begin
  inherited;
  if M <> D then begin
    FItemWidth  := MulDiv(FItemWidth,  M, D);
    FItemHeight := MulDiv(FItemHeight, M, D);
    ItemMargin  := MulDiv(ItemMargin,  M, D);
  end;
end;


function TsColorsPanel.ColorValue: TColor;
begin
  if FItemIndex < 0 then
    Result := clWhite
  else
    Result := ColorsArray[FItemIndex].ciColor;
end;


function TsColorsPanel.Count: integer;
begin
  Result := FColors.Count;
end;


constructor TsColorsPanel.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Caption := s_Space;
  FColors := TStringList.Create;
  FItemIndex := -1;
  ItemHeight := 21;
  ItemWidth := 21;
  FColCount := 5;
  FRowCount := 2;
  FItemMargin := 6;
  Height := 60;
  Width := 140;
end;


destructor TsColorsPanel.Destroy;
begin
  FreeAndNil(FColors);
  inherited Destroy;
end;


procedure TsColorsPanel.GenerateColors;
var
  i, x, y: integer;
  s: string;
begin
  SetLength(ColorsArray, 0);
  i := 0;
  for y := 0 to RowCount - 1 do
    for x := 0 to ColCount - 1 do begin
      SetLength(ColorsArray, i + 1);
      with ColorsArray[i] do begin
        if i < FColors.Count then begin
          s := ExtractWord(1, FColors[i], [#13, #10, s_Space]);
          ciColor := SwapInteger(HexToInt(s));
        end
        else begin
          ciColor := SwapInteger(ColorToRgb(clWhite));
          FColors.Add('FFFFFF');
        end;
        ciRect.Left   := ItemMargin + x * (ItemWidth + ItemMargin);
        ciRect.Top    := ItemMargin + y * (ItemHeight + ItemMargin);
        ciRect.Right  := ciRect.Left + ItemWidth;
        ciRect.Bottom := ciRect.Top + ItemHeight;
      end;
      inc(i);
    end;
end;


function TsColorsPanel.GetItemByCoord(p: TPoint): integer;
var
  i: integer;
  R: TRect;
begin
  Result := - 1;
  for i := 0 to Count - 1 do begin
    R := ColorsArray[i].ciRect;
    InflateRect(R, ItemMargin, ItemMargin);
    if PtInRect(R, p) then begin
      Result := i;
      Exit;
    end
  end;
end;


procedure TsColorsPanel.Loaded;
begin
  inherited;
  GenerateColors;
end;


procedure TsColorsPanel.MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  if CanFocus and IsWindowVisible(Handle) then
    SetFocus;

  ItemIndex := GetItemByCoord(Point(x, y));
end;


procedure TsColorsPanel.OurPaint;
var
  R: TRect;
  b: boolean;
  NewDC: hdc;
  Brush: TBrush;
begin
  if DC <> 0 then
    NewDC := DC
  else
    NewDC := Canvas.Handle;

  if not (csDestroying in ComponentState) and not (csCreating in Parent.ControlState) then begin
    if FCommonData.Skinned then begin
      if not InUpdating(FCommonData) then begin
        InitCacheBmp(SkinData);
        // If transparent and in a form resizing
        b := True or FCommonData.BGChanged or FCommonData.HalfVisible or GetBoolMsg(Parent, AC_GETHALFVISIBLE);
        FCommonData.HalfVisible := not (PtInRect(Parent.ClientRect, Point(Left, Top)) and
                                   PtInRect(Parent.ClientRect, Point(Left + Width, Top + Height)));
        if b then begin
          PaintItem(FCommonData, GetParentCache(FCommonData), False, 0, MkRect(Self), Point(Left, Top), FCommonData.FCacheBMP, False);
          WriteText(ClientRect);
          FCommonData.BGChanged := False;
          if not Assigned(FOnPaint) then
            PaintColors(FCommonData.FCacheBmp.Canvas.Handle);
        end;
        if Assigned(FOnPaint) then
          FOnPaint(Self, FCommonData.FCacheBmp.Canvas);

        CopyWinControlCache(Self, FCommonData, MkRect, MkRect(Self), NewDC, True);
        sVCLUtils.PaintControls(NewDC, Self, b, MkPoint);
        if SendUpdated then
          SetParentUpdated(Self);
      end;
    end
    else begin
      inherited;
      Perform(WM_NCPAINT, 0, 0);
      if not Assigned(FOnPaint) then
        PaintColors(NewDC);
    end;
    // Selected item
    if (FItemIndex >= 0) and not Assigned(FOnPaint) then begin
      R := ColorsArray[FItemIndex].ciRect;
      Brush := TBrush.Create;
      Brush.Style := bsSolid;
      Brush.Color := clWhite;
      InflateRect(R, 1, 1);
      FrameRect(NewDC, R, Brush.Handle);
      InflateRect(R, 1, 1);
      Brush.Color := 0;
      FrameRect(NewDC, R, Brush.Handle);
      if Focused then begin
        Brush.Color := clWhite;
        InflateRect(R, 2, 2);
        DrawFocusRect(NewDC, R);
      end;
      FreeAndNil(Brush);
    end;
  end;
end;


procedure TsColorsPanel.PaintColors(const DC: hdc);
var
  i: integer;
  bordColor: TColor;
begin
  if SkinData.Skinned then
    bordColor := SkinData.SkinManager.Palette[pcBorder]
  else
    bordColor := clBtnShadow;

  for i := 0 to Count - 1 do
    with ColorsArray[i] do begin
      FillDC(DC, ciRect, ciColor);
      FillDCBorder(DC, ciRect, 1, 1, 1, 1, bordColor);
    end;
end;


procedure TsColorsPanel.SetColors(const Value: TStrings);
begin
  FColors.Assign(Value);
  GenerateColors;
  SkinData.Invalidate;
end;


procedure TsColorsPanel.SetInteger(const Index, Value: integer);
begin
  case Index of
    0: if FColCount <> Value then begin
      FColCount := Value;
      GenerateColors;
      SkinData.Invalidate;
    end;

    1: begin
      if FItemIndex >= Count then
        FItemIndex := - 1;

      if FItemIndex <> Value then begin
        OldSelected := FItemIndex;
        FItemIndex := Value;
        if Assigned(FOnChange) then
          FOnChange(Self);

        Repaint;
      end;
    end;

    2: if FItemHeight <> Value then begin
      FItemHeight := Value;
      GenerateColors;
      SkinData.Invalidate;
    end;

    3: if FItemWidth <> Value then begin
      FItemWidth := Value;
      GenerateColors;
      SkinData.Invalidate;
    end;

    4: if FItemMargin <> Value then begin
      FItemMargin := Value;
      GenerateColors;
      SkinData.Invalidate;
    end;

    5: if FRowCount <> Value then begin
      FRowCount := Value;
      GenerateColors;
      SkinData.Invalidate;
    end;
  end;
end;


procedure TsColorsPanel.WndProc(var Message: TMessage);
begin
  inherited;
  case Message.Msg of
    WM_SETFOCUS, WM_KILLFOCUS:
      if FItemIndex >= 0 then
        Repaint;
  end;
end;


procedure TsGradientPanel.AfterConstruction;
begin
  inherited;
end;


procedure TsGradientPanel.CopyCache(DC: hdc);
var
  R, cR: TRect;
  i: integer;
  SaveIndex: HDC;
  Child: TControl;
begin
  SaveIndex := SaveDC(DC);
  cR := MkRect(Self);
//  IntersectClipRect(DC, DstRect.Left, DstRect.Top, DstRect.Right, DstRect.Bottom);
  try
    for i := 0 to ControlCount - 1 do begin
      Child := Controls[i];
      if (Child is TGraphicControl) and ((DefaultManager = nil) or DefaultManager.Options.StdImgTransparency) {$IFNDEF ALITE}or (Child is TsSplitter){$ENDIF} then
        Continue;

      with Child do begin
        R := BoundsRect;
        if Visible and RectIsVisible(cR, R) then
          if {(csDesigning in ComponentState) or} (csOpaque in ControlStyle) or (Child is TGraphicControl) then
            ExcludeClipRect(DC, R.Left, R.Top, R.Right, R.Bottom);
      end;
    end;
    BitBlt(DC, 0, 0, Width, Height, FCacheBmp.Canvas.Handle, 0, 0, SRCCOPY);
  finally
    RestoreDC(DC, SaveIndex);
  end;

//  BitBlt(DC, 0, 0, Width, Height, FCacheBmp.Canvas.Handle, 0, 0, SRCCOPY)
end;


constructor TsGradientPanel.Create(AOwner: TComponent);
begin
  inherited;
  BGChanged := True;
  FCacheBmp := CreateBmp32;
  FPaintData := TacGradPaintData.Create(Self);
end;


destructor TsGradientPanel.Destroy;
begin
  FCacheBmp.Free;
  FPaintData.Free;
  inherited;
end;


procedure TsGradientPanel.Loaded;
begin
  inherited;
  ControlStyle := ControlStyle - [csOpaque];
end;


procedure TsGradientPanel.OurPaint(DC: HDC; SendUpdated: boolean);
var
  R: TRect;
  i: integer;
  b: boolean;
  NewDC: HDC;
begin
  if Showing then begin
    if DC <> 0 then
      NewDC := DC
    else
      NewDC := Canvas.Handle;

    b := BGChanged;
    if BGChanged and not PrepareCache then
      Exit;

    i := GetClipBox(NewDC, R);
    if (i = 0) {or IsRectEmpty(R) is not redrawn while resizing }then
      Exit;

    CopyCache(NewDC);
    sVCLUtils.PaintControls(NewDC, Self, b, MkPoint);

    if SendUpdated and not (csPaintCopy in ControlState) {and not InUpdating(FCommonData) test in Beta } then
      SetParentUpdated(Self);
  end;
end;



procedure TsGradientPanel.Paint;
begin
  inherited;
  if Showing and Assigned(FOnPaint) then
    FOnPaint(Self, Canvas)
end;


procedure TsGradientPanel.PaintWindow(DC: HDC);
begin
  if not (csPaintCopy in ControlState) then
    inherited;

  OurPaint(DC);
end;


function TsGradientPanel.PrepareCache: boolean;
var
  R: TRect;
  s, s1, s2: string;
begin
  FCacheBmp.Width := Width;
  FCacheBmp.Height := Height;

  R := MkRect(FCacheBmp);
  // Paint here
  if (PaintData.CustomGradient = '') {or (PaintData.CustomGradient = 'N/A') }then begin
    if FPaintData.Color1.UseSkinColor and (DefaultManager <> nil) and DefaultManager.CommonSkinData.Active then
      s1 := IntToStr(DefaultManager.Palette[pcMainColor])
    else
      s1 := IntToStr(ColorToRGB(FPaintData.Color1.Color));

    if FPaintData.Color2.UseSkinColor and (DefaultManager <> nil) and DefaultManager.CommonSkinData.Active then
      s2 := IntToStr(DefaultManager.Palette[pcMainColor])
    else
      s2 := IntToStr(ColorToRGB(FPaintData.Color2.Color));

    s := s1 + ';' + s2 + ';' + IntToStr(100) + ';' + IntToStr(integer(not PaintData.IsVertical)) + ';' + IntToStr(integer(not PaintData.IsVertical)) + ';';
    s := s + s2 + ';' + s2 + ';' + IntToStr(0) + ';' + IntToStr(integer(not PaintData.IsVertical)) + ';' + IntToStr(integer(not PaintData.IsVertical)) + ';';
    PaintGrad(FCacheBmp, R, s);
  end
  else
    PaintGrad(FCacheBmp, R, PaintData.CustomGradient);

  FCacheBmp.Canvas.Brush.Style := bsClear;
  WriteText(R, FCacheBmp.Canvas);
  if Assigned(FOnPaint) then
    FOnPaint(Self, FCacheBmp.Canvas);

  BGChanged := False;
  Result := True;
end;


procedure TsGradientPanel.UpdatePalette;
begin

end;


procedure TsGradientPanel.WndProc(var Message: TMessage);
var
  SaveIndex: Integer;
  PS: TPaintStruct;
  DC: HDC;
begin
{$IFDEF LOGGED}
  AddToLog(Message);
{$ENDIF}
  if Message.Msg = SM_ALPHACMD then
    case Message.WParamHi of
      AC_CTRLHANDLED: begin
        Message.Result := 1;
        Exit;
      end;

      AC_REMOVESKIN: begin
        if ACUInt(Message.LParam) = ACUInt(DefaultManager) then begin
          UpdatePalette;
          Invalidate;
        end;
        AlphaBroadCast(Self, Message);
        Exit;
      end;

      AC_SETNEWSKIN: begin
        AlphaBroadCast(Self, Message);
        Exit;
      end;

      AC_REFRESH: begin
        if ACUInt(Message.LParam) = ACUInt(DefaultManager) then begin
          if HandleAllocated and not (csLoading in ComponentState) and Visible then begin
            InvalidateRect(Handle, nil, True);
            RedrawWindow(Handle, nil, 0, RDWA_NOCHILDRENNOW);
            AlphaBroadCast(Self, Message);
          end;
        end
        else
          AlphaBroadCast(Self, Message);

        Exit;
      end;

      AC_GETBG: begin
        if not BGChanged or PrepareCache then begin
          PacBGInfo(Message.LParam)^.Bmp := FCacheBmp;
          PacBGInfo(Message.LParam)^.Offset := MkPoint;
          PacBGInfo(Message.LParam)^.R := MkRect;
          PacBGInfo(Message.LParam)^.BgType := btCache;
        end;
        Exit;
      end;
    end;

  if not ControlIsReady(Self) then
    case Message.Msg of
      WM_PRINT:
        if Assigned(OnPaint) then begin
          OnPaint(Self, Canvas);
          if TWMPaint(Message).DC <> 0 then
            BitBlt(TWMPaint(Message).DC, 0, 0, Width, Height, Canvas.Handle, 0, 0, SRCCOPY);
        end
        else
          Perform(WM_PAINT, Message.WParam, Message.LParam);

      WM_ERASEBKGND:
        if not Assigned(FOnPaint) then
          inherited;

      else
        inherited;
    end
  else begin
    case Message.Msg of
      SM_ALPHACMD: begin
        case Message.WParamHi of
          AC_ENDPARENTUPDATE:
            SetParentUpdated(Self);

          AC_PREPARECACHE:
            PrepareCache;
        end;
        Exit;
      end;

      WM_PRINT: begin
        if ControlIsReady(Self) then begin
          DC := TWMPaint(Message).DC;
          PrepareCache;
          OurPaint(DC, False);
        end;
        Exit;
      end;

      WM_PAINT:
        if Visible or (csDesigning in ComponentState) then begin
          BeginPaint(Handle, PS);
          if TWMPAINT(Message).DC = 0 then
            DC := GetDC(Handle)
          else
            DC := TWMPAINT(Message).DC;

          try
            SaveIndex := SaveDC(DC);
            ControlState := ControlState + [csCustomPaint];
            Canvas.Lock;
            Canvas.Handle := DC;
            try
              TControlCanvas(Canvas).UpdateTextFlags;
              OurPaint(DC);
            finally
              Canvas.Handle := 0;
              Canvas.Unlock;
            end;
            RestoreDC(DC, SaveIndex);
          finally
            ControlState := ControlState - [csCustomPaint];
            if TWMPaint(Message).DC = 0 then
              ReleaseDC(Handle, DC);
          end;
          EndPaint(Handle, PS);
          Message.Result := 0;
          Exit;
        end;

      CM_TEXTCHANGED: begin
        BGChanged := True;
        Exit;
      end;

      WM_ERASEBKGND: begin
        if not (csPaintCopy in ControlState) and (Message.WParam <> WParam(Message.LParam) {PerformEraseBackground, TntSpeedButtons}) then begin
{          if not InUpdating(FCommonData) and not IsCached(SkinData) then
            OurPaint(TWMPaint(Message).DC)
          else}
            if csDesigning in ComponentState then
              inherited;
        end
        else
          if Message.WParam <> 0 then begin // From PaintTo
            if BGChanged then
              PrepareCache;

            if not BGChanged then
              CopyCache(TWMPaint(Message).DC);
          end;

        Message.Result := 1;
        Exit;
      end;

      CM_VISIBLECHANGED: begin
        BGChanged := True;
        if Visible then begin
          PrepareCache;
          inherited;
          SetParentUpdated(Self);
        end
        else
          inherited;

        Exit;
      end;

      WM_KILLFOCUS, WM_SETFOCUS: begin
        inherited;
        Exit
      end;

      WM_SIZE:
        BGChanged := True;
    end;
    inherited;
    case Message.Msg of
      WM_WINDOWPOSCHANGED, WM_SIZE:
        if Assigned(OnResize) and (Message.Msg = WM_SIZE) then
          OnResize(Self);

      WM_SETFONT:
        if Caption <> '' then begin
          BGChanged := True;
          Repaint;
        end;
    end;
  end;
{$IFNDEF D2010}
  case Message.Msg of
    CM_MOUSEENTER: if Assigned(FOnMouseEnter) then FOnMouseEnter(Self);
    CM_MOUSELEAVE: if Assigned(FOnMouseLeave) then FOnMouseLeave(Self);
  end;
{$ENDIF}
end;


procedure TsGradientPanel.WriteText(R: TRect; aCanvas: TCanvas; aDC: hdc);
var
  C: TCanvas;
  TmpRect: TRect;
  Flags: Cardinal;
begin
{$IFDEF D2009}
  if not ShowCaption then
    Exit;
{$ENDIF}
  if Caption <> '' then begin
    if aCanvas = nil then
      if aDC <> 0 then begin
        C := TCanvas.Create;
        C.Handle := aDC;
      end
      else
        Exit
    else
      C := aCanvas;

    TmpRect := R;
    C.Font.Assign(Font);
{$IFDEF D2005}
    if VerticalAlignment <> taVerticalCenter then begin
      Flags := GetStringFlags(Self, alignment) or DT_SINGLELINE;
      Flags := Flags and not DT_VCENTER and not DT_WORDBREAK;
      if VerticalAlignment = taAlignBottom then
        Flags := Flags or DT_BOTTOM;
    end
    else
{$ENDIF}
    begin
      Flags := GetStringFlags(Self, alignment) or DT_WORDBREAK;
      acDrawText(C.Handle, Caption, TmpRect, Flags or DT_CALCRECT);
      R.Top := R.Top + (HeightOf(R) - HeightOf(TmpRect, True)) div 2 + BorderWidth;
      R.Bottom := R.Top + HeightOf(TmpRect, True);
    end;
    acWriteText(C, PacChar(Caption), Enabled, R, Flags);
    if (aCanvas = nil) and (C <> nil) then
      FreeAndNil(C);
  end;
end;


constructor TacGradPaintData.Create(AOwner: TsGradientPanel);
begin
  FOwner := AOwner;
  FIsVertical := True;
  FColor1 := TacColorData1.Create(Self);
  FColor2 := TacColorData2.Create(Self);
end;


destructor TacGradPaintData.Destroy;
begin
  FColor2.Free;
  FColor1.Free;
  inherited;
end;


procedure TacGradPaintData.Invalidate;
begin
  FOwner.BGChanged := True;
  if [csLoading, csDestroying] * FOwner.ComponentState = [] then
    FOwner.Invalidate;
end;


procedure TacGradPaintData.SetColor1(const Value: TacColorData1);
begin
  if FColor1 <> Value then begin
    FColor1 := Value;
    Invalidate;
  end;
end;


procedure TacGradPaintData.SetColor2(const Value: TacColorData2);
begin
  if FColor2 <> Value then begin
    FColor2 := Value;
    Invalidate;
  end;
end;


procedure TacGradPaintData.SetCustomGradient(const Value: string);
begin
  if FCustomGradient <> Value then begin
    FCustomGradient := Value;
    Invalidate;
  end;
end;


procedure TacGradPaintData.SetIsVertical(const Value: boolean);
begin
  if FIsVertical <> Value then begin
    FIsVertical := Value;
    Invalidate;
  end;
end;


constructor TacColorData1.Create(AOwner: TacGradPaintData);
begin
  FOwner := AOwner;
  FUseSkinColor := False;
  FColor := clWhite;
end;


procedure TacColorData1.Invalidate;
begin
  FOwner.Invalidate;
end;


procedure TacColorData1.SetColor(const Value: TColor);
begin
  if FColor <> Value then begin
    FColor := Value;
    Invalidate;
  end;
end;


procedure TacColorData1.SetUseSkinColor(const Value: boolean);
begin
  FUseSkinColor := Value;
end;


constructor TacColorData2.Create(AOwner: TacGradPaintData);
begin
  FOwner := AOwner;
  FColor := clBtnFace;
  FUseSkinColor := True;
end;

end.
