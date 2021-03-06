{***************************************************************************}
{ TMS Advanced Charts for IntraWeb DB version                               }
{ for Delphi & C++Builder                                                   }
{                                                                           }
{ written by TMS Software                                                   }
{            copyright � 2012                                               }
{            Email : info@tmssoftware.com                                   }
{            Web : http://www.tmssoftware.com                               }
{                                                                           }
{ The source code is given as is. The author is not responsible             }
{ for any possible damage done due to the use of this code.                 }
{ The component can be freely used in any application. The complete         }
{ source code remains property of the author and may not be distributed,    }
{ published, given or sold in any form as such. No parts of the source      }
{ code can be included in any other component or application without        }
{ written authorization of the author.                                      }
{***************************************************************************}
unit IWDBAdvChart;

{$I TMSDEFS.INC}

interface

uses
  AdvChartViewGDIP, DBAdvChartView, DB, DBAdvChartViewGDIP, AdvChart, Math, Dialogs, IWApplication,
  Controls, Graphics, Windows,
  {$IFDEF DELPHI6_LVL}
  Types
  {$ENDIF}
  {$IFDEF TMSIW121}
  , IWCompExtCtrls
  {$ELSE}
  , IWExtCtrls
  {$ENDIF}
  {$IFDEF TMSIW14}
  , IW.CacheStream
  {$ENDIF}
  , Classes, IWControl, IWTypes, SysUtils, JPEG, IWHTMLTag, IWRenderContext,
  IWColor, IWXMLTag;

const
  MAJ_VER = 3; // Major version nr.
  MIN_VER = 1; // Minor version nr.
  REL_VER = 0; // Release nr.
  BLD_VER = 1; // Build nr.
  DATE_VER = 'NOV, 2012'; // Month version

type
  {$IFDEF TMSIW11}
  TIWComponent40Context = TIWCompContext;
  TIWBaseHTMLComponentContext = TIWCompContext;
  TIWBaseComponentContext = TIWCompContext;
  {$ENDIF}

  {$IFNDEF TMSIW11}
  TIWBaseComponentContext = TIWBaseHTMLComponentContext;
  {$ENDIF}

  {$IFDEF TMSIW14}
  TIWImageType = (imgPNG, imgJPEG, imgGIF, imgBMP);
  {$ENDIF}

  TIWChartSelectSerieIndexEvent = procedure(Sender: TObject; Serie: integer; PointIndex: integer) of object;

  TIWChartAnnotationMouseEvent = procedure(Sender: TObject; Serie, Annotation, Point: integer) of object;

  TIWChartClickEvent = procedure(Sender: TObject; X, Y: Integer) of object;

  TTIWDBAdvChart = class(TIWControl)
  private
    FUpdateCount: integer;
    FVersion: string;
    FChanged: boolean;
    FChartV: TDBAdvGDIPChartView;
    FImageQuality: integer;
    FOnSelectSerieIndex: TIWChartSelectSerieIndexEvent;
    FOnAnnotationClick: TIWChartAnnotationMouseEvent;
    FChartClick: TIWChartClickEvent;
    FAsyncChartClick: TIWChartClickEvent;
    FOnAsyncSelectSerieIndex: TIWChartSelectSerieIndexEvent;
    FOnAsyncAnnotationClick: TIWChartAnnotationMouseEvent;
    procedure SetChart(const Value: TDBAdvGDIPChart);
    function GetVersion: string;
    function GetChart: TDBAdvGDIPChart;
    function OutputImage: string;
    function GetDataSource: TDataSource;
    procedure SetDataSource(const Value: TDataSource);
  protected
    procedure FillPoints;
    function ImageHTML(const ASrc,BSrc: string; AContext: TIWBaseComponentContext): TIWHTMLTag;
    procedure SetValue(const value:string); override;
    procedure DoMouseEvents(X, Y: Integer);
    procedure DoAsyncChartClick(AParams: TStringList);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure ChartChanged(Sender: TObject);
    procedure IWPaint; override;
    function RenderHTML(AContext: TIWBaseComponentContext): TIWHTMLTag; override;
    function RenderAsync(AContext: TIWBaseHTMLComponentContext): TIWXMLTag; override;
    function GetVersionNr: Integer; virtual;
    function GetVersionString: string; virtual;
    procedure BeginUpdate;
    procedure EndUpdate;
  published
    property DataSource: TDataSource read GetDataSource write SetDataSource;
    property Chart: TDBAdvGDIPChart read GetChart write SetChart;
    property Version: string read GetVersion;
    property OnSelectSerieIndex: TIWChartSelectSerieIndexEvent read FOnSelectSerieIndex write FOnSelectSerieIndex;
    property OnAnnotationClick: TIWChartAnnotationMouseEvent read FOnAnnotationClick write FOnAnnotationClick;
    property OnChartClick: TIWChartClickEvent read FChartClick write FChartClick;
    property OnAsyncSelectSerieIndex: TIWChartSelectSerieIndexEvent read FOnAsyncSelectSerieIndex write FOnAsyncSelectSerieIndex;
    property OnAsyncAnnotationClick: TIWChartAnnotationMouseEvent read FOnAsyncAnnotationClick write FOnAsyncAnnotationClick;
    property OnAsyncChartClick: TIWChartClickEvent read FAsyncChartClick write FAsyncChartClick;
  end;

  function GetCacheDir(Control: TIWCustomControl): string;
  function GetControlHTML(Control: TIWCustomControl; AContext: TIWBaseComponentContext): string;

implementation
uses
  IWGlobal, IWAppForm, IWForm, IWServerControllerBase
//    {$IFDEF TMSIW11}
//  , IWStrings, IWSystem
//  {$ELSE}
//  , SWStrings, SWSystem
//  {$ENDIF}
  ;

function GetControlHTML(Control: TIWCustomControl;
  AContext: TIWBaseComponentContext): string;
var
  it: TIWHTMLTag;
begin
  // !!!!!!!!!!!!!! IMPORTANT NOTICE !!!!!!!!!!!!!!!!!!
  //
  // If you encounter a compilation problem here,
  // make sure that you followed the installation steps
  // in INSTALL.TXT, in particular, that you're using the
  // correct TMSDEFS.INC file
  //
  // !!!!!!!!!!!!!! IMPORTANT NOTICE !!!!!!!!!!!!!!!!!!

  it := Control.RenderHTML(AContext);
  Result := it.Render;
  it.Free;
end;

function GetCacheDir(Control:TIWCustomControl): string;
begin
{$IFDEF TMSIW14}
{$ELSE}
  Result := GServerController.UserCacheURL;
{$ENDIF}
end;

{ TTIWDBAdvChart }

function TTIWDBAdvChart.RenderAsync(
  AContext: TIWBaseHTMLComponentContext): TIWXMLTag;
var
  ImgName, js: string;
begin
  Result := TIWXMLTag.CreateTag('control');
  try
    Result.AddStringParam('id', HTMLName);
    Result.AddStringParam('type', 'TTIWDBAdvChart');
    RenderAsyncCommonProperties( AContext, Result );

    ImgName := OutputImage;

    js :=
      '<![CDATA['
      + 'document.getElementById("' + HTMLName + '_IMG").src = "' + GetCacheDir(Self) + ExtractFileName(ImgName) + '"'#13
      +']]>';

    GGetWebApplicationThreadVar.CallBackResponse.AddJavaScriptToExecute(js);

  except
    FreeAndNil(Result);
  end;
end;

function TTIWDBAdvChart.GetChart: TDBAdvGDIPChart;
begin
  Result := TDBAdvGDIPChart(FChartV.Panes[0].Chart);
end;

function TTIWDBAdvChart.GetDataSource: TDataSource;
begin
  Result := FChartV.Panes[0].DataSource;
end;

function TTIWDBAdvChart.GetVersion: string;
begin
  Result := FVersion;
end;

function TTIWDBAdvChart.GetVersionNr: Integer;
begin
  Result := MakeLong(MakeWord(BLD_VER, REL_VER), MakeWord(MIN_VER, MAJ_VER));
end;

function TTIWDBAdvChart.GetVersionString: string;
var
  vn: Integer;
begin
  vn := GetVersionNr;
  Result := IntToStr(Hi(Hiword(vn))) + '.' + IntToStr(Lo(Hiword(vn))) + '.' + IntToStr(Hi(Loword(vn))) + '.' + IntToStr(Lo(Loword(vn))) + ' ' + DATE_VER;
end;

constructor TTIWDBAdvChart.Create(AOwner: TComponent);
var
  FDesignTime: boolean;
begin
  inherited;
  Width := 400;
  Height := 300;
  FChartV := TDBAdvGDIPChartView.Create(Self);
  FChartV.NonVisual := True;
  FChartV.Panes.Add;

  FDesignTime := (csDesigning in ComponentState) and not
      ((csReading in Owner.ComponentState) or (csLoading in Owner.ComponentState));

  if FDesignTime then
  begin
    Chart.Series.Add;
    Chart.Range.RangeTo := 10;
  end;

  FImageQuality := 100;
  FUpdateCount := 0;
  FVersion := GetVersionString;
end;

destructor TTIWDBAdvChart.Destroy;
begin
  FChartV.Free;
  inherited;
end;

procedure TTIWDBAdvChart.DoMouseEvents(X, Y: Integer);
var
  I, K: integer;
  sp: TChartSeriePoint;
begin
  if not Assigned(Chart) then
    Exit;

  with Chart do
    for I := 0 to Series.Count - 1 do
      with Series[I] do
        for K := 0 to Annotations.Count - 1 do
          with Annotations[K] do
            if PtInRect(AnnotationRect, Point(X, Y)) then
            begin
              if Assigned(OnAnnotationClick) then
                OnAnnotationClick(Self, I, K, PointIndex);

              if Assigned(OnAsyncAnnotationClick) then
                OnAsyncAnnotationClick(Self, I, K, PointIndex);
              Exit;
            end;


    sp := Chart.XYtoSeriePoint(X, Y);
    if (sp.serie <> -1) and (sp.Point <> -1) then
    begin
      Chart.Series[sp.Serie].SelectedIndex := sp.Point;
      if Assigned(FOnSelectSerieIndex) then
        FOnSelectSerieIndex(Self, sp.serie, sp.Point);

      if Assigned(FOnAsyncSelectSerieIndex) then
        FOnAsyncSelectSerieIndex(Self, sp.serie, sp.Point);

      ChartChanged(Self);
      Exit;
    end;

  if Assigned(OnChartClick) then
    OnChartClick(Self, X, Y);

  if Assigned(OnAsyncChartClick) then
    OnAsyncChartClick(Self, X, Y);
end;

procedure TTIWDBAdvChart.EndUpdate;
begin
  Dec(FUpdateCount);
  if FUpdateCount = 0 then
    ChartChanged(Self);
end;

procedure TTIWDBAdvChart.DoAsyncChartClick(AParams: TStringList);
begin
     //
end;

procedure TTIWDBAdvChart.FillPoints;
var
  i: integer;
  r: integer;
  d: Double;
  K: Integer;
begin
  r := Chart.Range.RangeTo - Chart.Range.RangeFrom;
  for I := 0 to Chart.Series.Count - 1 do
  begin
    with Chart.Series[I] do
    begin
      d := (I + 1) * 100 / (r / 2);
      if Odd(I) then
      begin
        for K := 0 to r div 2 do
          AddSinglePoint((I * 100) + (d * K));

        for K := r div 2 to r do
          AddSinglePoint((I * 100) + ((d * (r / 2)) - d * K));
      end
      else
      begin
        for K := 0 to r div 2 do
          AddSinglePoint((I * 100) + ((d * (r / 2)) - d * K));

        for K := r div 2 to r do
          AddSinglePoint((I * 100) + (d * K));
      end;
      AutoRange := arCommon;
    end;
  end;
end;

procedure TTIWDBAdvChart.IWPaint;
begin
  if not (Assigned(Chart)) then
  begin
    inherited;
    Exit;
  end;

  inc(FUpdateCount);

  if FChanged then
  begin
    Chart.BeginUpdate;
    FillPoints;
    Chart.ResetUpdate;
  end;

  FChanged := false;

  // design time painting
  Chart.Draw(Canvas, Bounds(0, 0, Width, Height),1,1, true);

  dec(FUpdateCount);
end;

function TTIWDBAdvChart.ImageHTML(const ASrc, BSrc: string; AContext: TIWBaseComponentContext): TIWHTMLTag;
var
  sl: TStringList;
begin
  Result := TIWHTMLTag.CreateTag('DIV');
  sl := TStringList.Create;
  with sl do
  begin
    Add('<Script Language="JavaScript">');
    Add('function '+HTMLName+'DoMouseUp(e)');
    Add('{');
    Add('var isIE = navigator.appName.indexOf("Microsoft") != -1;');
    Add('var x;');
    Add('var y;');
    Add('var cx;');
    Add('var cy;');
    Add('if (isIE)');
    Add('{');
    Add('x = event.clientX;');
    Add('y = event.clientY;');
    Add('}');
    Add('else');
    Add('{');
    Add('x = e.clientX;');
    Add('y = e.clientY;');
    Add('}');
    Add('x = x - '+inttostr(Left));
    Add('y = y - '+inttostr(Top));

    Add('if (document.compatMode && document.compatMode != "BackCompat")');
    Add('{');
    Add('  x = x + document.documentElement.scrollLeft;');
    Add('  y = y + document.documentElement.scrollTop;');
    Add('}');
    Add('else');
    Add('{');
    Add('  x = x + document.body.scrollLeft;');
    Add('  y = y + document.body.scrollTop;');
    Add('}');

    Add(' FindElem(''' + HTMLName + '_INPUT'').value = ""+x+";"+y');

    if Assigned(OnChartClick) or Assigned(OnSelectSerieIndex) or Assigned(OnAnnotationClick) then
      Add('return SubmitClick('#39+HTMLName+#39', 0, '#39'false'#39');'#13)
    else
      Add('processAjaxEvent(''onChartClick'', '
        + HTMLControlImplementation.IWCLName
        + ',''' + HTMLName + '.' + 'DoAsyncChartClick' + ''','
        + 'true' + ', null, '
        + 'true' + ');');

    Add('}');
    Add('</script>');
  end;
  Result.Contents.AddText(sl.Text);
  sl.Free;
  with Result.Contents.AddTag('IMG') do
  begin
    AddStringParam('SRC', ASrc);
    AddStringParam('NAME', HTMLName);
    AddStringParam('ID', HTMLName+'_IMG');
    AddIntegerParam('WIDTH', Width);
    AddIntegerParam('HEIGHT', Height);
    AddStringParam('OnMouseUp',  HTMLName+'DoMouseUp(event)');
  end;
  with Result.Contents.AddTag('INPUT') do
  begin
    AddStringParam('TYPE','hidden');
    AddStringParam('NAME',HTMLName+'');
    AddStringParam('ID',HTMLName+'_INPUT');
  end;
end;

{$IFDEF TMSIW14}
function StreamToCacheFile(AStream: TMemoryStream;
  const ImgType: TIWImageType): string;
var
  xCacheStream: TCacheStream;
  xContentType: string;
  ASession: TIWApplication;
begin
  case imgType of
    imgPNG: xContentType := 'image/png';
    imgJPEG: xContentType := 'image/jpeg';
    imgGIF: xContentType := 'image/gif';
    imgBMP: xContentType := 'image/bmp';
  end;

  ASession := GGetWebApplicationThreadVar();
  xCacheStream := TCacheStream.Create(ASession);
  xCacheStream.ContentType := xContentType;
  Result := xCacheStream.Href;

  try
    AStream.Position := 0;
    AStream.SaveToStream(xCacheStream.Stream);
  finally
    xCacheStream.Free;
  end;
end;
{$ENDIF}

function TTIWDBAdvChart.OutputImage: string;
var
  ImgName, str: string;
  {$IFDEF TMSIW14}
  ms: TMemoryStream;
  {$ENDIF}
begin
  ImgName := '';

  if Assigned(Chart) then
  begin
    str := 'png';

    {$IFNDEF TMSIW14}
    ImgName := TIWServerControllerBase.NewCacheFile(str,true);

    Chart.SaveToImage(ImgName, Width, Height, itpng, 100);
    {$ENDIF}

    {$IFDEF TMSIW14}
    ms := TMemoryStream.Create;

    try
      Chart.SaveToStream(ms, Width, Height, itpng, 100);
      ms.Position := 0;

      ImgName := StreamToCacheFile(ms, imgPNG);
    finally
      ms.Free;
    end;
    {$ENDIF}
  end;

  result := ImgName;
end;

procedure TTIWDBAdvChart.BeginUpdate;
begin
  Inc(FUpdateCount);
end;

procedure TTIWDBAdvChart.ChartChanged(Sender: TObject);
begin
  if FUpdateCount = 0 then
  begin
    FChanged := true;
    Invalidate;
  end;
end;

function TTIWDBAdvChart.RenderHTML(AContext: TIWBaseComponentContext): TIWHTMLTag;
var
  ImgName,ImgHot: string;
  htmlres: string;
begin
  htmlres := '';
  ImgName := '';
  ImgHot := '';

  ImgName := OutputImage;

  //Register async call
  AContext.WebApplication.RegisterCallBack(HTMLName + '.DoAsyncChartClick', DoAsyncChartClick);

  Result := ImageHTML(GetCacheDir(Self) + ExtractFilename(ImgName),
  GetCacheDir(Self) + ExtractFilename(ImgHot),AContext);
end;

procedure TTIWDBAdvChart.SetChart(const Value: TDBAdvGDIPChart);
begin
  if Assigned(FChartV) then
  begin
    if FChartV.Panes[0].Chart <> value then
    begin
      FChartV.Panes[0].Chart.Assign(Value);
      ChartChanged(self);
    end;
  end;
end;

procedure TTIWDBAdvChart.SetDataSource(const Value: TDataSource);
begin
  FChartV.Panes[0].DataSource := Value;
end;

procedure TTIWDBAdvChart.SetValue(const value: string);
var
  vp, x, y: Integer;
  varvalue : string;
begin
  varvalue := value;

  if Length(value) > 0 then
  begin
    vp := Pos(';', varvalue);

    if vp > 0 then
    begin
      x := strtoint(Copy(varvalue, 0, Pos(';', varvalue) - 1));
      y := strtoint(Copy(varvalue, Pos(';', varvalue) + 1 , Length(varvalue) - Pos(';', varvalue)));
      DoMouseEvents(x, y);
      inherited SetValue(varvalue);
    end;
  end
end;

end.
