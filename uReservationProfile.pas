unit uReservationProfile;

interface

uses
  VCL.Forms,
  variants,
  cxGraphics,
  cxControls,
  cxLookAndFeels,
  cxLookAndFeelPainters,
  dxSkinsCore,
  dxSkinCaramel,
  dxSkinCoffee,
  dxSkinDarkSide,
  dxSkinTheAsphaltWorld,
  dxSkinsDefaultPainters,
  cxStyles,
  dxSkinscxPCPainter,
  cxCustomData,
  cxFilter,
  cxData,
  cxDataStorage,
  cxEdit,
  cxNavigator,
  cxDBData,
  cxCheckBox,
  cxButtonEdit,
  cxDropDownEdit,
  cxLabel,
  cxCurrencyEdit,
  cxTextEdit,
  cxTimeEdit,
  DragDrop,
  DropTarget,
  DropComboTarget,
  VCL.ExtCtrls,
  cxPropertiesStore,
  dxmdaset,
  cxGridLevel,
  cxGridCustomTableView,
  cxGridTableView,
  cxGridDBTableView,
  cxClasses,
  cxGridCustomView,
  cxGrid,
  cxSplitter,
  sMemo,
  sSplitter,
  sPageControl,
  sComboBox,
  sCheckBox,
  sEdit,
  VCL.Mask,
  sMaskEdit,
  sCustomComboEdit,
  sToolEdit,
  sButton,
  sLabel,
  sGroupBox,
  sPanel,
  Data.DB,
  VCL.Menus,
  VCL.StdCtrls,
  VCL.ComCtrls,
  VCL.Controls,
  System.Classes,
  System.Types,
  uAlertEditPanel,
  uAlerts,
  uDynamicRates
    ;

type
  TfrmReservationProfile = class(TForm)
    Panel2: TsPanel;
    PageControl2: TsPageControl;
    TabSheet3: TsTabSheet;
    Panel3: TsPanel;
    Panel4: TsPanel;
    PageControl3: TsPageControl;
    TabSheet4: TsTabSheet;
    TabSheet5: TsTabSheet;
    Label9: TsLabel;
    edtCustomer: TsEdit;
    Label19: TsLabel;
    edtKennitala: TsEdit;
    Label6: TsLabel;
    edtName: TsEdit;
    Label7: TsLabel;
    edtAddress1: TsEdit;
    edtAddress2: TsEdit;
    edtAddress3: TsEdit;
    Bevel4: TBevel;
    edtInvRefrence: TsEdit;
    Label4: TsLabel;
    mainPage: TsPageControl;
    RoomsTab: TsTabSheet;
    GuestsTab: TsTabSheet;
    tvRooms: TcxGridDBTableView;
    lvRooms: TcxGridLevel;
    grRooms: TcxGrid;
    mRooms: TdxMemData;
    mGuestRoomsDS: TDataSource;
    mRoomsReservation: TIntegerField;
    mRoomsRoomReservation: TIntegerField;
    mRoomsRoom: TWideStringField;
    mRoomsRoomType: TWideStringField;
    mRoomsArrival: TDateTimeField;
    mRoomsDeparture: TDateTimeField;
    mRoomsStatus: TWideStringField;
    mRoomsCurrency: TWideStringField;
    mRoomsisGroupAccount: TBooleanField;
    mRoomsisNoRoom: TBooleanField;
    mRoomsuseStayTax: TBooleanField;
    mRoomsRoomAlias: TWideStringField;
    mRoomsRoomTypeAlias: TWideStringField;
    tvRoomsRecId: TcxGridDBColumn;
    tvRoomsReservation: TcxGridDBColumn;
    tvRoomsRoomReservation: TcxGridDBColumn;
    tvRoomsRoom: TcxGridDBColumn;
    tvRoomsRoomType: TcxGridDBColumn;
    tvRoomsArrival: TcxGridDBColumn;
    tvRoomsDeparture: TcxGridDBColumn;
    tvRoomsStatus: TcxGridDBColumn;
    tvRoomsCurrency: TcxGridDBColumn;
    tvRoomsisGroupAccount: TcxGridDBColumn;
    tvRoomsisNoRoom: TcxGridDBColumn;
    tvRoomsuseStayTax: TcxGridDBColumn;
    tvRoomsRoomAlias: TcxGridDBColumn;
    tvRoomsRoomTypeAlias: TcxGridDBColumn;
    mnuFinishedInv: TPopupMenu;
    mnuThisRoom: TMenuItem;
    mnuThisreservation: TMenuItem;
    OpenthisRoom1: TMenuItem;
    OpenGroupInvoice1: TMenuItem;
    Panel9: TsPanel;
    btnShowPrices: TsButton;
    btnShowInvoice: TsButton;
    mRoomsdayCount: TIntegerField;
    tvRoomsdayCount: TcxGridDBColumn;
    mRoomsStatusText: TStringField;
    tvRoomsStatusText: TcxGridDBColumn;
    mRoomsBreakFast: TBooleanField;
    tvRoomsBreakFast: TcxGridDBColumn;
    mRoomsGuestCount: TIntegerField;
    mRoomsdefGuestCount: TIntegerField;
    tvRoomsGuestCount: TcxGridDBColumn;
    tvRoomsdefGuestCount: TcxGridDBColumn;
    mRoomsGuestName: TWideStringField;
    tvRoomsGuestName: TcxGridDBColumn;
    mRoomsbreakfastText: TStringField;
    mRoomsaccountTypeText: TStringField;
    tvRoomsbreakfastText: TcxGridDBColumn;
    tvRoomsaccountTypeText: TcxGridDBColumn;
    mRoomsunPaidRoomRent: TFloatField;
    mRoomsDiscountUnpaidRoomRent: TFloatField;
    mRoomsTotalUnpaidRoomRent: TFloatField;
    tvRoomsunPaidRoomRent: TcxGridDBColumn;
    tvRoomsDiscountUnpaidRoomRent: TcxGridDBColumn;
    tvRoomsTotalUnpaidRoomRent: TcxGridDBColumn;
    mRoomsunpaidRentNights: TIntegerField;
    mRoomsunpaidRentPrice: TFloatField;
    tvRoomsunpaidRentNights: TcxGridDBColumn;
    tvRoomsunpaidRentPrice: TcxGridDBColumn;
    mRoomsunPaidItems: TFloatField;
    btnAddRoom: TsButton;
    btnRemoveRoom: TsButton;
    btnProvideRoom: TsButton;
    btnRoomToExcel: TsButton;
    InvoicesTab: TsTabSheet;
    mGuests: TdxMemData;
    Panel10: TsPanel;
    btnGuestsRefresh: TsButton;
    Panel11: TsPanel;
    cxButton1: TsButton;
    mGuestsPerson: TIntegerField;
    mGuestsRoomReservation: TIntegerField;
    mGuestsReservation: TIntegerField;
    mGuestsGuestName: TWideStringField;
    mGuestsAddress1: TWideStringField;
    mGuestsAddress2: TWideStringField;
    mGuestsAddress3: TWideStringField;
    mGuestsAddress4: TWideStringField;
    mGuestsCountry: TWideStringField;
    mGuestsDS: TDataSource;
    mGuestRooms: TdxMemData;
    mGuestRoomsReservation: TIntegerField;
    mGuestRoomsRoomReservation: TIntegerField;
    mGuestRoomsisGroup: TBooleanField;
    mGuestRoomsBreakfast: TBooleanField;
    mGuestRoomsrrArrival: TDateTimeField;
    mGuestRoomsrrDeparture: TDateTimeField;
    mGuestRoomsRoom: TWideStringField;
    mGuestRoomsRoomDescription: TWideStringField;
    mGuestRoomsEquipments: TWideStringField;
    mGuestRoomsNoRoom: TBooleanField;
    mGuestRoomsRoomType: TWideStringField;
    mGuestRoomsRoomTypeDescription: TWideStringField;
    mGuestRoomsDefNumberGuests: TIntegerField;
    mGuestRoomsFloor: TIntegerField;
    mGuestRoomsLocation: TWideStringField;
    mGuestRoomsLocationDescription: TWideStringField;
    tvGuestRooms: TcxGridDBTableView;
    lvGuestRooms: TcxGridLevel;
    grGuests: TcxGrid;
    tvGuestRoomsRecId: TcxGridDBColumn;
    tvGuestRoomsReservation: TcxGridDBColumn;
    tvGuestRoomsRoomReservation: TcxGridDBColumn;
    tvGuestRoomsisGroup: TcxGridDBColumn;
    tvGuestRoomsBreakfast: TcxGridDBColumn;
    tvGuestRoomsrrArrival: TcxGridDBColumn;
    tvGuestRoomsrrDeparture: TcxGridDBColumn;
    tvGuestRoomsRoom: TcxGridDBColumn;
    tvGuestRoomsRoomDescription: TcxGridDBColumn;
    tvGuestRoomsEquipments: TcxGridDBColumn;
    tvGuestRoomsNoRoom: TcxGridDBColumn;
    tvGuestRoomsRoomType: TcxGridDBColumn;
    tvGuestRoomsRoomTypeDescription: TcxGridDBColumn;
    tvGuestRoomsDefNumberGuests: TcxGridDBColumn;
    tvGuestRoomsFloor: TcxGridDBColumn;
    tvGuestRoomsLocation: TcxGridDBColumn;
    tvGuestRoomsLocationDescription: TcxGridDBColumn;
    lvGuests: TcxGridLevel;
    tvGuests: TcxGridDBTableView;
    tvGuestsRecId: TcxGridDBColumn;
    tvGuestsPerson: TcxGridDBColumn;
    tvGuestsRoomReservation: TcxGridDBColumn;
    tvGuestsReservation: TcxGridDBColumn;
    tvGuestsGuestName: TcxGridDBColumn;
    tvGuestsAddress1: TcxGridDBColumn;
    tvGuestsAddress2: TcxGridDBColumn;
    tvGuestsAddress3: TcxGridDBColumn;
    tvGuestsAddress4: TcxGridDBColumn;
    tvGuestsCountry: TcxGridDBColumn;
    mRoomsDS: TDataSource;
    mGuestsPID: TWideStringField;
    tvGuestsPID: TcxGridDBColumn;
    mGuestRoomsMainGuest: TWideStringField;
    mGuestRoomsGuestCount: TIntegerField;
    btnExpand: TsButton;
    btnCollapse: TsButton;
    cxButton2: TsButton;
    lvAllGuests: TcxGridLevel;
    tvAllGuests: TcxGridDBTableView;
    mAllGuests: TdxMemData;
    mAllGuestsIntegerField1: TIntegerField;
    mAllGuestsIntegerField2: TIntegerField;
    mAllGuestsIsGroup: TBooleanField;
    mAllGuestsBreakfast: TBooleanField;
    mAllGuestsrrArrival: TDateTimeField;
    mAllGuestsDeparture: TDateTimeField;
    mAllGuestsRoom: TWideStringField;
    mAllGuestsRoomDescription: TWideStringField;
    mAllGuestsEquipments: TWideStringField;
    mAllGuestsNoRoom: TBooleanField;
    mAllGuestsRoomType: TWideStringField;
    mAllGuestsRoomTypeDescription: TWideStringField;
    mAllGuestsDefNumberGuests: TIntegerField;
    mAllGuestsFloor: TIntegerField;
    mAllGuestsLocation: TWideStringField;
    mAllGuestsLocationDescription: TWideStringField;
    mAllGuestsPerson: TIntegerField;
    mAllGuestsGuestName: TWideStringField;
    mAllGuestsAddress1: TWideStringField;
    mAllGuestsAddress2: TWideStringField;
    mAllGuestsAddress3: TWideStringField;
    mAllGuestsAddress4: TWideStringField;
    mAllGuestsCountry: TWideStringField;
    mAllGuestsPID: TWideStringField;
    mAllGuestsDS: TDataSource;
    tvAllGuestsRecId: TcxGridDBColumn;
    tvAllGuestsReservation: TcxGridDBColumn;
    tvAllGuestsRoomReservation: TcxGridDBColumn;
    tvAllGuestsisGroup: TcxGridDBColumn;
    tvAllGuestsBreakfast: TcxGridDBColumn;
    tvAllGuestsrrArrival: TcxGridDBColumn;
    tvAllGuestsrrDeparture: TcxGridDBColumn;
    tvAllGuestsRoom: TcxGridDBColumn;
    tvAllGuestsRoomDescription: TcxGridDBColumn;
    tvAllGuestsEquipments: TcxGridDBColumn;
    tvAllGuestsNoRoom: TcxGridDBColumn;
    tvAllGuestsRoomType: TcxGridDBColumn;
    tvAllGuestsRoomTypeDescription: TcxGridDBColumn;
    tvAllGuestsDefNumberGuests: TcxGridDBColumn;
    tvAllGuestsFloor: TcxGridDBColumn;
    tvAllGuestsLocation: TcxGridDBColumn;
    tvAllGuestsLocationDescription: TcxGridDBColumn;
    tvAllGuestsPerson: TcxGridDBColumn;
    tvAllGuestsGuestName: TcxGridDBColumn;
    tvAllGuestsAddress1: TcxGridDBColumn;
    tvAllGuestsAddress2: TcxGridDBColumn;
    tvAllGuestsAddress3: TcxGridDBColumn;
    tvAllGuestsAddress4: TcxGridDBColumn;
    tvAllGuestsCountry: TcxGridDBColumn;
    tvAllGuestsPID: TcxGridDBColumn;
    tvGuestRoomsMainGuest: TcxGridDBColumn;
    tvGuestRoomsGuestCount: TcxGridDBColumn;
    mAllGuestsStatus: TWideStringField;
    mAllGuestsStatusText: TWideStringField;
    mGuestRoomsStatus: TWideStringField;
    mGuestRoomsStatusText: TWideStringField;
    tvAllGuestsStatus: TcxGridDBColumn;
    tvAllGuestsStatusText: TcxGridDBColumn;
    tvGuestRoomsStatus: TcxGridDBColumn;
    tvGuestRoomsStatusText: TcxGridDBColumn;
    chkShowAllGuests: TsCheckBox;
    mInvoiceLines: TdxMemData;
    mInvoiceLinesInvoiceNumber: TIntegerField;
    mInvoiceLinesItem: TStringField;
    mInvoiceLinesDescription: TStringField;
    mInvoiceLinesPrice: TFloatField;
    mInvoiceLinesVatType: TStringField;
    mInvoiceLinesAmountWithTax: TFloatField;
    mInvoiceLinesAmountNoTax: TFloatField;
    mInvoiceLinesAmountTax: TFloatField;
    mInvoiceLinesCurrency: TStringField;
    mInvoiceLinesCurrencyRate: TFloatField;
    mInvoiceLinesImportRefrence: TStringField;
    mInvoiceLinesImportSource: TStringField;
    mInvoiceLinespurchaseDate: TDateField;
    mInvoiceHeads: TdxMemData;
    mInvoiceHeadsInvoiceNumber: TIntegerField;
    mInvoiceHeadsSplitNumber: TIntegerField;
    mInvoiceHeadsInvoiceDate: TDateField;
    mInvoiceHeadsdueDate: TDateField;
    mInvoiceHeadsReservation: TIntegerField;
    mInvoiceHeadsRoomReservation: TIntegerField;
    mInvoiceHeadsCustomer: TStringField;
    mInvoiceHeadsNameOnInvoice: TStringField;
    mInvoiceHeadsAddress1: TStringField;
    mInvoiceHeadsAddress2: TStringField;
    mInvoiceHeadsAddress3: TStringField;
    mInvoiceHeadsAmountWithTax: TFloatField;
    mInvoiceHeadsAmountNoTax: TFloatField;
    mInvoiceHeadsinvRefrence: TStringField;
    mInvoiceHeadsAmountTax: TFloatField;
    mInvoiceHeadsCreditInvoice: TIntegerField;
    mInvoiceHeadsOriginalInvoice: TIntegerField;
    mInvoiceHeadsRoomGuest: TStringField;
    mInvoiceHeadsPayTypes: TStringField;
    mInvoiceHeadsPayGroups: TStringField;
    mInvoiceHeadsPayTypeDescription: TStringField;
    mInvoiceHeadspayGroupDescription: TStringField;
    mInvoiceHeadsDS: TDataSource;
    mInvoiceLinesDS: TDataSource;
    Grid: TcxGrid;
    tvInvoiceHeads: TcxGridDBTableView;
    tvInvoiceHeadsRecId: TcxGridDBColumn;
    tvInvoiceHeadsInvoiceNumber: TcxGridDBColumn;
    tvInvoiceHeadsInvoiceDate: TcxGridDBColumn;
    tvInvoiceHeadsCustomer: TcxGridDBColumn;
    tvInvoiceHeadsNameOnInvoice: TcxGridDBColumn;
    tvInvoiceHeadsAmountWithTax: TcxGridDBColumn;
    tvInvoiceHeadsAmountNoTax: TcxGridDBColumn;
    tvInvoiceHeadsAmountTax: TcxGridDBColumn;
    tvInvoiceHeadsPayTypes: TcxGridDBColumn;
    tvInvoiceHeadsPayTypeDescription: TcxGridDBColumn;
    tvInvoiceHeadsPayGroups: TcxGridDBColumn;
    tvInvoiceHeadspayGroupDescription: TcxGridDBColumn;
    tvInvoiceHeadsAddress1: TcxGridDBColumn;
    tvInvoiceHeadsAddress2: TcxGridDBColumn;
    tvInvoiceHeadsAddress3: TcxGridDBColumn;
    tvInvoiceHeadsRoomGuest: TcxGridDBColumn;
    tvInvoiceHeadsinvRefrence: TcxGridDBColumn;
    tvInvoiceHeadsdueDate: TcxGridDBColumn;
    tvInvoiceHeadsCreditInvoice: TcxGridDBColumn;
    tvInvoiceHeadsOriginalInvoice: TcxGridDBColumn;
    tvInvoiceHeadsReservation: TcxGridDBColumn;
    tvInvoiceHeadsRoomReservation: TcxGridDBColumn;
    tvInvoiceHeadsSplitNumber: TcxGridDBColumn;
    tvInvoiceLines: TcxGridDBTableView;
    tvInvoiceLinesRecId: TcxGridDBColumn;
    tvInvoiceLinesInvoiceNumber: TcxGridDBColumn;
    tvInvoiceLinesItem: TcxGridDBColumn;
    tvInvoiceLinesDescription: TcxGridDBColumn;
    tvInvoiceLinesQuantity: TcxGridDBColumn;
    tvInvoiceLinesPrice: TcxGridDBColumn;
    tvInvoiceLinesAmountWithTax: TcxGridDBColumn;
    tvInvoiceLinesAmountNoTax: TcxGridDBColumn;
    tvInvoiceLinesAmountTax: TcxGridDBColumn;
    tvInvoiceLinesCurrency: TcxGridDBColumn;
    tvInvoiceLinesCurrencyRate: TcxGridDBColumn;
    tvInvoiceLinespurchaseDate: TcxGridDBColumn;
    tvInvoiceLinesImportRefrence: TcxGridDBColumn;
    tvInvoiceLinesImportSource: TcxGridDBColumn;
    tvInvoiceLinesVatType: TcxGridDBColumn;
    lvInvoiceHeads: TcxGridLevel;
    lvInvoiceLines: TcxGridLevel;
    btnInvoiceheadsExcel: TsButton;
    mInvoiceHeadsRoom: TStringField;
    tvInvoiceHeadsRoom: TcxGridDBColumn;
    StoreMain: TcxPropertiesStore;
    edGetCustomer: TsButton;
    mRoomsPriceCode: TWideStringField;
    tvRoomsPriceCode: TcxGridDBColumn;
    tvRoomsunPaidItems: TcxGridDBColumn;
    timStart: TTimer;
    rgrinvoice: TcxGridDBColumn;
    pnlDataWait: TsPanel;
    sLabel2: TsLabel;
    mRoomsRoomClass: TWideStringField;
    tvRoomsRoomClass: TcxGridDBColumn;
    mRoomsRoomClassDescription: TWideStringField;
    tvRoomsRoomClassDescription: TcxGridDBColumn;
    tvRoomsColumn1: TcxGridDBColumn;
    cxButton5: TsButton;
    cxButton6: TsButton;
    mInvoiceLinesQuantity: TFloatField;
    sGroupBox1: TsGroupBox;
    edtContactName: TsEdit;
    edtContactAddress1: TsEdit;
    edtContactAddress2: TsEdit;
    edtContactAddress3: TsEdit;
    edtContactPhone: TsEdit;
    edtContactPhone2: TsEdit;
    edtContactCountry: TsEdit;
    edtContactEmail: TsEdit;
    Label20: TsLabel;
    sLabel3: TsLabel;
    edtContact: TsLabel;
    Label21: TsLabel;
    Label23: TsLabel;
    memPanel: TsPanel;
    cxSplitter2: TsSplitter;
    sSplitter1: TsSplitter;
    GroupBox1: TsGroupBox;
    memInformation: TsMemo;
    GroupBox2: TsGroupBox;
    memPMInfo: TsMemo;
    Panel8: TsPanel;
    btnShowHiddenMemo: TsButton;
    btnClipboardToHinndenMemo: TsButton;
    gbxRoomInformation: TsGroupBox;
    memRoomNotes: TsMemo;
    btnRoomsRefresh: TsButton;
    sGroupBox2: TsGroupBox;
    cxButton3: TsButton;
    dtDeparture: TsDateEdit;
    dtArrival: TsDateEdit;
    Label2: TsLabel;
    Label3: TsLabel;
    sGroupBox3: TsGroupBox;
    Label8: TsLabel;
    edtType: TsEdit;
    btnGetCustomerType: TsButton;
    lblCustomerType: TsLabel;
    sLabel1: TsLabel;
    edCountry: TsEdit;
    btnGetCountry: TsButton;
    labCountry: TsLabel;
    sGroupBox4: TsGroupBox;
    clabReserveDate: TsLabel;
    __labReserveDate: TsLabel;
    Label5: TsLabel;
    __labStaff: TsLabel;
    __labResNumbers: TsLabel;
    sLabel4: TsLabel;
    sGroupBox5: TsGroupBox;
    Label25: TsLabel;
    Label24: TsLabel;
    Label26: TsLabel;
    cbxStatus: TsComboBox;
    cbxBreakfast: TsComboBox;
    cbxPaymentdetails: TsComboBox;
    Label61: TsLabel;
    chkUseStayTax: TsCheckBox;
    sButton1: TsButton;
    cxSplitter1: TcxSplitter;
    Panel1: TsPanel;
    sButton2: TsButton;
    sButton3: TsButton;
    sButton4: TsButton;
    mRoomsPackage: TWideStringField;
    tvRoomsPackage: TcxGridDBColumn;
    sLabel5: TsLabel;
    memRequestFromChannel: TsMemo;
    Label10: TsLabel;
    edtTel1: TsEdit;
    edtTel2: TsEdit;
    edtFax: TsEdit;
    Label11: TsLabel;
    Label14: TsLabel;
    edtCustomerEmail: TsEdit;
    edtCustomerWebSite: TsEdit;
    Label15: TsLabel;
    mRoomsoutOfOrderBlocking: TBooleanField;
    sPanel1: TsPanel;
    mRoomsblockMove: TBooleanField;
    tvRoomsblockMove: TcxGridDBColumn;
    mRoomsPersonsProfilesId: TIntegerField;
    rgrProfiles: TcxGridDBColumn;
    sButton5: TsButton;
    btnGroups: TsButton;
    sTabSheet1: TsTabSheet;
    mRoomsManualChannelId: TIntegerField;
    mRoomsratePlanCode: TWideStringField;
    tvRoomsratePlanCode: TcxGridDBColumn;
    sTabSheet2: TsTabSheet;
    pnlAlertHolder: TsPanel;
    timBlink: TTimer;
    DropComboTarget1: TDropComboTarget;
    btnPasteFile: TsButton;
    __PriceViewer: TcxGridDBColumn;
    edtContactAddress4: TsEdit;
    sLabel7: TsLabel;
    mRoomsExpectedTimeOfArrival: TTimeField;
    mRoomsExpectedCheckoutTime: TTimeField;
    tvRoomsPersonsProfilesId: TcxGridDBColumn;
    tvRoomsoutOfOrderBlocking: TcxGridDBColumn;
    tvRoomsManualChannelId: TcxGridDBColumn;
    tvRoomsExpectedTimeOfArrival: TcxGridDBColumn;
    tvRoomsExpectedCheckoutTime: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cbxBreakfastCloseUp(Sender: TObject);
    procedure cbxPaymentdetailsCloseUp(Sender: TObject);
    procedure cbxStatusCloseUp(Sender: TObject);
    procedure memRoomNotesExit(Sender: TObject);
    procedure PageNotesChange(Sender: TObject);
    procedure btnRoomsRefreshClick(Sender: TObject);
    procedure tvRoomsCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure tvRoomsTcxGridDBDataControllerTcxDataSummaryFooterSummaryItems9GetText
      (Sender: TcxDataSummaryItem; const AValue: Variant; AIsFooter: Boolean;
      var AText: string);
    procedure mRoomsAfterScroll(DataSet: TDataSet);
    procedure btnClipboardToHinndenMemoClick(Sender: TObject);
    procedure btnShowHiddenMemoClick(Sender: TObject);
    procedure tvRoomsbreakfastTextPropertiesChange(Sender: TObject);
    procedure tvRoomsaccountTypeTextPropertiesChange(Sender: TObject);
    procedure tvRoomsStatusTextPropertiesChange(Sender: TObject);
    procedure btnAddRoomClick(Sender: TObject);
    procedure btnProvideRoomClick(Sender: TObject);
    procedure OpenthisRoom1Click(Sender: TObject);
    procedure OpenGroupInvoice1Click(Sender: TObject);
    procedure btnRemoveRoomClick(Sender: TObject);
    procedure btnShowPricesClick(Sender: TObject);
    procedure btnRoomToExcelClick(Sender: TObject);
    procedure mnuThisRoomClick(Sender: TObject);
    procedure mnuThisreservationClick(Sender: TObject);
    procedure btnGuestsRefreshClick(Sender: TObject);
    procedure btnExpandClick(Sender: TObject);
    procedure btnCollapseClick(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure chkShowAllGuestsClick(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure btnInvoiceheadsExcelClick(Sender: TObject);
    procedure btnShowInvoiceExit(Sender: TObject);
    procedure mAllGuestsAfterScroll(DataSet: TDataSet);
    procedure tvAllGuestsCanFocusRecord(Sender: TcxCustomGridTableView;
      ARecord: TcxCustomGridRecord; var AAllow: Boolean);
    procedure tvGuestRoomsCanFocusRecord(Sender: TcxCustomGridTableView;
      ARecord: TcxCustomGridRecord; var AAllow: Boolean);
    procedure tvGuestsCanFocusRecord(Sender: TcxCustomGridTableView;
      ARecord: TcxCustomGridRecord; var AAllow: Boolean);
    procedure tvRoomsFocusedRecordChanged(Sender: TcxCustomGridTableView;
      APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure tvRoomsUpdateEdit(Sender: TcxCustomGridTableView;
      AItem: TcxCustomGridTableItem; AEdit: TcxCustomEdit);
    procedure tvRoomsGuestNamePropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure tvRoomsInitEdit(Sender: TcxCustomGridTableView;
      AItem: TcxCustomGridTableItem; AEdit: TcxCustomEdit);
    procedure edtTypeDblClick(Sender: TObject);
    procedure edCountryDblClick(Sender: TObject);
    procedure edCountryKeyPress(Sender: TObject; var Key: Char);
    procedure cbxStatusEnter(Sender: TObject);
    procedure mainPageChange(Sender: TObject);
    procedure edGetCustomerClick(Sender: TObject);
    procedure tvRoomsDeparturePropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
    procedure tvRoomsArrivalPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
    procedure tvRoomsdayCountPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
    procedure tvRoomsGuestCountPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
    procedure timStartTimer(Sender: TObject);
    procedure rgrinvoicePropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
    procedure cxButton3Click(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure tvRoomsRoomTypePropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
    procedure tvRoomsColumn1PropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
    procedure sButton1Click(Sender: TObject);
    procedure cxButton5Click(Sender: TObject);
    procedure cxButton6Click(Sender: TObject);
    procedure edCountryExit(Sender: TObject);
    procedure edCountryChange(Sender: TObject);
    procedure tvInvoiceHeadsAmountWithTaxGetProperties(Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AProperties: TcxCustomEditProperties);
    procedure tvInvoiceHeadsAmountNoTaxGetProperties(Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AProperties: TcxCustomEditProperties);
    procedure tvInvoiceHeadsAmountTaxGetProperties(Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AProperties: TcxCustomEditProperties);
    procedure tvInvoiceLinesPriceGetProperties(Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AProperties: TcxCustomEditProperties);
    procedure tvInvoiceLinesAmountWithTaxGetProperties(Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AProperties: TcxCustomEditProperties);
    procedure tvInvoiceLinesAmountNoTaxGetProperties(Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AProperties: TcxCustomEditProperties);
    procedure tvInvoiceLinesAmountTaxGetProperties(Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AProperties: TcxCustomEditProperties);
    procedure sButton4Click(Sender: TObject);
    procedure tvRoomsPackagePropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
    procedure tvRoomsblockMovePropertiesChange(Sender: TObject);
    procedure tvRoomsPersonsProfilesIdPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
    procedure sButton5Click(Sender: TObject);
    procedure btnGroupsClick(Sender: TObject);
    procedure tvRoomsratePlanCodePropertiesCloseUp(Sender: TObject);
    procedure DropComboTarget1Drop(Sender: TObject; ShiftState: TShiftState; APoint: TPoint; var Effect: Integer);
    procedure timBlinkTimer(Sender: TObject);
    procedure btnPasteFileClick(Sender: TObject);
    procedure tvRoomsunpaidRentPricePropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DropComboTarget1GetDropEffect(Sender: TObject; ShiftState: TShiftState; APoint: TPoint;
      var Effect: Integer);
    procedure DropComboTarget1DragOver(Sender: TObject; ShiftState: TShiftState; APoint: TPoint; var Effect: Integer);
  private
    { Private declarations }
    vStartName: string;
    vStatus: string;
    FOutOfOrderBlocking: Boolean;
    DynamicRates: TDynamicRates;

    FrmAlertPanel: TFrmAlertPanel;
    AlertList: TAlertList;

    procedure Display;
    procedure Display_rGrid(gotoRoomReservation: longInt);
    procedure AddNewRoom3;
    procedure MoveGuestToNewRoom2;
    procedure UpdateBreakfast;
    procedure UpdatePaymentDetails;
    procedure UpdateStatus;

    Function guestRoomsSQL(reservation: Integer): string;
    function getGuestData(gotoRoomReservation: Integer): Boolean;

    Function guestsSQL(reservation: Integer): string;
    Function allGuestsSQL(reservation: Integer): string;

    Function InvoiceSQL(reservation: Integer): string;
    function getInvoiceData(gotoRoomReservation: Integer): Boolean;
    procedure doRRDateChange(startIn: Integer);
    procedure PlacePnlDataWait;
    procedure SetLabNumbers;

    procedure SetStatusItemindex(sStatus: string);
    function StatusToItemindex(sStatus: string): Integer;

    procedure SetBreakfastItemindex(sStatus: string);
    procedure SetPaymentDetailItemindex(sStatus: string);
    procedure SetOutOfOrderBlocking(const Value: Boolean);

    property OutOfOrderBlocking: Boolean read FOutOfOrderBlocking write SetOutOfOrderBlocking;
  public
    { Public declarations }
    zGuestName: string;
    zGuestCount: Integer;

    zReservation: longInt;
    zRoomReservation: longInt;

    zInitDateFrom, zInitDateTo: TDateTime;

    zShowAllGuests: Boolean;

    zInt: Integer;

    procedure UpdateProfile;
  end;

var
  frmReservationProfile: TfrmReservationProfile;

function EditReservation(reservation, roomReservation: Integer): Boolean;

implementation

uses
  ADODB,
  UITypes,
  cxGridExportLink,
  Graphics,
  SysUtils,
  Windows,
  VCL.Dialogs,
  _GLOB,
  cmpRoomerDataSet,
  shellapi,
  uFrmResources,
  uUtils,
  uG,
  uD,
  uGuestProfile2,
  uProvideARoom2,
  uFinishedInvoices2,
  uInvoice,
  uResGuestList,
  uCountries,
  uCustomers2,
  uCustomertypes2,
  uSqlDefinitions,
  uAppGlobal,
  PrjConst,
  uPackages,
  uGuestProfiles,
  uGuestPortfolioEdit,
  uGuestCheckInForm,
  uDateUtils,
  uRoomerDefinitions,
  uGroupGuests,
  uAvailabilityPerDay,
  uResourceManagement,
  uViewDailyRates,
  uRoomTypes2,
  hData,
  uMain;

{$R *.DFM}


function strIsDiff(const s: string): Boolean;
var
  ch: Char;
  i: Integer;
begin
  result := false;
  if trim(s) = '' then
    exit;

  ch := s[1];
  for i := 1 to length(s) do
  begin
    if s[i] <> ch then
      result := true;
  end;
end;

function EditReservation(reservation, roomReservation: longInt): Boolean;
begin
  // --
  result := false;
  Application.CreateForm(TfrmReservationProfile, frmReservationProfile);
  try
    frmReservationProfile.zReservation := reservation;
    frmReservationProfile.zRoomReservation := roomReservation;
    frmReservationProfile.SetLabNumbers;

    if frmReservationProfile.ShowModal = mrOK then
    begin
      try
        if d.isResCurrentlyCheckedIn(reservation) then
        begin
          g.updateCurrentGuestlist;
        end;
      except
      end;

      frmReservationProfile.UpdateProfile;

      if trim(frmReservationProfile.vStartName) <>
        trim(frmReservationProfile.edtName.text) then
      begin
        d.RV_Upd_Name(reservation, frmReservationProfile.edtName.text);
      end;

      frmMain.refreshGrid;
      result := true;
    end;
  finally
    frmReservationProfile.free;
  end;
end;


// **********************************************************************
//
// Form procedures
//
// **********************************************************************

procedure TfrmReservationProfile.FormShow(Sender: TObject);
var
  i: Integer;
begin
  _restoreForm(frmReservationProfile);
  enabled := false;
  (tvRoomsStatusText.Properties AS TcxComboBoxProperties).Items.Clear;
  for i := 0 to cbxStatus.Items.Count - 1 do
    (tvRoomsStatusText.Properties AS TcxComboBoxProperties).Items.Add(cbxStatus.Items[i]);
  cbxStatus.ItemIndex := 0;
  PlacePnlDataWait;
  timStart.enabled := true;
  vStartName := frmReservationProfile.edtName.text;
end;

procedure TfrmReservationProfile.FormCreate(Sender: TObject);
begin
  RoomerLanguage.TranslateThisForm(self);
  glb.PerformAuthenticationAssertion(self);
  PlaceFormOnVisibleMonitor(self);

  FOutOfOrderBlocking := false;
  mainPage.ActivePage := RoomsTab;
  zInt := 0;
  vStatus := '';

  DynamicRates := TDynamicRates.Create;
end;

procedure TfrmReservationProfile.FormDestroy(Sender: TObject);
begin
  DynamicRates.free;
  FreeAndNil(FrmAlertPanel);
  AlertList.postChanges;
  AlertList.free;
end;

procedure TfrmReservationProfile.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    Close;
end;

procedure TfrmReservationProfile.FormResize(Sender: TObject);
begin
  PlacePnlDataWait;
end;

procedure TfrmReservationProfile.PlacePnlDataWait;
begin
  pnlDataWait.Left := (Width div 2) - (pnlDataWait.Width div 2);
  pnlDataWait.Top := (Height div 2) - (pnlDataWait.Height div 2);
end;

// **********************************************************************************
//
//
// ***********************************************************************************

procedure TfrmReservationProfile.Display;
var
  ciCustomerInfo: recCustomerHolderEX;
  s: string;
  rSet: TRoomerDataSet;
  HiddenInfo: string;
  ChannelRequest: String;
begin
  pnlDataWait.Show;
  ActiveControl := grRooms;
  screen.Cursor := crHourGlass;
  Application.ProcessMessages;

  rSet := CreateNewDataSet;
  try
    s := format(select_ReservationProfile_Display, [zReservation]);
    hData.rSet_bySQL(rSet, s);

    with rSet do
    begin
      First;
      if not Eof then
      begin
        edtInvRefrence.ReadOnly := glb.GetBooleanValueOfFieldFromId('channels', 'managedByChannelManager',
          fieldbyname('channel').asInteger);
        edtCustomer.text := trim(fieldbyname('Customer').asstring);
        // OPT?
        ciCustomerInfo := hData.Customer_GetHolder(edtCustomer.text);

        edtContactName.text := trim(fieldbyname('ContactName').asstring);
        edtContactEmail.text := trim(fieldbyname('ContactEmail').asstring);
        edtContactPhone.text := trim(fieldbyname('ContactPhone').asstring);
        edtContactPhone2.text := trim(fieldbyname('ContactPhone2').asstring);
        edtContactAddress1.text := trim(fieldbyname('ContactAddress1').asstring);
        edtContactAddress2.text := trim(fieldbyname('ContactAddress2').asstring);
        edtContactAddress3.text := trim(fieldbyname('ContactAddress3').asstring);
        edtContactAddress4.text := trim(fieldbyname('ContactAddress4').asstring);
        edtContactCountry.text := trim(fieldbyname('ContactCountry').asstring);

        edtName.text := trim(fieldbyname('Name').asstring);
        edtKennitala.text := trim(fieldbyname('CustPId').asstring);
        edtAddress1.text := trim(fieldbyname('Address1').asstring);
        edtAddress2.text := trim(fieldbyname('Address2').asstring);
        edtAddress3.text := trim(fieldbyname('Address3').asstring);
        edtCustomerEmail.text := trim(fieldbyname('CustomerEmail').asstring);
        edtCustomerWebSite.text := trim(fieldbyname('CustomerWebSite').asstring);
        edCountry.text := trim(fieldbyname('Country').asstring);

        // **TESTED**// lev3 ok
        countryValidate(edCountry, labCountry);

        edtTel1.text := trim(fieldbyname('Tel1').asstring);
        edtTel2.text := trim(fieldbyname('Tel2').asstring);
        edtFax.text := trim(fieldbyname('Fax').asstring);

        dtArrival.Date := _DBDateToDate(trim(fieldbyname('Arrival').asstring));
        dtDeparture.Date := _DBDateToDate(trim(fieldbyname('Departure').asstring));

        memInformation.Lines.text := trim(fieldbyname('Information').asstring);
        memPMInfo.Lines.text := trim(fieldbyname('PMInfo').asstring);

        edtType.text := trim(fieldbyname('MarketSegment').asstring);
        lblCustomerType.caption := d.GET_CustomerTypesDescription_byCustomerType(edtType.text);

        edtInvRefrence.text := trim(fieldbyname('invRefrence').asstring);
        chkUseStayTax.checked := rSet['useStayTax'];

        // labReserveDate.caption := DateToStr(_DBDateToDate(rSet.fieldbyname('ReservationDate').asString));
        __labReserveDate.caption := DateTimeToStr(rSet.fieldbyname('dtCreated').AsDateTime) + ' UTC';
        __labStaff.caption := rSet.fieldbyname('staff').asstring;

        OutOfOrderBlocking := fieldbyname('outOfOrderBlocking').AsBoolean;
      end;
    end;

    Display_rGrid(zRoomReservation);
    d.RR_GetMemoBothTextForRoom(zRoomReservation, HiddenInfo, ChannelRequest);
    gbxRoomInformation.caption := 'Notes for Room : ' + mRooms.fieldbyname('Room').asstring;
    memRoomNotes.Lines.text := HiddenInfo;
    memRequestFromChannel.Lines.text := ChannelRequest;

    zInitDateFrom := dtArrival.Date;
    zInitDateTo := dtDeparture.Date;
  finally
    FreeAndNil(rSet);
    screen.Cursor := crDefault;
    pnlDataWait.Hide;
  end;
end;

procedure TfrmReservationProfile.rgrinvoicePropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
begin
  case AButtonIndex of
    0:
      begin
        try
          EditInvoice(zReservation, zRoomReservation, 0, 0, 0, 0, false, true, false);
        finally
          Display_rGrid(zRoomReservation);
        end;
      end;
    1:
      begin
        try
          EditInvoice(zReservation, 0, 0, 0, 0, 0, false, true, false);
        finally
          Display_rGrid(zRoomReservation);
        end;
      end;
  end;
end;

procedure TfrmReservationProfile.sButton1Click(Sender: TObject);
begin
  StaticResources('Reservation Resources',
    format(BOOKING_STATIC_RESOURCES, [inttostr(zReservation)]),
    ACCESS_RESTRICTED);
end;

procedure TfrmReservationProfile.sButton4Click(Sender: TObject);
begin
  // guestlist
  frmResGuestList := TfrmResGuestList.Create(self);
  try
    frmResGuestList.zReservation := zReservation;
    frmResGuestList.ShowModal;
    if frmResGuestList.ModalResult = mrOK then
    begin
    end;
  finally
    frmResGuestList.free;
    frmResGuestList := nil;
  end;
end;

procedure TfrmReservationProfile.sButton5Click(Sender: TObject);
var
  rSet: TRoomerDataSet;
begin
  if (NOT mRooms.Eof) AND OpenGuestCheckInForm(mRooms['RoomReservation'], false) then
  begin
    rSet := CreateNewDataSet;
    try
      if hData.rSet_bySQL(rSet, 'SELECT Name FROM persons WHERE MainName=1 AND RoomReservation=' +
        inttostr(mRooms['RoomReservation'])) then
      begin
        mRooms.Edit;
        mRooms['GuestName'] := rSet['Name'];
        mRooms.Post;
      end;
    finally
      FreeAndNil(rSet);
    end;
  end;
end;

procedure TfrmReservationProfile.btnGroupsClick(Sender: TObject);
var
  iReservation: Integer;
  iRoomreservation: Integer;
begin
  iReservation := zReservation;
  iRoomreservation := zRoomReservation;
  if GroupGuests(iReservation, iRoomreservation) then
  begin
    Display_rGrid(zRoomReservation);
  end;
end;

procedure TfrmReservationProfile.SetLabNumbers;
var
  s: string;
begin
  s := inttostr(zReservation) + ' / ' + inttostr(zRoomReservation);
  __labResNumbers.caption := s;
end;

procedure TfrmReservationProfile.SetOutOfOrderBlocking(const Value: Boolean);
begin
  FOutOfOrderBlocking := Value;

  sPanel1.Visible := FOutOfOrderBlocking;
  Panel4.Visible := NOT FOutOfOrderBlocking;
  Panel9.Visible := NOT FOutOfOrderBlocking;
  cxSplitter1.Visible := NOT FOutOfOrderBlocking;
  sGroupBox1.Visible := NOT FOutOfOrderBlocking;
  GroupBox2.Visible := NOT FOutOfOrderBlocking;
  gbxRoomInformation.Visible := NOT FOutOfOrderBlocking;
  sGroupBox3.Visible := NOT FOutOfOrderBlocking;
  sGroupBox5.Visible := NOT FOutOfOrderBlocking;
  Panel8.Visible := NOT FOutOfOrderBlocking;
  if FOutOfOrderBlocking then
  begin
    GuestsTab.Visible := NOT FOutOfOrderBlocking;
    InvoicesTab.Visible := NOT FOutOfOrderBlocking;
  end;

  if FOutOfOrderBlocking then
  begin
    Label2.caption := GetTranslatedText('shTx_FrmMakeReservationQuick_OutOfOrderStartDate');
    Label3.caption := GetTranslatedText('shTx_FrmMakeReservationQuick_OutOfOrderEndDate');
  end
  else
  begin
    RoomerLanguage.TranslateThisControl(self, Label2);
    RoomerLanguage.TranslateThisControl(self, Label3);
  end;

  tvRoomsPackage.Visible := NOT FOutOfOrderBlocking;
  tvRoomsGuestName.Visible := true;
  tvRoomsRoomClassDescription.Visible := NOT FOutOfOrderBlocking;
  tvRoomsGuestCount.Visible := NOT FOutOfOrderBlocking;
  tvRoomsCurrency.Visible := NOT FOutOfOrderBlocking;
  tvRoomsbreakfastText.Visible := NOT FOutOfOrderBlocking;
  tvRoomsaccountTypeText.Visible := NOT FOutOfOrderBlocking;
  rgrinvoice.Visible := NOT FOutOfOrderBlocking;
  tvRoomsTotalUnpaidRoomRent.Visible := NOT FOutOfOrderBlocking;
  tvRoomsDiscountUnpaidRoomRent.Visible := NOT FOutOfOrderBlocking;
  tvRoomsunPaidRoomRent.Visible := NOT FOutOfOrderBlocking;
  tvRoomsunpaidRentNights.Visible := NOT FOutOfOrderBlocking;
  tvRoomsunpaidRentPrice.Visible := NOT FOutOfOrderBlocking;
  tvRoomsPriceCode.Visible := NOT FOutOfOrderBlocking;
  tvRoomsunPaidItems.Visible := NOT FOutOfOrderBlocking;

end;

procedure TfrmReservationProfile.UpdateProfile;
var
  rSet: TRoomerDataSet;
  s: string;
  Numdays: Integer;
begin
  Numdays := trunc(dtDeparture.Date) - trunc(dtArrival.Date);

  if Numdays < 1 then
  begin
    showmessage(GetTranslatedText('shTx_ReservationProfile_MustBeOver1Day'));
    exit;
  end;

  rSet := CreateNewDataSet;
  try
    d.roomerMainDataSet.SystemStartTransaction;
    try

      rSet.CommandType := cmdText;

      s := format(select_ReservationProfile_UpdateProfile, [zReservation]);
      hData.rSet_bySQL(rSet, s);

      rSet.Edit;
      rSet.fieldbyname('Customer').asstring := edtCustomer.text;
      rSet.fieldbyname('Name').asstring := edtName.text;
      rSet.fieldbyname('CustPID').asstring := edtKennitala.text;
      rSet.fieldbyname('Address1').asstring := edtAddress1.text;
      rSet.fieldbyname('Address2').asstring := edtAddress2.text;
      rSet.fieldbyname('Address3').asstring := edtAddress3.text;
      rSet.fieldbyname('CustomerWebSite').asstring := edtCustomerWebSite.text;
      rSet.fieldbyname('CustomerEmail').asstring := edtCustomerEmail.text;
      rSet.fieldbyname('Country').asstring := edCountry.text;
      rSet.fieldbyname('MarketSegment').asstring := edtType.text;
      rSet.fieldbyname('Tel1').asstring := edtTel1.text;
      rSet.fieldbyname('Fax').asstring := edtFax.text;
      rSet.fieldbyname('Tel2').asstring := edtTel2.text;
      rSet.fieldbyname('Arrival').asstring := _DateToDBDate(dtArrival.Date, false);
      rSet.fieldbyname('Departure').asstring := _DateToDBDate(dtDeparture.Date, false);
      rSet.fieldbyname('Information').asstring := memInformation.Lines.text;
      rSet.fieldbyname('PMInfo').asstring := memPMInfo.Lines.text;
      rSet.fieldbyname('ContactName').asstring := edtContactName.text;
      rSet.fieldbyname('ContactEmail').asstring := edtContactEmail.text;
      rSet.fieldbyname('ContactPhone').asstring := edtContactPhone.text;
      rSet.fieldbyname('ContactPhone2').asstring := edtContactPhone2.text;
      rSet.fieldbyname('ContactAddress1').asstring := edtContactAddress1.text;
      rSet.fieldbyname('ContactAddress2').asstring := edtContactAddress2.text;
      rSet.fieldbyname('ContactAddress3').asstring := edtContactAddress3.text;
      rSet.fieldbyname('ContactAddress4').asstring := edtContactAddress4.text;
      rSet.fieldbyname('ContactCountry').asstring := edtContactCountry.text;
      rSet.fieldbyname('invRefrence').asstring := edtInvRefrence.text;
      rSet['useStayTax'] := chkUseStayTax.checked;
      rSet.Post;

      d.roomerMainDataSet.SystemCommitTransaction;
    except
      d.roomerMainDataSet.SystemRollbackTransaction;
      raise;
    end;
  finally
    FreeAndNil(rSet);
  end;
end;

// ***********************************************************************************
//
// Hidden Memo
//
// ************************************************************************************

procedure TfrmReservationProfile.btnClipboardToHinndenMemoClick
  (Sender: TObject);
var
  s: string;
  selection: string;
  id: Integer;
begin
  selection := ClipBoardText;
  if selection = '' then
    exit;
  // S := 'Copy to hidden :' + #10#10 + selection;
  s := GetTranslatedText('shTx_ReservationProfile_CopyHidden') + #10#10 + selection;
  if MessageDlg(s, mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    id := d.hiddenInfo_Exists(zReservation, 1);
    d.hiddenInfo_Append(id, selection, zReservation);
  end;
end;

procedure TfrmReservationProfile.btnShowHiddenMemoClick(Sender: TObject);
begin
  g.openHiddenInfo(zReservation, 1);
end;

procedure TfrmReservationProfile.btnShowInvoiceExit(Sender: TObject);
begin

end;

// ********************************************************************************************
//
// Edits Dbl-click to select
//
// ********************************************************************************************

procedure TfrmReservationProfile.edCountryChange(Sender: TObject);
begin
  if glb.LocateCountry(edCountry.text) then
    labCountry.caption := glb.Countries['CountryName'] // GET_CountryName(sValue);
  else
    labCountry.caption := GetTranslatedText('shNotF_star');

end;

procedure TfrmReservationProfile.edCountryDblClick(Sender: TObject);
var
  oldCountry: string;
  oldCountryName: string;

  newCountry: string;

  s: string;
begin
  // --
  oldCountry := edCountry.text;
  oldCountryName := labCountry.caption;
  // **TESTED**//  lev3 ok
  if getCountry(edCountry, labCountry) then
  begin
    s := format(GetTranslatedText('shTx_ReservationProfile_ChangeNationalityConfirmation'),
      [oldCountryName, labCountry.caption]);

    if MessageDlg(s, mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      newCountry := edCountry.text;;
      if not d.ChangeCountry(newCountry, zReservation, 0, 0, 2) then
      begin
        showmessage(GetTranslatedText('shTx_ReservationProfile_NationalityChangeFailed'));
      end;
    end
    else
    begin
      edCountry.text := oldCountry;
      countryValidate(edCountry, labCountry);
    end;
  end;
end;

procedure TfrmReservationProfile.edCountryExit(Sender: TObject);
begin
  // **
  if countryValidate(edCountry, labCountry) then
  begin

  end;
end;

procedure TfrmReservationProfile.edCountryKeyPress(Sender: TObject;
  var Key: Char);
begin
  Key := #0;
end;

procedure TfrmReservationProfile.edGetCustomerClick(Sender: TObject);
var
  CustomerHolder: recCustomerHolder;
  CustomerHolderEX: recCustomerHolderEX;
begin
  CustomerHolder.Customer := edtCustomer.text;
  if openCustomers(actLookup, true, CustomerHolder) then
  begin
    edtCustomer.text := CustomerHolder.Customer;
    CustomerHolderEX := hData.Customer_GetHolder(CustomerHolder.Customer);
    edtName.text := InvoiceName(0, CustomerHolderEX.DisplayName, CustomerHolderEX.CustomerName);
    edtKennitala.text := CustomerHolderEX.PID;
    edtAddress1.text := CustomerHolderEX.Address1;
    edtAddress2.text := CustomerHolderEX.Address2;
    edtAddress3.text := CustomerHolderEX.Address3;
    edtTel1.text := CustomerHolderEX.Tel1;
    edtTel2.text := CustomerHolderEX.Tel2;
    edtFax.text := CustomerHolderEX.Fax;
    edtCustomerEmail.text := CustomerHolderEX.EmailAddress;
    edtCustomerWebSite.text := CustomerHolderEX.HomePage;
    edtContactName.text := CustomerHolderEX.ContactPerson;
    edtContactEmail.text := CustomerHolderEX.ContactEmail;
    edtContactPhone.text := CustomerHolderEX.ContactPhone;
  end;
end;

procedure TfrmReservationProfile.edtTypeDblClick(Sender: TObject);
var
  theData: recCustomerTypeHolder;
  id: Integer;
begin
  theData.customerType := edtType.text;
  glb.LocateSpecificRecordAndGetValue('customertypes', 'CustomerType', edtType.text, 'ID', id);
  theData.id := id;
  if openCustomerTypes(actLookup, theData) then
  begin
    edtType.text := theData.customerType;
    lblCustomerType.caption := theData.description;
  end;
end;

// **************************************************************************************
//
//
// **************************************************************************************

procedure TfrmReservationProfile.UpdateBreakfast;
var
  s: string;
  isBr: Boolean;
begin
  if cbxBreakfast.ItemIndex = 0 then
  begin
  end;

  isBr := false;
  if cbxBreakfast.ItemIndex = 1 then
    isBr := true;
  s := '';
  s := s + GetTranslatedText('shTx_ReservationProfile_ChangeAllRooms');
  if isBr then
    s := s + GetTranslatedText('shTx_ReservationProfile_BreakfastInc')
  else
    s := s + GetTranslatedText('shTx_ReservationProfile_BreakfastNotInc');

  if MessageDlg(s, mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    d.UpdateBreakfastIncluted(zReservation, 0, isBr);
    Display_rGrid(zRoomReservation);
  end;
end;

procedure TfrmReservationProfile.UpdatePaymentDetails;
var
  s: string;
  GroupAccount: Boolean;
begin
  if cbxPaymentdetails.ItemIndex = 0 then
  begin
    Display_rGrid(zRoomReservation);
    exit;
  end;

  GroupAccount := cbxPaymentdetails.ItemIndex = 2;

  s := GetTranslatedText('shTx_ReservationProfile_ChangeAllRooms');
  if GroupAccount then
    s := s + GetTranslatedText('shTx_ReservationProfile_GroupAccount')
  else
    s := s + GetTranslatedText('shTx_ReservationProfile_RoomAccount');

  if MessageDlg(s, mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    d.UpdateGroupAccountAll(zReservation, 0, zRoomReservation, GroupAccount);
    Display_rGrid(zRoomReservation);
    // frmMain.refreshGrid;
  end;
end;

procedure TfrmReservationProfile.SetStatusItemindex(sStatus: string);
var
  ch: Char;
begin
  cbxStatus.ItemIndex := 0;

  if sStatus = '' then
  begin
    sStatus := d.isMixedStatus(zReservation);
  end;

  if strIsDiff(sStatus) then
  begin
    cbxStatus.ItemIndex := 0;
    exit;
  end;

  if sStatus = '' then
    exit;

  ch := sStatus[1];
  cbxStatus.ItemIndex := _StatusToIndex(ch, true);
  cbxStatus.Update;
  cbxStatus.Invalidate;
end;

procedure TfrmReservationProfile.SetBreakfastItemindex(sStatus: string);
var
  ch: Char;
begin
  // **
  if sStatus = '' then
  begin
    sStatus := d.isMixedBreakfast(zReservation);
  end;

  if strIsDiff(sStatus) then
  begin
    cbxBreakfast.ItemIndex := 0;
    exit;
  end;
  ch := sStatus[1];
  if ch = '0' then
    cbxBreakfast.ItemIndex := 2
  else
    cbxBreakfast.ItemIndex := 1;
  cbxBreakfast.Update;
  cbxBreakfast.Invalidate;
end;

procedure TfrmReservationProfile.SetPaymentDetailItemindex(sStatus: string);
var
  ch: Char;
begin
  if sStatus = '' then
  begin
    sStatus := d.isMixedPaymentdetails(zReservation);
  end;
  if strIsDiff(sStatus) then
  begin
    cbxPaymentdetails.ItemIndex := 0;
    exit;
  end;
  ch := sStatus[1];
  if ch = '0' then
    cbxPaymentdetails.ItemIndex := 1
  else
    cbxPaymentdetails.ItemIndex := 2;
  cbxPaymentdetails.Update;
  cbxPaymentdetails.Invalidate;
end;

function TfrmReservationProfile.StatusToItemindex(sStatus: string): Integer;
var
  ch: Char;
begin
  // **
  result := 0;
  ch := sStatus[1];
  case ch of
    'P':
      result := 1;
    'G':
      result := 2;
    'D':
      result := 3;
    'O':
      result := 4;
    'A':
      result := 5;
    'N':
      result := 6;
    'B':
      result := 7;
    'C':
      result := 8;
    'W':
      result := 9;
    'Z':
      result := 10;
  end;
end;

procedure TfrmReservationProfile.UpdateStatus;
var
  s: string;
  sChar: string;
  sStr: string;
begin
  if cbxStatus.ItemIndex = 0 then
  begin
    Display_rGrid(zRoomReservation);
    exit;
  end;

  if cbxStatus.ItemIndex = 1 then
  begin
    sChar := 'G';
    sStr := GetTranslatedText('shTx_ReservationProfile_CheckedIn');
  end
  else
    if cbxStatus.ItemIndex = 2 then
  begin
    sChar := 'P';
    sStr := GetTranslatedText('shTx_ReservationProfile_NotArrived');
  end
  else
    if cbxStatus.ItemIndex = 3 then
  begin
    sChar := 'D';
    sStr := GetTranslatedText('shTx_ReservationProfile_Departed');
  end
  else
    if cbxStatus.ItemIndex = 4 then
  begin
    sChar := 'O';
    sStr := GetTranslatedText('shTx_ReservationProfile_WaitingList');
  end
  else
    if cbxStatus.ItemIndex = 5 then
  begin
    sChar := 'N';
    sStr := GetTranslatedText('shTx_ReservationProfile_NoShow');
  end
  else
    if cbxStatus.ItemIndex = 6 then
  begin
    sChar := 'A';
    sStr := GetTranslatedText('shTx_ReservationProfile_Allotment');
  end
  else
    if cbxStatus.ItemIndex = 7 then
  begin
    sChar := 'B';
    sStr := GetTranslatedText('shTx_ReservationProfile_Blocked');
  end
  else
    if cbxStatus.ItemIndex = 8 then
  begin
    sChar := 'C';
    sStr := GetTranslatedText('shTx_ReservationProfile_Canceled');
  end
  else
    if cbxStatus.ItemIndex = 9 then
  begin
    sChar := 'W';
    sStr := GetTranslatedText('shTx_ReservationProfile_Tmp1');
  end
  else
    if cbxStatus.ItemIndex = 10 then
  begin
    sChar := 'Z';
    sStr := GetTranslatedText('shTx_ReservationProfile_Tmp2');
  end;

  s := format(GetTranslatedText('shTx_ReservationProfile_ChangeStatus'), [sStr]);

  if MessageDlg(s, mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    d.UpdateStatusSimple(zReservation, 0, sChar);
    Display_rGrid(zRoomReservation);
  end;
end;

procedure TfrmReservationProfile.cbxBreakfastCloseUp(Sender: TObject);
begin
  UpdateBreakfast;
end;

procedure TfrmReservationProfile.cbxPaymentdetailsCloseUp(Sender: TObject);
begin
  UpdatePaymentDetails
end;

procedure TfrmReservationProfile.cbxStatusCloseUp(Sender: TObject);
begin
  UpdateStatus;
end;

procedure TfrmReservationProfile.cbxStatusEnter(Sender: TObject);
begin
  case cbxStatus.ItemIndex of
    0:
      vStatus := ''; // 0  Mixed
    1:
      vStatus := 'P'; // 1 Not arrived
    2:
      vStatus := 'G'; // 2 Checked in
    3:
      vStatus := 'D'; // 3 Departed
    4:
      vStatus := 'O'; // 4 Waitinglist
    5:
      vStatus := 'A'; // 5 Alotment
    6:
      vStatus := 'N'; // 6 No-show
    7:
      vStatus := 'B'; // 7 Blocked
    8:
      vStatus := 'C'; // 8 Canceled
    9:
      vStatus := 'W'; // 9 [Unused]
    // 10:
    // vStatus := 'Z'; // Awaiting payment

  end;

end;

procedure TfrmReservationProfile.chkShowAllGuestsClick(Sender: TObject);
begin
  if chkShowAllGuests.checked then
  begin
    lvAllGuests.GridView.Focused := true;
    btnExpand.enabled := false;
    btnCollapse.enabled := false;
  end
  else
  begin
    lvGuestRooms.GridView.Focused := true;
    btnExpand.enabled := true;
    btnCollapse.enabled := true;
  end;
end;

procedure TfrmReservationProfile.cxButton2Click(Sender: TObject);
var
  sFilename: string;
  s: string;
begin
  datetimeTostring(s, 'yyyymmddhhnn', now);
  sFilename := g.qProgramPath + s + '_Guests' + inttostr(zReservation);
  tvGuestRooms.BeginUpdate();
  tvGuestRooms.ViewData.Collapse(true);
  tvGuestRooms.EndUpdate;

  ExportGridToExcel(sFilename, grGuests, false, true, true);
  ShellExecute(Handle, 'OPEN', PChar(sFilename + '.xls'), nil, nil,
    sw_shownormal);
end;

procedure TfrmReservationProfile.cxButton3Click(Sender: TObject);
var
  arrival: TDate;
  departure: TDate;
  s: string;

begin

  arrival := dtArrival.Date;
  departure := dtDeparture.Date;

  g.openResDates(zReservation, 0, '', arrival, departure, 1);
  if dtArrival.Date <> 1 then
  begin
    dtArrival.Date := arrival;
    dtDeparture.Date := departure;
    Display_rGrid(0);
    s := '';
    s := s + 'UPDATE `reservations` '#10;
    s := s + 'SET '#10;
    s := s + '`Arrival` = %s, '#10;;
    s := s + '`Departure` = %s '#10;
    s := s + 'WHERE reservation = %d ';
    s := format(s, [_DateToDBDate(arrival, true), _DateToDBDate(departure, true), zReservation]);
    if not cmd_bySQL(s) then
    begin
    end;
  end;
  BringToFront;
end;

procedure TfrmReservationProfile.cxButton5Click(Sender: TObject);
begin
  tvRoomsColumn1PropertiesButtonClick(nil, 0);
end;

procedure TfrmReservationProfile.cxButton6Click(Sender: TObject);
begin
  Hide;
  frmMain.GoToDateAndRoom(mRooms.fieldbyname('Arrival').AsDateTime, mRooms.fieldbyname('RoomReservation').asInteger);
  Close;
end;


// ******************************************************************************
// Room Functions
// ******************************************************************************

procedure TfrmReservationProfile.AddNewRoom3;
var
  Currency: string;
  RoomType: string;

  Customer: string;
  ReservationName: string;

  RoomNumber: string;
  arrival: TDateTime;
  departure: TDateTime;

  iReservation: Integer;
  iRoomreservation: Integer;

  numGuests: Integer;
  numInfants: Integer;
  numChildren: Integer;

  PriceCode: string;
  AvrageRate: double;
  AvrageDiscount: double;
  isPercentage: Boolean;
  rateCount: Integer;

  useInNationalReport: Boolean;

  isGroupInvoice: Boolean;
  isBreckfastIncluted: Boolean;

  roomStatus: string;

  RoomPMInfo: string;
  RoomHiddenInfo: string;

  invoiceHeadData: recInvoiceHeadHolder;
  roomReservationData: recRoomReservationHolder;
  roomsDateData: recRoomsDateHolder;
  personData: recPersonHolder;

  guestName: string;
  iPerson: Integer;

  Address1: string;
  Address2: string;
  Address3: string;
  Address4: string;
  Country: string;

  temp: String;
  ii: Integer;

  dayCount: Integer;
  tmpDate: TDate;

  RoomReservationRentHolder: recRoomReservationRentHolder;

  oldRoomreservation: Integer;

  ExecutionPlan: TRoomerExecutionPlan;
  theData: recRoomTypeHolder;
  newRoomType: String;
begin
  // Add roomreservation as noroom

  initRoomTypeHolder(theData);

  theData.RoomType := mRooms['RoomType'];
  if openRoomTypes(actLookup, theData) then
    newRoomType := theData.RoomType
  else
    exit;

  if g.qWarnWhenOverbooking then
    if NOT IsAvailabilityThere('', newRoomType, mRooms['Arrival'], mRooms['Departure']) then
      exit;

  ExecutionPlan := d.roomerMainDataSet.CreateExecutionPlan;
  try
    try
      ExecutionPlan.BeginTransaction;

      iReservation := zReservation;
      oldRoomreservation := zRoomReservation;
      iRoomreservation := RR_SetNewID();

      Customer := trim(edtCustomer.text);
      ReservationName := edtName.text;
      Address1 := edtAddress1.text;
      Address2 := edtAddress1.text;
      Address3 := edtAddress1.text;
      Address4 := edtAddress1.text;
      Country := edCountry.text;

      Currency := mRooms.fieldbyname('Currency').asstring;
      isGroupInvoice := mRooms['isGroupAccount'];
      isBreckfastIncluted := mRooms['breakfast'];
      guestName := mRooms.fieldbyname('GuestName').asstring;

      arrival := mRooms.fieldbyname('Arrival').AsDateTime;
      departure := mRooms.fieldbyname('Departure').AsDateTime;
      dayCount := trunc(departure) - trunc(arrival);

      RoomType := newRoomType;

      numGuests := mRooms.fieldbyname('GuestCount').asInteger;
      numChildren := 0;
      numInfants := 0;

      RoomReservationRentHolder := RR_GetAvrageRent(oldRoomreservation);

      PriceCode := RoomReservationRentHolder.PriceType;
      AvrageRate := RoomReservationRentHolder.AvrageRate;
      AvrageDiscount := RoomReservationRentHolder.Discount;
      isPercentage := RoomReservationRentHolder.Percentage;
      rateCount := 1;

      useInNationalReport := true;
      RoomNumber := '<' + inttostr(iRoomreservation) + '>';
      roomStatus := mRooms.fieldbyname('status').asstring;
      RoomPMInfo := '';
      RoomHiddenInfo := '';

      initRoomReservationHolderRec(roomReservationData);
      roomReservationData := SP_GET_RoomReservation(iRoomreservation);

      roomReservationData.roomReservation := iRoomreservation;
      roomReservationData.Room := RoomNumber;
      roomReservationData.reservation := iReservation;
      roomReservationData.status := roomStatus;
      roomReservationData.GroupAccount := isGroupInvoice;
      roomReservationData.invBreakfast := isBreckfastIncluted;
      roomReservationData.Currency := Currency;
      roomReservationData.PriceType := PriceCode;
      roomReservationData.arrival := _DateToDBDate(arrival, false);
      roomReservationData.departure := _DateToDBDate(departure, false);
      roomReservationData.RoomType := RoomType;
      roomReservationData.PMInfo := RoomPMInfo;
      roomReservationData.HiddenInfo := RoomHiddenInfo;
      roomReservationData.rrArrival := arrival;
      roomReservationData.rrDeparture := departure;
      roomReservationData.rrIsNoRoom := true;
      roomReservationData.rrRoomAlias := '';
      roomReservationData.rrRoomTypeAlias := RoomType;
      roomReservationData.Discount := AvrageDiscount;
      roomReservationData.Percentage := isPercentage;
      roomReservationData.useInNationalReport := useInNationalReport;
      roomReservationData.RoomRentPaid1 := 0.00;
      roomReservationData.RoomRentPaid2 := 0.00;
      roomReservationData.RoomRentPaid3 := 0.00;
      roomReservationData.numGuests := numGuests;
      roomReservationData.numInfants := numInfants;
      roomReservationData.numChildren := numChildren;
      roomReservationData.AvrageRate := AvrageRate;
      roomReservationData.rateCount := rateCount;
      roomReservationData.Discount := AvrageDiscount;
      roomReservationData.RoomPrice1 := 0.00;
      roomReservationData.Price1From := _DateToDBDate(arrival, false);
      roomReservationData.Price1To := _DateToDBDate(departure, false);
      roomReservationData.RoomPrice2 := 0.00;
      roomReservationData.Price2From := _DateToDBDate(arrival, false);
      roomReservationData.Price2To := _DateToDBDate(arrival, false);
      roomReservationData.RoomPrice3 := 0.00;
      roomReservationData.Price3From := _DateToDBDate(arrival, false);
      roomReservationData.Price3To := _DateToDBDate(arrival, false);
      roomReservationData.Hallres := 0;

      ExecutionPlan.AddExec(SQL_INS_RoomReservation(roomReservationData));

      initInvoiceHeadHolderRec(invoiceHeadData);
      invoiceHeadData.reservation := iReservation;
      invoiceHeadData.roomReservation := iRoomreservation;
      invoiceHeadData.SplitNumber := 0;
      invoiceHeadData.InvoiceNumber := -1;
      invoiceHeadData.InvoiceDate := _DateToDBDate(now, false);
      invoiceHeadData.Customer := Customer;
      invoiceHeadData.name := ReservationName + ', ' + guestName;
      invoiceHeadData.Address1 := Address1;
      invoiceHeadData.Address2 := Address2;
      invoiceHeadData.Address3 := Address3;
      invoiceHeadData.Address4 := Address4;
      invoiceHeadData.Country := Country;
      invoiceHeadData.Total := 0.00;
      invoiceHeadData.TotalWOVAT := 0.00;
      invoiceHeadData.TotalVAT := 0.00;
      invoiceHeadData.TotalBreakFast := 0.00;
      invoiceHeadData.ExtraText := '';;
      invoiceHeadData.Finished := false;
      invoiceHeadData.CreditInvoice := -1;
      invoiceHeadData.OriginalInvoice := -1;
      invoiceHeadData.InvoiceType := 1;
      invoiceHeadData.ihTmp := '';
      invoiceHeadData.CustPID := edtKennitala.text;
      invoiceHeadData.RoomGuest := guestName;
      invoiceHeadData.ihDate := Date;
      invoiceHeadData.ihInvoiceDate := Date;
      invoiceHeadData.ihConfirmDate := _DBDateToDateTimeNoMs('1900-01-01 00:00:00');
      invoiceHeadData.ihPayDate := Date;
      invoiceHeadData.ihStaff := '';
      invoiceHeadData.ihCurrency := Currency;
      invoiceHeadData.ihCurrencyRate := 1.00;
      invoiceHeadData.ReportDate := '';
      invoiceHeadData.ReportTime := '';

      ExecutionPlan.AddExec(SQL_INS_InvoiceHead(invoiceHeadData));

      initRoomsDateHolderRec(roomsDateData);

      tmpDate := arrival;
      for ii := 1 to dayCount do
      begin
        roomsDateData := GET_RoomsDate(tmpDate, oldRoomreservation);
        roomsDateData.roomReservation := iRoomreservation;
        roomsDateData.Room := RoomNumber;
        roomsDateData.RoomType := RoomType;
        roomsDateData.isNoRoom := true;
        roomsDateData.Paid := false;

        ExecutionPlan.AddExec(SQL_INS_RoomsDate(roomsDateData));
        tmpDate := tmpDate + 1;
      end;

      if roomStatus = 'B' then
      begin
        numGuests := 1;
      end;

      iPerson := PE_SetNewID();

      initPersonHolder(personData);
      personData.Person := iPerson;
      personData.roomReservation := iRoomreservation;
      personData.reservation := iReservation;
      personData.name := guestName;
      personData.Surname := ReservationName;
      personData.Address1 := Address1;
      personData.Address2 := Address2;
      personData.Address3 := Address3;
      personData.Address4 := Address4;
      personData.Country := Country;
      personData.Company := Customer;
      personData.GuestType := RoomType;
      personData.Information := '';
      personData.PID := '';
      personData.MainName := true;
      personData.Customer := Customer;
      personData.peTmp := '';
      personData.hgrID := -1;
      personData.HallReservation := -1;

      ExecutionPlan.AddExec(SQL_INS_Person(personData));

      if numGuests > 1 then
      begin
        for ii := 2 to numGuests do
        begin
          iPerson := PE_SetNewID();

          personData.Person := iPerson;
          personData.name := 'RoomGuest';
          personData.MainName := false;
          // rest of the Guests
          ExecutionPlan.AddExec(SQL_INS_Person(personData));
        end;
      end;

      if (roomStatus <> 'O') and (roomStatus <> 'N') and (roomStatus <> 'C') then
      begin
        temp := format
          ('(AddNewRoom3) Add a room to reservation Reservation=%d, RoomReservation=%d, Room=%s, RoomType=%s, TO ArrDate=%s, DepDate=%s',
          [iReservation, iRoomreservation, RoomNumber, RoomType, DateToSqlString(arrival), DateToSqlString(departure)]);
        d.roomerMainDataSet.SystemChangeAvailability(RoomType, arrival, departure - 1, true, temp); // minnka frambo�
      end;

      if ExecutionPlan.Execute(ptExec, false, true) then
        ExecutionPlan.CommitTransaction
      else
        raise Exception.Create(ExecutionPlan.ExecException);

    except
      on e: Exception do
      begin
        ExecutionPlan.RollbackTransaction;
        showmessage(format(GetTranslatedText('shTx_ReservationProfile_AddRoomError'), [e.message]));
      end;
    end;
  finally
    FreeAndNil(ExecutionPlan);
  end;

  Display_rGrid(zRoomReservation);
end;

procedure TfrmReservationProfile.MoveGuestToNewRoom2;
begin
  if ProvideARoom2(zRoomReservation) <> '' then
  begin
    Display_rGrid(zRoomReservation);
  end;
end;

procedure TfrmReservationProfile.btnAddRoomClick(Sender: TObject);
begin
  AddNewRoom3;
end;

procedure TfrmReservationProfile.btnRemoveRoomClick(Sender: TObject);
var
  RoomNumber: string;
begin
  RoomNumber := d.RR_GetRoomNr(zRoomReservation);

  if not g.OpenRemoveRoom(zRoomReservation) then
    exit;

  Display_rGrid(zRoomReservation);
end;

procedure TfrmReservationProfile.btnPasteFileClick(Sender: TObject);
begin
  if DropComboTarget1.CanPasteFromClipboard then
    DropComboTarget1.PasteFromClipboard;
end;

procedure TfrmReservationProfile.btnProvideRoomClick(Sender: TObject);
begin
  MoveGuestToNewRoom2;
end;

procedure TfrmReservationProfile.btnShowPricesClick(Sender: TObject);
begin
  try
    EditInvoice(zReservation, 0, 0, 0, 0, 0, false, true, true);
  finally
    Display_rGrid(zRoomReservation);
  end;
end;

procedure TfrmReservationProfile.btnRoomToExcelClick(Sender: TObject);
var
  sFilename: string;
  s: string;
begin
  datetimeTostring(s, 'yyyymmddhhnn', now);
  sFilename := g.qProgramPath + s + '_Res' + inttostr(zReservation);
  ExportGridToExcel(sFilename, grRooms, false, true, true);
  ShellExecute(Handle, 'OPEN', PChar(sFilename + '.xls'), nil, nil,
    sw_shownormal);
end;

procedure TfrmReservationProfile.btnRoomsRefreshClick(Sender: TObject);
begin
  Display_rGrid(zRoomReservation);
end;


// **************************************************************************
//
// ***************************************************************************

procedure TfrmReservationProfile.mnuThisreservationClick(Sender: TObject);
var
  iReservation: longInt;
begin
  iReservation := zReservation;
  ShowFinishedInvoices2(itPerReservation, '', iReservation);
  Display_rGrid(zRoomReservation);
end;

procedure TfrmReservationProfile.mnuThisRoomClick(Sender: TObject);
var
  iRoomreservation: longInt;
begin
  iRoomreservation := zRoomReservation;
  ShowFinishedInvoices2(itPerRoomRes, '', iRoomreservation);
  Display_rGrid(zRoomReservation);
end;

procedure TfrmReservationProfile.OpenthisRoom1Click(Sender: TObject);
begin
  try
    EditInvoice(zReservation, zRoomReservation, 0, 0, 0, 0, false, true, false);
  finally
    Display_rGrid(zRoomReservation);
  end;

end;

procedure TfrmReservationProfile.OpenGroupInvoice1Click(Sender: TObject);
begin
  try
    EditInvoice(zReservation, 0, 0, 0, 0, 0, false, true, false);
  finally
    Display_rGrid(zRoomReservation);
  end;
end;


// ***************************************************************************
//
//
//
// ***************************************************************************

procedure TfrmReservationProfile.mRoomsAfterScroll(DataSet: TDataSet);
var
  HiddenInfo: string;
  ChannelRequest: String;
begin
  if mainPage.ActivePage = RoomsTab then
  begin
    if NOT DataSet.Eof then
    begin
      zGuestName := DataSet['GuestName'];
      zRoomReservation := DataSet.fieldbyname('Roomreservation').asInteger;
      d.RR_GetMemoBothTextForRoom(zRoomReservation, HiddenInfo, ChannelRequest);
      gbxRoomInformation.caption := 'Notes for Room : ' + mRooms.fieldbyname('Room').asstring;
      memRoomNotes.Lines.text := HiddenInfo;
      memRequestFromChannel.Lines.text := ChannelRequest;
      SetLabNumbers;
    end;
  end;
end;

procedure TfrmReservationProfile.tvRoomsFocusedRecordChanged
  (Sender: TcxCustomGridTableView; APrevFocusedRecord, AFocusedRecord
  : TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
end;

// ****************************************************************************
//
//
//
// *****************************************************************************

procedure TfrmReservationProfile.mainPageChange(Sender: TObject);
begin
  if mainPage.ActivePage = RoomsTab then
  begin
    Display_rGrid(zRoomReservation);
  end
  else if mainPage.ActivePage = GuestsTab then
  begin
    getGuestData(zRoomReservation);
  end
  else if mainPage.ActivePage = InvoicesTab then
  begin
    getInvoiceData(zRoomReservation);
  end;
end;

procedure TfrmReservationProfile.mAllGuestsAfterScroll(DataSet: TDataSet);
var
  HiddenInfo: string;
  ChannelRequest: String;
begin
  if mainPage.ActivePage = GuestsTab then
  begin
    if lvAllGuests.GridView.Focused then
    begin
      zRoomReservation := DataSet.fieldbyname('Roomreservation').asInteger;
      d.RR_GetMemoBothTextForRoom(zRoomReservation, HiddenInfo, ChannelRequest);
      memRoomNotes.Lines.text := HiddenInfo;
      memRequestFromChannel.Lines.text := ChannelRequest;
      SetLabNumbers;
    end;
  end;
end;

procedure TfrmReservationProfile.memRoomNotesExit(Sender: TObject);
begin
  d.RR_Upd_MemoTexts(zRoomReservation, memRoomNotes.text);
end;



// ********************************************************************************
//
//
//
// *********************************************************************************

procedure TfrmReservationProfile.Display_rGrid(gotoRoomReservation: longInt);
var
  rSet: TRoomerDataSet;

  arrival: TDateTime;
  departure: TDateTime;
  iNights: Integer;
  status: string;
  statusText: string;
  defGuestCount: Integer;
  RoomType: string;
  package: string;

  accountTypeText: string;
  breakfastText: string;

  breakfastIncluted: Boolean;
  isGroupAccount: Boolean;
  unpaidRentPrice: double;

  Room: string;

  s: string;

  RoomClass: string;

  sPaymentdetails: string;
  sBreakfast: string;
  sStatus: string;
  packageRoomprice: double;
  packageItemPrice: double;
  PersonsProfilesId,
    iGuests: Integer;

  procedure PopulateRatePlanCombo;
  begin
    (tvRoomsratePlanCode.Properties AS TcxComboBoxProperties).Items.Clear;
    (tvRoomsratePlanCode.Properties AS TcxComboBoxProperties).Items.Add('');
    DynamicRates.GetAllRateCodes((tvRoomsratePlanCode.Properties AS TcxComboBoxProperties).Items);
  end;

  procedure InitDynamicRates;
  var
    arrival, departure: TDate;
    channelId: Integer;
    channelCode, chManCode: String;
  begin
    arrival := now + 2000;
    departure := 0;

    mRooms.First;
    while NOT mRooms.Eof do
    begin
      if mRooms['Arrival'] < arrival then
        arrival := mRooms['Arrival'];
      if mRooms['Departure'] > departure then
        departure := mRooms['Departure'];
      mRooms.Next;
    end;

    mRooms.First;
    channelId := mRooms['ManualChannelId'];
    chManCode := channelManager_GetDefaultCode;
    if glb.LocateSpecificRecordAndGetValue('channels', 'id', channelId, 'channelManagerId', channelCode) then
    begin
      DynamicRates.Prepare(arrival, departure, channelCode, chManCode);
      PopulateRatePlanCombo;
    end;

  end;

begin
  screen.Cursor := crHourGlass;
  status := '';
  mRooms.AfterScroll := nil;
  mRooms.DisableControls;
  rSet := CreateNewDataSet;
  try

    s := s + ' SELECT '#10;
    s := s + '      Reservation '#10;
    s := s + '    , RoomReservation '#10;
    s := s + '    , Room '#10;
    s := s + '    , RoomType '#10;
    s := s + '    , package '#10;
    s := s + '    , rrArrival as Arrival'#10;
    s := s + '    , rrDeparture as Departure'#10;
    s := s + '    , ExpectedTimeOfArrival'#10;
    s := s + '    , ExpectedCheckoutTime'#10;
    s := s + '    , Status '#10;
    s := s + '    , Currency '#10;
    s := s + '    , invBreakfast as Breakfast '#10;
    s := s + '    , GroupAccount as isGroupAccount '#10;
    s := s + '    , rrIsNoRoom as isNoRoom '#10;
    s := s + '    , useStayTax '#10;
    s := s + '    , ratePlanCode '#10;
    s := s + '    , IF(ISNULL(ManualChannelId) OR ManualChannelId < 1, (SELECT channel FROM reservations WHERE reservations.Reservation=roomreservations.Reservation LIMIT 1), ManualChannelId) AS ManualChannelId '#10;
    s := s + '    , RoomClass '#10;
    s := s + '    , blockMove '#10;
    s := s + '    , rrRoomAlias as RoomAlias '#10;
    s := s + '    , rrRoomTypeAlias as RoomTypeAlias '#10;
    s := s + '    , (SELECT count(ID) FROM roomsdate WHERE (roomsdate.roomreservation=roomreservations.roomreservation) AND (roomsdate.ResFlag <> '
      + _db(STATUS_DELETED) + ' )) AS unPaidRentNights '#10;
    s := s + '    , (SELECT name FROM persons WHERE persons.roomreservation=roomreservations.roomreservation ORDER BY MainName DESC LIMIT 1) AS GuestName '#10;
    s := s + '    , (SELECT PersonsProfilesId FROM persons WHERE persons.roomreservation=roomreservations.roomreservation ORDER BY MainName DESC LIMIT 1) AS PersonsProfilesId '#10;
    s := s + '    , (SELECT count(ID) FROM persons WHERE persons.roomreservation=roomreservations.roomreservation) AS GuestCount '#10;
    s := s + '    , (SELECT SUM(RoomRate) FROM roomsdate WHERE (roomsdate.roomreservation=roomreservations.roomreservation) AND (roomsdate.paid=0) AND (roomsdate.ResFlag <> '
      + _db(STATUS_DELETED) + ' )) AS unPaidRoomRent '#10;
    s := s + '    , (SELECT SUM(IF(isPercentage, RoomRate*Discount/100, Discount)) FROM roomsdate WHERE (roomsdate.roomreservation=roomreservations.roomreservation) AND (roomsdate.paid=0) AND (roomsdate.ResFlag <> '
      + _db(STATUS_DELETED) + ' ))  AS DiscountUnPaidRoomRent '#10;
    s := s + '    , ((SELECT SUM(RoomRate) FROM roomsdate WHERE (roomsdate.roomreservation=roomreservations.roomreservation) AND (roomsdate.paid=0) and (roomsdate.ResFlag <> '
      + _db(STATUS_DELETED) + ' )) '#10;
    s := s + '       - (SELECT SUM(IF(isPercentage, RoomRate*Discount/100, Discount)) FROM roomsdate WHERE (roomsdate.roomreservation=roomreservations.roomreservation) AND (roomsdate.paid=0) AND (roomsdate.ResFlag <> '
      + _db(STATUS_DELETED) + ' ))) AS TotalUnpaidRoomRent '#10;
    s := s + '    , (SELECT Description FROM roomtypegroups WHERE roomtypegroups.code=roomreservations.roomclass) AS RoomClassDescription '#10;
    s := s + ' FROM '#10;
    s := s + '   roomreservations '#10;
    s := s + ' WHERE '#10;
    s := s + '   (Reservation = %d) '#10;
    s := s + ' ORDER BY '#10;
    s := s + '  Room ';

    s := format(s, [zReservation]);

    hData.rSet_bySQL(rSet, s);

    if mRooms.Active then
      mRooms.Close;
    mRooms.Open;

    mRooms.LoadFromDataSet(rSet);
    InitDynamicRates;
    mRooms.First;

    sPaymentdetails := '';
    sBreakfast := '';
    sStatus := '';

    while not mRooms.Eof do
    begin
      Room := mRooms.fieldbyname('Room').asstring;
      departure := mRooms.fieldbyname('departure').AsDateTime;
      arrival := mRooms.fieldbyname('arrival').AsDateTime;
      iGuests := mRooms.fieldbyname('GuestCount').asInteger;
      iNights := trunc(departure) - trunc(arrival);
      status := mRooms.fieldbyname('status').asstring;
      RoomType := mRooms.fieldbyname('RoomType').asstring;
      package := mRooms.fieldbyname('package').asstring;
      RoomClass := mRooms.fieldbyname('RoomClass').asstring;
      breakfastIncluted := mRooms['breakfast'];
      isGroupAccount := mRooms['isGroupAccount'];
      PersonsProfilesId := mRooms['PersonsProfilesId'];
      sPaymentdetails := sPaymentdetails + _GLOB._Bool2Str(isGroupAccount, 0);

      statusText := _StatusToText(status);
      sStatus := sStatus + status;

      defGuestCount := glb.GET_RoomTypeNumberGuests_byRoomType(RoomType);
      accountTypeText := _AccountTypeToText(isGroupAccount);
      breakfastText := _BreakfastToText(breakfastIncluted);
      sBreakfast := sBreakfast + _GLOB._Bool2Str(breakfastIncluted, 0);

      Package_getRoomPrice(package, iNights, iGuests, packageRoomprice, packageItemPrice);

      unpaidRentPrice := 0.00;
      if mRooms.fieldbyname('unPaidRentNights').asInteger <> 0 then
      begin
        unpaidRentPrice := mRooms.fieldbyname('unPaidRoomRent').AsFloat / mRooms.fieldbyname('unPaidRentNights')
          .asInteger;
      end;

      mRooms.Edit;

      mRooms.fieldbyname('dayCount').asInteger := iNights;
      mRooms.fieldbyname('statusText').asstring := statusText;
      mRooms.fieldbyname('defGuestCount').asInteger := defGuestCount;
      mRooms.fieldbyname('BreakfastText').asstring := breakfastText;
      mRooms.fieldbyname('accountTypeText').asstring := accountTypeText;
      mRooms.fieldbyname('unpaidRentPrice').AsFloat := unpaidRentPrice;
      mRooms.fieldbyname('RoomClass').asstring := RoomClass;
      mRooms.fieldbyname('PersonsProfilesId').asInteger := PersonsProfilesId;

      if OutOfOrderBlocking then
        mRooms.fieldbyname('GuestName').asstring := edtName.text;

      mRooms.Post;
      mRooms.Next;
    end;

    SetStatusItemindex(sStatus);
    SetBreakfastItemindex(sBreakfast);
    SetPaymentDetailItemindex(sPaymentdetails);

  finally
    mRooms.Locate('RoomReservation', gotoRoomReservation, []);
    mRooms.AfterScroll := mRoomsAfterScroll;
    mRooms.EnableControls;
    FreeAndNil(rSet);
    screen.Cursor := crDefault;
  end;
end;

procedure TfrmReservationProfile.tvRoomsaccountTypeTextPropertiesChange
  (Sender: TObject);
var
  aBool: Boolean;
  Value: string;
begin
  if mRoomsDS.State = dsEdit then
  begin
    mRooms.Post;
  end;
  Value := mRooms.fieldbyname('AccountTypeText').asstring;
  aBool := pos('Group', Value) = 1;
  d.UpdateGroupAccountOne(zReservation, zRoomReservation, zRoomReservation, aBool);
  SetPaymentDetailItemindex('');
end;

procedure TfrmReservationProfile.tvRoomsGuestCountPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
var
  theData: recPersonHolder;
  s: string;
begin
  if mRoomsDS.State = dsEdit then
  begin
    mRooms.Post;
  end;

  s := mRooms.fieldbyname('Guestname').asstring;
  initPersonHolder(theData);
  theData.reservation := mRooms.fieldbyname('reservation').asInteger;
  theData.roomReservation := mRooms.fieldbyname('RoomReservation').asInteger;
  theData.name := s;

  if openGuestProfile(actNone, theData) then
  begin
  end;

  screen.Cursor := crHourGlass;
  mRooms.DisableControls;
  try
    mRooms.Edit;
    mRooms.fieldbyname('GuestName').asstring :=
      d.RR_GetFirstGuestName(mRooms.fieldbyname('RoomReservation').asInteger);
    mRooms.fieldbyname('GuestCount').asInteger :=
      d.RR_GetGuestCount(zRoomReservation);
    mRooms.Post;
    Display_rGrid(mRooms.fieldbyname('RoomReservation').asInteger);
  finally
    screen.Cursor := crDefault;
    mRooms.EnableControls;
  end;
end;

procedure TfrmReservationProfile.tvRoomsGuestNamePropertiesValidate
  (Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);
begin
  if mRoomsDS.State = dsEdit then
  begin
    mRooms.Post;
  end;
  if zGuestName <> DisplayValue then
  begin
    d.RR_Upd_FirstGuestName(mRooms['RoomReservation'], DisplayValue);
    zGuestName := DisplayValue;
  end;
end;

procedure TfrmReservationProfile.tvRoomsInitEdit(Sender: TcxCustomGridTableView;
  AItem: TcxCustomGridTableItem; AEdit: TcxCustomEdit);
begin
  If AEdit is TcxComboBox then
    TcxComboBox(AEdit).Properties.UseMouseWheel := false;

end;

procedure TfrmReservationProfile.tvRoomsPackagePropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
var
  theData: recPackageHolder;
  oldPackage: String;
  rSet: TRoomerDataSet;
  rate: double;

  rr, rrAlias: Integer;

  procedure RemovePackage(oldPackage: String; rr, rrAlias: Integer; restorePrice: Boolean);
  begin
    d.roomerMainDataSet.SystempackagesRemove(oldPackage, rr, rrAlias, restorePrice);
    mRooms.Edit;
    mRooms.fieldbyname('Package').asstring := '';
    mRooms.Post;
  end;

begin
  initPackageHolder(theData);
  theData.package := mRooms.fieldbyname('Package').asstring;

  if AButtonIndex = 0 then
  begin

    oldPackage := theData.package;
    if (oldPackage <> '') AND
      (MessageDlg(GetTranslatedText('shTx_RoomResProfile_PackageAlreadyExists_Remove'), mtConfirmation,
      [mbYes, mbCancel], 0) = mrCancel) then
      exit;

    if openPackages(actLookup, theData) then
    begin
      if theData.package <> '' then
      begin
        rr := zRoomReservation;
        rrAlias := rr;
        if mRooms.fieldbyname('isGroupAccount').AsBoolean = true then
          rr := 0;

        rate := mRooms.fieldbyname('unpaidRentPrice').AsFloat;
        if oldPackage <> '' then
        begin

          RemovePackage(oldPackage, rr, rrAlias, true);

          rSet := CreateNewDataSet;
          try
            hData.rSet_bySQL(rSet, 'SELECT AvrageRate FROM roomreservations WHERE RoomReservation=' +
              inttostr(zRoomReservation));
            rSet.First;
            if not rSet.Eof then
              rate := rSet['AvrageRate'];
          finally
            rSet.free;
          end;
        end;

        d.roomerMainDataSet.SystempackagesAdd(theData.package, rr, rrAlias, rate, mRooms['Currency']);
        mRooms.Edit;
        mRooms.fieldbyname('Package').asstring := theData.package;
        mRooms.fieldbyname('unpaidRentPrice').AsFloat := rate;
        mRooms.Post;
      end;
    end;

  end
  else
  begin
    rr := zRoomReservation;
    rrAlias := rr;
    if mRooms.fieldbyname('isGroupAccount').AsBoolean = true then
      rr := 0;

    if theData.package <> '' then
      RemovePackage(theData.package, rr, rrAlias, true);
  end;

  Display_rGrid(zRoomReservation);

end;

procedure TfrmReservationProfile.tvRoomsPersonsProfilesIdPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
var
  iGoto: Integer;
  s,
    s1, s2, s3: String;
begin
  if AButtonIndex = 0 then
  begin
    iGoto := -1;
    if mRooms['PersonsProfilesId'] > 0 then
      iGoto := mRooms['PersonsProfilesId'];

    iGoto := GuestProfiles(actLookup, iGoto);
    if iGoto > 0 then
    begin
      mRooms.Edit;

      mRooms['PersonsProfilesId'] := iGoto;

      glb.LocateSpecificRecordAndGetValue('personprofiles', 'ID', inttostr(iGoto), 'Firstname', s1);
      glb.LocateSpecificRecordAndGetValue('personprofiles', 'ID', inttostr(iGoto), 'Lastname', s2);
      s3 := trim(s1 + ' ' + s2);
      mRooms['guestname'] := s3;

      mRooms.Post;

      s := format('UPDATE persons pe, ' +
        'personprofiles pp ' +
        'SET PersonsProfilesId=pp.Id, ' +
        'pe.title = pp.title, ' +
        'pe.Name = TRIM(CONCAT(pp.FirstName, '' '', pp.LastName)), ' +
        'pe.Address1 = pp.Address1, ' +
        'pe.Address2 = pp.Address2, ' +
        'pe.Address3 = pp.Zip, ' +
        'pe.Address4 = pp.City, ' +
        'pe.Country = pp.Country, ' +
        'pe.Tel1 = pp.TelLandLine, ' +
        'pe.Tel2 = pp.TelMobile, ' +
        'pe.Fax = pp.TelFax, ' +
        'pe.Email = pp.Email, ' +
        'pe.Information = pp.Information, ' +
        'pe.Nationality = pp.Nationality, ' +
        'pe.Customer = pp.CustomerCode, ' +
        'pe.Surname = pp.CompanyName, ' +
        'pe.CompanyName = pp.CompanyName, ' +
        'pe.CompAddress1 = pp.CompAddress1, ' +
        'pe.CompAddress2 = pp.CompAddress2, ' +
        'pe.CompZip = pp.CompZip, ' +
        'pe.CompCity = pp.CompCity, ' +
        'pe.CompCountry = pp.CompCountry, ' +
        'pe.CompTel = pp.CompTel, ' +
        'pe.CompEmail = pp.CompEmail, ' +
        'pe.state = pp.state, ' +
        'pe.DateOfBirth = pp.DateOfBirth ' +
        'WHERE pp.Id=%d AND ' +
        'pe.MainName=1 AND pe.Reservation=%d AND pe.RoomReservation=%d',
        [
        iGoto,
        mRooms.fieldbyname('reservation').asInteger,
        mRooms.fieldbyname('RoomReservation').asInteger
        ]);
      d.roomerMainDataSet.DoCommand(s);
    end;
  end
  else

    if AButtonIndex = 1 then
  begin
    if mRooms['PersonsProfilesId'] > 0 then
      iGoto := mRooms['PersonsProfilesId']
    else
      exit;
    if OpenGuestPortfolioEdit(glb.PersonProfiles, iGoto, false) then
    begin
      mRooms.Edit;
      if iGoto > 0 then
      begin
        mRooms['PersonsProfilesId'] := iGoto;
        glb.LocateSpecificRecordAndGetValue('personprofiles', 'ID', inttostr(iGoto), 'Firstname', s1);
        glb.LocateSpecificRecordAndGetValue('personprofiles', 'ID', inttostr(iGoto), 'Lastname', s2);
        s3 := trim(s1 + ' ' + s2);
        mRooms['guestname'] := s3;
      end
      else
        mRooms['PersonsProfilesId'] := 0;
      mRooms.Post;
    end;
  end;

end;

procedure TfrmReservationProfile.tvRoomsratePlanCodePropertiesCloseUp(Sender: TObject);
var
  code: String;
  rate: double;
begin
  if NOT mRooms.Eof then
  begin
    code := (tvRoomsratePlanCode.Properties AS TcxComboBoxProperties).Items[TcxComboBox(Sender).ItemIndex];
    rate := DynamicRates.AverageRateStay(code, mRooms['RoomType'], mRooms['Arrival'], mRooms['Departure']);
    mRooms.Edit;
    mRooms['ratePlanCode'] := code;
    mRooms['unpaidRentPrice'] := rate;
    mRooms.Post;

    DynamicRates.UpdateRoomReservation(mRooms['RoomReservation'], code, mRooms['RoomType'], mRooms['Arrival'],
      mRooms['Departure']);
  end;
end;

procedure TfrmReservationProfile.tvRoomsRoomTypePropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
var
  s: String;
begin
  if copy(mRooms.fieldbyname('room').asstring, 1, 1) = '<' then
  begin
    s := changeNoRoomRoomtypeReturnSelection(zReservation, zRoomReservation,
      trim(mRooms.fieldbyname('roomtype').asstring));
    if s <> '' then
    begin
      mRooms.Edit;
      mRooms['RoomType'] := s;
      mRooms.Post;
    end;
  end;
end;

procedure TfrmReservationProfile.tvRoomsStatusTextPropertiesChange
  (Sender: TObject);
var
  sTmp: string;
  iTMP: Integer;
begin
  if mRoomsDS.State = dsEdit then
  begin
    mRooms.Post;
  end;
  sTmp := _IndexToStatus(TcxComboBox(Sender).ItemIndex, true);

  d.UpdateStatusSimple(zReservation, zRoomReservation, sTmp);
  frmMain.refreshGrid;

  if cbxStatus.ItemIndex <> 0 then
  begin
    iTMP := StatusToItemindex(sTmp);
    if cbxStatus.ItemIndex <> iTMP then
    begin
      cbxStatus.ItemIndex := 0;
    end;
    cbxStatus.Update;
    cbxStatus.Invalidate;
    Application.ProcessMessages;
  end
  else
  begin
    SetStatusItemindex('');
  end;
end;

procedure TfrmReservationProfile.tvRoomsblockMovePropertiesChange(Sender: TObject);
var
  Value: Integer;
  iRoomRes: Integer;
  sTmp: string;
begin
  if mRoomsDS.State = dsEdit then
    mRooms.Post;

  iRoomRes := mRooms.fieldbyname('RoomReservation').asInteger;
  Value := 0;
  if mRooms.fieldbyname('blockMove').AsBoolean then
    Value := 1;
  sTmp := format('UPDATE roomreservations SET blockMove=%d WHERE RoomReservation=%d', [Value, iRoomRes]);
  cmd_bySQL(sTmp);
end;

procedure TfrmReservationProfile.tvRoomsbreakfastTextPropertiesChange
  (Sender: TObject);
var
  aBool: Boolean;
  Value: string;
begin
  if mRoomsDS.State = dsEdit then
  begin
    mRooms.Post;
  end;
  Value := mRooms.fieldbyname('BreakfastText').asstring;
  aBool := pos('Not', Value) = 0;
  d.UpdateBreakfastIncluted(zReservation, zRoomReservation, aBool);

  SetBreakfastItemindex('');
end;

procedure TfrmReservationProfile.tvRoomsCellDblClick
  (Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
var
  reservation: longInt;
  roomReservation: longInt;
  fieldName: string;
  s: string;
  theData: recPersonHolder;

begin
  roomReservation := mRooms.fieldbyname('roomReservation').asInteger;
  reservation := mRooms.fieldbyname('Reservation').asInteger;
  fieldName := _trimlower(ACellViewInfo.Item.caption);

  if (fieldName = 'guests') then
  begin
    //
    if mRoomsDS.State = dsEdit then
    begin
      mRooms.Post;
    end;

    s := mRooms.fieldbyname('Guestname').asstring;
    initPersonHolder(theData);
    theData.reservation := reservation;
    theData.roomReservation := roomReservation;
    theData.name := s;

    if openGuestProfile(actNone, theData) then
    begin
    end;

    screen.Cursor := crHourGlass;
    mRooms.DisableControls;
    try
      mRooms.Edit;
      mRooms.fieldbyname('GuestName').asstring :=
        d.RR_GetFirstGuestName(roomReservation);
      mRooms.fieldbyname('GuestCount').asInteger :=
        d.RR_GetGuestCount(zRoomReservation);
      mRooms.Post;
      Display_rGrid(roomReservation);
    finally
      screen.Cursor := crDefault;
      mRooms.EnableControls;
    end;
  end;
end;

procedure TfrmReservationProfile.tvRoomsColumn1PropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
begin
  StaticResources('Room Resources',
    format(ROOM_BOOKING_STATIC_RESOURCES, [inttostr(mRooms['RoomReservation'])]),
    ACCESS_RESTRICTED);
end;

procedure TfrmReservationProfile.doRRDateChange(startIn: Integer);
var
  arrival: TDate;
  departure: TDate;

  iNights: Integer;

  roomReservation: Integer;
  reservation: Integer;
  Room: string;
  RoomType: String;

  temp: String;
begin
  roomReservation := mRooms.fieldbyname('roomReservation').asInteger;
  reservation := mRooms.fieldbyname('Reservation').asInteger;
  Room := mRooms.fieldbyname('Room').asstring;
  RoomType := mRooms.fieldbyname('RoomType').asstring;

  if mRoomsDS.State = dsEdit then
  begin
    mRooms.Post;
  end;

  arrival := mRooms.fieldbyname('arrival').AsDateTime;
  departure := mRooms.fieldbyname('departure').AsDateTime;

  temp := format
    ('(doRRDateChange 1) Availability made dirty for Reservation=%d, RoomReservation=%d, Room=%s, RoomType=%s, FOR ArrDate=%s, DepDate=%s',
    [reservation, roomReservation, Room, RoomType, DateToSqlString(arrival), DateToSqlString(departure)]);
  d.roomerMainDataSet.SystemMakeAvailabilityDirtyFromRoomReservation(roomReservation, temp);

  g.openResDates(reservation, roomReservation, Room, arrival, departure, startIn);

  iNights := trunc(departure) - trunc(arrival);

  mRooms.Edit;
  mRooms.fieldbyname('arrival').AsDateTime := arrival;
  mRooms.fieldbyname('departure').AsDateTime := departure;
  mRooms.fieldbyname('dayCount').asInteger := iNights;
  mRooms.Post;

  temp := format
    ('(doRRDateChange 2) Availability made dirty for Reservation=%d, RoomReservation=%d, Room=%s, RoomType=%s, FOR ArrDate=%s, DepDate=%s',
    [reservation, roomReservation, Room, RoomType, DateToSqlString(arrival), DateToSqlString(departure)]);
  d.roomerMainDataSet.SystemMakeAvailabilityDirtyFromRoomReservation(roomReservation, temp);
end;

procedure TfrmReservationProfile.DropComboTarget1DragOver(Sender: TObject; ShiftState: TShiftState; APoint: TPoint;
  var Effect: Integer);
begin
  Effect := DROPEFFECT_COPY;
end;

procedure TfrmReservationProfile.DropComboTarget1Drop(Sender: TObject; ShiftState: TShiftState; APoint: TPoint;
  var Effect: Integer);
begin
  Effect := DROPEFFECT_COPY;
  DropComboTargetDrop(format(BOOKING_STATIC_RESOURCES, [inttostr(zReservation)]), ACCESS_RESTRICTED,
    Sender AS TDropComboTarget, ShiftState, APoint, Effect);
  timBlink.Tag := 0;
  timBlink.enabled := false;
  timBlink.Interval := 100;
  timBlink.enabled := true;
end;

procedure TfrmReservationProfile.DropComboTarget1GetDropEffect(Sender: TObject; ShiftState: TShiftState; APoint: TPoint;
  var Effect: Integer);
begin
  Effect := DROPEFFECT_COPY;
end;

procedure TfrmReservationProfile.tvRoomsArrivalPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
begin
  doRRDateChange(1); // Arrival
  Display_rGrid(zRoomReservation);
end;

procedure TfrmReservationProfile.tvRoomsDeparturePropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
begin
  doRRDateChange(2); // Departure
  Display_rGrid(zRoomReservation);
end;

procedure TfrmReservationProfile.tvRoomsdayCountPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
begin
  doRRDateChange(3); // Dates
  Display_rGrid(zRoomReservation);
end;

procedure TfrmReservationProfile.
  tvRoomsTcxGridDBDataControllerTcxDataSummaryFooterSummaryItems9GetText
  (Sender: TcxDataSummaryItem; const AValue: Variant; AIsFooter: Boolean;
  var AText: string);
var
  price: double;
  Nights: Integer;
  r: double;
begin
  Nights := 0;
  price := 0.00;
  if tvRooms.DataController.Summary.FooterSummaryValues[8] <> null then
  begin
    Nights := tvRooms.DataController.Summary.FooterSummaryValues[8];
  end;
  if tvRooms.DataController.Summary.FooterSummaryValues[6] <> null then
  begin
    price := tvRooms.DataController.Summary.FooterSummaryValues[6];
  end;

  r := 0.00;
  if Nights <> 0 then
  begin
    r := price / Nights;
  end;

  AText := FormatFloat('#,##0.# per/night', r);
end;

procedure TfrmReservationProfile.tvRoomsunpaidRentPricePropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
begin
  if AButtonIndex = 0 then
  begin
    ShowRatesForRoomReservation(zRoomReservation);
  end;
end;

procedure TfrmReservationProfile.tvRoomsUpdateEdit
  (Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem;
  AEdit: TcxCustomEdit);
begin
end;

// ***************************************************************************
//
// Guests Grid
//
// ***************************************************************************

Function TfrmReservationProfile.guestRoomsSQL(reservation: longInt): string;
begin
  result := format(select_ReservationProfile_guestRoomsSQL, [zReservation]);
end;

Function TfrmReservationProfile.guestsSQL(reservation: longInt): string;
begin
  result := format(select_ReservationProfile_guestsSQL, [zReservation]);
end;

function TfrmReservationProfile.allGuestsSQL(reservation: longInt): string;
begin
  result := format(select_ReservationProfile_allGuestsSQL, [zReservation]);
end;

Function TfrmReservationProfile.InvoiceSQL(reservation: longInt): string;
var
  Sql: string;
begin
  Sql :=
    '   SELECT ' +
    '     invoiceheads.Reservation ' +
    '   , invoiceheads.RoomReservation ' +
    '   , invoiceheads.SplitNumber ' +
    '   , invoiceheads.InvoiceNumber ' +
    '   , invoiceheads.Customer ' +
    '   , invoiceheads.Name As NameOnInvoice' +
    '   , invoiceheads.Address1 ' +
    '   , invoiceheads.Address2 ' +
    '   , invoiceheads.Address3 ' +
    '   , invoiceheads.Total as ihAmountWithTax ' +
    '   , invoiceheads.TotalWOVAT as ihAmountNoTax ' +
    '   , invoiceheads.TotalVAT as ihAmountTax ' +
    '   , invoiceheads.CreditInvoice ' +
    '   , invoiceheads.OriginalInvoice ' +
    '   , invoiceheads.RoomGuest ' +
    '   , invoiceheads.ihInvoiceDate as InvoiceDate' +
    '   , invoiceheads.ihPayDate as dueDate' +
    '   , invoiceheads.invRefrence ' +
    '   , invoicelines.PurchaseDate ' +
    '   , invoicelines.ItemID as Item' +
    '   , invoicelines.Number as Quantity' +
    '   , invoicelines.Description ' +
    '   , invoicelines.Price ' +
    '   , invoicelines.VATType ' +
    '   , invoicelines.Total AS ilAmountWithTax ' +
    '   , invoicelines.TotalWOVat AS ilAmountNoTax ' +
    '   , invoicelines.Vat as ilAmountTax' +
    '   , invoicelines.Currency ' +
    '   , invoicelines.CurrencyRate ' +
    '   , invoicelines.ImportRefrence ' +
    '   , invoicelines.ImportSource ' +
    ' FROM ' +
    '  invoicelines ' +
    '     INNER JOIN invoiceheads ON invoicelines.InvoiceNumber = invoiceheads.InvoiceNumber ' +
    ' WHERE ' +
    '  (invoiceheads.InvoiceNumber > 0) ' +
    ' AND (invoiceheads.Reservation =%d) ' + // zReservation
    ' ORDER BY ' +
    '  invoiceheads.InvoiceNumber ';

  result := format(Sql, [zReservation]);
end;

function TfrmReservationProfile.getGuestData(gotoRoomReservation
  : longInt): Boolean;
var
  rSet: TRoomerDataSet;
  s: string;

  status: string;
  statusText: string;

  mainGuest: string;
  guestCount: Integer;

  roomReservation: longInt;

begin
  rSet := CreateNewDataSet;
  try

    rSet.CommandType := cmdText;

    mGuestRooms.DisableControls;
    screen.Cursor := crHourGlass;
    try
      s := guestRoomsSQL(zReservation);
      hData.rSet_bySQL(rSet, s);

      if mGuestRooms.Active then
        mGuestRooms.Close;
      mGuestRooms.Open;

      mGuestRooms.LoadFromDataSet(rSet);

      mGuestRooms.First;
      while not mGuestRooms.Eof do
      begin
        roomReservation := mGuestRooms.fieldbyname('roomReservation').asInteger;

        status := mGuestRooms.fieldbyname('status').asstring;
        statusText := _StatusToText(status);

        mainGuest := d.RR_GetFirstGuestName(roomReservation);
        guestCount := d.RR_GetGuestCount(roomReservation);

        mGuestRooms.Edit;
        mGuestRooms.fieldbyname('statusText').asstring := statusText;
        mGuestRooms.fieldbyname('mainGuest').asstring := mainGuest;
        mGuestRooms.fieldbyname('GuestCount').asInteger := guestCount;
        mGuestRooms.Post;
        mGuestRooms.Next;
      end;

      if not mGuestRooms.Locate('RoomReservation', gotoRoomReservation, []) then
      begin
      end;

    finally
      screen.Cursor := crDefault;
      mGuestRooms.EnableControls;
    end;
  finally
    FreeAndNil(rSet);
  end;

  rSet := CreateNewDataSet;
  try

    rSet.CommandType := cmdText;

    mGuests.DisableControls;
    screen.Cursor := crHourGlass;
    try
      if rSet.Active then
        rSet.Close;
      s := guestsSQL(zReservation);
      hData.rSet_bySQL(rSet, s);
      if mGuests.Active then
        mGuests.Close;
      mGuests.Open;

      mGuests.LoadFromDataSet(rSet);

      mGuests.First;
      while not mGuests.Eof do
      begin
        mGuests.Next;
      end;
    finally
      screen.Cursor := crDefault;
      mGuests.EnableControls;
    end;
  finally
    FreeAndNil(rSet);
  end;

  rSet := CreateNewDataSet;
  try

    rSet.CommandType := cmdText;

    mAllGuests.DisableControls;
    screen.Cursor := crHourGlass;
    try
      if rSet.Active then
        rSet.Close;
      s := allGuestsSQL(zReservation);
      hData.rSet_bySQL(rSet, s);

      mAllGuests.AfterScroll := nil;
      try
        if mAllGuests.Active then
          mAllGuests.Close;
        mAllGuests.Open;

        mAllGuests.LoadFromDataSet(rSet);
        mAllGuests.First;
        while not mAllGuests.Eof do
        begin
          status := mAllGuests.fieldbyname('status').asstring;
          statusText := _StatusToText(status);

          mAllGuests.Edit;
          mAllGuests.fieldbyname('statusText').asstring := statusText;
          mAllGuests.Post;

          mAllGuests.Next;
        end;
        mAllGuests.Locate('RoomReservation', gotoRoomReservation, []);
        mAllGuestsAfterScroll(mAllGuests);
        result := true;
      finally
        mAllGuests.AfterScroll := mAllGuestsAfterScroll;
      end;
    finally
      screen.Cursor := crDefault;
      mAllGuests.EnableControls;
    end;
  finally
    FreeAndNil(rSet);
  end;
end;

function TfrmReservationProfile.getInvoiceData(gotoRoomReservation: Integer): Boolean;
var
  rSet: TRoomerDataSet;
  s: string;
  InvoiceNumber: longInt;
  SplitNumber: Integer;
  InvoiceDate: TDate;
  dueDate: TDate;
  reservation: longInt;
  roomReservation: longInt;
  Customer: string;
  NameOnInvoice: string;
  Address1: string;
  Address2: string;
  Address3: string;
  ihAmountWithTax: double;
  ihAmountNoTax: double;
  ihAmountTax: double;
  CreditInvoice: Integer;
  OriginalInvoice: Integer;
  RoomGuest: string;
  invRefrence: string;

  Item: string;
  Quantity: double; // -96
  description: string;
  price: double;
  VATType: String;
  ilAmountWithTax: double;
  ilAmountNoTax: double;
  ilAmountTax: double;
  Currency: string;
  CurrencyRate: double;
  ImportRefrence: string;
  ImportSource: string;

  lastInvoiceNumber: longInt;

  PayTypes: string;
  payTypeDescription: string;
  PayGroups: string;
  PayGroupDescription: string;

begin
  result := false;
  rSet := CreateNewDataSet;
  try

    rSet.CommandType := cmdText;

    mInvoiceHeads.DisableControls;
    mInvoiceLines.DisableControls;
    screen.Cursor := crHourGlass;
    try
      s := InvoiceSQL(zReservation);
      hData.rSet_bySQL(rSet, s);

      mInvoiceHeads.Close;
      mInvoiceHeads.Open;

      mInvoiceLines.Close;
      mInvoiceLines.Open;

      lastInvoiceNumber := -1;

      rSet.First;
      while not rSet.Eof do
      begin
        InvoiceNumber := rSet.fieldbyname('InvoiceNumber').asInteger;

        if InvoiceNumber <> lastInvoiceNumber then
        begin
          lastInvoiceNumber := InvoiceNumber;

          SplitNumber := rSet.fieldbyname('SplitNumber').asInteger;
          InvoiceDate := rSet.fieldbyname('InvoiceDate').AsDateTime;
          dueDate := rSet.fieldbyname('dueDate').AsDateTime;
          reservation := rSet.fieldbyname('Reservation').asInteger;
          roomReservation := rSet.fieldbyname('RoomReservation').asInteger;
          Customer := rSet.fieldbyname('Customer').asstring;
          NameOnInvoice := rSet.fieldbyname('NameOnInvoice').asstring;
          Address1 := rSet.fieldbyname('Address1').asstring;
          Address2 := rSet.fieldbyname('Address2').asstring;
          Address3 := rSet.fieldbyname('Address3').asstring;
          ihAmountWithTax := LocalFloatValue(rSet.fieldbyname('ihAmountWithTax').asstring);
          ihAmountNoTax := LocalFloatValue(rSet.fieldbyname('ihAmountNoTax').asstring);
          ihAmountTax := LocalFloatValue(rSet.fieldbyname('ihAmountTax').asstring);
          CreditInvoice := rSet.fieldbyname('CreditInvoice').asInteger;
          OriginalInvoice := rSet.fieldbyname('OriginalInvoice').asInteger;
          RoomGuest := rSet.fieldbyname('RoomGuest').asstring;
          invRefrence := rSet.fieldbyname('invRefrence').asstring;

          d.IH_getPaymentsTypes(InvoiceNumber, PayTypes, payTypeDescription,
            PayGroups, PayGroupDescription

            );

          mInvoiceHeads.Insert;
          mInvoiceHeads.fieldbyname('InvoiceNumber').asInteger := InvoiceNumber;
          mInvoiceHeads.fieldbyname('SplitNumber').asInteger := SplitNumber;
          mInvoiceHeads.fieldbyname('InvoiceDate').AsDateTime := InvoiceDate;
          mInvoiceHeads.fieldbyname('dueDate').AsDateTime := dueDate;
          mInvoiceHeads.fieldbyname('Reservation').asInteger := reservation;
          mInvoiceHeads.fieldbyname('RoomReservation').asInteger := roomReservation;
          mInvoiceHeads.fieldbyname('Customer').asstring := Customer;
          mInvoiceHeads.fieldbyname('NameOnInvoice').asstring := NameOnInvoice;
          mInvoiceHeads.fieldbyname('Address1').asstring := Address1;
          mInvoiceHeads.fieldbyname('Address2').asstring := Address2;
          mInvoiceHeads.fieldbyname('Address3').asstring := Address3;
          mInvoiceHeads.fieldbyname('AmountWithTax').AsFloat := ihAmountWithTax;
          mInvoiceHeads.fieldbyname('AmountNoTax').AsFloat := ihAmountNoTax;
          mInvoiceHeads.fieldbyname('AmountTax').AsFloat := ihAmountTax;
          mInvoiceHeads.fieldbyname('CreditInvoice').asInteger := CreditInvoice;
          mInvoiceHeads.fieldbyname('OriginalInvoice').asInteger := OriginalInvoice;
          mInvoiceHeads.fieldbyname('RoomGuest').asstring := RoomGuest;
          mInvoiceHeads.fieldbyname('invRefrence').asstring := invRefrence;
          mInvoiceHeads.fieldbyname('PayTypes').asstring := PayTypes;
          mInvoiceHeads.fieldbyname('PayTypeDescription').asstring := payTypeDescription;
          mInvoiceHeads.fieldbyname('payGroups').asstring := PayGroups;
          mInvoiceHeads.fieldbyname('payGroupDescription').asstring := PayGroupDescription;
          mInvoiceHeads.fieldbyname('room').asstring := RR_GetRoomNumber(roomReservation);
          mInvoiceHeads.Post;
        end;

        Item := rSet.fieldbyname('Item').asstring;
        Quantity := rSet.fieldbyname('Quantity').AsFloat; // -96
        description := rSet.fieldbyname('Description').asstring;
        price := LocalFloatValue(rSet.fieldbyname('Price').asstring);
        VATType := rSet.fieldbyname('VATType').asstring;
        ilAmountWithTax := LocalFloatValue(rSet.fieldbyname('ilAmountWithTax').asstring);
        ilAmountNoTax := LocalFloatValue(rSet.fieldbyname('ilAmountNoTax').asstring);
        ilAmountTax := LocalFloatValue(rSet.fieldbyname('ilAmountTax').asstring);
        Currency := rSet.fieldbyname('Currency').asstring;
        CurrencyRate := LocalFloatValue(rSet.fieldbyname('CurrencyRate').asstring);
        ImportRefrence := rSet.fieldbyname('ImportRefrence').asstring;
        ImportSource := rSet.fieldbyname('ImportSource').asstring;

        mInvoiceLines.Insert;
        mInvoiceLines.fieldbyname('InvoiceNumber').asInteger := InvoiceNumber;
        mInvoiceLines.fieldbyname('Item').asstring := Item;
        mInvoiceLines.fieldbyname('Quantity').AsFloat := Quantity;
        mInvoiceLines.fieldbyname('Description').asstring := description;
        mInvoiceLines.fieldbyname('Price').AsFloat := price;
        mInvoiceLines.fieldbyname('VATType').asstring := VATType;
        mInvoiceLines.fieldbyname('AmountWithTax').AsFloat := ilAmountWithTax;
        mInvoiceLines.fieldbyname('AmountNoTax').AsFloat := ilAmountNoTax;
        mInvoiceLines.fieldbyname('AmountTax').AsFloat := ilAmountTax;
        mInvoiceLines.fieldbyname('Currency').asstring := Currency;
        mInvoiceLines.fieldbyname('CurrencyRate').AsFloat := CurrencyRate;
        mInvoiceLines.fieldbyname('ImportRefrence').asstring := ImportRefrence;
        mInvoiceLines.fieldbyname('ImportSource').asstring := ImportSource;
        mInvoiceLines.Post;
        rSet.Next
      end;
    finally
      screen.Cursor := crDefault;
      mInvoiceHeads.EnableControls;
      mInvoiceLines.EnableControls;
    end;
  finally
    FreeAndNil(rSet);
  end;

end;

procedure TfrmReservationProfile.btnGuestsRefreshClick(Sender: TObject);
begin
  getGuestData(zRoomReservation);
end;

procedure TfrmReservationProfile.btnExpandClick(Sender: TObject);
begin
  tvGuestRooms.BeginUpdate();
  tvGuestRooms.ViewData.Expand(true);
  tvGuestRooms.EndUpdate;
end;

procedure TfrmReservationProfile.btnCollapseClick(Sender: TObject);
begin
  tvGuestRooms.BeginUpdate();
  tvGuestRooms.ViewData.Collapse(true);
  tvGuestRooms.EndUpdate;
end;

procedure TfrmReservationProfile.cxButton1Click(Sender: TObject);
begin
  getInvoiceData(zRoomReservation);
end;

procedure TfrmReservationProfile.btnInvoiceheadsExcelClick(Sender: TObject);
var
  sFilename: string;
  s: string;
begin
  tvInvoiceHeads.ViewData.Collapse(true);
  datetimeTostring(s, 'yyyymmddhhnn', now);
  sFilename := g.qProgramPath + s + '_ResInvoices';
  ExportGridToExcel(sFilename, Grid, false, true, true);
  ShellExecute(Handle, 'OPEN', PChar(sFilename + '.xls'), nil, nil,
    sw_shownormal);
end;

procedure TfrmReservationProfile.PageNotesChange(Sender: TObject);
var
  HiddenInfo: string;
  ChannelRequest: String;
begin
  d.RR_GetMemoBothTextForRoom(zRoomReservation, HiddenInfo, ChannelRequest);
  memRoomNotes.Lines.text := HiddenInfo;
  memRequestFromChannel.Lines.text := ChannelRequest;
end;

procedure TfrmReservationProfile.timBlinkTimer(Sender: TObject);
begin
  timBlink.enabled := false;
  timBlink.Tag := timBlink.Tag + 1;
  if timBlink.Tag < 7 then
  begin
    sButton1.SkinData.CustomColor := NOT(timBlink.Tag div 2 = timBlink.Tag / 2);
    if sButton1.SkinData.CustomColor then
    begin
      sButton1.SkinData.ColorTone := clRed;
      timBlink.Interval := 500;
    end
    else
    begin
      sButton1.SkinData.ColorTone := clNone;
      timBlink.Interval := 250;
    end;
    timBlink.enabled := true;
  end
  else
  begin
    sButton1.SkinData.ColorTone := clNone;
    sButton1.SkinData.CustomColor := false;
  end;
end;

procedure TfrmReservationProfile.timStartTimer(Sender: TObject);
begin
  pnlDataWait.Show;
  timStart.enabled := false;
  Display;
  enabled := true;

  ShowAlertsForReservation(zReservation, 0, atOPEN_RESERVATION);
  FrmAlertPanel := TFrmAlertPanel.Create(nil);
  AlertList := CreateAlertsForRoomReservation(zReservation, 0, atUNKNOWN);
  FrmAlertPanel.PlaceEditPanel(pnlAlertHolder, AlertList);
end;

procedure TfrmReservationProfile.tvAllGuestsCanFocusRecord
  (Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  var AAllow: Boolean);
var
  AValue: Variant;
  rr: longInt;
  HiddenInfo: string;
  ChannelRequest: String;
begin
  AValue := ARecord.Values[0];
  rr := AValue;
  if zInt <> rr then
  begin
    if mAllGuests.Locate('roomReservation', rr, []) then
    begin
      zRoomReservation := mAllGuests.fieldbyname('Roomreservation').asInteger;
      d.RR_GetMemoBothTextForRoom(zRoomReservation, HiddenInfo, ChannelRequest);
      memRoomNotes.Lines.text := HiddenInfo;
      memRequestFromChannel.Lines.text := ChannelRequest;
      SetLabNumbers;
    end;
  end;
  zInt := rr;
end;

procedure TfrmReservationProfile.tvGuestRoomsCanFocusRecord
  (Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  var AAllow: Boolean);
var
  AValue: Variant;
  rr: longInt;
  HiddenInfo: string;
  ChannelRequest: String;
begin
  AValue := ARecord.Values[0];
  rr := AValue;
  if rr <> zRoomReservation then
  begin
    zRoomReservation := rr;
    d.RR_GetMemoBothTextForRoom(zRoomReservation, HiddenInfo, ChannelRequest);
    memRoomNotes.Lines.text := HiddenInfo;
    memRequestFromChannel.Lines.text := ChannelRequest;
    SetLabNumbers;
  end;
end;

procedure TfrmReservationProfile.tvGuestsCanFocusRecord(Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  var AAllow: Boolean);
var
  AValue: Variant;
  rr: longInt;
  HiddenInfo: string;
  ChannelRequest: String;
begin
  AValue := ARecord.Values[2];
  rr := AValue;
  if rr <> zRoomReservation then
  begin
    if mGuests.Locate('roomReservation', rr, []) then
    begin
      zRoomReservation := rr;
      d.RR_GetMemoBothTextForRoom(zRoomReservation, HiddenInfo, ChannelRequest);
      memRoomNotes.Lines.text := HiddenInfo;
      memRequestFromChannel.Lines.text := ChannelRequest;
      SetLabNumbers;
    end;
  end;
end;

procedure TfrmReservationProfile.tvInvoiceHeadsAmountNoTaxGetProperties(Sender: TcxCustomGridTableItem;
  ARecord: TcxCustomGridRecord;
  var AProperties: TcxCustomEditProperties);
begin
  AProperties := d.getCurrencyProperties(g.qNativeCurrency);
end;

procedure TfrmReservationProfile.tvInvoiceHeadsAmountTaxGetProperties(Sender: TcxCustomGridTableItem;
  ARecord: TcxCustomGridRecord;
  var AProperties: TcxCustomEditProperties);
begin
  AProperties := d.getCurrencyProperties(g.qNativeCurrency);
end;

procedure TfrmReservationProfile.tvInvoiceHeadsAmountWithTaxGetProperties(Sender: TcxCustomGridTableItem;
  ARecord: TcxCustomGridRecord;
  var AProperties: TcxCustomEditProperties);
begin
  AProperties := d.getCurrencyProperties(g.qNativeCurrency);
end;

procedure TfrmReservationProfile.tvInvoiceLinesAmountNoTaxGetProperties(Sender: TcxCustomGridTableItem;
  ARecord: TcxCustomGridRecord;
  var AProperties: TcxCustomEditProperties);
begin
  AProperties := d.getCurrencyProperties(g.qNativeCurrency);
end;

procedure TfrmReservationProfile.tvInvoiceLinesAmountTaxGetProperties(Sender: TcxCustomGridTableItem;
  ARecord: TcxCustomGridRecord;
  var AProperties: TcxCustomEditProperties);
begin
  AProperties := d.getCurrencyProperties(g.qNativeCurrency);
end;

procedure TfrmReservationProfile.tvInvoiceLinesAmountWithTaxGetProperties(Sender: TcxCustomGridTableItem;
  ARecord: TcxCustomGridRecord;
  var AProperties: TcxCustomEditProperties);
begin
  AProperties := d.getCurrencyProperties(g.qNativeCurrency);
end;

procedure TfrmReservationProfile.tvInvoiceLinesPriceGetProperties(Sender: TcxCustomGridTableItem;
  ARecord: TcxCustomGridRecord;
  var AProperties: TcxCustomEditProperties);
begin
  AProperties := d.getCurrencyProperties(g.qNativeCurrency);
end;

end.
