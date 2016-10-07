unit uRoomerGridForm;

interface

uses
  WIndows, uRoomerForm, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkSide, dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinsdxStatusBarPainter, cxStyles,
  dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, dxPSGlbl,
  dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd, dxWrap, dxPrnDev, dxPSCompsProvider, dxPSFillPatterns, dxPSEdgePatterns,
  dxPSPDFExportCore, dxPSPDFExport, cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwAdv, dxPSPrVwRibbon,
  dxPScxPageControlProducer, dxPScxGridLnk, dxPScxGridLayoutViewLnk, dxPScxEditorProducers, dxPScxExtEditorProducers,
  dxSkinsdxBarPainter, dxSkinsdxRibbonPainter, System.Classes, System.Actions, Vcl.ActnList, dxPSCore, dxPScxCommon,
  cxClasses, kbmMemTable, cxGridLevel, cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, Vcl.StdCtrls, sButton, Vcl.ExtCtrls, Vcl.Forms, sPanel, cxPropertiesStore, Vcl.Controls, dxStatusBar,
  Vcl.Dialogs, sDialogs
  , uROomerDataProvider
  ;

type
  /// <summary>
  ///   Extension of TfrmBaseRoomerForm with a datagrid and standard options to print and export.
  /// </summary>
  TfrmBaseRoomerGridForm = class(TfrmBaseRoomerForm)
    kbmGridData: TkbmMemTable;
    dsGridData: TDataSource;
    pnlTop: TsPanel;
    pnlActionButtons: TsPanel;
    grData: TcxGrid;
    lvGridDataLevel1: TcxGridLevel;
    grDataDBTableView1: TcxGridDBTableView;
    cxGridStyleRepository: TcxStyleRepository;
    cxsBoldStyle: TcxStyle;
    gridPrinter: TdxComponentPrinter;
    gridPrinterLink1: TdxGridReportLink;
    alGridActions: TActionList;
    acPrint: TAction;
    acRefresh: TAction;
    pnlSelection: TsPanel;
    acExportExcel: TAction;
    acExportHTML: TAction;
    acExportText: TAction;
    acExportXML: TAction;
    procedure kbmGridDataAfterScroll(DataSet: TDataSet);
    procedure acRefreshExecute(Sender: TObject);
    procedure acPrintExecute(Sender: TObject);
    procedure acExportExcelExecute(Sender: TObject);
    procedure acGridDependentActionUpdate(Sender: TObject);
  private
    FDataProvider: TRoomerDataProvider;
    function GridContainsData: boolean;
    procedure ExportGridToExcel;
  protected
    FDataProviderClass: TRoomerDataProviderClass;
    procedure DoShow; override;
    function ConstructSQLStatement: string; virtual;
    procedure LoadData; override;
  public
    constructor Create(aOwner: TComponent); override;
    destructor Destroy; override;
    property DataProvider: TRoomerDataProvider read FDataProvider;
    { Public declarations }
  end;



implementation

{$R *.dfm}

uses
    uG
  , IOUtils
  , hData
  , SysUtils
  , cmpRoomerDataset
  , uD
  , uUtils
  , uGridExporter;



function TfrmBaseRoomerGridForm.GridContainsData: boolean;
begin
  if assigned(FDataProvider) then
    Result := FDataProvider.ContainsData
  else
    Result := False;
end;

procedure TfrmBaseRoomerGridForm.acExportExcelExecute(Sender: TObject);
begin
  ExportGridToExcel;
end;

procedure TfrmBaseRoomerGridForm.acPrintExecute(Sender: TObject);
begin
  gridPrinter.PrintTitle := Caption;
  gridPrinterLink1.ReportTitle.Text := Caption;
  gridPrinterLink1.ComponentPrinter := gridPrinter;
  gridPrinter.Print(True, nil, gridPrinterLink1);
end;

procedure TfrmBaseRoomerGridForm.acGridDependentActionUpdate(Sender: TObject);
begin
  inherited;
  TAction(Sender).Enabled := GridContainsData;
end;

procedure TfrmBaseRoomerGridForm.acRefreshExecute(Sender: TObject);
begin
  inherited;
  RefreshData;
end;

procedure TfrmBaseRoomerGridForm.kbmGridDataAfterScroll(DataSet: TDataSet);
begin
  if not Dataset.ControlsDisabled then
    UpdateControls;
end;

procedure TfrmBaseRoomerGridForm.LoadData;
begin
  inherited;
  if assigned(FDataProvider) then
    FDataProvider.LoadDataIntoKbmMemTable(kbmGridData);
end;

function TfrmBaseRoomerGridForm.ConstructSQLStatement: string;
begin
  // if not overridden then no data is delivered
  Result := 'SELECT ''<NO SQL SPECIFIED>'' as Result';
end;

constructor TfrmBaseRoomerGridForm.Create(aOwner: TComponent);
begin
  inherited;
  FDataProvider := FDataProviderClass.Create;
end;

destructor TfrmBaseRoomerGridForm.Destroy;
begin
  FDataProvider.Free;
  inherited;
end;

procedure TfrmBaseRoomerGridForm.DoShow;
begin
  inherited;
end;

procedure TfrmBaseRoomerGridForm.ExportGridToExcel;
var
  gridExporter: TGridExporter;
begin
  gridExporter := TGridExporter.Create(grData);
  try
    gridExporter.ExportToXLS(Caption, [geOpenFile]);
  finally
    gridExporter.Free;
  end;
end;


end.