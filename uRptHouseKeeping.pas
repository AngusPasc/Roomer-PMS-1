unit uRptHouseKeeping;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, kbmMemTable, cxClasses, cxPropertiesStore, Vcl.StdCtrls, sRadioButton,
  acPNG, sLabel, Vcl.Mask, sMaskEdit, sCustomComboEdit, sToolEdit, sGroupBox, sButton, Vcl.ExtCtrls, sPanel,
  uDImages, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkSide, dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinsdxStatusBarPainter, cxStyles,
  dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, cxDBData, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridBandedTableView, cxGridDBBandedTableView, cxGridCustomView, cxGrid,
  dxStatusBar, cxGridDBTableView, Vcl.Grids, Vcl.DBGrids, Vcl.Menus, cxTimeEdit, ppParameter, ppDesignLayer, ppCtrls,
  ppBands, ppVar, ppPrnabl, ppClass, ppCache, ppProd, ppReport, ppDB, ppComm, ppRelatv, ppDBPipe, sComboBox, cxTextEdit,
  dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd, dxWrap, dxPrnDev, dxPSCompsProvider, dxPSFillPatterns,
  dxPSEdgePatterns, dxPSPDFExportCore, dxPSPDFExport, cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwAdv, dxPSPrVwRibbon,
  dxPScxPageControlProducer, dxPScxEditorProducers, dxPScxExtEditorProducers, dxSkinsdxBarPainter,
  dxSkinsdxRibbonPainter, dxServerModeData, dxServerModeDBXDataSource, dxPSCore, dxPScxGridLnk, dxPScxGridLayoutViewLnk,
  dxPScxCommon, cxMemo, cxLabel, ppStrtch, ppMemo
  , uRoomerForm, cxSpinEdit
  ;

type
  TfrmHouseKeepingReport = class(TfrmBaseRoomerForm)
    FormStore: TcxPropertiesStore;
    kbmHouseKeepingList: TkbmMemTable;
    HouseKeepingListDS: TDataSource;
    pnlFilter: TsPanel;
    pnlExportButtons: TsPanel;
    btnExcel: TsButton;
    grHouseKeepingList: TcxGrid;
    lvHouseKeepingListLevel1: TcxGridLevel;
    grHouseKeepingListDBTableView1: TcxGridDBTableView;
    gbxSelection: TsGroupBox;
    dtDate: TsDateEdit;
    cbxLocations: TsComboBox;
    lblDate: TsLabel;
    lblLocation: TsLabel;
    kbmHouseKeepingListroomtype: TStringField;
    kbmHouseKeepingListfloor: TIntegerField;
    kbmHouseKeepingListnumberofguests: TIntegerField;
    kbmHouseKeepingListexpectedcot: TTimeField;
    kbmHouseKeepingListstatus: TStringField;
    grHouseKeepingListDBTableView1room: TcxGridDBColumn;
    grHouseKeepingListDBTableView1roomtype: TcxGridDBColumn;
    grHouseKeepingListDBTableView1floor: TcxGridDBColumn;
    grHouseKeepingListDBTableView1expectedcot: TcxGridDBColumn;
    kbmHouseKeepingListroom: TStringField;
    kbmHouseKeepingListlocation: TStringField;
    grHouseKeepingListDBTableView1location: TcxGridDBColumn;
    gridPrinter: TdxComponentPrinter;
    gridPrinterLink1: TdxGridReportLink;
    btnPrintGrid: TsButton;
    cxStyleRepository2: TcxStyleRepository;
    dxGridReportLinkStyleSheet1: TdxGridReportLinkStyleSheet;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    cxStyle5: TcxStyle;
    cxStyle6: TcxStyle;
    cxStyle7: TcxStyle;
    cxStyle8: TcxStyle;
    cxStyle9: TcxStyle;
    cxStyle10: TcxStyle;
    cxStyle11: TcxStyle;
    cxStyle12: TcxStyle;
    cxStyle13: TcxStyle;
    cxStyle14: TcxStyle;
    grHouseKeepingListDBTableView1Roomnotes: TcxGridDBColumn;
    kbmHouseKeepingListRoomnotes: TMemoField;
    kbmHouseKeepingListArrivingGuests: TIntegerField;
    kbmHouseKeepingListexpectedtoa: TTimeField;
    grHouseKeepingListDBTableView1LastGuests: TcxGridDBColumn;
    grHouseKeepingListDBTableView1ArrivingGuests: TcxGridDBColumn;
    grHouseKeepingListDBTableView1housekeepingstatus: TcxGridDBColumn;
    grHouseKeepingListDBTableView1expectedtoa: TcxGridDBColumn;
    kbmHouseKeepingListmaintenancenotes: TMemoField;
    kbmHouseKeepingListcleaningnotes: TMemoField;
    grHouseKeepingListDBTableView1maintenancenotes: TcxGridDBColumn;
    grHouseKeepingListDBTableView1cleaningnotes: TcxGridDBColumn;
    btnRefresh: TsButton;
    procedure btnExcelClick(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
    procedure kbmHouseKeepingListAfterScroll(DataSet: TDataSet);
    procedure btnPrintGridClick(Sender: TObject);
    procedure grHouseKeepingListDBTableView1ArrivingGuestsGetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: string);
  private
    FRefreshingdata: boolean;
   { Private declarations }
    function ConstructSQL: string;
    procedure UpdateLocations;
  protected
    procedure UpdateControls; override;
    procedure LoadData; override;
    procedure DoShow; override;
  public
    { Public declarations }
  end;


/// <summary>
///   Global access point for showing the arrival report form, If Modalresult is OK then True is returned
/// </summary>
function ShowHouseKeepingReport(aDate: TDateTime): boolean;

implementation

{$R *.dfm}

uses
    uRoomerLanguage
  , uAppGlobal
  , uG
  , uUtils
  , cxGridExportLink
  , ShellApi
  , cmpRoomerDataset
  , uD
  , PrjConst
  , hData
  , uAlerts
  , uProvideARoom2
  , uGuestCheckInForm
  , uInvoice
  , uReservationProfile
  , uRptbViewer
  , _Glob;

const
  cSQL =
      '	select * '#10+
      '	from '#10+
      '	( '#10+
      '	select '#10+
      '	 r.room, '#10+
      '	 r.roomtype, '#10+
      '	 r.floor, '#10+
      '	 l.description as location, '#10+
      '	 coalesce(departing.NumGuestsD, stayover.NumGuestsS) as LastGuests, '#10+
      '	 arriving.NumGuestsA as ArrivingGuests, '#10+
      '	 departing.ExpectedCheckOutTime as expectedCOT, '#10+
      '	 arriving.ExpectedTimeOfArrival as expectedTOA, '#10+
      '	 arriving.hiddeninfo as Roomnotes, '#10+
      '	 rm.CleaningNotes, '#10+
      '	 rm.MaintenanceNotes, '#10+
      '	 case '#10+
      '	   when (not IsNUll(departing.room) and not IsNull(arriving.room)) then CONCAT({departure}, '' + '', {arrival}) '#10+
      '	   when (not IsNUll(departing.room)) then {departure} '#10+
      '	   when (not IsNUll(arriving.room)) then {arrival} '#10+
      '	   when (not IsnUll(stayover.room)) then {stayover} '#10+
      '    when (r.Status in (''U'', ''R'')) then (Select name from maintenancecodes mc where mc.code= r.Status) '#10+
      '	 end as HousekeepingStatus '#10+
      '	from '#10+
      '	  rooms r '#10+
      '	  JOIN roomtypes rt on rt.roomtype=r.roomtype '#10+
      '	  JOIN locations l on l.Location=r.location '#10+
      '   LEFT JOIN maintenanceroomnotes rm ON rm.Room=r.Room '#10+
      ' '#10+
      '	  LEFT OUTER JOIN ( SELECT * '#10+
      '			 , (select count(*) from persons p where p.roomreservation = rrd.RoomReservation)  + rrd.numChildren + rrd.numInfants as NumGuestsD '#10+
      '	         FROM roomreservations rrd '#10+
      '			 where rrd.status not in (''C'', ''D'') and rrd.departure = {probedate} '#10+
      '			) departing on departing.room = r.room '#10+
      ' '#10+
      '		LEFT OUTER JOIN ( SELECT * '#10+
      '			 , (select count(*) from persons p where p.roomreservation = rra.RoomReservation)  + rra.numChildren + rra.numInfants as NumGuestsA '#10+
      '	         FROM roomreservations rra '#10+
      '			 where rra.status not in (''C'', ''D'') and rra.arrival= {probedate} '#10+
      '			) arriving on arriving.room = r.room '#10+
      ' '#10+
      '		LEFT OUTER JOIN ( SELECT * '#10+
      '			 , (select count(*) from persons p where p.roomreservation = rrs.RoomReservation)  + rrs.numChildren + rrs.numInfants as NumGuestsS '#10+
      '	         FROM roomreservations rrs '#10+
      '			 where rrs.status not in (''C'', ''D'') and rrs.arrival < {probedate} and rrs.departure > {probedate} '#10+
      '			) stayover on stayover.room=r.room '#10+
      '	 group by room, roomtype, floor, numberguests '#10+
      '	 order by floor, room ) x '#10+
      '	 where not x.HousekeepingStatus is null ';


function ShowHouseKeepingReport(aDate: TDateTime):  boolean;
var
  frm: TfrmHouseKeepingReport;
begin
  frm := TfrmHouseKeepingReport.Create(nil);
  try
    frm.dtDate.Date := aDate;
    frm.ShowModal;
    Result := (frm.modalresult = mrOk);
  finally
    frm.Free;
  end;
end;

procedure TfrmHouseKeepingReport.btnExcelClick(Sender: TObject);
var
  sFilename : string;
  s         : string;
begin
  dateTimeToString(s, 'yyyymmddhhnn', now);
  sFilename := g.qProgramPath + s + '_HouseKeepingList';
  ExportGridToExcel(sFilename, grHouseKeepingList, true, true, true);
  ShellExecute(Handle, 'OPEN', PChar(sFilename + '.xls'), nil, nil, sw_shownormal);
end;

procedure TfrmHouseKeepingReport.btnRefreshClick(Sender: TObject);
begin
  RefreshData;
end;


function TfrmHouseKeepingReport.ConstructSQL: string;
begin
  Result := ReplaceString(cSQL, '{probedate}', _db(dtDate.Date));
  Result := ReplaceString(Result, '{departure}', _db(GetTranslatedText('shTx_Housekeepinglist_Departure')));
  Result := ReplaceString(Result, '{arrival}', _db(GetTranslatedText('shTx_Housekeepinglist_Arriving')));
  Result := ReplaceString(Result, '{stayover}', _db(GetTranslatedText('shTx_Housekeepinglist_Stayover')));
  if cbxLocations.ItemIndex >= 0 then
    Result := Result + ' AND location = ' + _db(cbxLocations.Text);
  CopyToClipboard(Result);
end;


procedure TfrmHouseKeepingReport.DoShow;
begin
  inherited;
  RefreshData;
end;

procedure TfrmHouseKeepingReport.grHouseKeepingListDBTableView1ArrivingGuestsGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord; var AText: string);
begin
  inherited;
  if aText = '0'then aText := '';
end;

procedure TfrmHouseKeepingReport.kbmHouseKeepingListAfterScroll(DataSet: TDataSet);
begin
  UpdateControls;
end;


procedure TfrmHouseKeepingReport.LoadData;
var
  s    : string;
  rset1: TRoomerDataset;
begin
  inherited;
  if NOT btnRefresh.Enabled then exit;

  btnRefresh.Enabled := False;
  Screen.Cursor := crHourglass;
  try

    kbmHouseKeepingList.DisableControls;
    try
      FRefreshingdata := True; // UpdateControls still called when updating dataset, despite DisableControls
      rSet1 := CreateNewDataSet;
      try
        s := ConstructSQL;

        hData.rSet_bySQL(rSet1, s, false);
        rSet1.First;
        if not kbmHouseKeepingList.Active then
          kbmHouseKeepingList.Open;
        LoadKbmMemtableFromDataSetQuiet(kbmHouseKeepingList,rSet1,[]);
      finally
        FreeAndNil(rSet1);
      end;

      kbmHouseKeepingList.First;

    finally
      FRefreshingdata := False;
      kbmHouseKeepingList.EnableControls;
    end;
  finally
    btnRefresh.Enabled := True;
    Screen.Cursor := crDefault;
  end;
end;


procedure TfrmHouseKeepingReport.btnPrintGridClick(Sender: TObject);
var
  lTitle: string;
begin
  lTitle := Format('%s - %s %s', [Caption, dtDate.Text, cbxLocations.Text]);
  gridPrinter.PrintTitle := lTitle;
  gridPrinterLink1.ReportTitle.Text := lTitle;
  gridPrinter.Print(True, nil, gridPrinterLink1);
end;

procedure TfrmHouseKeepingReport.UpdateControls;
begin
  if FRefreshingData then
    Exit;

  inherited;

  UpdateLocations;
end;

procedure TfrmHouseKeepingReport.UpdateLocations;
var
  lCurrentSelection: string;
begin

  lCurrentSelection := '';
  if cbxLocations.ItemIndex >= 0 then
    lCurrentSelection := cbxLocations.Text;

  cbxLocations.Clear;

  glb.Locations.First;
  while not glb.Locations.Eof do
  begin
    cbxLocations.Items.Add(glb.Locations['Description']);
    glb.Locations.Next;
  end;

  if lCurrentSelection.IsEmpty then
    cbxLocations.ItemIndex := -1
  else
    cbxLocations.ItemIndex := cbxLocations.Items.IndexOf(lCurrentSelection);
end;

end.
