unit uControlData;

(*

 121207 - checked for ww - OK

*)


interface

uses
  //DELPHI
    SysUtils
  , Windows
  , Messages
  , Classes
  , Graphics
  , Controls
  , dialogs
  , StdCtrls
  , Forms
  , DBCtrls
  , DBTables
  , ADODB
  , Mask
  , ExtCtrls
  , Buttons
  , ComCtrls
  , treelist
  , Menus
  , ImgList
  , DB
  , dateUtils

  //BERYLLIUM
  , uAppGlobal
  , ug
  , _Glob
  , hData

  //DEVEXPRESS
  , ColCombo

  , uUtils
  , cmpRoomerDataSet
  , cmpRoomerConnection
  , kbmMemTable


  , sSkinProvider
  , sPageControl
  , sTreeView
  , sLabel
  , sPanel
  , sGroupBox
  , sEdit
  , sSpinEdit
  , sButton
  , sComboBox
  , sCheckBox
  , sComboBoxes
  , sComboEdit
  , sCurrencyEdit
  , sTooledit
  , sMaskEdit
  , sCustomComboEdit
  , sCurrEdit
  , sFontCtrls

  , uFrmKeyPairSelector
  , uD


  , sSpeedButton

  //TMS
  , AdvCombo
  , AdvEdit
  , AdvEdBtn
  , AdvDirectoryEdit

  , dxSkinsCore
  , dxSkinDarkSide
  , dxSkinMcSkin
  , dxSkinOffice2013White
  , dxSkinsDefaultPainters
  , dxSkinDevExpressDarkStyle
  , cxGraphics
  , cxControls
  , cxLookAndFeels
  , cxLookAndFeelPainters
  , cxContainer
  , cxEdit
  , cxTextEdit
  , cxMaskEdit
  , cxDropDownEdit
  , cxColorComboBox, dxSkinCaramel, dxSkinCoffee, dxSkinTheAsphaltWorld, dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinDarkRoom,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinValentine,
  dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue, AdvDropDown, AdvColorPickerDropDown, AdvGlowButton, AdvOfficeSelectors, AsgCombo, ColorCombo, dxGalleryControl, dxColorGallery, dxColorEdit



  ;

  //


type
  TfrmControlData = class(TForm)
    Panel3: TsPanel;
    __Panel2: TPanel;
    LMDBackPanel1: TsPanel;
    labHeader: TsLabel;
    LMDBackPanel2: TsPanel;
    TreeView1: TsTreeView;
    __LMDBackPanel3: TsPanel;
    mainPage: TsPageControl;
    tsNull: TsTabSheet;
    tsCompany: TsTabSheet;
    gbxCompany: TsGroupBox;
    clabCompanyCode: TsLabel;
    clabCompanyPID: TsLabel;
    labCompanyName: TsLabel;
    gbxAddress: TsGroupBox;
    clabAddress1: TsLabel;
    gbxContact: TsGroupBox;
    clabTelephone1: TsLabel;
    clabTelephone2: TsLabel;
    clabFax: TsLabel;
    clabCompanyEmail: TsLabel;
    clabCompanyHomePage: TsLabel;
    gbxBank: TsGroupBox;
    labCompanyVATno: TsLabel;
    labCompanyBankInfo: TsLabel;
    tsSystemItemIDs: TsTabSheet;
    cbxIdNumbers: TsGroupBox;
    clabLasIinvoiceNo: TsLabel;
    clabLastPerson: TsLabel;
    clabLastReservation: TsLabel;
    clabLastRoomReservation: TsLabel;
    tsInvoiceTexts: TsTabSheet;
    AdvPageControl2: TsPageControl;
    tsInvTexts_Laser1: TsTabSheet;
    gbxInvoiceHead: TsGroupBox;
    LMDSimpleLabel1: TsLabel;
    LMDSimpleLabel2: TsLabel;
    edinvTxtHeadDebit: TsEdit;
    edinvTxtHeadKredit: TsEdit;
    gbxInvoiceHeadInfo: TsGroupBox;
    clabInvoiceDate: TsLabel;
    clabInvoiceHeadCustomerNumber: TsLabel;
    clabInvoicePayDate: TsLabel;
    clabInvoiceDueDate: TsLabel;
    clabNativeCurrency: TsLabel;
    clabInvoiceCurrency: TsLabel;
    clabCurrencyRate: TsLabel;
    clabReservationID: TsLabel;
    clabCreditInvoiceReference: TsLabel;
    clabOrginalInvoiceRefernce: TsLabel;
    clabGuestName: TsLabel;
    clabInvTxtHeadInfoNumber: TsLabel;
    clabGuestRoom: TsLabel;
    edinvTxtHeadInfoDate: TsEdit;
    edinvTxtHeadInfoCustomerNo: TsEdit;
    edinvTxtHeadInfoGjalddagi: TsEdit;
    edinvTxtHeadInfoEindagi: TsEdit;
    edinvTxtHeadInfoLocalCurrency: TsEdit;
    edinvTxtHeadInfoCurrency: TsEdit;
    edinvTxtHeadInfoCurrencyRate: TsEdit;
    edinvTxtHeadInfoReservation: TsEdit;
    edinvTxtHeadInfoCreditInvoice: TsEdit;
    edinvTxtHeadInfoOrginalInfo: TsEdit;
    edinvTxtHeadInfoGuest: TsEdit;
    edinvTxtHeadInfoNumber: TsEdit;
    edinvTxtHeadInfoRoom: TsEdit;
    gbxInvoicelines: TsGroupBox;
    LMDSimpleLabel15: TsLabel;
    LMDSimpleLabel16: TsLabel;
    LMDSimpleLabel17: TsLabel;
    LMDSimpleLabel18: TsLabel;
    LMDSimpleLabel19: TsLabel;
    LMDSimpleLabel20: TsLabel;
    edinvTxtLinesItemNo: TsEdit;
    edinvTxtLinesItemText: TsEdit;
    edinvTxtLinesItemCount: TsEdit;
    edinvTxtLinesItemPrice: TsEdit;
    edinvTxtLinesItemAmount: TsEdit;
    edinvTxtLinesItemTotal: TsEdit;
    gbxInvoiceCompany: TsGroupBox;
    LMDSimpleLabel46: TsLabel;
    LMDSimpleLabel47: TsLabel;
    LMDSimpleLabel48: TsLabel;
    LMDSimpleLabel49: TsLabel;
    LMDSimpleLabel50: TsLabel;
    LMDSimpleLabel51: TsLabel;
    LMDSimpleLabel52: TsLabel;
    edinvTxtCompanyName: TsEdit;
    edinvTxtCompanyAddress: TsEdit;
    edinvTxtCompanyTel1: TsEdit;
    edinvTxtCompanyTel2: TsEdit;
    edinvTxtCompanyFax: TsEdit;
    edinvTxtCompanyEmail: TsEdit;
    edinvTxtCompanyHomePage: TsEdit;
    GbxBankInfo: TsGroupBox;
    clabVATid: TsLabel;
    clabCustomerID: TsLabel;
    clabBankAccount: TsLabel;
    edinvTxtCompanyPID: TsEdit;
    edinvTxtCompanyVATId: TsEdit;
    edinvTxtCompanyBankInfo: TsEdit;
    tsInvTexts_Laser2: TsTabSheet;
    gbxVATlist: TsGroupBox;
    LMDSimpleLabel25: TsLabel;
    LMDSimpleLabel26: TsLabel;
    LMDSimpleLabel27: TsLabel;
    LMDSimpleLabel28: TsLabel;
    LMDSimpleLabel36: TsLabel;
    LMDSimpleLabel37: TsLabel;
    LMDSimpleLabel45: TsLabel;
    edinvTxtVATListHead: TsEdit;
    edinvTxtVATListDescription: TsEdit;
    edinvTxtVATListwoVAT: TsEdit;
    edinvTxtVATListwVAT: TsEdit;
    edinvTxtVATListVATAmount: TsEdit;
    edinvTxtVATListTotal: TsEdit;
    edinvTxtVATListVATpr: TsEdit;
    gbxPaymentLine: TsGroupBox;
    LMDSimpleLabel29: TsLabel;
    LMDSimpleLabel30: TsLabel;
    edinvTxtPaymentLineHead: TsEdit;
    edinvTxtPaymentLineSeperator: TsEdit;
    gbxPaymentList: TsGroupBox;
    LMDSimpleLabel31: TsLabel;
    LMDSimpleLabel32: TsLabel;
    LMDSimpleLabel33: TsLabel;
    LMDSimpleLabel34: TsLabel;
    LMDSimpleLabel35: TsLabel;
    edinvTxtPaymentListHead: TsEdit;
    edinvTxtPaymentListCode: TsEdit;
    edinvTxtPaymentListAmount: TsEdit;
    edinvTxtPaymentListDate: TsEdit;
    edinvTxtPaymentListTotal: TsEdit;
    gbxVATline: TsGroupBox;
    LMDSimpleLabel38: TsLabel;
    LMDSimpleLabel39: TsLabel;
    edinvTxtVATLineHead: TsEdit;
    edinvTxtVATLineSeperator: TsEdit;
    gbxTotals: TsGroupBox;
    LMDSimpleLabel40: TsLabel;
    LMDSimpleLabel41: TsLabel;
    LMDSimpleLabel42: TsLabel;
    edinvTxtTotalwoVAT: TsEdit;
    edinvTxtTotalVATAmount: TsEdit;
    edinvTxtTotalTotal: TsEdit;
    gbxExtra: TsGroupBox;
    LMDSimpleLabel43: TsLabel;
    LMDSimpleLabel44: TsLabel;
    edinvTxtExtra1: TsEdit;
    edinvTxtExtra2: TsEdit;
    tsInvoiceSystem: TsTabSheet;
    LMDGroupBox5: TsGroupBox;
    Label24: TsLabel;
    Label25: TsLabel;
    Label26: TsLabel;
    Label27: TsLabel;
    Label28: TsLabel;
    LMDGroupBox1: TsGroupBox;
    Label1: TsLabel;
    Label2: TsLabel;
    LMDGroupBox2_new: TsGroupBox;
    tsRoomStatusColors: TsTabSheet;
    LMDGroupBox3: TsGroupBox;
    EditGreenColor: TsEdit;
    EditPurpleColor: TsEdit;
    EditFuchsiaColor: TsEdit;
    Edit4: TsEdit;
    Edit5: TsEdit;
    Edit6: TsEdit;
    tsMail: TsTabSheet;
    LMDGroupBox8: TsGroupBox;
    Label16: TsLabel;
    Label17: TsLabel;
    LMDGroupBox9: TsGroupBox;
    Label18: TsLabel;
    Label19: TsLabel;
    Label20: TsLabel;
    Label21: TsLabel;
    Label22: TsLabel;
    tsLookMainScreen: TsTabSheet;
    tsInvoiceMain: TsTabSheet;
    editMailHost: TsEdit;
    editSmtpHost: TsEdit;
    editEmailAddress: TsEdit;
    editMailUser: TsEdit;
    editMailPassword: TsEdit;
    editMailMachineName: TsEdit;
    CheckBoxMailActive: TsCheckBox;
    editCompanyID: TsEdit;
    editCompanyPID: TsEdit;
    editCompanyName: TsEdit;
    editCompanyVATNo: TsEdit;
    editCompanyBankInfo: TsEdit;
    editAddress1: TsEdit;
    editAddress2: TsEdit;
    editAddress3: TsEdit;
    editAddress4: TsEdit;
    editTelephone1: TsEdit;
    editTelephone2: TsEdit;
    editFax: TsEdit;
    editCompanyEmail: TsEdit;
    editCompanyHomePage: TsEdit;
    editBreakFastItem: TsComboEdit;
    CheckBoxArrivalDateRulesPrice: TsCheckBox;
    CheckBoxBreakfastInclDefault: TsCheckBox;
    editRoomRentItem: TsComboEdit;
    editDiscountItem: TsComboEdit;
    editPhoneUseItem: TsComboEdit;
    editPaymentItem: TsComboEdit;
    labBreakFastItemDescription: TsLabel;
    labRoomRentItemDescription: TsLabel;
    labDiscountItemDescription: TsLabel;
    labPhoneUseItemDescription: TsLabel;
    labPaymentItemDescription: TsLabel;
    cbcCustomerID: TsGroupBox;
    clabCustomerNumber: TsLabel;
    clabCustomerIDLength: TsLabel;
    clabCustomerIdFillChar: TsLabel;
    LMDGroupBox10: TsGroupBox;
    tsInvEmail: TsTabSheet;
    AdvTabSheet3: TsTabSheet;
    AdvTabSheet5: TsTabSheet;
    AdvTabSheet6: TsTabSheet;
    LMDGroupBox21: TsGroupBox;
    cbxInvoicePrinter: TComboBox;
    cbxReportPrinter: TComboBox;
    AdvTabSheet7: TsTabSheet;
    LMDSimplePanel2: TsPanel;
    LMDSimpleLabel68: TsLabel;
    cbxAccountType: TComboBox;
    PageAccount: TsPageControl;
    AdvTabSheet8: TsTabSheet;
    AdvTabSheet9: TsTabSheet;
    AdvTabSheet10: TsTabSheet;
    AdvTabSheet11: TsTabSheet;
    clabNoAccontConnection: TsLabel;
    LMDSimpleLabel71: TsLabel;
    r1_ : TRoomerDataSet;
    LMDSimplePanel3: TsPanel;
    LMDGroupBox22: TsGroupBox;
    LMDSimpleLabel67: TsLabel;
    AdvPageControl4: TsPageControl;
    AdvTabSheet12: TsTabSheet;
    LMDSimpleLabel70: TsLabel;
    LMDSimpleLabel73: TsLabel;
    LMDSimpleLabel74: TsLabel;
    LMDSimpleLabel75: TsLabel;
    LMDSimpleLabel76: TsLabel;
    LMDSimpleLabel77: TsLabel;
    LMDSimpleLabel78: TsLabel;
    LMDSimpleLabel79: TsLabel;
    LMDSimpleLabel80: TsLabel;
    edswCust_sCurrCode: TsEdit;
    EDswCust_GL_numberID: TsEdit;
    EDswCust_GL_numberID_INFO: TsLabel;
    LabswCust_GL_numberID: TsLabel;
    edswCust_iAccountFK: TsEdit;
    LABswCust_iAccountFK: TsLabel;
    LABswCust_iAccountFK_info: TsLabel;
    cbxDeliveryTerms : TColumnComboBox;
    LabswCust_lDeliveryTermsFK: TsLabel;
    cbxEmployees : TColumnComboBox;
    LabswCust_SalesPersonID: TsLabel;
    Label5: TsLabel;
    Label11: TsLabel;
    chkXmlDoExportInLocalCurrency: TsCheckBox;
    chkXmlDoExport: TsCheckBox;
    edSnFieldSeparator: TsEdit;
    Label57: TsLabel;
    tabTouchStoreXML: TsTabSheet;
    LMDSimpleLabel81: TsLabel;
    AdvTabSheet13: TsTabSheet;
    AdvTabSheet14: TsTabSheet;
    tsIncomingMonitor: TsTabSheet;
    LMDGroupBox23: TsGroupBox;
    labSec: TsLabel;
    labInPosSeconds: TsLabel;
    ChkinPosMonitorUse: TsCheckBox;
    tsColors: TsTabSheet;
    Panel4: TsPanel;
    Panel5: TsPanel;
    panDeparted: TsPanel;
    panOrder: TsPanel;
    panDeparting: TsPanel;
    panGuestLeavingNextDay: TsPanel;
    panGuestStaying: TsPanel;
    cxGroupBox2: TsGroupBox;
    labBackgroundColor: TsLabel;
    cxLabel5: TsLabel;
    chkBold: TsCheckBox;
    chkItalic: TsCheckBox;
    chkUnderline: TsCheckBox;
    chkStrikeOut: TsCheckBox;
    panBlocked: TsPanel;
    panArrivingOtherLeaving: TsPanel;
    panNoShow: TsPanel;
    panWaitingList: TsPanel;
    panAllotment: TsPanel;
    Panel1: TsPanel;
    btnUpdateOneColor: TsButton;
    btnOneColorToDefault: TsButton;
    Panel6: TsPanel;
    btnUpdateAllColors: TsButton;
    btnAllColorsToDefault: TsButton;
    rgHomeExportPOSType: TsRadioGroup;
    gbxComputer: TsGroupBox;
    clabComputerName: TsLabel;
    edHomeComputerName: TsEdit;
    edSnXMLEncoding: TsEdit;
    LMDSimpleLabel82: TsLabel;
    AdvTabSheet15: TsTabSheet;
    LMDSimpleLabel85: TsLabel;
    Label59: TsLabel;
    editStayTaxItem: TsComboEdit;
    labStayTaxItemDescription: TsLabel;
    Label63: TsLabel;
    chkShowSideBar: TsCheckBox;
    Label7: TsLabel;
    LMDGroupBox26: TsGroupBox;
    Label65: TsLabel;
    labInvPriceGroup: TsLabel;
    edInvPriceGroup: TsComboEdit;
    cxGroupBox4: TsGroupBox;
    Label66: TsLabel;
    chkCallLogInternal: TsCheckBox;
    cbxCallType: TsComboBox;
    Label67: TsLabel;
    Label68: TsLabel;
    cxGroupBox5: TsGroupBox;
    Label69: TsLabel;
    Label70: TsLabel;
    Label71: TsLabel;
    EditLastRoomRes: TsSpinEdit;
    EditLastInvoice: TsSpinEdit;
    EditLastPerson: TsSpinEdit;
    EditLastReservation: TsSpinEdit;
    edCustIdLength: TsSpinEdit;
    edCustIdLast: TsSpinEdit;
    edCustIdFill: TsEdit;
    btnGetSwCust_GL_numberID: TsButton;
    btnGetSwCust_iAccountFK: TsButton;
    edswCust_CreditTerms: TsSpinEdit;
    edswCust_iLanguage: TsSpinEdit;
    edswCust_iPriceType: TsSpinEdit;
    edswCust_CompanyID: TsSpinEdit;
    edCallMinSec: TsSpinEdit;
    edCallMinUnits: TsSpinEdit;
    edCallMinPrice: TsCalcEdit;
    edCallStartPrice: TsCalcEdit;
    edSnPath: TAdvDirectoryEdit;
    edxmlPath_invoice: TAdvDirectoryEdit;
    Label4: TsLabel;
    Label6: TsLabel;
    Label8: TsLabel;
    Label9: TsLabel;
    GroupBox1: TsGroupBox;
    edGrandRowHeight: TsSpinEdit;
    rgrNameOrder: TsRadioGroup;
    Label10: TsLabel;
    Label12: TsLabel;
    GroupBox2: TsGroupBox;
    Label13: TsLabel;
    edFiveDayColWidth: TsSpinEdit;
    edFiveDayRowHeight: TsSpinEdit;
    edFiveDayColCount: TsSpinEdit;
    Label14: TsLabel;
    Label15: TsLabel;
    Label23: TsLabel;
    rgrNameOrderPeriod: TsRadioGroup;
    cxGroupBox1: TsGroupBox;
    edFiveDayDateFormat1: TsEdit;
    edFiveDayDateFormat2: TsEdit;
    Label29: TsLabel;
    Label30: TsLabel;
    GroupBox3: TsGroupBox;
    Label31: TsLabel;
    Label32: TsLabel;
    edinvTxtOriginal: TsEdit;
    edinvTxtCopy: TsEdit;
    GroupBox4: TsGroupBox;
    Label33: TsLabel;
    Label34: TsLabel;
    edIvhTxtTotalStayTax: TsEdit;
    edIvhTxtTotalStayTaxNights: TsEdit;
    GroupBox5: TsGroupBox;
    Label62: TsLabel;
    Label61: TsLabel;
    chkStayTaxIncluted: TsCheckBox;
    chkUseStayTax: TsCheckBox;
    labNativeCurrency: TsLabel;
    edNativeCurrency: TsComboEdit;
    labCountry: TsLabel;
    sLabel1: TsLabel;
    cbxStatusAttr_: TsComboBox;
    edCountry: TsComboEdit;
    sLabel2: TsLabel;
    sLabel3: TsLabel;
    edInvoiceFormFileISL: TsFilenameEdit;
    edInvoiceFormFileERL: TsFilenameEdit;
    sLabel4: TsLabel;
    sLabel5: TsLabel;
    LMDGroupBox25: TsGroupBox;
    Label64: TsLabel;
    labRackCustomerName: TsLabel;
    sGroupBox2: TsGroupBox;
    chkExcluteWaitingList: TsCheckBox;
    chkExcluteAllotment: TsCheckBox;
    chkExcluteOrder: TsCheckBox;
    chkExcluteNoShow: TsCheckBox;
    chkExcluteDeparted: TsCheckBox;
    chkExcluteBlocked: TsCheckBox;
    chkExcluteGuest: TsCheckBox;
    edSnPathXML: TsDirectoryEdit;
    edSnPathCurrentGuestsXML: TsDirectoryEdit;
    fcCurrentFontName: TsFontComboBox;
    edCurrentFontSize: TsSpinEdit;
    fc5DayFontName: TsFontComboBox;
    ed5DayFontSize: TsSpinEdit;
    panCanceled: TsPanel;
    panTmp2: TsPanel;
    panTmp1: TsPanel;
    sGroupBox1: TsGroupBox;
    labChannelManager: TsLabel;
    edChannelManager: TsComboEdit;
    labDefaultChannelManager: TsLabel;
    labSessionTimeoutSeconds: TsLabel;
    edSessionTimeoutSeconds: TsSpinEdit;
    labSessionSec: TsLabel;
    gbxForceExternalIdCorrectness: TsGroupBox;
    edForceExternalCustomerIdCorrectness: TsLabel;
    labforceExternalProductIdCorrectness: TsLabel;
    labforceExternalPaymentTypeIdCorrectness: TsLabel;
    chkforceExternalCustomerIdCorrectness: TsCheckBox;
    chkForceExternalProductIdCorrectness: TsCheckBox;
    chkForceExternalPaymentTypeIdCorrectness: TsCheckBox;
    sGroupBox3: TsGroupBox;
    labExpensiveChannelsLevelFrom: TsLabel;
    edExpensiveChannelsLevelFrom: TsSpinEdit;
    __cbxSpringStartsMonth: TsComboBox;
    edspringStartsDay: TsSpinEdit;
    __cbxsummerStartsMonth: TsComboBox;
    edsummerStartsDay: TsSpinEdit;
    __cbxAutumnStartsMonth: TsComboBox;
    edautumnStartsDay: TsSpinEdit;
    __cbxWinterStartsMonth: TsComboBox;
    edwinterStartsDay: TsSpinEdit;
    labspringStarts: TsLabel;
    labsummerStarts: TsLabel;
    labautumnStarts: TsLabel;
    labwinterStarts: TsLabel;
    sPanel1: TsPanel;
    sGroupBox4: TsGroupBox;
    sLabel7: TsLabel;
    sCheckBox1: TsCheckBox;
    cbxTaxPerPerson: TsCheckBox;
    gbxBottomLines: TsGroupBox;
    LMDSimpleLabel21: TsLabel;
    LMDSimpleLabel22: TsLabel;
    LMDSimpleLabel23: TsLabel;
    LMDSimpleLabel24: TsLabel;
    edinvTxtFooterLine1: TsEdit;
    edinvTxtFooterLine2: TsEdit;
    edinvTxtFooterLine3: TsEdit;
    edinvTxtFooterLine4: TsEdit;
    sLabel6: TsLabel;
    edinvTxtPaymentListDescription: TsEdit;
    sLabel8: TsLabel;
    edinvTxtHeadPrePaid: TsEdit;
    sLabel9: TsLabel;
    edinvTxtHeadBalance: TsEdit;
    sGroupBox5: TsGroupBox;
    chkConfirmAuto: TsCheckBox;
    edConfirmMinuteOfTheDay: TsSpinEdit;
    sLabel10: TsLabel;
    cbxTaxPercentage: TsCheckBox;
    edinPosMonitorChkSec: TsSpinEdit;
    sLabel12: TsLabel;
    chkNegInvoice: TsCheckBox;
    btnOK: TsButton;
    btnCancel: TsButton;
    sGroupBox6: TsGroupBox;
    Label56: TsLabel;
    sLabel11: TsLabel;
    chkUseSetUnclean: TsCheckBox;
    ChkMakeRoomsDirtyOvernight: TsCheckBox;
    edRackCustomer: TsEdit;
    btnGetCustomer: TsSpeedButton;
    sGroupBox7: TsGroupBox;
    sLabel13: TsLabel;
    sLabel14: TsLabel;
    edtInvoiceSystemCustomerTemplate: TsEdit;
    sSpeedButton1: TsSpeedButton;
    edtInvoiceSystemProductTemplate: TsEdit;
    sSpeedButton2: TsSpeedButton;
    cbxBackupMachine: TsCheckBox;
    sGroupBox8: TsGroupBox;
    sLabel15: TsLabel;
    edProformaheader: TsEdit;
    cbxBackColor: TAdvOfficeColorSelector;
    cbxFontColor: TAdvOfficeColorSelector;
    sGroupBox9: TsGroupBox;
    sLabel16: TsLabel;
    cbxCheckInDetailsDialog: TsCheckBox;
    sGroupBox10: TsGroupBox;
    cbxLocationPerRoomType: TsCheckBox;
    sLabel17: TsLabel;
    cbxWithdrawalWithoutGuarantee: TsCheckBox;
    sGroupBox11: TsGroupBox;
    sLabel20: TsLabel;
    cbxQuery: TsComboBox;
    btnResources: TsButton;
    sLabel18: TsLabel;
    editTZ: TsEdit;
    lblNumShifts: TsLabel;
    edtNumShifts: TsEdit;
    edCurrencySymbol: TsEdit;
    sGroupBox12: TsGroupBox;
    labAutoInvoiceTransfer: TsLabel;
    chkAutoInvoiceTransfer: TsCheckBox;
    btnSynchronizeFinanceTables: TsButton;
    __SyncResult: TsLabel;
    lblConfirmMinuteFromMidnight: TsLabel;
    sGroupBox13: TsGroupBox;
    cbxInvoiceExport: TsComboBox;
    sLabel19: TsLabel;
    btnInvoiceTemplateResources: TsButton;
    sLabel21: TsLabel;
    cbxExpandRoomRent: TsCheckBox;
    sGroupBox14: TsGroupBox;
    sLabel23: TsLabel;
    cbxAutoAddToGuestPortfolio: TsCheckBox;
    sLabel22: TsLabel;
    cbxCheckOutPaymentsDialog: TsCheckBox;
    cbxDefaultSendCCEmailToHotel: TsCheckBox;
    cbxMasterRateActive: TsCheckBox;
    sLabel24: TsLabel;
    tsInvoiceRouting: TsTabSheet;
    sGroupBox15: TsGroupBox;
    sLabel29: TsLabel;
    sLabel25: TsLabel;
    edtRIIndexRoomRent: TsSpinEdit;
    edtRIIndexPosItems: TsSpinEdit;
    sLabel26: TsLabel;
    sGroupBox16: TsGroupBox;
    sLabel27: TsLabel;
    sLabel28: TsLabel;
    sLabel30: TsLabel;
    edtGIIndexRoomRent: TsSpinEdit;
    edtGIIndexPosItems: TsSpinEdit;
    sGroupBox17: TsGroupBox;
    sLabel31: TsLabel;
    sLabel32: TsLabel;
    edtWarnCheckInDirtyRoom: TsCheckBox;
    edtWarnWhenOverbooking: TsCheckBox;
    edtWarnMoveRoomToNewRoomtype: TsCheckBox;
    sLabel33: TsLabel;
    procedure FormCreate(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormShow(Sender : TObject);
    procedure okBtnClick(Sender : TObject);
    procedure panBtnResize(Sender : TObject);
    procedure TreeView1Change(Sender : TObject; Node : TTreeNode);
    procedure FormDestroy(Sender : TObject);
    procedure editBreakFastItemCustomButtons0Click(Sender : TObject; index : Integer);
    procedure editRoomRentItemCustomButtons0Click(Sender : TObject; index : Integer);
    procedure cbxAccountTypeChange(Sender : TObject);
    procedure cbxDeliveryTermsChange(Sender : TObject);
    procedure cbxEmployeesChange(Sender : TObject);
    procedure btnUpdateOneColorClick(Sender : TObject);
    procedure cbxBackColorPropertiesCloseUp(Sender : TObject);
    procedure chkBoldPropertiesEditValueChanged(Sender : TObject);
    procedure cbxFontColorPropertiesCloseUp(Sender : TObject);
    procedure chkItalicPropertiesEditValueChanged(Sender : TObject);
    procedure chkUnderlinePropertiesEditValueChanged(Sender : TObject);
    procedure chkStrikeOutPropertiesEditValueChanged(Sender : TObject);
    procedure btnOneColorToDefaultClick(Sender : TObject);
    procedure panGuestStayingDblClick(Sender : TObject);
    procedure btnUpdateAllColorsClick(Sender : TObject);
    procedure btnAllColorsToDefaultClick(Sender : TObject);
    procedure edCallStartPriceChange(Sender : TObject);
    procedure edCallMinUnitsChange(Sender : TObject);
    procedure edCallMinPriceChange(Sender : TObject);
    procedure editBreakFastItemDblClick(Sender : TObject);
    procedure editRoomRentItemDblClick(Sender : TObject);
    procedure editStayTaxItemDblClick(Sender : TObject);
    procedure edRackCustomerDblClick(Sender : TObject);
    procedure editDiscountItemDblClick(Sender : TObject);
    procedure editPhoneUseItemDblClick(Sender : TObject);
    procedure editPaymentItemDblClick(Sender : TObject);
    procedure edinPosMonitorChkSecChange(Sender: TObject);
    procedure edNativeCurrencyDblClick(Sender: TObject);
    procedure cbxStatusAttr_CloseUp(Sender: TObject);
    procedure edCountryDblClick(Sender: TObject);
    procedure edInvoiceFormFileERLChange(Sender: TObject);
    procedure edInvoiceFormFileISLChange(Sender: TObject);
    procedure fcCurrentFontNameCloseUp(Sender: TObject);
    procedure edChannelManagerDblClick(Sender: TObject);
    procedure __cbxSpringStartsMonthChange(Sender: TObject);
    procedure __cbxsummerStartsMonthChange(Sender: TObject);
    procedure __cbxAutumnStartsMonthChange(Sender: TObject);
    procedure __cbxWinterStartsMonthChange(Sender: TObject);
    procedure edInvPriceGroupDblClick(Sender: TObject);
    procedure __Panel2Click(Sender: TObject);
    procedure edConfirmMinuteOfTheDayChange(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure edRackCustomerChange(Sender: TObject);
    procedure edRackCustomerExit(Sender: TObject);
    procedure sSpeedButton1Click(Sender: TObject);
    procedure sSpeedButton2Click(Sender: TObject);
    procedure cbxBackColorSelectColor(Sender: TObject; AColor: TColor);
    procedure btnResourcesClick(Sender: TObject);
    procedure btnSynchronizeFinanceTablesClick(Sender: TObject);
    procedure btnInvoiceTemplateResourcesClick(Sender: TObject);

  private
    { private declarations }

    rSet : TRoomerDataSet;
    r_ : TRoomerDataSet;
    rSetHotelConfigurations : TRoomerDataSet;

    financeCustomerList : TKeyPairList;
    financeLookupList : TKeyPairList;



    procedure LoadTable;
    procedure SaveTable;
    procedure SetBtnPos;
    procedure LoadColors(ExecutionPlan : TRoomerExecutionPlan);
    procedure updatePanColor;
    procedure ShowPanelColor;
    procedure setColorControls;
    procedure UpdateOneColor;
    procedure UpdateAllColors;

    procedure itemLookup(edit : TsComboEdit; lab : TsLabel);
    procedure calcRequestInterval;
    function  customerValidate : boolean;
  public
    { public declarations }
    gridFont : TFont;
    grid5DayFont : TFont;
  end;

var
  frmControlData : TfrmControlData;

implementation

uses
  uMain
  , uCurrencies
  , uSqlDefinitions
  , uCountries
  , uAPIDataHandler
  , uManageFilesOnServer
  , uFileDependencyManager
  , Printers
  , uItems2
  , PrjConst
  , uDImages
  , uChannelmanager
  , upayGroups
  , uCustomers2
  , uFrmResources

  ;
{$R *.DFM}

procedure TfrmControlData.calcRequestInterval;
var
  hours : Integer;
  minutes : Integer;
  seconds : Integer;

  tmp : Integer;

begin
  labInPosSeconds.Caption := 'Not Active';

  if edinPosMonitorChkSec.value < 1 then
    exit;

  tmp := edinPosMonitorChkSec.value;
  hours := tmp div 3600;
  tmp := tmp mod 3600;
  minutes := tmp div 60;
  tmp := tmp mod 60;
  seconds := tmp;

  labInPosSeconds.Caption := inttostr(hours) + ' hours ' + inttostr(minutes) + ' minutes ' + inttostr(seconds) + ' seconds';
end;

function TfrmControlData.customerValidate : boolean;
var
  sCustomer : string;
  customername : string;
begin
  sCustomer := trim(edRackCustomer.Text);
  result :=  glb.CustomersSet.Locate('customer',scustomer,[]);
  if not result then
  begin
    edRackCustomer.SetFocus;
    labRackCustomerName.Caption := GetTranslatedText('shNotF_star');
  end else
  begin
    labRackCustomerName.Caption := glb.customersset.FieldByName('SurName').AsString;
  end;
end;


procedure TfrmControlData.SetBtnPos;
begin
end;

procedure TfrmControlData.LoadTable;
var
  s : string;
  defFile : string;

  printerName : string;
  idx : Integer;

  iTmp : Integer;
  sTmp : string;

  currencyHolder : recCurrencyHolder;

  springStartsMonth : integer;
  SummerStartsMonth : integer;
  autumnStartsMonth : integer;
  winterStartsMonth : integer;

  springStartsDay : integer;
  SummerStartsDay : integer;
  autumnStartsDay : integer;
  winterStartsDay : integer;




begin
  g.ProcessAppIni(0);
  edInvoiceFormFileISL.Text := g.qInvoiceFormFileISL;
  chkShowSideBar.checked := g.qShowSideBar;

//  try
    defFile := getLocalInvoiceFilePath(false);
//  Except
//  end;


//  ReadFileList(d.roomerMainDataSet, rftTemplates);
//  defFile := getFilePath('islInvoice.fr3');

  if (defFile <> '') AND fileexists(defFile) then
  begin
    g.qInvoiceFormFileISL := defFile;
    edInvoiceFormFileISL.Text := g.qInvoiceFormFileISL;
  end;

  if not fileexists(g.qInvoiceFormFileISL) then
  begin
    s := '';
    //s := s + 'Formskr� reiknings fannst ekki'#10'undir li�num Reikningur er reitur '#10'til a� sta�setja skr�nna '#10'Upphafsnafn (default name) hennar '#10'er islInvoice.fr3 ';
    s := s + GetTranslatedText('shTx_ControlData_NoAccount');
    showmessage(s);
    edInvoiceFormFileISL.InitialDir := g.qProgramExePath;
  end;


  edInvoiceFormFileISL.InitialDir := extractFilePath(g.qInvoiceFormFileISL);
  edInvoiceFormFileISL.filter := '*.fr3';

  edInvoiceFormFileERL.Text := g.qInvoiceFormFileERL;
//  try
    defFile := getForeignInvoiceFilePath(false);
//  EXCEPT
//  end;

  if (defFile <> '') AND fileexists(defFile) then
  begin
    g.qInvoiceFormFileERL := defFile;
    edInvoiceFormFileERL.Text := g.qInvoiceFormFileERL;
  end;

  if not fileexists(g.qInvoiceFormFileERL) then
  begin
    s := '';
   // s := s + 'Formskr� reiknings fannst ekki'#10'undir li�num Reikningur er reitur '#10'til a� sta�setja skr�nna '#10'Upphafsnafn (default name) hennar '#10'er islInvoice.fr3 ';
    s := s + GetTranslatedText('shTx_ControlData_NoAccount');
    showmessage(s);
    edInvoiceFormFileERL.InitialDir := g.qProgramExePath;
  end;

  edInvoiceFormFileERL.InitialDir := extractFilePath(g.qInvoiceFormFileERL);
  edInvoiceFormFileERL.filter := '*.fr3';

  idx := 0;
  printerName := trim(g.qInvoicePrinter);
  if printerName = '' then
  begin
    printerName := _GetDefaultPrinterName;
  end
  else
  begin
    idx := cbxInvoicePrinter.Items.IndexOf(printerName);
    // vRef V10B001  FIX
    if (idx < 0) then
    begin
      idx := 0;
      printerName := _GetDefaultPrinterName;
    end
    else
      printerName := cbxReportPrinter.Items[idx];
  end;

  cbxInvoicePrinter.ItemIndex := idx;

  idx := 0;
  printerName := trim(g.qReportPrinter);
  if printerName = '' then
  begin
    printerName := _GetDefaultPrinterName;
  end
  else
  begin
    idx := cbxReportPrinter.Items.IndexOf(printerName);
    // vRef V10B001  FIX
    if (idx < 0) then
    begin
      idx := 0;
      printerName := _GetDefaultPrinterName;
    end
    else
      printerName := cbxReportPrinter.Items[idx];
  end;

  cbxReportPrinter.ItemIndex := idx;

  // tsCompany
  editCompanyID.Text := rSet.fieldbyname('CompanyID').AsString;
  editCompanyName.Text := rSet.fieldbyname('CompanyName').AsString;
  editCompanyPID.Text := rSet.fieldbyname('CompanyPID').AsString;
  // --
  editAddress1.Text := rSet.fieldbyname('Address1').AsString;
  editAddress2.Text := rSet.fieldbyname('Address2').AsString;
  editAddress3.Text := rSet.fieldbyname('Address3').AsString;
  editAddress4.Text := rSet.fieldbyname('Address4').AsString;
  edCountry.Text := rSet.fieldbyname('Country').AsString;

  //**TESTED**// lev3 ok
  countryValidate(edCountry,labCountry);


  editTelephone1.Text := rSet.fieldbyname('Telephone1').AsString;
  editTelephone2.Text := rSet.fieldbyname('Telephone2').AsString;
  editFax.Text := rSet.fieldbyname('Fax').AsString;
  editCompanyEmail.Text := rSet.fieldbyname('CompanyEmail').AsString;
  editCompanyHomePage.Text := rSet.fieldbyname('CompanyHomePage').AsString;

  editCompanyVATNo.Text := rSet.fieldbyname('CompanyVATNo').AsString;
  editCompanyBankInfo.Text := rSet.fieldbyname('CompanyBankInfo').AsString;

  // tsSystemIDs
  EditLastInvoice.value := rSet.fieldbyname('LastInvoice').AsInteger;
  EditLastReservation.value := rSet.fieldbyname('LastReservation').AsInteger;
  EditLastPerson.value := rSet.fieldbyname('LastPerson').AsInteger;
  EditLastRoomRes.value := rSet.fieldbyname('LastRoomRes').AsInteger;

  // tsMail
  editMailHost.Text := rSet.fieldbyname('MailHost').AsString;
  editSmtpHost.Text := rSet.fieldbyname('SmtpHost').AsString;
  editEmailAddress.Text := rSet.fieldbyname('EmailAddress').AsString;
  editMailUser.Text := rSet.fieldbyname('MailUser').AsString;
  editMailPassword.Text := rSet.fieldbyname('MailPassword').AsString;
  editMailMachineName.Text := rSet.fieldbyname('MailMachineName').AsString;
  CheckBoxMailActive.checked := rSet['MailActive'];

  // tsInvoiceSystem
  editBreakFastItem.Text := rSet.fieldbyname('BreakFastItem').AsString;
  labBreakFastItemDescription.Caption := Item_GetDescription(editBreakFastItem.Text);

  editRoomRentItem.Text := rSet.fieldbyname('RoomRentItem').AsString;
  labRoomRentItemDescription.Caption := Item_GetDescription(editRoomRentItem.Text);

  try
    editStayTaxItem.Text := rSet.fieldbyname('stayTaxItem').AsString;
    labStayTaxItemDescription.Caption := Item_GetDescription(editStayTaxItem.Text);
    cbxTaxPerPerson.Checked := rSet['stayTaxPerPerson'];
    g.qStayTaxPerPerson := cbxTaxPerPerson.Checked;
  except
    on E : Exception do
      showmessage(E.message);
  end;

  if trim(editStayTaxItem.Text) = '' then
  begin
	  showmessage(GetTranslatedText('shTx_ControlData_Tax'));
  end;

  editPaymentItem.Text := rSet.fieldbyname('PaymentItem').AsString;
  labPaymentItemDescription.Caption := Item_GetDescription(editPaymentItem.Text);

  editPhoneUseItem.Text := rSet.fieldbyname('PhoneUseItem').AsString;
  labPhoneUseItemDescription.Caption := Item_GetDescription(editPhoneUseItem.Text);

  editDiscountItem.Text := rSet.fieldbyname('DiscountItem').AsString;
  labDiscountItemDescription.Caption := Item_GetDescription(editDiscountItem.Text);

  edNativeCurrency.Text := rSet.fieldbyname('NativeCurrency').AsString;
  if CurrencyValidate(edNativeCurrency, labNativeCurrency) then
  begin
    //
  end;

  try
    edChannelManager.Text := inttostr(rSet.fieldbyname('DefaultChannelManager').AsInteger);
  EXCEPT
    edChannelManager.Text := '1';
  end;

  try
    if ChannelManagerValidate(edChannelManager, labChannelManager) then
    begin
      //
    end;
  Except
  end;

  try
    edRackCustomer.Text := rSet.fieldbyname('RackCustomer').AsString;
  Except
    edRackCustomer.Text := '0';
  end;

  labRackCustomerName.Caption := d.GetCustomerName(edRackCustomer.Text);

  CheckBoxBreakfastInclDefault.checked := rSet['BreakfastInclDefault'];
  CheckBoxArrivalDateRulesPrice.checked := rSet['ArrivalDateRulesPrice'];

  // tsRoomStatusColors
  EditGreenColor.Text := rSet.fieldbyname('GreenColor').AsString;
  EditPurpleColor.Text := rSet.fieldbyname('PurpleColor').AsString;
  EditFuchsiaColor.Text := rSet.fieldbyname('FuchsiaColor').AsString;

  // tsInvoice System

  // tsInvoiceTexts / tsDotPrinterTexts

  // tsInvoiceTexts
  edinvTxtHeadDebit.Text := rSet.fieldbyname('invTxtHeadDebit').AsString;
  edinvTxtHeadKredit.Text := rSet.fieldbyname('invTxtHeadKredit').AsString;
  edinvTxtHeadInfoNumber.Text := rSet.fieldbyname('invTxtHeadInfoNumber').AsString;
  edinvTxtHeadInfoDate.Text := rSet.fieldbyname('invTxtHeadInfoDate').AsString;
  edinvTxtHeadInfoCustomerNo.Text := rSet.fieldbyname('invTxtHeadInfoCustomerNo').AsString;
  edinvTxtHeadInfoGjalddagi.Text := rSet.fieldbyname('invTxtHeadInfoGjalddagi').AsString;
  edinvTxtHeadInfoEindagi.Text := rSet.fieldbyname('invTxtHeadInfoEindagi').AsString;
  edinvTxtHeadInfoLocalCurrency.Text := rSet.fieldbyname('invTxtHeadInfoLocalCurrency').AsString;
  edinvTxtHeadInfoCurrency.Text := rSet.fieldbyname('invTxtHeadInfoCurrency').AsString;
  edinvTxtHeadInfoCurrencyRate.Text := rSet.fieldbyname('invTxtHeadInfoCurrencyRate').AsString;
  edinvTxtHeadInfoReservation.Text := rSet.fieldbyname('invTxtHeadInfoReservation').AsString;
  edinvTxtHeadInfoCreditInvoice.Text := rSet.fieldbyname('invTxtHeadInfoCreditInvoice').AsString;
  edinvTxtHeadInfoOrginalInfo.Text := rSet.fieldbyname('invTxtHeadInfoOrginalInfo').AsString;
  edinvTxtHeadInfoGuest.Text := rSet.fieldbyname('invTxtHeadInfoGuest').AsString;
  edinvTxtHeadInfoRoom.Text := rSet.fieldbyname('invTxtHeadInfoRoom').AsString;
  edinvTxtLinesItemNo.Text := rSet.fieldbyname('invTxtLinesItemNo').AsString;
  edinvTxtLinesItemText.Text := rSet.fieldbyname('invTxtLinesItemText').AsString;
  edinvTxtLinesItemCount.Text := rSet.fieldbyname('invTxtLinesItemCount').AsString;
  edinvTxtLinesItemPrice.Text := rSet.fieldbyname('invTxtLinesItemPrice').AsString;

  edinvTxtPaymentListDescription.Text := rSet.fieldbyname('invTxtPaymentListDescription').AsString;
  edinvTxtHeadPrePaid.Text := rSet.fieldbyname('invTxtHeadPrePaid').AsString;
  edinvTxtHeadBalance.Text := rSet.fieldbyname('invTxtHeadBalance').AsString;

  edinvTxtLinesItemAmount.Text := rSet.fieldbyname('invTxtLinesItemAmount').AsString;
  edinvTxtLinesItemTotal.Text := rSet.fieldbyname('invTxtLinesItemTotal').AsString;
  edinvTxtExtra1.Text := rSet.fieldbyname('invTxtExtra1').AsString;
  edinvTxtExtra2.Text := rSet.fieldbyname('invTxtExtra2').AsString;
  edinvTxtFooterLine1.Text := rSet.fieldbyname('invTxtFooterLine1').AsString;
  edinvTxtFooterLine2.Text := rSet.fieldbyname('invTxtFooterLine2').AsString;
  edinvTxtFooterLine3.Text := rSet.fieldbyname('invTxtFooterLine3').AsString;
  edinvTxtFooterLine4.Text := rSet.fieldbyname('invTxtFooterLine4').AsString;
  edinvTxtPaymentListHead.Text := rSet.fieldbyname('invTxtPaymentListHead').AsString;
  edinvTxtPaymentListCode.Text := rSet.fieldbyname('invTxtPaymentListCode').AsString;
  edinvTxtPaymentListAmount.Text := rSet.fieldbyname('invTxtPaymentListAmount').AsString;
  edinvTxtPaymentListDate.Text := rSet.fieldbyname('invTxtPaymentListDate').AsString;
  edinvTxtPaymentListTotal.Text := rSet.fieldbyname('invTxtPaymentListTotal').AsString;
  edinvTxtPaymentLineHead.Text := rSet.fieldbyname('invTxtPaymentLineHead').AsString;
  edinvTxtPaymentLineSeperator.Text := rSet.fieldbyname('invTxtPaymentLineSeperator').AsString;
  edinvTxtVATListHead.Text := rSet.fieldbyname('invTxtVATListHead').AsString;
  edinvTxtVATListDescription.Text := rSet.fieldbyname('invTxtVATListDescription').AsString;
  edinvTxtVATListwoVAT.Text := rSet.fieldbyname('invTxtVATListwoVAT').AsString;
  edinvTxtVATListwVAT.Text := rSet.fieldbyname('invTxtVATListwVAT').AsString;
  edinvTxtVATListVATpr.Text := rSet.fieldbyname('invTxtVATListVATpr').AsString;
  edinvTxtVATListVATAmount.Text := rSet.fieldbyname('invTxtVATListVATAmount').AsString;
  edinvTxtVATListTotal.Text := rSet.fieldbyname('invTxtVATListTotal').AsString;
  edinvTxtVATLineHead.Text := rSet.fieldbyname('invTxtVATLineHead').AsString;
  edinvTxtVATLineSeperator.Text := rSet.fieldbyname('invTxtVATLineSeperator').AsString;
  edinvTxtTotalwoVAT.Text := rSet.fieldbyname('invTxtTotalwoVAT').AsString;
  edinvTxtTotalVATAmount.Text := rSet.fieldbyname('invTxtTotalVATAmount').AsString;
  edinvTxtTotalTotal.Text := rSet.fieldbyname('invTxtTotalTotal').AsString;

  edinvTxtCompanyName.Text := rSet.fieldbyname('invTxtCompanyName').AsString;
  edinvTxtCompanyAddress.Text := rSet.fieldbyname('invTxtCompanyAddress').AsString;
  edinvTxtCompanyTel1.Text := rSet.fieldbyname('invTxtCompanyTel1').AsString;
  edinvTxtCompanyTel2.Text := rSet.fieldbyname('invTxtCompanyTel2').AsString;
  edinvTxtCompanyFax.Text := rSet.fieldbyname('invTxtCompanyFax').AsString;
  edinvTxtCompanyEmail.Text := rSet.fieldbyname('invTxtCompanyEmail').AsString;
  edinvTxtCompanyHomePage.Text := rSet.fieldbyname('invTxtCompanyHomePage').AsString;
  edinvTxtCompanyPID.Text := rSet.fieldbyname('invTxtCompanyPID').AsString;
  edinvTxtCompanyBankInfo.Text := rSet.fieldbyname('invTxtCompanyBankInfo').AsString;
  edinvTxtCompanyVATId.Text := rSet.fieldbyname('invTxtCompanyVATId').AsString;

  edFiveDayRowHeight.value := rSet.fieldbyname('FiveDayRowHeight').AsInteger;
  edFiveDayColWidth.value := rSet.fieldbyname('FiveDayColWidth').AsInteger;
  edFiveDayColCount.value := rSet.fieldbyname('FiveDayColCount').AsInteger;

  try
    edFiveDayDateFormat1.Text := rSet.fieldbyname('FiveDayDateFormat1').AsString;
  except
    edFiveDayDateFormat1.Text := 'MMM YY';
  end;

  try
    edFiveDayDateFormat2.Text := rSet.fieldbyname('FiveDayDateFormat2').AsString;
  except
    edFiveDayDateFormat2.Text := 'DD ddd';
  end;

  edGrandRowHeight.value := rSet.fieldbyname('GrandRowHeight').AsInteger;

  edCustIdLast.value   := d.getTblINC_Last;
  edCustIdLength.value := d.getTblINC_Length;
  edCustIdFill.Text    := d.getTblINC_Fill;

  try
    edSessionTimeoutSeconds.value := rSet.fieldbyname('SessionTimeoutSeconds').AsInteger;
  except
    edSessionTimeoutSeconds.value := 900;
  end;


  try
    edInvPriceGroup.Text := rSet.fieldbyname('InvPriceGroup').AsString;
  except
    edInvPriceGroup.Text := '';
  end;

  try
    rgrNameOrder.ItemIndex := rSet.fieldbyname('NameOrder').AsInteger except rgrNameOrder.ItemIndex := 0;
  end;

  try
    rgrNameOrderPeriod.ItemIndex := rSet.fieldbyname('NameOrderPeriod').AsInteger except rgrNameOrderPeriod.ItemIndex := 0;
  end;


  try
    cbxAccountType.ItemIndex := rSet.fieldbyname('AccountType').AsInteger;
    PageAccount.ActivePageIndex := cbxAccountType.ItemIndex;

    // ef tenging er st�lpi
    if rSet.fieldbyname('AccountType').AsInteger = 1 then
    begin
    end;
  except
  end;

  try
    chkXmlDoExportInLocalCurrency.checked := rSet['XmlDoExportInLocalCurrency'];
  except
  end;

  try
    chkUseStayTax.checked := rSet['UseStayTax'];
  except
  end;

  try
    chkNegInvoice.checked := rSet['AllowNegativeInvoice'];
  except
  end;

  try
    chkStayTaxIncluted.checked := rSet['StayTaxIncluted'];
  except
  end;

  try
    chkXmlDoExport.checked := rSet['XmlDoExport'];
  except
  end;

  try
    edxmlPath_invoice.Text := rSet.fieldbyname('xmlPath_invoice').AsString;
  except
  end;

  try
    edswCust_CompanyID.value := rSet.fieldbyname('swCust_CompanyID').AsInteger;
    LabswCust_GL_numberID.Caption := rSet.fieldbyname('swCust_GL_numberID').AsString;

    LABswCust_iAccountFK.Caption := rSet.fieldbyname('swCust_iAccountFK').AsString;

    LabswCust_SalesPersonID.Caption := rSet.fieldbyname('swCust_SalesPersonID').AsString;
    edswCust_iLanguage.value := rSet.fieldbyname('swCust_iLanguage').AsInteger;
    edswCust_CreditTerms.value := rSet.fieldbyname('swCust_CreditTerms').AsInteger;
    LabswCust_lDeliveryTermsFK.Caption := rSet.fieldbyname('swCust_lDeliveryTermsFK').AsString;
    edswCust_iPriceType.value := rSet.fieldbyname('swCust_iPriceType').AsInteger;
    edswCust_sCurrCode.Text := rSet.fieldbyname('swCust_sCurrCode').AsString;
  except
  end;

  chkUseSetUnclean.checked := rSet['UseSetUnclean'];

  try
    edSnPath.Text := rSet.fieldbyname('snPath').AsString;
  except
  end;

  try
    edSnFieldSeparator.Text := rSet.fieldbyname('SnFieldSeparator').AsString;
  except
  end;

  try
    edSnXMLEncoding.Text := rSet.fieldbyname('snXMLEncoding').AsString;
  except
  end;

  if edSnXMLEncoding.Text = '' then
    edSnXMLEncoding.Text := 'UTF-8';

  try
    edSnPathXML.Text := g.qSnPathXML;
  except
  end;

  try
    edSnPathCurrentGuestsXML.Text := g.qSnPathCurrentGuestsXML;
  except
  end;

  try
    edinvTxtOriginal.Text := rSet.fieldbyname('invTxtOriginal').AsString;
    edinvTxtCopy.Text := rSet.fieldbyname('invTxtCopy').AsString;
  except
  end;

  try
    edIvhTxtTotalStayTax.Text := rSet.fieldbyname('ivhTxtTotalStayTax').AsString;
    edIvhTxtTotalStayTaxNights.Text := rSet.fieldbyname('ivhTxtTotalStayTaxNights').AsString;
  except
  end;

  ChkinPosMonitorUse.checked := g.qInPosMonitorUse;
  edinPosMonitorChkSec.value := g.qInPosMonitorChkSec;
  rgHomeExportPOSType.ItemIndex := g.qHomeExportPOSType;
  edHomeComputerName.Text := g.qHomeComputerName;
  cbxBackupMachine.Checked := g.BackupMachine;
  cbxLocationPerRoomType.Checked := g.qLocationPerRoomType;
  cbxWithdrawalWithoutGuarantee.Checked := NOT g.qRestrictWithdrawalWithoutGuarantee;
  cbxExpandRoomRent.Checked := g.qExpandRoomRentOnInvoice;



  chkConfirmAuto.checked := g.qConfirmAuto;
  edConfirmMinuteOfTheDay.value  := g.qConfirmMinuteOfTheDay;


  try
    cbxCallType.ItemIndex := rSet.fieldbyname('callType').AsInteger except cbxCallType.ItemIndex := 3;
  end;

  try
    chkCallLogInternal.checked := rSet['callLogInternal'] except chkCallLogInternal.checked := false;
  end;

  try
    edCallMinSec.value := rSet.fieldbyname('callMinSec').AsInteger;
  except
    edCallMinSec.value := 0;
  end;

  try
    edCallStartPrice.value := LocalFloatValue(rSet.fieldbyname('callStartPrice').asString);
  except
    edCallStartPrice.value := 0;
  end;

  try
    edCallMinUnits.value := rSet.fieldbyname('callMinUnits').AsInteger;
  except
    edCallMinUnits.value := 0;
  end;

  try
    edCallMinPrice.value := LocalFloatValue(rSet.fieldbyname('callMinPrice').asString);
  except
    edCallMinPrice.value := 0;
  end;

  try
    chkExcluteWaitingList.checked := rSet.fieldbyname('ExcluteWaitingList').AsBoolean;
  except
    chkExcluteWaitingList.checked := false;
  end;
  try
    chkExcluteAllotment.checked := rSet.fieldbyname('ExcluteAllotment').AsBoolean;
  except
    chkExcluteAllotment.checked := false;
  end;
  try
    chkExcluteOrder.checked := rSet.fieldbyname('ExcluteOrder').AsBoolean;
  except
    chkExcluteOrder.checked := false;
  end;
  try
    chkExcluteDeparted.checked := rSet.fieldbyname('ExcluteDeparted').AsBoolean;
  except
    chkExcluteDeparted.checked := false;
  end;
  try
    chkExcluteGuest.checked  := rSet.fieldbyname('ExcluteGuest').AsBoolean;
  except
    chkExcluteGuest.checked := false;
  end;
  try
    chkExcluteBlocked.checked := rSet.fieldbyname('ExcluteBlocked').AsBoolean;
  except
    chkExcluteBlocked.checked := false;
  end;
  try
    chkExcluteNoshow.checked := rSet.fieldbyname('ExcluteNoshow').AsBoolean;
  except
    chkExcluteNoshow.checked := false;
  end;

  try
    chkforceExternalCustomerIdCorrectness.Checked := rSethotelconfigurations.FieldByName('forceExternalCustomerIdCorrectness').AsBoolean;
  except
    chkforceExternalCustomerIdCorrectness.Checked := false;
  end;

  try
    chkAutoInvoiceTransfer.Checked := rSethotelconfigurations.FieldByName('AutoInvoiceTransfer').AsBoolean;
  except
    chkAutoInvoiceTransfer.Checked := true;
  end;


  try
    editTZ.Text := rSethotelconfigurations.FieldByName('UTCTimeZoneOffset').AsString;
  except
    editTZ.Text := '+00:00';
  end;

  try
    edtNumShifts.Text := inttostr(rSethotelconfigurations.FieldByName('NumberOfShifts').AsInteger);
  except
    edtNumShifts.Text := '3';
  end;

  try
    edtWarnCheckInDirtyRoom.Checked := rSethotelconfigurations.FieldByName('WarnCheckInDirtyRoom').AsBoolean;
  except
    edtWarnCheckInDirtyRoom.Checked := False;
  end;
  try
    edtWarnWhenOverbooking.Checked := rSethotelconfigurations.FieldByName('WarnWhenOverbooking').AsBoolean;
  except
    edtWarnWhenOverbooking.Checked := False;
  end;
  try
    edtWarnMoveRoomToNewRoomtype.Checked := rSethotelconfigurations.FieldByName('WarnMoveRoomToNewRoomtype').AsBoolean;
  except
    edtWarnMoveRoomToNewRoomtype.Checked := False;
  end;


  try
    cbxDefaultSendCCEmailToHotel.Checked := rSethotelconfigurations.FieldByName('DefaultSendCCEmailToHotel').AsBoolean;
  except
  end;

  try
    cbxMasterRateActive.Checked := rSethotelconfigurations.FieldByName('masterRatesActive').AsBoolean;
  except
  end;


  edtInvoiceSystemCustomerTemplate.Text := rSethotelconfigurations['invoiceSystemTemplateCustomer'];
  try
    edtInvoiceSystemProductTemplate.Text := rSethotelconfigurations['invoiceSystemTemplateArticle'];
  Except
    edtInvoiceSystemProductTemplate.Text := '0';
  end;

  try
    ChkMakeRoomsDirtyOvernight.Checked := rSethotelconfigurations.FieldByName('MakeRoomsDirtyOvernight').AsBoolean;
  except
    ChkMakeRoomsDirtyOvernight.Checked := false;
  end;

  try
    cbxCheckInDetailsDialog.Checked := rSet.FieldByName('CheckinWithDetailsDialog').AsBoolean;
  except
    cbxCheckInDetailsDialog.Checked := false;
  end;

  try
    cbxCheckOutPaymentsDialog.Checked := rSet.FieldByName('CheckOutWithPaymentsDialog').AsBoolean;
  except
    cbxCheckOutPaymentsDialog.Checked := false;
  end;

  try
    edProformaheader.text := rSethotelconfigurations.FieldByName('ProformaHeader').AsString;
  except
    edProformaheader.text := 'Proforma';
  end;

  try
    cbxQuery.ItemIndex := cbxQuery.IndexOf(rSethotelconfigurations.FieldByName('DefaultChannelConfirmationEmail').AsString);
  except
    cbxQuery.ItemIndex := -1;
  end;

  try
    cbxInvoiceExport.ItemIndex := cbxInvoiceExport.IndexOf(rSethotelconfigurations.FieldByName('InvoiceExportFilename').AsString);
  except
    cbxInvoiceExport.ItemIndex := -1;
  end;

  try
    chkforceExternalProductIdCorrectness.Checked := rSethotelconfigurations.FieldByName('forceExternalProductIdCorrectness').AsBoolean;
  except
    chkforceExternalProductIdCorrectness.Checked := false;
  end;

  try
    chkForceExternalPaymentTypeIdCorrectness.Checked :=  rSethotelconfigurations.FieldByName('ForceExternalPaymentTypeIdCorrectness').AsBoolean;
  except
    chkForceExternalPaymentTypeIdCorrectness.Checked := false;
  end;

  edexpensiveChannelsLevelFrom.value := trunc(rSethotelconfigurations.FieldByName('expensiveChannelsLevelFrom').asFloat);


  try
    edCurrencySymbol.text := rSet.FieldByName('CurrencySymbol').AsString;
  except
  end;

  try
    cbxAutoAddToGuestPortfolio.Checked := rSethotelconfigurations.fieldbyname('AutoAddGuestsToProfilesFromChannels').AsBoolean;
  except
  end;

  edtRIIndexRoomRent.Value := rSethotelconfigurations.FieldByName('RoomInvoiceRoomRentIndex').AsInteger + 1;
  edtRIIndexPosItems.Value := rSethotelconfigurations.FieldByName('RoomInvoicePosItemIndex').AsInteger + 1;
  edtGIIndexRoomRent.Value := rSethotelconfigurations.FieldByName('GroupInvoiceRoomRentIndex').AsInteger + 1;
  edtGIIndexPosItems.Value := rSethotelconfigurations.FieldByName('GroupInvoicePosItemIndex').AsInteger + 1;



  sTmp := rSethotelconfigurations.FieldByName('SpringStarts').AsString;
  springStartsMonth := strToInt(copy(stmp,4,2));
  springStartsDay := strToInt(copy(stmp,1,2));
  __cbxSpringStartsMonth.ItemIndex := SpringStartsMonth-1;
  iTmp := DaysInAMonth(2001, SpringStartsMonth);
  edspringStartsday.MaxValue := iTmp;
  edspringStartsday.Value := SpringStartsDay;


  sTmp := rSethotelconfigurations.FieldByName('SummerStarts').AsString;
  SummerStartsMonth := strToInt(copy(stmp,4,2));
  SummerStartsDay := strToInt(copy(stmp,1,2));
  __cbxsummerStartsMonth.ItemIndex := SummerStartsMonth-1;
  iTmp := DaysInAMonth(2001, SummerStartsMonth);
  edSummerStartsday.MaxValue := iTmp;
  edSummerStartsday.Value := SummerStartsDay;



  sTmp := rSethotelconfigurations.FieldByName('AutumnStarts').AsString;
  autumnStartsMonth := strToInt(copy(stmp,4,2));
  autumnStartsDay := strToInt(copy(stmp,1,2));
  __cbxAutumnStartsMonth.ItemIndex := autumnStartsMonth-1;
  iTmp := DaysInAMonth(2001, autumnStartsMonth);
  edautumnStartsday.MaxValue := iTmp;
  edautumnStartsday.Value := autumnStartsDay;


  sTmp := rSethotelconfigurations.FieldByName('winterStarts').AsString;
  winterStartsMonth := strToInt(copy(stmp,4,2));;
  winterStartsDay := strToInt(copy(stmp,1,2));;
  __cbxWinterStartsMonth.ItemIndex := WinterStartsMonth-1;
  iTmp := DaysInAMonth(2001, WinterStartsMonth);
  edWinterStartsday.MaxValue := iTmp;
  edWinterStartsday.Value := WinterStartsDay;


//  rSetHotelConfigurations


end;

procedure TfrmControlData.SaveTable;
var
  idx : Integer;
  springStartsMonth : integer;
  SummerStartsMonth : integer;
  autumnStartsMonth : integer;
  winterStartsMonth : integer;

  springStartsDay : integer;
  SummerStartsDay : integer;
  autumnStartsDay : integer;
  winterStartsDay : integer;

  sTmp : string;
  iTmp : integer;


begin
  rSet.edit;
  // tsCompany
  rSet.fieldbyname('CompanyID').AsString := editCompanyID.Text;
  rSet.fieldbyname('CompanyName').AsString := editCompanyName.Text;
  rSet.fieldbyname('CompanyPID').AsString := editCompanyPID.Text;
  // --
  rSet.fieldbyname('Address1').AsString := editAddress1.Text;
  rSet.fieldbyname('Address2').AsString := editAddress2.Text;
  rSet.fieldbyname('Address3').AsString := editAddress3.Text;
  rSet.fieldbyname('Address4').AsString := editAddress4.Text;
  rSet.fieldbyname('Country').AsString := edCountry.Text;

  rSet.fieldbyname('Telephone1').AsString := editTelephone1.Text;
  rSet.fieldbyname('Telephone2').AsString := editTelephone2.Text;
  rSet.fieldbyname('Fax').AsString := editFax.Text;
  rSet.fieldbyname('CompanyEmail').AsString := editCompanyEmail.Text;
  rSet.fieldbyname('CompanyHomePage').AsString := editCompanyHomePage.Text;

  rSet.fieldbyname('CompanyVATNo').AsString := editCompanyVATNo.Text;
  rSet.fieldbyname('CompanyBankInfo').AsString := editCompanyBankInfo.Text;

  // Those are made read-only so they should not be saved!
//  rSet.fieldbyname('LastInvoice').AsInteger     := EditLastInvoice.value    ;
//  rSet.fieldbyname('LastReservation').AsInteger := EditLastReservation.value;
//  rSet.fieldbyname('LastPerson').AsInteger      := EditLastPerson.value     ;
//  rSet.fieldbyname('LastRoomRes').AsInteger     := EditLastRoomRes.value    ;

  // tsMail
  rSet.fieldbyname('MailHost').AsString := editMailHost.Text;
  rSet.fieldbyname('SmtpHost').AsString := editSmtpHost.Text;
  rSet.fieldbyname('EmailAddress').AsString := editEmailAddress.Text;
  rSet.fieldbyname('MailUser').AsString := editMailUser.Text;
  rSet.fieldbyname('MailPassword').AsString := editMailPassword.Text;
  rSet.fieldbyname('MailMachineName').AsString := editMailMachineName.Text;
  rSet.fieldbyname('MailActive').AsBoolean := CheckBoxMailActive.checked;

  // tsInvoiceSystem
  rSet.fieldbyname('BreakFastItem').AsString := editBreakFastItem.Text;
  rSet.fieldbyname('RoomRentItem').AsString := editRoomRentItem.Text;
  rSet.fieldbyname('StayTaxItem').AsString := editStayTaxItem.Text;
  rSet['stayTaxPerPerson'] := cbxTaxPerPerson.Checked;
  g.qStayTaxPerPerson := cbxTaxPerPerson.Checked;

  rSet.fieldbyname('PaymentItem').AsString := editPaymentItem.Text;
  rSet.fieldbyname('PhoneUseItem').AsString := editPhoneUseItem.Text;
  rSet.fieldbyname('NativeCurrency').AsString := edNativeCurrency.Text;

  try
    rSet.fieldbyname('DefaultChannelManager').AsInteger := strtoint(edChannelManager.Text);
  Except

  end;

  rSet.fieldbyname('DiscountItem').AsString := editDiscountItem.Text;
  rSet.fieldbyname('BreakfastInclDefault').AsBoolean := CheckBoxBreakfastInclDefault.checked;
  rSet.fieldbyname('ArrivalDateRulesPrice').AsBoolean := CheckBoxArrivalDateRulesPrice.checked;

  rSet.fieldbyname('RackCustomer').AsString := edRackCustomer.Text;
  g.qRackCustomer := edRackCustomer.Text;

  // tsRoomStatusColors
  rSet.fieldbyname('GreenColor').AsString := EditGreenColor.Text;
  rSet.fieldbyname('PurpleColor').AsString := EditPurpleColor.Text;
  rSet.fieldbyname('FuchsiaColor').AsString := EditFuchsiaColor.Text;
  // tsInvoice System
  // tsInvoiceTexts / tsDotPrinterTexts
  // tsInvoiceTexts
  rSet.fieldbyname('invTxtHeadDebit').AsString := edinvTxtHeadDebit.Text;
  rSet.fieldbyname('invTxtHeadKredit').AsString := edinvTxtHeadKredit.Text;
  rSet.fieldbyname('invTxtHeadInfoNumber').AsString := edinvTxtHeadInfoNumber.Text;
  rSet.fieldbyname('invTxtHeadInfoDate').AsString := edinvTxtHeadInfoDate.Text;
  rSet.fieldbyname('invTxtHeadInfoCustomerNo').AsString := edinvTxtHeadInfoCustomerNo.Text;
  rSet.fieldbyname('invTxtHeadInfoGjalddagi').AsString := edinvTxtHeadInfoGjalddagi.Text;
  rSet.fieldbyname('invTxtHeadInfoEindagi').AsString := edinvTxtHeadInfoEindagi.Text;
  rSet.fieldbyname('invTxtHeadInfoLocalCurrency').AsString := edinvTxtHeadInfoLocalCurrency.Text;
  rSet.fieldbyname('invTxtHeadInfoCurrency').AsString := edinvTxtHeadInfoCurrency.Text;
  rSet.fieldbyname('invTxtHeadInfoCurrencyRate').AsString := edinvTxtHeadInfoCurrencyRate.Text;
  rSet.fieldbyname('invTxtHeadInfoReservation').AsString := edinvTxtHeadInfoReservation.Text;
  rSet.fieldbyname('invTxtHeadInfoCreditInvoice').AsString := edinvTxtHeadInfoCreditInvoice.Text;
  rSet.fieldbyname('invTxtHeadInfoOrginalInfo').AsString := edinvTxtHeadInfoOrginalInfo.Text;
  rSet.fieldbyname('invTxtHeadInfoGuest').AsString := edinvTxtHeadInfoGuest.Text;
  rSet.fieldbyname('invTxtHeadInfoRoom').AsString := edinvTxtHeadInfoRoom.Text;
  rSet.fieldbyname('invTxtLinesItemNo').AsString := edinvTxtLinesItemNo.Text;
  rSet.fieldbyname('invTxtLinesItemText').AsString := edinvTxtLinesItemText.Text;
  rSet.fieldbyname('invTxtLinesItemCount').AsString := edinvTxtLinesItemCount.Text;
  rSet.fieldbyname('invTxtLinesItemPrice').AsString := edinvTxtLinesItemPrice.Text;

  rSet.fieldbyname('invTxtPaymentListDescription').AsString   :=   edinvTxtPaymentListDescription.Text;
  rSet.fieldbyname('invTxtHeadPrePaid').AsString              :=   edinvTxtHeadPrePaid.Text           ;
  rSet.fieldbyname('invTxtHeadBalance').AsString              :=   edinvTxtHeadBalance.Text           ;

  rSet.fieldbyname('invTxtLinesItemAmount').AsString := edinvTxtLinesItemAmount.Text;
  rSet.fieldbyname('invTxtLinesItemTotal').AsString := edinvTxtLinesItemTotal.Text;
  rSet.fieldbyname('invTxtExtra1').AsString := edinvTxtExtra1.Text;
  rSet.fieldbyname('invTxtExtra2').AsString := edinvTxtExtra2.Text;
  rSet.fieldbyname('invTxtFooterLine1').AsString := edinvTxtFooterLine1.Text;
  rSet.fieldbyname('invTxtFooterLine2').AsString := edinvTxtFooterLine2.Text;
  rSet.fieldbyname('invTxtFooterLine3').AsString := edinvTxtFooterLine3.Text;
  rSet.fieldbyname('invTxtFooterLine4').AsString := edinvTxtFooterLine4.Text;
  rSet.fieldbyname('invTxtPaymentListHead').AsString := edinvTxtPaymentListHead.Text;
  rSet.fieldbyname('invTxtPaymentListCode').AsString := edinvTxtPaymentListCode.Text;
  rSet.fieldbyname('invTxtPaymentListAmount').AsString := edinvTxtPaymentListAmount.Text;
  rSet.fieldbyname('invTxtPaymentListDate').AsString := edinvTxtPaymentListDate.Text;
  rSet.fieldbyname('invTxtPaymentListTotal').AsString := edinvTxtPaymentListTotal.Text;
  rSet.fieldbyname('invTxtPaymentLineHead').AsString := edinvTxtPaymentLineHead.Text;
  rSet.fieldbyname('invTxtPaymentLineSeperator').AsString := edinvTxtPaymentLineSeperator.Text;
  rSet.fieldbyname('invTxtVATListHead').AsString := edinvTxtVATListHead.Text;
  rSet.fieldbyname('invTxtVATListDescription').AsString := edinvTxtVATListDescription.Text;
  rSet.fieldbyname('invTxtVATListwoVAT').AsString := edinvTxtVATListwoVAT.Text;
  rSet.fieldbyname('invTxtVATListwVAT').AsString := edinvTxtVATListwVAT.Text;
  rSet.fieldbyname('invTxtVATListVATpr').AsString := edinvTxtVATListVATpr.Text;
  rSet.fieldbyname('invTxtVATListVATAmount').AsString := edinvTxtVATListVATAmount.Text;
  rSet.fieldbyname('invTxtVATListTotal').AsString := edinvTxtVATListTotal.Text;
  rSet.fieldbyname('invTxtVATLineHead').AsString := edinvTxtVATLineHead.Text;
  rSet.fieldbyname('invTxtVATLineSeperator').AsString := edinvTxtVATLineSeperator.Text;
  rSet.fieldbyname('invTxtTotalwoVAT').AsString := edinvTxtTotalwoVAT.Text;
  rSet.fieldbyname('invTxtTotalVATAmount').AsString := edinvTxtTotalVATAmount.Text;
  rSet.fieldbyname('invTxtTotalTotal').AsString := edinvTxtTotalTotal.Text;

  rSet.fieldbyname('invTxtCompanyName').AsString := edinvTxtCompanyName.Text;
  rSet.fieldbyname('invTxtCompanyAddress').AsString := edinvTxtCompanyAddress.Text;
  rSet.fieldbyname('invTxtCompanyTel1').AsString := edinvTxtCompanyTel1.Text;
  rSet.fieldbyname('invTxtCompanyTel2').AsString := edinvTxtCompanyTel2.Text;
  rSet.fieldbyname('invTxtCompanyFax').AsString := edinvTxtCompanyFax.Text;
  rSet.fieldbyname('invTxtCompanyEmail').AsString := edinvTxtCompanyEmail.Text;
  rSet.fieldbyname('invTxtCompanyHomePage').AsString := edinvTxtCompanyHomePage.Text;
  rSet.fieldbyname('invTxtCompanyPID').AsString := edinvTxtCompanyPID.Text;
  rSet.fieldbyname('invTxtCompanyBankInfo').AsString := edinvTxtCompanyBankInfo.Text;
  rSet.fieldbyname('invTxtCompanyVATId').AsString := edinvTxtCompanyVATId.Text;

  rSet.fieldbyname('FiveDayRowHeight').AsInteger := edFiveDayRowHeight.Value;
  rSet.fieldbyname('FiveDayColWidth').AsInteger := edFiveDayColWidth.value;
  rSet.fieldbyname('FiveDayColCount').AsInteger := edFiveDayColCount.value;

  rSet.fieldbyname('GrandRowHeight').AsInteger := edGrandRowHeight.value;

  try
    rSet.fieldbyname('SessionTimeoutSeconds').AsInteger := edSessionTimeoutSeconds.value;
  Except
  end;

  try
    rSet.fieldbyname('FiveDayDateFormat1').AsString := edFiveDayDateFormat1.Text;
    g.qPeriodDateformat1 := edFiveDayDateFormat1.Text;
  except
  end;

  try
    rSet.fieldbyname('FiveDayDateFormat2').AsString := edFiveDayDateFormat2.Text;
    g.qPeriodDateformat2 := edFiveDayDateFormat2.Text;
  except
  end;

  try
    rSet.fieldbyname('InvPriceGroup').AsString := edInvPriceGroup.Text;
    g.qInvPriceGroup := edInvPriceGroup.Text;
  except
  end;

  try
    rSet.fieldbyname('NameOrder').AsInteger := rgrNameOrder.ItemIndex;
  except
  end;

  try
    rSet.fieldbyname('NameOrderPeriod').AsInteger := rgrNameOrderPeriod.ItemIndex;
  except
  end;

  g.qNameOrder := rgrNameOrder.ItemIndex;
  g.qNameOrderPeriod := rgrNameOrderPeriod.ItemIndex;


  try
    rSet.fieldbyname('XmlDoExportInLocalCurrency').AsBoolean := chkXmlDoExportInLocalCurrency.checked;
  except
  end;

  try
    rSet.fieldbyname('UseStayTax').AsBoolean := chkUseStayTax.checked;
  except
  end;

  try
    rSet.fieldbyname('AllowNegativeInvoice').AsBoolean := chkNegInvoice.checked;
  except
  end;


  try
    rSet.fieldbyname('StayTaxIncluted').AsBoolean := chkStayTaxIncluted.checked;
  except
  end;

  try
    rSet.fieldbyname('XmlDoExport').AsBoolean := chkXmlDoExport.checked;
  except
  end;

  try
    rSet.fieldbyname('xmlPath_invoice').AsString := edxmlPath_invoice.Text;
  except
  end;

  try
    rSet.fieldbyname('AccountType').AsInteger := cbxAccountType.ItemIndex;
  except

  end;

  try
    rSet.fieldbyname('swCust_CompanyID').AsInteger := edswCust_CompanyID.value;

    if LabswCust_GL_numberID.Caption = '' then LabswCust_GL_numberID.Caption := '0';
    rSet.fieldbyname('swCust_GL_numberID').AsInteger := strToInt(LabswCust_GL_numberID.Caption);

    if LABswCust_iAccountFK.Caption = '' then LABswCust_iAccountFK.Caption := '0';
    rSet.fieldbyname('swCust_iAccountFK').AsInteger := strToInt(LABswCust_iAccountFK.Caption);


    if LabswCust_SalesPersonID.Caption = '' then LabswCust_SalesPersonID.Caption := '0';
    rSet.fieldbyname('swCust_SalesPersonID').AsInteger := strToInt(LabswCust_SalesPersonID.Caption);

    rSet.fieldbyname('swCust_iLanguage').AsInteger := edswCust_iLanguage.value;
    rSet.fieldbyname('swCust_CreditTerms').AsInteger := edswCust_CreditTerms.value;

    if LabswCust_lDeliveryTermsFK.Caption = '' then LabswCust_lDeliveryTermsFK.Caption := '0';
    rSet.fieldbyname('swCust_lDeliveryTermsFK').AsInteger := strToInt(LabswCust_lDeliveryTermsFK.Caption);

    rSet.fieldbyname('swCust_iPriceType').AsInteger := edswCust_iPriceType.value;
    rSet.fieldbyname('swCust_sCurrCode').AsString := edswCust_sCurrCode.Text;
  except
  end;

  try
    rSet.fieldbyname('UseSetUnclean').AsBoolean := chkUseSetUnclean.checked;
  except
  end;

  try
    rSet.fieldbyname('snPath').AsString := edSnPath.Text;
  except
  end;

  try
    rSet.fieldbyname('snFieldSeparator').AsString := edSnFieldSeparator.Text;
  except
  end;

  try
    rSet.fieldbyname('snXMLEncoding').AsString := edSnXMLEncoding.Text;
  except
  end;

  try
    rSet.fieldbyname('invTxtOriginal').AsString := edinvTxtOriginal.Text;
    rSet.fieldbyname('invTxtCopy').AsString := edinvTxtCopy.Text;
  except
  end;

  try
    rSet.fieldbyname('ivhTxtTotalStayTax').AsString := edIvhTxtTotalStayTax.Text;
    rSet.fieldbyname('ivhTxtTotalStayTaxNights').AsString := edIvhTxtTotalStayTaxNights.Text;
  except
  end;

  g.qSnPathXML := edSnPathXML.Text;
  g.qSnPathCurrentGuestsXML := edSnPathCurrentGuestsXML.Text;

  g.qInPosMonitorUse := ChkinPosMonitorUse.checked;
  g.qInPosMonitorChkSec := edinPosMonitorChkSec.value;

  g.qHomeExportPOSType := rgHomeExportPOSType.ItemIndex;
  g.qHomeComputerName := edHomeComputerName.Text;
  g.BackupMachine := cbxBackupMachine.Checked;
  g.qLocationPerRoomType := cbxLocationPerRoomType.Checked;
  g.qRestrictWithdrawalWithoutGuarantee := NOT cbxWithdrawalWithoutGuarantee.Checked;
  g.qExpandRoomRentOnInvoice := cbxExpandRoomRent.Checked;





  g.qConfirmAuto := chkConfirmAuto.checked;
  g.qConfirmMinuteOfTheDay := edConfirmMinuteOfTheDay.value;

  try
    rSet.fieldbyname('callType').AsInteger := cbxCallType.ItemIndex;
  except
  end;

  try
    rSet.fieldbyname('callLogInternal').AsBoolean := chkCallLogInternal.checked;
  except
  end;

  try
    rSet.fieldbyname('callMinSec').AsInteger := edCallMinSec.value;
  except
  end;

  try
    rSet.fieldbyname('callStartPrice').asfloat := edCallStartPrice.value;
  except
  end;

  try
    rSet.fieldbyname('callMinUnits').AsInteger := edCallMinUnits.value;
  except
  end;

  try
    rSet.fieldbyname('callMinPrice').asfloat := edCallMinPrice.value;
  except
  end;

  try
    rSet.fieldbyname('ExcluteWaitingList').AsBoolean :=  chkExcluteWaitingList.checked;
  except
  end;

  try
    rSet.fieldbyname('ExcluteAllotment').AsBoolean := chkExcluteAllotment.checked;
  except
  end;

  try
    rSet.fieldbyname('ExcluteOrder').AsBoolean := chkExcluteOrder.checked;
  except
  end;

  try
    rSet.fieldbyname('ExcluteDeparted').AsBoolean := chkExcluteDeparted.checked;
  except
  end;

  try
    rSet.fieldbyname('ExcluteGuest').AsBoolean := chkExcluteGuest.checked;
  except
  end;

  try
    rSet.fieldbyname('ExcluteBlocked').AsBoolean := chkExcluteBlocked.checked;
  except
  end;

  try
    rSet.fieldbyname('ExcluteNoshow').AsBoolean := chkExcluteNoshow.checked;
  except
  end;

  try
    rSet.FieldByName('CheckinWithDetailsDialog').AsBoolean := cbxCheckInDetailsDialog.Checked;
  except
  end;

  try
    rSet.FieldByName('CheckOutWithPaymentsDialog').AsBoolean := cbxCheckOutPaymentsDialog.Checked;
  except
  end;

  try
    rSet.FieldByName('CurrencySymbol').AsString :=  trim(edCurrencySymbol.text);
    if FormatSettings.CurrencyString <> edCurrencySymbol.text then FormatSettings.CurrencyString := edCurrencySymbol.text
  Except
  end;


  rSet.Post;  //ID OK

  rSethotelconfigurations.Edit;

  try
    rSethotelconfigurations['invoiceSystemTemplateCustomer'] := edtInvoiceSystemCustomerTemplate.Text;
  except
  end;

  try
    rSethotelconfigurations['invoiceSystemTemplateArticle'] := edtInvoiceSystemProductTemplate.Text;
  except
  end;

  try
    rSethotelconfigurations['LocationPerRoomType'] := cbxLocationPerRoomType.Checked;
  except
  end;

  try
    rSethotelconfigurations['RestrictWithdrawalToGuarantee'] := NOT cbxWithdrawalWithoutGuarantee.Checked;
  except
  end;

  try
    rSethotelconfigurations['ExpandedRoomStayOnInvoice'] := cbxExpandRoomRent.Checked;
  except
  end;

  try
    rSethotelconfigurations['AutoAddGuestsToProfilesFromChannels'] := cbxAutoAddToGuestPortfolio.Checked;
  except
  end;

  try
    rSethotelconfigurations.FieldByName('forceExternalCustomerIdCorrectness').AsBoolean := chkforceExternalCustomerIdCorrectness.Checked;
  except
  end;


  try
    rSethotelconfigurations.FieldByName('AutoInvoiceTransfer').AsBoolean := chkAutoInvoiceTransfer.Checked;
  except
  end;

  try
    rSethotelconfigurations.FieldByName('UTCTimeZoneOffset').AsString := editTZ.Text;
  except
  end;

  try
    rSethotelconfigurations.FieldByName('NumberOfShifts').AsInteger := StrToInt(edtNumShifts.Text);
    g.qNumberOfShifts := StrToInt(edtNumShifts.Text);
  except
  end;

  try
    rSethotelconfigurations.FieldByName('WarnCheckInDirtyRoom').AsBoolean := edtWarnCheckInDirtyRoom.Checked;
    g.qWarnCheckInDirtyRoom := edtWarnCheckInDirtyRoom.Checked;
  except
  end;
  try
    rSethotelconfigurations.FieldByName('WarnWhenOverbooking').AsBoolean := edtWarnWhenOverbooking.Checked;
    g.qWarnWhenOverbooking := edtWarnWhenOverbooking.Checked;
  except
  end;
  try
    rSethotelconfigurations.FieldByName('WarnMoveRoomToNewRoomtype').AsBoolean := edtWarnMoveRoomToNewRoomtype.Checked;
    g.qWarnMoveRoomToNewRoomtype := edtWarnMoveRoomToNewRoomtype.Checked;
  except
  end;


  try
    rSethotelconfigurations.FieldByName('DefaultSendCCEmailToHotel').AsBoolean := cbxDefaultSendCCEmailToHotel.Checked;
    g.qDefaultSendCCEmailToHotel := cbxDefaultSendCCEmailToHotel.Checked;
  except
  end;

  try
    rSethotelconfigurations.FieldByName('masterRatesActive').AsBoolean := cbxMasterRateActive.Checked;
  except
  end;


  try
    rSethotelconfigurations.FieldByName('Proformaheader').AsString := edProformaheader.text;
  except
    rSethotelconfigurations.FieldByName('Proformaheader').AsString := 'Proforma';
  end;


  try
    rSethotelconfigurations.FieldByName('forceExternalProductIdCorrectness').AsBoolean := chkforceExternalProductIdCorrectness.Checked;
  except
  end;

  try
    rSethotelconfigurations.FieldByName('ForceExternalPaymentTypeIdCorrectness').AsBoolean :=  chkForceExternalPaymentTypeIdCorrectness.Checked;
  except
  end;


  try
    rSethotelconfigurations.FieldByName('MakeRoomsDirtyOvernight').AsBoolean := ChkMakeRoomsDirtyOvernight.Checked;
  except
  end;

  try
    if cbxQuery.ItemIndex >= 0 then
      rSethotelconfigurations.FieldByName('DefaultChannelConfirmationEmail').AsString := cbxQuery.Items[cbxQuery.ItemIndex]
    else
      rSethotelconfigurations.FieldByName('DefaultChannelConfirmationEmail').AsString := '';
  except
  end;

  try
    if cbxInvoiceExport.ItemIndex >= 0 then
      rSethotelconfigurations.FieldByName('InvoiceExportFilename').AsString := cbxInvoiceExport.Items[cbxInvoiceExport.ItemIndex]
    else
      rSethotelconfigurations.FieldByName('InvoiceExportFilename').AsString := '';
  except
  end;

  g.qRoomInvoiceRoomRentIndex := edtRIIndexRoomRent.Value - 1;
  g.qRoomInvoicePosItemIndex := edtRIIndexPosItems.Value - 1;
  g.qGroupInvoiceRoomRentIndex := edtGIIndexRoomRent.Value - 1;
  g.qGroupInvoicePosItemIndex := edtGIIndexPosItems.Value - 1;
  rSethotelconfigurations.FieldByName('RoomInvoiceRoomRentIndex').AsInteger := g.qRoomInvoiceRoomRentIndex;
  rSethotelconfigurations.FieldByName('RoomInvoicePosItemIndex').AsInteger := g.qRoomInvoicePosItemIndex;
  rSethotelconfigurations.FieldByName('GroupInvoiceRoomRentIndex').AsInteger := g.qGroupInvoiceRoomRentIndex;
  rSethotelconfigurations.FieldByName('GroupInvoicePosItemIndex').AsInteger := g.qGroupInvoicePosItemIndex;


  iTmp := edexpensiveChannelsLevelFrom.value;
  rSethotelconfigurations.FieldByName('expensiveChannelsLevelFrom').asFloat := iTmp;

  springStartsMonth := __cbxSpringStartsMonth.itemindex+1;
  SummerStartsMonth := __cbxsummerStartsMonth.itemindex+1;
  autumnStartsMonth := __cbxAutumnStartsMonth.itemindex+1;
  winterStartsMonth := __cbxWinterStartsMonth.itemindex+1;

  springStartsDay := edSpringStartsDay.value;
  SummerStartsDay := edSummerStartsDay.value;
  autumnStartsDay := edAutumnStartsDay.value;
  winterStartsDay := edWinterStartsDay.value;

  stmp := _glob._intPadZeroLeft(springStartsDay,2)+'-'+_glob._intPadZeroLeft(springStartsMonth,2);
  rSethotelconfigurations.FieldByName('SpringStarts').AsString :=  sTmp;

  stmp := _glob._intPadZeroLeft(SummerStartsDay,2)+'-'+_glob._intPadZeroLeft(SummerStartsMonth,2);
  rSethotelconfigurations.FieldByName('SummerStarts').AsString :=  sTmp;

  stmp := _glob._intPadZeroLeft(AutumnStartsDay,2)+'-'+_glob._intPadZeroLeft(AutumnStartsMonth,2);
  rSethotelconfigurations.FieldByName('AutumnStarts').AsString :=  sTmp;

  stmp := _glob._intPadZeroLeft(WinterStartsDay,2)+'-'+_glob._intPadZeroLeft(WinterStartsMonth,2);
  rSethotelconfigurations.FieldByName('WinterStarts').AsString :=  sTmp;

  rSethotelconfigurations.post;


  r_.edit;
  r_.fieldbyname('CustLast').AsInteger   := edCustIdLast.value;
  r_.fieldbyname('CustLength').AsInteger := edCustIdLength.value;
  r_.fieldbyname('CustFill').AsString    := edCustIdFill.Text;
  r_.Post; //ID OK

  g.qInvoiceFormFileISL := edInvoiceFormFileISL.Text;
  g.qInvoiceFormFileERL := edInvoiceFormFileERL.Text;
  g.qShowSideBar := chkShowSideBar.checked;

  idx := cbxInvoicePrinter.ItemIndex;
  if idx = 0 then
  begin
    g.qInvoicePrinter := '';
  end
  else
  begin
    g.qInvoicePrinter := cbxInvoicePrinter.Items[idx];
  end;

  idx := cbxReportPrinter.ItemIndex;
  if idx = 0 then
  begin
    g.qReportPrinter := '';
  end
  else
  begin
    g.qReportPrinter := cbxReportPrinter.Items[idx];
  end;

  g.ProcessAppIni(1);
end;


procedure TfrmControlData.btnInvoiceTemplateResourcesClick(Sender: TObject);
var idx : Integer;
begin
  frmMain.dxBarLargeButton4Click(nil);
  idx := cbxInvoiceExport.ItemIndex;
  cbxInvoiceExport.Items.Clear;
  cbxInvoiceExport.Items.AddStrings(StaticResourceList(ANY_FILE));
  cbxInvoiceExport.ItemIndex := idx;
end;

procedure TfrmControlData.btnSynchronizeFinanceTablesClick(Sender: TObject);
begin
  __SyncResult.Caption := d.RoomerMainDataSet.SyncFinanceTables;
end;

procedure TfrmControlData.btnResourcesClick(Sender: TObject);
var idx : Integer;
begin
  frmMain.ShowBookingConfirmationTemplates;
  idx := cbxQuery.ItemIndex;
  cbxQuery.Items.Clear;
  cbxQuery.Items.AddStrings(StaticResourceList(GUEST_EMAIL_TEMPLATE));
  cbxQuery.ItemIndex := idx;
end;

procedure TfrmControlData.btnCancelClick(Sender: TObject);
begin
  d.Get_All_StatusAttributes;
end;

procedure TfrmControlData.__cbxSpringStartsMonthChange(Sender: TObject);
var
  Month : integer;
  maxDays : integer;
begin
  Month := __cbxSpringStartsMonth.itemindex+1;
  MaxDays := DaysInAMonth(2001, Month);
  if edSpringStartsday.Value > MaxDays then edSpringStartsday.Value := MaxDays;
  edSpringStartsday.MaxValue := maxdays;
end;

procedure TfrmControlData.__cbxsummerStartsMonthChange(Sender: TObject);
var
  Month : integer;
  maxDays : integer;
begin
  Month := __cbxsummerStartsMonth.itemindex+1;
  MaxDays := DaysInAMonth(2001, Month);
  if edSummerStartsday.Value > MaxDays then edSummerStartsday.Value := MaxDays;
  edSummerStartsday.MaxValue := maxdays;
end;



procedure TfrmControlData.__cbxAutumnStartsMonthChange(Sender: TObject);
var
  Month : integer;
  maxDays : integer;
begin
  Month := __cbxAutumnStartsMonth.itemindex+1;
  MaxDays := DaysInAMonth(2001, Month);
  if edAutumnStartsday.Value > MaxDays then edAutumnStartsday.Value := MaxDays;
  edAutumnStartsday.MaxValue := maxdays;
end;

procedure TfrmControlData.__cbxWinterStartsMonthChange(Sender: TObject);
var
  Month : integer;
  maxDays : integer;
begin
  Month := __cbxWinterStartsMonth.itemindex+1;
  MaxDays := DaysInAMonth(2001, Month);
  if edWinterStartsday.Value > MaxDays then edWinterStartsday.Value := MaxDays;
  edWinterStartsday.MaxValue := maxdays;
end;


procedure TfrmControlData.edChannelManagerDblClick(Sender: TObject);
begin
  if getChannelManager(edChannelmanager, labChannelManager) then
  begin

  end;
end;

procedure TfrmControlData.edConfirmMinuteOfTheDayChange(Sender: TObject);
var
  minute : integer;
  hour   : integer;
  s : string;
  minuteOfTheDay : integer;
begin
  minuteofTheday := edConfirmMinuteOfTheDay.value;
  Hour := minuteOfTheDay div 60;
  minute := minuteOfTheDay mod 60;
  sLabel10.Caption :=  _glob._strPadZeroL(inttostr(Hour),2)+':'+_glob._strPadZeroL(inttostr(minute),2);
end;

procedure TfrmControlData.edCountryDblClick(Sender: TObject);
begin
  if getCountry(edCountry, labCountry) then
  begin
  end;
end;

// ******************************************************************************

procedure TfrmControlData.FormCreate(Sender : TObject);
var
  s : string;
  i : Integer;
  ExecutionPlan : TRoomerExecutionPlan;
begin
  RoomerLanguage.TranslateThisForm(self);
  glb.PerformAuthenticationAssertion(self);

  glb.fillListWithMonthsLong(__cbxSpringStartsMonth.Items, 0);
  glb.fillListWithMonthsLong(__cbxsummerStartsMonth.Items, 0);
  glb.fillListWithMonthsLong(__cbxAutumnStartsMonth.Items, 0);
  glb.fillListWithMonthsLong(__cbxWinterStartsMonth.Items, 0);

  financeCustomerList := nil;
  financeLookupList := nil;
//  Width := 940;
  gridFont := TFont.Create;
  grid5DayFont := TFont.Create;

  for i := 0 to PageAccount.PageCount - 1 do
    PageAccount.Pages[i].TabVisible := false;

  //rSet := CreateNewDataSet;
  ExecutionPlan := d.roomerMainDataSet.CreateExecutionPlan;

  //  s := 'select * from Control';
  s := format(select_ControlData_FormCreate , []);
  ExecutionPlan.AddQuery(s);
//  hData.rSet_bySQL(rSet,s);


//  r_ := CreateNewDataSet;
  // s := s + 'select * from tblINC';
  s := format(select_tblInc_All, []);
  ExecutionPlan.AddQuery(s);
//  hData.rSet_bySQL(r_,s);

  s := 'SELECT * FROM hotelconfigurations';
  ExecutionPlan.AddQuery(s);


  try
    LoadColors(ExecutionPlan);
  except
  end;
  rSet := ExecutionPlan.Results[0];
  r_ := ExecutionPlan.Results[1];
  rSetHotelConfigurations := ExecutionPlan.Results[2];


  rSet.first;
  r_.first;
  rSetHotelConfigurations.First;
  updatePanColor;
end;

procedure TfrmControlData.FormClose(Sender : TObject; var Action : TCloseAction);
begin
  if rSet.Active then
    rSet.Close;
  if r_.Active then
    r_.Close;

  freeandNil(rSet);
  freeandNil(r_);

  glb.ForceTableRefresh;

end;

procedure TfrmControlData.FormShow(Sender : TObject);
var
  TN : TTreeNode;
  i : Integer;
  idx : Integer;
begin
  for i := 0 to mainPage.PageCount - 1 do
  begin
    mainPage.Pages[i].TabVisible := false;
  end;

  cbxQuery.Items.Clear;
  cbxQuery.Items.AddStrings(StaticResourceList(GUEST_EMAIL_TEMPLATE));
  cbxInvoiceExport.Items.AddStrings(StaticResourceList(ANY_FILE));

  fcCurrentFontName.Font.Name := gridFont.name;
  fcCurrentFontName.ItemIndex := fcCurrentFontName.Items.IndexOf(fcCurrentFontName.Font.Name);
  fcCurrentFontName.Font.size := gridFont.size;
  edCurrentFontSize.value := gridFont.size;

  fc5DayFontName.Font.Name := grid5DayFont.name;
  fc5DayFontName.ItemIndex := fc5DayFontName.Items.IndexOf(fc5DayFontName.Font.Name);
  fc5DayFontName.Font.size := grid5DayFont.size;
  ed5DayFontSize.value := grid5DayFont.size;

  TreeView1.RowSelect := TRUE;
  TN := TreeView1.Items.GetFirstNode;
  for i := 0 to TreeView1.Items.Count - 1 do
  begin
    TN := TreeView1.Items.item[i];
    if TN <> nil then
      TN.Expand(TRUE); // that node and all its children expand}
  end;

  TN := TreeView1.Items.GetFirstNode;
  idx := TN.SelectedIndex;
  TN.Selected := TRUE;

  if idx = 0 then
  begin
    //labHeader.Caption := 'Veldu undirli� ' + TN.Text;
	 labHeader.Caption := format(GetTranslatedText('shTx_ControlData_Indent'), [TN.Text]);
  end
  else
  begin
    labHeader.Caption := TN.Text;
  end;

  try
  mainPage.ActivePageIndex := idx;
  except end;


  //***** LMDLImage1.ListIndex := idx;

  cbxInvoicePrinter.Items.Assign(Printer.Printers);
  cbxInvoicePrinter.Items.Insert(0, 'Default Printer');
  cbxReportPrinter.Items.Assign(cbxInvoicePrinter.Items);

  LoadTable;
  cbxStatusAttr_.ItemIndex := 0;
  setColorControls;
end;

procedure TfrmControlData.okBtnClick(Sender : TObject);
begin

  if trim(editCompanyID.text) = '' then
  begin
    exit;
  end;

  gridFont.name := fcCurrentFontName.Font.Name;
  gridFont.size := edCurrentFontSize.Value;

  grid5DayFont.name := fc5DayFontName.Font.Name;
  grid5DayFont.size := ed5DayFontSize.Value;

  SaveTable;

  d.save_StatusAttr_GuestStaying;
  d.save_StatusAttr_GuestLeavingNextDay;
  d.save_StatusAttr_Departed;
  d.save_StatusAttr_Departing;
  d.save_StatusAttr_Allotment;
  d.save_StatusAttr_Waitinglist;
  d.Save_StatusAttr_NoShow;
  d.save_StatusAttr_Blocked;
  d.save_StatusAttr_ArrivingOtherLeaving;
  d.save_StatusAttr_order;
  d.save_StatusAttr_canceled;
  d.save_StatusAttr_tmp1;
  d.save_StatusAttr_tmp2;

end;

procedure TfrmControlData.panBtnResize(Sender : TObject);
begin
  SetBtnPos;
end;

procedure TfrmControlData.panGuestStayingDblClick(Sender : TObject);
var
  tag : Integer;
begin
  tag := (Sender as TPanel).tag;
  cbxStatusAttr_.ItemIndex := tag;
  setColorControls;
end;

procedure TfrmControlData.TreeView1Change(Sender : TObject; Node : TTreeNode);
var
  idx : Integer;
begin
  idx := TreeView1.Selected.SelectedIndex;
  try
  mainPage.ActivePageIndex := idx;
  except end;
  //****** LMDLImage1.ListIndex := idx;

  if idx = 0 then
  begin
    //labHeader.Caption := 'Veldu undirli� ' + Node.Text;
	labHeader.Caption := format(GetTranslatedText('shTx_ControlData_Indent'), [Node.Text]);
  end
  else
  begin
    labHeader.Caption := Node.Text;
  end;
end;

procedure TfrmControlData.FormDestroy(Sender : TObject);
begin
  gridFont.Free;
  grid5DayFont.Free;
  financeCustomerList.Free;
  financeLookupList.Free;
end;

procedure TfrmControlData.itemLookup(edit : TsComboEdit; lab : TsLabel);
var
  s : string;
  theData : recItemHolder;
begin
  initItemHolder(theData);
  theData.Item := edit.text;
  OpenItems(actLookup, true, theData);
  s := theData.Item;
  if s = '' then
    exit;

  if s <> edit.Text then
  begin
    edit.Text := s;
    lab.Caption := theData.Description;
  end;
end;


procedure TfrmControlData.btnUpdateAllColorsClick(Sender : TObject);
begin
  UpdateAllColors;
end;

procedure TfrmControlData.btnUpdateOneColorClick(Sender : TObject);
begin
  UpdateOneColor;
end;

procedure TfrmControlData.UpdateOneColor;
var
  BackgroundColor : TColor;
  FontColor : TColor;
  isBold : boolean;
  isItalic : boolean;
  isUnderLine : boolean;
  isStrikeOut : boolean;
  idx : Integer;

  index : Integer;
begin
  BackgroundColor := cbxBackColor.SelectedColor; // cbxBackColor.ColorValue;
  FontColor := cbxFontColor.SelectedColor; // cbxFontColor.ColorValue;
  isBold := chkBold.checked;
  isItalic := chkItalic.checked;
  isUnderLine := chkUnderline.checked;
  isStrikeOut := chkStrikeOut.checked;

  index := cbxStatusAttr_.ItemIndex;
  case index of
    0 :
      begin
        g.qStatusAttr_GuestStaying.BackgroundColor := BackgroundColor;
        g.qStatusAttr_GuestStaying.FontColor := FontColor;
        g.qStatusAttr_GuestStaying.isBold := isBold;
        g.qStatusAttr_GuestStaying.isItalic := isItalic;
        g.qStatusAttr_GuestStaying.isUnderLine := isUnderLine;
        g.qStatusAttr_GuestStaying.isStrikeOut := isStrikeOut;
      end;
    1 :
      begin
        g.qStatusAttr_GuestLeavingNextDay.BackgroundColor := BackgroundColor;
        g.qStatusAttr_GuestLeavingNextDay.FontColor := FontColor;
        g.qStatusAttr_GuestLeavingNextDay.isBold := isBold;
        g.qStatusAttr_GuestLeavingNextDay.isItalic := isItalic;
        g.qStatusAttr_GuestLeavingNextDay.isUnderLine := isUnderLine;
        g.qStatusAttr_GuestLeavingNextDay.isStrikeOut := isStrikeOut;
      end;
    2 :
      begin
        g.qStatusAttr_Departing.BackgroundColor := BackgroundColor;
        g.qStatusAttr_Departing.FontColor := FontColor;
        g.qStatusAttr_Departing.isBold := isBold;
        g.qStatusAttr_Departing.isItalic := isItalic;
        g.qStatusAttr_Departing.isUnderLine := isUnderLine;
        g.qStatusAttr_Departing.isStrikeOut := isStrikeOut;
      end;
    3 :
      begin
        g.qStatusAttr_Order.BackgroundColor := BackgroundColor;
        g.qStatusAttr_Order.FontColor := FontColor;
        g.qStatusAttr_Order.isBold := isBold;
        g.qStatusAttr_Order.isItalic := isItalic;
        g.qStatusAttr_Order.isUnderLine := isUnderLine;
        g.qStatusAttr_Order.isStrikeOut := isStrikeOut;
      end;
    4 :
      begin
        g.qStatusAttr_Allotment.BackgroundColor := BackgroundColor;
        g.qStatusAttr_Allotment.FontColor := FontColor;
        g.qStatusAttr_Allotment.isBold := isBold;
        g.qStatusAttr_Allotment.isItalic := isItalic;
        g.qStatusAttr_Allotment.isUnderLine := isUnderLine;
        g.qStatusAttr_Allotment.isStrikeOut := isStrikeOut;
      end;
    5 :
      begin
        g.qStatusAttr_Waitinglist.BackgroundColor := BackgroundColor;
        g.qStatusAttr_Waitinglist.FontColor := FontColor;
        g.qStatusAttr_Waitinglist.isBold := isBold;
        g.qStatusAttr_Waitinglist.isItalic := isItalic;
        g.qStatusAttr_Waitinglist.isUnderLine := isUnderLine;
        g.qStatusAttr_Waitinglist.isStrikeOut := isStrikeOut;
      end;
    6 :
      begin
        g.qStatusAttr_ArrivingOtherLeaving.BackgroundColor := BackgroundColor;
        g.qStatusAttr_ArrivingOtherLeaving.FontColor := FontColor;
        g.qStatusAttr_ArrivingOtherLeaving.isBold := isBold;
        g.qStatusAttr_ArrivingOtherLeaving.isItalic := isItalic;
        g.qStatusAttr_ArrivingOtherLeaving.isUnderLine := isUnderLine;
        g.qStatusAttr_ArrivingOtherLeaving.isStrikeOut := isStrikeOut;
      end;
    7 :
      begin
        g.qStatusAttr_Departed.BackgroundColor := BackgroundColor;
        g.qStatusAttr_Departed.FontColor := FontColor;
        g.qStatusAttr_Departed.isBold := isBold;
        g.qStatusAttr_Departed.isItalic := isItalic;
        g.qStatusAttr_Departed.isUnderLine := isUnderLine;
        g.qStatusAttr_Departed.isStrikeOut := isStrikeOut;
      end;
    8 :
      begin
        g.qStatusAttr_NoShow.BackgroundColor := BackgroundColor;
        g.qStatusAttr_NoShow.FontColor := FontColor;
        g.qStatusAttr_NoShow.isBold := isBold;
        g.qStatusAttr_NoShow.isItalic := isItalic;
        g.qStatusAttr_NoShow.isUnderLine := isUnderLine;
        g.qStatusAttr_NoShow.isStrikeOut := isStrikeOut;
      end;
    9 :
      begin
        g.qStatusAttr_Blocked.BackgroundColor := BackgroundColor;
        g.qStatusAttr_Blocked.FontColor := FontColor;
        g.qStatusAttr_Blocked.isBold := isBold;
        g.qStatusAttr_Blocked.isItalic := isItalic;
        g.qStatusAttr_Blocked.isUnderLine := isUnderLine;
        g.qStatusAttr_Blocked.isStrikeOut := isStrikeOut;
      end;
    10 :
      begin
        g.qStatusAttr_Canceled.BackgroundColor := BackgroundColor;
        g.qStatusAttr_Canceled.FontColor := FontColor;
        g.qStatusAttr_Canceled.isBold := isBold;
        g.qStatusAttr_Canceled.isItalic := isItalic;
        g.qStatusAttr_Canceled.isUnderLine := isUnderLine;
        g.qStatusAttr_Canceled.isStrikeOut := isStrikeOut;
      end;
    11 :
      begin
        g.qStatusAttr_Tmp1.BackgroundColor := BackgroundColor;
        g.qStatusAttr_Tmp1.FontColor := FontColor;
        g.qStatusAttr_Tmp1.isBold := isBold;
        g.qStatusAttr_Tmp1.isItalic := isItalic;
        g.qStatusAttr_Tmp1.isUnderLine := isUnderLine;
        g.qStatusAttr_Tmp1.isStrikeOut := isStrikeOut;
      end;
    12 :
      begin
        g.qStatusAttr_Tmp2.BackgroundColor := BackgroundColor;
        g.qStatusAttr_Tmp2.FontColor := FontColor;
        g.qStatusAttr_Tmp2.isBold := isBold;
        g.qStatusAttr_Tmp2.isItalic := isItalic;
        g.qStatusAttr_Tmp2.isUnderLine := isUnderLine;
        g.qStatusAttr_Tmp2.isStrikeOut := isStrikeOut;
      end;

  end;
end;

procedure TfrmControlData.UpdateAllColors;
var
  BackgroundColor : TColor;
  FontColor : TColor;
  isBold : boolean;
  isItalic : boolean;
  isUnderLine : boolean;
  isStrikeOut : boolean;
  idx : Integer;
  index : Integer;

  Font : TFont;

begin
  g.qStatusAttr_GuestStaying.BackgroundColor := panGuestStaying.Color;
  Font := panGuestStaying.Font;
  with Font do
  begin
    g.qStatusAttr_GuestStaying.FontColor := Color;
    g.qStatusAttr_GuestStaying.isBold := (fsBold in Style);
    g.qStatusAttr_GuestStaying.isItalic := (fsItalic in Style);
    g.qStatusAttr_GuestStaying.isUnderLine := (fsUnderLine in Style);
    g.qStatusAttr_GuestStaying.isStrikeOut := (fsStrikeOut in Style);
  end;

  g.qStatusAttr_GuestLeavingNextDay.BackgroundColor := panGuestLeavingNextDay.Color;
  Font := panGuestLeavingNextDay.Font;
  with Font do
  begin
    g.qStatusAttr_GuestLeavingNextDay.FontColor := Color;
    g.qStatusAttr_GuestLeavingNextDay.isBold := (fsBold in Style);
    g.qStatusAttr_GuestLeavingNextDay.isItalic := (fsItalic in Style);
    g.qStatusAttr_GuestLeavingNextDay.isUnderLine := (fsUnderLine in Style);
    g.qStatusAttr_GuestLeavingNextDay.isStrikeOut := (fsStrikeOut in Style);
  end;

  g.qStatusAttr_Departing.BackgroundColor := panDeparting.Color;
  Font := panDeparting.Font;
  with Font do
  begin
    g.qStatusAttr_Departing.FontColor := Color;
    g.qStatusAttr_Departing.isBold := (fsBold in Style);
    g.qStatusAttr_Departing.isItalic := (fsItalic in Style);
    g.qStatusAttr_Departing.isUnderLine := (fsUnderLine in Style);
    g.qStatusAttr_Departing.isStrikeOut := (fsStrikeOut in Style);
  end;

  g.qStatusAttr_Order.BackgroundColor := panOrder.Color;
  Font := panOrder.Font;
  with Font do
  begin
    g.qStatusAttr_Order.FontColor := Color;
    g.qStatusAttr_Order.isBold := (fsBold in Style);
    g.qStatusAttr_Order.isItalic := (fsItalic in Style);
    g.qStatusAttr_Order.isUnderLine := (fsUnderLine in Style);
    g.qStatusAttr_Order.isStrikeOut := (fsStrikeOut in Style);
  end;

  g.qStatusAttr_Allotment.BackgroundColor := panAllotment.Color;
  Font := panAllotment.Font;
  with Font do
  begin
    g.qStatusAttr_Allotment.FontColor := Color;
    g.qStatusAttr_Allotment.isBold := (fsBold in Style);
    g.qStatusAttr_Allotment.isItalic := (fsItalic in Style);
    g.qStatusAttr_Allotment.isUnderLine := (fsUnderLine in Style);
    g.qStatusAttr_Allotment.isStrikeOut := (fsStrikeOut in Style);
  end;

  g.qStatusAttr_Waitinglist.BackgroundColor := panWaitingList.Color;
  Font := panWaitingList.Font;
  with Font do
  begin
    g.qStatusAttr_Waitinglist.FontColor := Color;
    g.qStatusAttr_Waitinglist.isBold := (fsBold in Style);
    g.qStatusAttr_Waitinglist.isItalic := (fsItalic in Style);
    g.qStatusAttr_Waitinglist.isUnderLine := (fsUnderLine in Style);
    g.qStatusAttr_Waitinglist.isStrikeOut := (fsStrikeOut in Style);
  end;

  g.qStatusAttr_ArrivingOtherLeaving.BackgroundColor := panArrivingOtherLeaving.Color;
  Font := panArrivingOtherLeaving.Font;
  with Font do
  begin
    g.qStatusAttr_ArrivingOtherLeaving.FontColor := Color;
    g.qStatusAttr_ArrivingOtherLeaving.isBold := (fsBold in Style);
    g.qStatusAttr_ArrivingOtherLeaving.isItalic := (fsItalic in Style);
    g.qStatusAttr_ArrivingOtherLeaving.isUnderLine := (fsUnderLine in Style);
    g.qStatusAttr_ArrivingOtherLeaving.isStrikeOut := (fsStrikeOut in Style);
  end;

  g.qStatusAttr_Departed.BackgroundColor := panDeparted.Color;
  Font := panDeparted.Font;
  with Font do
  begin
    g.qStatusAttr_Departed.FontColor := Color;
    g.qStatusAttr_Departed.isBold := (fsBold in Style);
    g.qStatusAttr_Departed.isItalic := (fsItalic in Style);
    g.qStatusAttr_Departed.isUnderLine := (fsUnderLine in Style);
    g.qStatusAttr_Departed.isStrikeOut := (fsStrikeOut in Style);
  end;

  g.qStatusAttr_NoShow.BackgroundColor := panNoShow.Color;
  Font := panNoShow.Font;
  with Font do
  begin
    g.qStatusAttr_NoShow.FontColor := Color;
    g.qStatusAttr_NoShow.isBold := (fsBold in Style);
    g.qStatusAttr_NoShow.isItalic := (fsItalic in Style);
    g.qStatusAttr_NoShow.isUnderLine := (fsUnderLine in Style);
    g.qStatusAttr_NoShow.isStrikeOut := (fsStrikeOut in Style);
  end;

  g.qStatusAttr_Blocked.BackgroundColor := panBlocked.Color;
  Font := panBlocked.Font;
  with Font do
  begin
    g.qStatusAttr_Blocked.FontColor := Color;
    g.qStatusAttr_Blocked.isBold := (fsBold in Style);
    g.qStatusAttr_Blocked.isItalic := (fsItalic in Style);
    g.qStatusAttr_Blocked.isUnderLine := (fsUnderLine in Style);
    g.qStatusAttr_Blocked.isStrikeOut := (fsStrikeOut in Style);
  end;

  g.qStatusAttr_Canceled.BackgroundColor := panCanceled.Color;
  Font := panCanceled.Font;
  with Font do
  begin
    g.qStatusAttr_Canceled.FontColor := Color;
    g.qStatusAttr_Canceled.isBold := (fsBold in Style);
    g.qStatusAttr_Canceled.isItalic := (fsItalic in Style);
    g.qStatusAttr_Canceled.isUnderLine := (fsUnderLine in Style);
    g.qStatusAttr_Canceled.isStrikeOut := (fsStrikeOut in Style);
  end;

  g.qStatusAttr_Tmp1.BackgroundColor := panTmp1.Color;
  Font := panTmp1.Font;
  with Font do
  begin
    g.qStatusAttr_Tmp1.FontColor := Color;
    g.qStatusAttr_Tmp1.isBold := (fsBold in Style);
    g.qStatusAttr_Tmp1.isItalic := (fsItalic in Style);
    g.qStatusAttr_Tmp1.isUnderLine := (fsUnderLine in Style);
    g.qStatusAttr_Tmp1.isStrikeOut := (fsStrikeOut in Style);
  end;

  g.qStatusAttr_Tmp2.BackgroundColor := panTmp2.Color;
  Font := panTmp2.Font;
  with Font do
  begin
    g.qStatusAttr_Tmp2.FontColor := Color;
    g.qStatusAttr_Tmp2.isBold := (fsBold in Style);
    g.qStatusAttr_Tmp2.isItalic := (fsItalic in Style);
    g.qStatusAttr_Tmp2.isUnderLine := (fsUnderLine in Style);
    g.qStatusAttr_Tmp2.isStrikeOut := (fsStrikeOut in Style);
  end;


end;

procedure TfrmControlData.btnAllColorsToDefaultClick(Sender : TObject);
var i, i1 : integer;
begin
  i1 := cbxStatusAttr_.ItemIndex;

  d.Default_StatusAttr_GuestStaying;
  d.Default_StatusAttr_GuestLeavingNextDay;
  d.Default_StatusAttr_Departing;
  d.Default_StatusAttr_Order;
  d.Default_StatusAttr_Allotment;
  d.Default_StatusAttr_Waitinglist;
  d.Default_StatusAttr_ArrivingOtherLeaving;
  d.Default_StatusAttr_Departed;
  d.Default_StatusAttr_NoShow;
  d.Default_StatusAttr_Blocked;
  d.Default_StatusAttr_canceled;
  d.Default_StatusAttr_tmp1;
  d.Default_StatusAttr_tmp2;

  for i := 0 to cbxStatusAttr_.Items.Count - 1 do
  begin
    cbxStatusAttr_.ItemIndex := i;
    application.processmessages;
    setColorControls;
    ShowPanelColor;
  end;

end;

procedure TfrmControlData.btnOneColorToDefaultClick(Sender : TObject);
var
  index : Integer;
begin
  index := cbxStatusAttr_.ItemIndex;
  case index of
    0 :
      begin
        d.Default_StatusAttr_GuestStaying;
      end;
    1 :
      begin
        d.Default_StatusAttr_GuestLeavingNextDay
      end;
    2 :
      begin
        d.Default_StatusAttr_Departing
      end;
    3 :
      begin
        d.Default_StatusAttr_Order
      end;
    4 :
      begin
        d.Default_StatusAttr_Allotment
      end;
    5 :
      begin
        d.Default_StatusAttr_Waitinglist
      end;
    6 :
      begin
        d.Default_StatusAttr_ArrivingOtherLeaving
      end;
    7 :
      begin
        d.Default_StatusAttr_Departed
      end;
    8 :
      begin
        d.Default_StatusAttr_NoShow
      end;
    9 :
      begin
        d.Default_StatusAttr_Blocked
      end;
   10 :
      begin
        d.Default_StatusAttr_canceled
      end;
   11 :
      begin
        d.Default_StatusAttr_tmp1
      end;
   12 :
      begin
        d.Default_StatusAttr_tmp2
      end;
  end;
  setColorControls;
  ShowPanelColor;
end;

procedure TfrmControlData.ShowPanelColor;
var
  BackgroundColor : TColor;
  FontColor : TColor;
  isBold : boolean;
  isItalic : boolean;
  isUnderLine : boolean;
  isStrikeOut : boolean;
  idx : Integer;
  index : Integer;
begin

  BackgroundColor := cbxBackColor.SelectedColor; // cbxBackColor.ColorValue;
  FontColor := cbxFontColor.SelectedColor; // cbxFontColor.ColorValue;
  isBold := chkBold.checked;
  isItalic := chkItalic.checked;
  isUnderLine := chkUnderline.checked;
  isStrikeOut := chkStrikeOut.checked;

  index := cbxStatusAttr_.ItemIndex;

  case index of
    0 :
      begin
        panGuestStaying.Color := BackgroundColor;
        panGuestStaying.Font.Color := FontColor;
        panGuestStaying.Font.Style := [];
        if isBold then
          panGuestStaying.Font.Style := panGuestStaying.Font.Style + [fsBold];
        if isItalic then
          panGuestStaying.Font.Style := panGuestStaying.Font.Style + [fsItalic];
        if isUnderLine then
          panGuestStaying.Font.Style := panGuestStaying.Font.Style + [fsUnderLine];
        if isStrikeOut then
          panGuestStaying.Font.Style := panGuestStaying.Font.Style + [fsStrikeOut];
      end;


    1 :
      begin
        panGuestLeavingNextDay.Color := BackgroundColor;
        panGuestLeavingNextDay.Font.Color := FontColor;
        panGuestLeavingNextDay.Font.Style := [];
        if isBold then
          panGuestLeavingNextDay.Font.Style := panGuestLeavingNextDay.Font.Style + [fsBold];
        if isItalic then
          panGuestLeavingNextDay.Font.Style := panGuestLeavingNextDay.Font.Style + [fsItalic];
        if isUnderLine then
          panGuestLeavingNextDay.Font.Style := panGuestLeavingNextDay.Font.Style + [fsUnderLine];
        if isStrikeOut then
          panGuestLeavingNextDay.Font.Style := panGuestLeavingNextDay.Font.Style + [fsStrikeOut];
      end;

    2 :
      begin
        panDeparting.Color := BackgroundColor;
        panDeparting.Font.Color := FontColor;
        panDeparting.Font.Style := [];
        if isBold then
          panDeparting.Font.Style := panDeparting.Font.Style + [fsBold];
        if isItalic then
          panDeparting.Font.Style := panDeparting.Font.Style + [fsItalic];
        if isUnderLine then
          panDeparting.Font.Style := panDeparting.Font.Style + [fsUnderLine];
        if isStrikeOut then
          panDeparting.Font.Style := panDeparting.Font.Style + [fsStrikeOut];
      end;

    3 :
      begin
        panOrder.Color := BackgroundColor;
        panOrder.Font.Color := FontColor;
        panOrder.Font.Style := [];
        if isBold then
          panOrder.Font.Style := panOrder.Font.Style + [fsBold];
        if isItalic then
          panOrder.Font.Style := panOrder.Font.Style + [fsItalic];
        if isUnderLine then
          panOrder.Font.Style := panOrder.Font.Style + [fsUnderLine];
        if isStrikeOut then
          panOrder.Font.Style := panOrder.Font.Style + [fsStrikeOut];
      end;

    4 :
      begin
        panAllotment.Color := BackgroundColor;
        panAllotment.Font.Color := FontColor;
        panAllotment.Font.Style := [];
        if isBold then
          panAllotment.Font.Style := panAllotment.Font.Style + [fsBold];
        if isItalic then
          panAllotment.Font.Style := panAllotment.Font.Style + [fsItalic];
        if isUnderLine then
          panAllotment.Font.Style := panAllotment.Font.Style + [fsUnderLine];
        if isStrikeOut then
          panAllotment.Font.Style := panAllotment.Font.Style + [fsStrikeOut];
      end;

    5 :
      begin
        panWaitingList.Color := BackgroundColor;
        panWaitingList.Font.Color := FontColor;
        panWaitingList.Font.Style := [];
        if isBold then
          panWaitingList.Font.Style := panWaitingList.Font.Style + [fsBold];
        if isItalic then
          panWaitingList.Font.Style := panWaitingList.Font.Style + [fsItalic];
        if isUnderLine then
          panWaitingList.Font.Style := panWaitingList.Font.Style + [fsUnderLine];
        if isStrikeOut then
          panWaitingList.Font.Style := panWaitingList.Font.Style + [fsStrikeOut];
      end;

    6 :
      begin
        panArrivingOtherLeaving.Color := BackgroundColor;
        panArrivingOtherLeaving.Font.Color := FontColor;
        panArrivingOtherLeaving.Font.Style := [];
        if isBold then
          panArrivingOtherLeaving.Font.Style := panArrivingOtherLeaving.Font.Style + [fsBold];
        if isItalic then
          panArrivingOtherLeaving.Font.Style := panArrivingOtherLeaving.Font.Style + [fsItalic];
        if isUnderLine then
          panArrivingOtherLeaving.Font.Style := panArrivingOtherLeaving.Font.Style + [fsUnderLine];
        if isStrikeOut then
          panArrivingOtherLeaving.Font.Style := panArrivingOtherLeaving.Font.Style + [fsStrikeOut];
      end;

    7 :
      begin
        panDeparted.Color := BackgroundColor;
        panDeparted.Font.Color := FontColor;
        panDeparted.Font.Style := [];
        if isBold then
          panDeparted.Font.Style := panDeparted.Font.Style + [fsBold];
        if isItalic then
          panDeparted.Font.Style := panDeparted.Font.Style + [fsItalic];
        if isUnderLine then
          panDeparted.Font.Style := panDeparted.Font.Style + [fsUnderLine];
        if isStrikeOut then
          panDeparted.Font.Style := panDeparted.Font.Style + [fsStrikeOut];
      end;

    8 :
      begin
        panNoShow.Color := BackgroundColor;
        panNoShow.Font.Color := FontColor;
        panNoShow.Font.Style := [];
        if isBold then
          panNoShow.Font.Style := panNoShow.Font.Style + [fsBold];
        if isItalic then
          panNoShow.Font.Style := panNoShow.Font.Style + [fsItalic];
        if isUnderLine then
          panNoShow.Font.Style := panNoShow.Font.Style + [fsUnderLine];
        if isStrikeOut then
          panNoShow.Font.Style := panNoShow.Font.Style + [fsStrikeOut];
      end;

    9 :
      begin
        panBlocked.Color := BackgroundColor;
        panBlocked.Font.Color := FontColor;
        panBlocked.Font.Style := [];
        if isBold then
          panBlocked.Font.Style := panBlocked.Font.Style + [fsBold];
        if isItalic then
          panBlocked.Font.Style := panBlocked.Font.Style + [fsItalic];
        if isUnderLine then
          panBlocked.Font.Style := panBlocked.Font.Style + [fsUnderLine];
        if isStrikeOut then
          panBlocked.Font.Style := panBlocked.Font.Style + [fsStrikeOut];
      end;
    10 :
      begin
        panCanceled.Color := BackgroundColor;
        panCanceled.Font.Color := FontColor;
        panCanceled.Font.Style := [];
        if isBold then
          panCanceled.Font.Style := panCanceled.Font.Style + [fsBold];
        if isItalic then
          panCanceled.Font.Style := panCanceled.Font.Style + [fsItalic];
        if isUnderLine then
          panCanceled.Font.Style := panCanceled.Font.Style + [fsUnderLine];
        if isStrikeOut then
          panCanceled.Font.Style := panCanceled.Font.Style + [fsStrikeOut];
      end;
    11 :
      begin
        panTmp1.Color := BackgroundColor;
        panTmp1.Font.Color := FontColor;
        panTmp1.Font.Style := [];
        if isBold then
          panTmp1.Font.Style := panTmp1.Font.Style + [fsBold];
        if isItalic then
          panTmp1.Font.Style := panTmp1.Font.Style + [fsItalic];
        if isUnderLine then
          panTmp1.Font.Style := panTmp1.Font.Style + [fsUnderLine];
        if isStrikeOut then
          panTmp1.Font.Style := panTmp1.Font.Style + [fsStrikeOut];
      end;
    12 :
      begin
        panTmp2.Color := BackgroundColor;
        panTmp2.Font.Color := FontColor;
        panTmp2.Font.Style := [];
        if isBold then
          panTmp2.Font.Style := panTmp2.Font.Style + [fsBold];
        if isItalic then
          panTmp2.Font.Style := panTmp2.Font.Style + [fsItalic];
        if isUnderLine then
          panTmp2.Font.Style := panTmp2.Font.Style + [fsUnderLine];
        if isStrikeOut then
          panTmp2.Font.Style := panTmp2.Font.Style + [fsStrikeOut];
      end;
  end;

end;

procedure TfrmControlData.sSpeedButton1Click(Sender: TObject);
var pIdValue : String;
    KeyValue : TKeyAndValue;
    CursorWas : SmallInt;
begin
  CursorWas := Screen.Cursor;
  Screen.Cursor := crHourglass; Application.ProcessMessages;
  try
    if NOT assigned(financeCustomerList) then
      financeCustomerList := d.RetrieveFinancesKeypair(FKP_CUSTOMERS);
    pIdValue := trim(edtInvoiceSystemCustomerTemplate.text);
    keyValue := selectFromKeyValuePairs('Customers', pIdValue, financeCustomerList);
    if Assigned(keyValue) then
    begin
      edtInvoiceSystemCustomerTemplate.text := keyValue.Key;
    end else
  finally
    Screen.Cursor := CursorWas; Application.ProcessMessages;
  end;
end;



procedure TfrmControlData.sSpeedButton2Click(Sender: TObject);
var pIdValue : String;
    KeyValue : TKeyAndValue;
    CursorWas : SmallInt;
begin
  CursorWas := Screen.Cursor;
  Screen.Cursor := crHourglass; Application.ProcessMessages;
  try
    if NOT assigned(financeLookupList) then
      financeLookupList := d.RetrieveFinancesKeypair(FKP_PRODUCTS);
    pIdValue := trim(edtInvoiceSystemProductTemplate.text);
    keyValue := selectFromKeyValuePairs('Products', pIdValue, financeLookupList);
    if Assigned(keyValue) then
    begin
      edtInvoiceSystemProductTemplate.text := keyValue.Key;
    end else
  finally
    Screen.Cursor := CursorWas; Application.ProcessMessages;
  end;
end;

procedure TfrmControlData.LoadColors(ExecutionPlan : TRoomerExecutionPlan);
var
  rSet : TRoomerDataSet;
  s : string;
  index : integer;
begin
  try

    s := format(select_ControlData_LoadColors , []);
    index := ExecutionPlan.AddQuery(s);
    if NOT ExecutionPlan.Execute(ptQuery) then
       raise Exception.Create(ExecutionPlan.ExecException);

//    cbxFontColor.Properties.CustomColors.Clear;
    rSet := ExecutionPlan.Results[index];
    rSet.First;
    while not rSet.Eof do
    begin
//      cbxBackColor.Properties.CustomColors.InsertColor(0, stringToColor(rSet.fieldbyname('ColorHex').AsString), rSet.fieldbyname
//          ('Description').AsString);
//      cbxFontColor.Properties.CustomColors.InsertColor(0, stringToColor(rSet.fieldbyname('ColorHex').AsString), rSet.fieldbyname
//          ('Description').AsString);
      rSet.Next;
    end;
  finally
    freeandNil(rSet);
  end;
end;


procedure TfrmControlData.editBreakFastItemCustomButtons0Click(Sender : TObject; index : Integer);
begin
  itemLookup(editBreakFastItem, labBreakFastItemDescription);
end;

procedure TfrmControlData.editBreakFastItemDblClick(Sender : TObject);
begin
  itemLookup(editBreakFastItem, labBreakFastItemDescription);
end;

procedure TfrmControlData.editRoomRentItemCustomButtons0Click(Sender : TObject; index : Integer);
begin
  itemLookup(editRoomRentItem, labRoomRentItemDescription);
end;

procedure TfrmControlData.editRoomRentItemDblClick(Sender : TObject);
begin
  itemLookup(editRoomRentItem, labRoomRentItemDescription);
end;

procedure TfrmControlData.editStayTaxItemDblClick(Sender : TObject);
begin
  itemLookup(editStayTaxItem, labStayTaxItemDescription);
end;

procedure TfrmControlData.edNativeCurrencyDblClick(Sender: TObject);
begin
  if getCurrency(edNativeCurrency, labNativeCurrency) then
  begin

  end;
end;

procedure TfrmControlData.edRackCustomerChange(Sender: TObject);
begin
 if customerValidate then
 begin
 end;
end;

procedure TfrmControlData.edRackCustomerDblClick(Sender : TObject);
var
  s : string;
  theData : recCustomerHolder;
begin
 theData.Customer := trim(edRackCustomer.text);
 if OpenCustomers(actLookup, true, theData) then
 begin
   s := theData.Customer;
   if (s <> '') and (s <> trim(edRackCustomer.text)) then
   begin
     edRackCustomer.text := s;
   end;
 end;
end;

procedure TfrmControlData.edRackCustomerExit(Sender: TObject);
begin
  if customerValidate then
  begin
  end;
end;

procedure TfrmControlData.editDiscountItemDblClick(Sender : TObject);
begin
  itemLookup(editDiscountItem, labDiscountItemDescription);
end;

procedure TfrmControlData.editPhoneUseItemDblClick(Sender : TObject);
begin
  itemLookup(editPhoneUseItem, labPhoneUseItemDescription);
end;

procedure TfrmControlData.editPaymentItemDblClick(Sender : TObject);
begin
  itemLookup(editPaymentItem, labPaymentItemDescription);
end;


procedure TfrmControlData.edinPosMonitorChkSecChange(Sender: TObject);
begin
calcRequestInterval;
end;

procedure TfrmControlData.edInvoiceFormFileERLChange(Sender: TObject);
begin
  if extractFileExt(edInvoiceFormFileERL.Filename) <> '.fr3' then
  begin
	  showmessage(format(GetTranslatedText('shTx_ControlData_NotAForm'), [edInvoiceFormFileERL.Filename]));
    edInvoiceFormFileERL.Filename := g.qInvoiceFormFileERL;
  end;
end;


procedure TfrmControlData.edInvoiceFormFileISLChange(Sender: TObject);
begin
  if extractFileExt(edInvoiceFormFileISL.Filename) <> '.fr3' then
  begin
	  showmessage(format(GetTranslatedText('shTx_ControlData_NotAForm'), [edInvoiceFormFileISL.Filename]));
    edInvoiceFormFileISL.Filename := g.qInvoiceFormFileISL;
  end;
end;

procedure TfrmControlData.edInvPriceGroupDblClick(Sender: TObject);
begin
   //**
  if getPayGroup(edInvPriceGroup, labInvPriceGroup) then
  begin

  end;

end;

procedure TfrmControlData.cbxAccountTypeChange(Sender : TObject);
begin
  PageAccount.ActivePageIndex := cbxAccountType.ItemIndex;
end;


procedure TfrmControlData.cbxBackColorPropertiesCloseUp(Sender : TObject);
begin
  ShowPanelColor;
end;

procedure TfrmControlData.cbxBackColorSelectColor(Sender: TObject; AColor: TColor);
begin
  ShowPanelColor;
end;

procedure TfrmControlData.edCallMinPriceChange(Sender : TObject);
begin
  if edCallMinPrice.value > 0 then
  begin
    edCallStartPrice.value := 0;
    edCallMinUnits.value := 0;
  end;
end;

procedure TfrmControlData.edCallMinUnitsChange(Sender : TObject);
begin
  if edCallMinUnits.value > 0 then
  begin
    edCallStartPrice.value := 0;
    edCallMinPrice.value := 0;
  end;
end;

procedure TfrmControlData.edCallStartPriceChange(Sender : TObject);
begin
  if edCallStartPrice.value > 0 then
  begin
    edCallMinUnits.value := 0;
    edCallMinPrice.value := 0;
  end;
end;

procedure TfrmControlData.cbxDeliveryTermsChange(Sender : TObject);
var
  sID : string;
begin
  sID := cbxDeliveryTerms.ComboItems.Items[cbxDeliveryTerms.ItemIndex].Strings[0];
  if _isInteger(sID) then
    LabswCust_lDeliveryTermsFK.Caption := sID;
end;

procedure TfrmControlData.cbxEmployeesChange(Sender : TObject);
var
  sID : string;
begin
  sID := cbxEmployees.ComboItems.Items[cbxEmployees.ItemIndex].Strings[0];
  if _isInteger(sID) then
    LabswCust_SalesPersonID.Caption := sID;
end;

procedure TfrmControlData.cbxFontColorPropertiesCloseUp(Sender : TObject);
begin
  ShowPanelColor;
end;


procedure TfrmControlData.cbxStatusAttr_CloseUp(Sender: TObject);
begin
  setColorControls
end;


procedure TfrmControlData.setColorControls;
var
  BackgroundColor : TColor;
  FontColor : TColor;
  isBold : boolean;
  isItalic : boolean;
  isUnderLine : boolean;
  isStrikeOut : boolean;
  idx : Integer;

  index : Integer;
begin
  index := cbxStatusAttr_.ItemIndex;

  case index of
    0 :
      begin
        BackgroundColor := g.qStatusAttr_GuestStaying.BackgroundColor;
        FontColor := g.qStatusAttr_GuestStaying.FontColor;
        isBold := g.qStatusAttr_GuestStaying.isBold;
        isItalic := g.qStatusAttr_GuestStaying.isItalic;
        isUnderLine := g.qStatusAttr_GuestStaying.isUnderLine;
        isStrikeOut := g.qStatusAttr_GuestStaying.isStrikeOut;
      end;
    1 :
      begin
        BackgroundColor := g.qStatusAttr_GuestLeavingNextDay.BackgroundColor;
        FontColor := g.qStatusAttr_GuestLeavingNextDay.FontColor;
        isBold := g.qStatusAttr_GuestLeavingNextDay.isBold;
        isItalic := g.qStatusAttr_GuestLeavingNextDay.isItalic;
        isUnderLine := g.qStatusAttr_GuestLeavingNextDay.isUnderLine;
        isStrikeOut := g.qStatusAttr_GuestLeavingNextDay.isStrikeOut;
      end;
    2 :
      begin
        BackgroundColor := g.qStatusAttr_Departing.BackgroundColor;
        FontColor := g.qStatusAttr_Departing.FontColor;
        isBold := g.qStatusAttr_Departing.isBold;
        isItalic := g.qStatusAttr_Departing.isItalic;
        isUnderLine := g.qStatusAttr_Departing.isUnderLine;
        isStrikeOut := g.qStatusAttr_Departing.isStrikeOut;
      end;
    3 :
      begin
        BackgroundColor := g.qStatusAttr_Order.BackgroundColor;
        FontColor := g.qStatusAttr_Order.FontColor;
        isBold := g.qStatusAttr_Order.isBold;
        isItalic := g.qStatusAttr_Order.isItalic;
        isUnderLine := g.qStatusAttr_Order.isUnderLine;
        isStrikeOut := g.qStatusAttr_Order.isStrikeOut;
      end;
    4 :
      begin
        BackgroundColor := g.qStatusAttr_Allotment.BackgroundColor;
        FontColor := g.qStatusAttr_Allotment.FontColor;
        isBold := g.qStatusAttr_Allotment.isBold;
        isItalic := g.qStatusAttr_Allotment.isItalic;
        isUnderLine := g.qStatusAttr_Allotment.isUnderLine;
        isStrikeOut := g.qStatusAttr_Allotment.isStrikeOut;

      end;
    5 :
      begin
        BackgroundColor := g.qStatusAttr_Waitinglist.BackgroundColor;
        FontColor := g.qStatusAttr_Waitinglist.FontColor;
        isBold := g.qStatusAttr_Waitinglist.isBold;
        isItalic := g.qStatusAttr_Waitinglist.isItalic;
        isUnderLine := g.qStatusAttr_Waitinglist.isUnderLine;
        isStrikeOut := g.qStatusAttr_Waitinglist.isStrikeOut;
      end;
    6 :
      begin
        BackgroundColor := g.qStatusAttr_ArrivingOtherLeaving.BackgroundColor;
        FontColor := g.qStatusAttr_ArrivingOtherLeaving.FontColor;
        isBold := g.qStatusAttr_ArrivingOtherLeaving.isBold;
        isItalic := g.qStatusAttr_ArrivingOtherLeaving.isItalic;
        isUnderLine := g.qStatusAttr_ArrivingOtherLeaving.isUnderLine;
        isStrikeOut := g.qStatusAttr_ArrivingOtherLeaving.isStrikeOut;
      end;
    7 :
      begin
        BackgroundColor := g.qStatusAttr_Departed.BackgroundColor;
        FontColor := g.qStatusAttr_Departed.FontColor;
        isBold := g.qStatusAttr_Departed.isBold;
        isItalic := g.qStatusAttr_Departed.isItalic;
        isUnderLine := g.qStatusAttr_Departed.isUnderLine;
        isStrikeOut := g.qStatusAttr_Departed.isStrikeOut;
      end;
    8 :
      begin
        BackgroundColor := g.qStatusAttr_NoShow.BackgroundColor;
        FontColor := g.qStatusAttr_NoShow.FontColor;
        isBold := g.qStatusAttr_NoShow.isBold;
        isItalic := g.qStatusAttr_NoShow.isItalic;
        isUnderLine := g.qStatusAttr_NoShow.isUnderLine;
        isStrikeOut := g.qStatusAttr_NoShow.isStrikeOut;
      end;
    9 :
      begin
        BackgroundColor := g.qStatusAttr_Blocked.BackgroundColor;
        FontColor := g.qStatusAttr_Blocked.FontColor;
        isBold := g.qStatusAttr_Blocked.isBold;
        isItalic := g.qStatusAttr_Blocked.isItalic;
        isUnderLine := g.qStatusAttr_Blocked.isUnderLine;
        isStrikeOut := g.qStatusAttr_Blocked.isStrikeOut;
      end;
    10 :
      begin
        BackgroundColor := g.qStatusAttr_Canceled.BackgroundColor;
        FontColor := g.qStatusAttr_Canceled.FontColor;
        isBold := g.qStatusAttr_Canceled.isBold;
        isItalic := g.qStatusAttr_Canceled.isItalic;
        isUnderLine := g.qStatusAttr_Canceled.isUnderLine;
        isStrikeOut := g.qStatusAttr_Canceled.isStrikeOut;
      end;
    11:
      begin
        BackgroundColor := g.qStatusAttr_Tmp1.BackgroundColor;
        FontColor := g.qStatusAttr_Tmp1.FontColor;
        isBold := g.qStatusAttr_Tmp1.isBold;
        isItalic := g.qStatusAttr_Tmp1.isItalic;
        isUnderLine := g.qStatusAttr_Tmp1.isUnderLine;
        isStrikeOut := g.qStatusAttr_Tmp1.isStrikeOut;
      end;
    12:
      begin
        BackgroundColor := g.qStatusAttr_Tmp2.BackgroundColor;
        FontColor := g.qStatusAttr_Tmp2.FontColor;
        isBold := g.qStatusAttr_Tmp2.isBold;
        isItalic := g.qStatusAttr_Tmp2.isItalic;
        isUnderLine := g.qStatusAttr_Tmp2.isUnderLine;
        isStrikeOut := g.qStatusAttr_Tmp2.isStrikeOut;
      end;

  end;

  cbxBackColor.SelectedColor := BackgroundColor;
//  idx := cbxBackColor.Properties.CustomColors.GetIndexByColor(BackgroundColor);
//  cbxBackColor.ItemIndex := idx;

  cbxFontColor.SelectedColor := FontColor;
//  idx := cbxFontColor.Properties.CustomColors.GetIndexByColor(FontColor);
//  cbxFontColor.ItemIndex := idx;

  chkBold.checked := isBold;
  chkItalic.checked := isItalic;
  chkUnderline.checked := isUnderLine;
  chkStrikeOut.checked := isStrikeOut;

end;

procedure TfrmControlData.fcCurrentFontNameCloseUp(Sender: TObject);
begin
  fcCurrentFontName.Font.Name := fcCurrentFontName.Items[fcCurrentFontName.itemindex];
end;

procedure TfrmControlData.chkBoldPropertiesEditValueChanged(Sender : TObject);
begin
  ShowPanelColor;
end;

procedure TfrmControlData.chkItalicPropertiesEditValueChanged(Sender : TObject);
begin
  ShowPanelColor;
end;

procedure TfrmControlData.chkStrikeOutPropertiesEditValueChanged(Sender : TObject);
begin
  ShowPanelColor;
end;

procedure TfrmControlData.chkUnderlinePropertiesEditValueChanged(Sender : TObject);
begin
  ShowPanelColor;
end;

procedure TfrmControlData.updatePanColor;
var
  BackgroundColor : TColor;
  FontColor : TColor;
  isBold : boolean;
  isItalic : boolean;
  isUnderLine : boolean;
  isStrikeOut : boolean;
  idx : Integer;

  index : Integer;
begin
  BackgroundColor := g.qStatusAttr_GuestStaying.BackgroundColor;
  FontColor := g.qStatusAttr_GuestStaying.FontColor;
  isBold := g.qStatusAttr_GuestStaying.isBold;
  isItalic := g.qStatusAttr_GuestStaying.isItalic;
  isUnderLine := g.qStatusAttr_GuestStaying.isUnderLine;
  isStrikeOut := g.qStatusAttr_GuestStaying.isStrikeOut;

  panGuestStaying.Color := BackgroundColor;
  panGuestStaying.Font.Color := FontColor;
  if isBold then
    panGuestStaying.Font.Style := panGuestStaying.Font.Style + [fsBold];
  if isItalic then
    panGuestStaying.Font.Style := panGuestStaying.Font.Style + [fsItalic];
  if isUnderLine then
    panGuestStaying.Font.Style := panGuestStaying.Font.Style + [fsUnderLine];
  if isStrikeOut then
    panGuestStaying.Font.Style := panGuestStaying.Font.Style + [fsStrikeOut];

  BackgroundColor := g.qStatusAttr_GuestLeavingNextDay.BackgroundColor;
  FontColor := g.qStatusAttr_GuestLeavingNextDay.FontColor;
  isBold := g.qStatusAttr_GuestLeavingNextDay.isBold;
  isItalic := g.qStatusAttr_GuestLeavingNextDay.isItalic;
  isUnderLine := g.qStatusAttr_GuestLeavingNextDay.isUnderLine;
  isStrikeOut := g.qStatusAttr_GuestLeavingNextDay.isStrikeOut;
  panGuestLeavingNextDay.Color := BackgroundColor;
  panGuestLeavingNextDay.Font.Color := FontColor;
  if isBold then
    panGuestLeavingNextDay.Font.Style := panGuestLeavingNextDay.Font.Style + [fsBold];
  if isItalic then
    panGuestLeavingNextDay.Font.Style := panGuestLeavingNextDay.Font.Style + [fsItalic];
  if isUnderLine then
    panGuestLeavingNextDay.Font.Style := panGuestLeavingNextDay.Font.Style + [fsUnderLine];
  if isStrikeOut then
    panGuestLeavingNextDay.Font.Style := panGuestLeavingNextDay.Font.Style + [fsStrikeOut];

  BackgroundColor := g.qStatusAttr_Departing.BackgroundColor;
  FontColor := g.qStatusAttr_Departing.FontColor;
  isBold := g.qStatusAttr_Departing.isBold;
  isItalic := g.qStatusAttr_Departing.isItalic;
  isUnderLine := g.qStatusAttr_Departing.isUnderLine;
  isStrikeOut := g.qStatusAttr_Departing.isStrikeOut;
  panDeparting.Color := BackgroundColor;
  panDeparting.Font.Color := FontColor;
  if isBold then
    panDeparting.Font.Style := panDeparting.Font.Style + [fsBold];
  if isItalic then
    panDeparting.Font.Style := panDeparting.Font.Style + [fsItalic];
  if isUnderLine then
    panDeparting.Font.Style := panDeparting.Font.Style + [fsUnderLine];
  if isStrikeOut then
    panDeparting.Font.Style := panDeparting.Font.Style + [fsStrikeOut];

  BackgroundColor := g.qStatusAttr_Order.BackgroundColor;
  FontColor := g.qStatusAttr_Order.FontColor;
  isBold := g.qStatusAttr_Order.isBold;
  isItalic := g.qStatusAttr_Order.isItalic;
  isUnderLine := g.qStatusAttr_Order.isUnderLine;
  isStrikeOut := g.qStatusAttr_Order.isStrikeOut;
  panOrder.Color := BackgroundColor;
  panOrder.Font.Color := FontColor;
  if isBold then
    panOrder.Font.Style := panOrder.Font.Style + [fsBold];
  if isItalic then
    panOrder.Font.Style := panOrder.Font.Style + [fsItalic];
  if isUnderLine then
    panOrder.Font.Style := panOrder.Font.Style + [fsUnderLine];
  if isStrikeOut then
    panOrder.Font.Style := panOrder.Font.Style + [fsStrikeOut];

  BackgroundColor := g.qStatusAttr_Allotment.BackgroundColor;
  FontColor := g.qStatusAttr_Allotment.FontColor;
  isBold := g.qStatusAttr_Allotment.isBold;
  isItalic := g.qStatusAttr_Allotment.isItalic;
  isUnderLine := g.qStatusAttr_Allotment.isUnderLine;
  isStrikeOut := g.qStatusAttr_Allotment.isStrikeOut;
  panAllotment.Color := BackgroundColor;
  panAllotment.Font.Color := FontColor;
  if isBold then
    panAllotment.Font.Style := panAllotment.Font.Style + [fsBold];
  if isItalic then
    panAllotment.Font.Style := panAllotment.Font.Style + [fsItalic];
  if isUnderLine then
    panAllotment.Font.Style := panAllotment.Font.Style + [fsUnderLine];
  if isStrikeOut then
    panAllotment.Font.Style := panAllotment.Font.Style + [fsStrikeOut];

  BackgroundColor := g.qStatusAttr_Waitinglist.BackgroundColor;
  FontColor := g.qStatusAttr_Waitinglist.FontColor;
  isBold := g.qStatusAttr_Waitinglist.isBold;
  isItalic := g.qStatusAttr_Waitinglist.isItalic;
  isUnderLine := g.qStatusAttr_Waitinglist.isUnderLine;
  isStrikeOut := g.qStatusAttr_Waitinglist.isStrikeOut;
  panWaitingList.Color := BackgroundColor;
  panWaitingList.Font.Color := FontColor;
  if isBold then
    panWaitingList.Font.Style := panWaitingList.Font.Style + [fsBold];
  if isItalic then
    panWaitingList.Font.Style := panWaitingList.Font.Style + [fsItalic];
  if isUnderLine then
    panWaitingList.Font.Style := panWaitingList.Font.Style + [fsUnderLine];
  if isStrikeOut then
    panWaitingList.Font.Style := panWaitingList.Font.Style + [fsStrikeOut];

  BackgroundColor := g.qStatusAttr_ArrivingOtherLeaving.BackgroundColor;
  FontColor := g.qStatusAttr_ArrivingOtherLeaving.FontColor;
  isBold := g.qStatusAttr_ArrivingOtherLeaving.isBold;
  isItalic := g.qStatusAttr_ArrivingOtherLeaving.isItalic;
  isUnderLine := g.qStatusAttr_ArrivingOtherLeaving.isUnderLine;
  isStrikeOut := g.qStatusAttr_ArrivingOtherLeaving.isStrikeOut;
  panArrivingOtherLeaving.Color := BackgroundColor;
  panArrivingOtherLeaving.Font.Color := FontColor;
  if isBold then
    panArrivingOtherLeaving.Font.Style := panArrivingOtherLeaving.Font.Style + [fsBold];
  if isItalic then
    panArrivingOtherLeaving.Font.Style := panArrivingOtherLeaving.Font.Style + [fsItalic];
  if isUnderLine then
    panArrivingOtherLeaving.Font.Style := panArrivingOtherLeaving.Font.Style + [fsUnderLine];
  if isStrikeOut then
    panArrivingOtherLeaving.Font.Style := panArrivingOtherLeaving.Font.Style + [fsStrikeOut];

  BackgroundColor := g.qStatusAttr_Departed.BackgroundColor;
  FontColor := g.qStatusAttr_Departed.FontColor;
  isBold := g.qStatusAttr_Departed.isBold;
  isItalic := g.qStatusAttr_Departed.isItalic;
  isUnderLine := g.qStatusAttr_Departed.isUnderLine;
  isStrikeOut := g.qStatusAttr_Departed.isStrikeOut;
  panDeparted.Color := BackgroundColor;
  panDeparted.Font.Color := FontColor;
  panDeparted.Font.Style := [];
  if isBold then
    panDeparted.Font.Style := panDeparted.Font.Style + [fsBold];
  if isItalic then
    panDeparted.Font.Style := panDeparted.Font.Style + [fsItalic];
  if isUnderLine then
    panDeparted.Font.Style := panDeparted.Font.Style + [fsUnderLine];
  if isStrikeOut then
    panDeparted.Font.Style := panDeparted.Font.Style + [fsStrikeOut];

  BackgroundColor := g.qStatusAttr_NoShow.BackgroundColor;
  FontColor := g.qStatusAttr_NoShow.FontColor;
  isBold := g.qStatusAttr_NoShow.isBold;
  isItalic := g.qStatusAttr_NoShow.isItalic;
  isUnderLine := g.qStatusAttr_NoShow.isUnderLine;
  isStrikeOut := g.qStatusAttr_NoShow.isStrikeOut;
  panNoShow.Color := BackgroundColor;
  panNoShow.Font.Color := FontColor;
  if isBold then
    panNoShow.Font.Style := panNoShow.Font.Style + [fsBold];
  if isItalic then
    panNoShow.Font.Style := panNoShow.Font.Style + [fsItalic];
  if isUnderLine then
    panNoShow.Font.Style := panNoShow.Font.Style + [fsUnderLine];
  if isStrikeOut then
    panNoShow.Font.Style := panNoShow.Font.Style + [fsStrikeOut];

  BackgroundColor := g.qStatusAttr_Blocked.BackgroundColor;
  FontColor := g.qStatusAttr_Blocked.FontColor;
  isBold := g.qStatusAttr_Blocked.isBold;
  isItalic := g.qStatusAttr_Blocked.isItalic;
  isUnderLine := g.qStatusAttr_Blocked.isUnderLine;
  isStrikeOut := g.qStatusAttr_Blocked.isStrikeOut;
  panBlocked.Color := BackgroundColor;
  panBlocked.Font.Color := FontColor;
  if isBold then
    panBlocked.Font.Style := panBlocked.Font.Style + [fsBold];
  if isItalic then
    panBlocked.Font.Style := panBlocked.Font.Style + [fsItalic];
  if isUnderLine then
    panBlocked.Font.Style := panBlocked.Font.Style + [fsUnderLine];
  if isStrikeOut then
    panBlocked.Font.Style := panBlocked.Font.Style + [fsStrikeOut];

  BackgroundColor := g.qStatusAttr_Canceled.BackgroundColor;
  FontColor := g.qStatusAttr_Canceled.FontColor;
  isBold := g.qStatusAttr_Canceled.isBold;
  isItalic := g.qStatusAttr_Canceled.isItalic;
  isUnderLine := g.qStatusAttr_Canceled.isUnderLine;
  isStrikeOut := g.qStatusAttr_Canceled.isStrikeOut;
  panCanceled.Color := BackgroundColor;
  panCanceled.Font.Color := FontColor;
  if isBold then
    panCanceled.Font.Style := panCanceled.Font.Style + [fsBold];
  if isItalic then
    panCanceled.Font.Style := panCanceled.Font.Style + [fsItalic];
  if isUnderLine then
    panCanceled.Font.Style := panCanceled.Font.Style + [fsUnderLine];
  if isStrikeOut then
    panCanceled.Font.Style := panCanceled.Font.Style + [fsStrikeOut];


  BackgroundColor := g.qStatusAttr_Tmp1.BackgroundColor;
  FontColor := g.qStatusAttr_Tmp1.FontColor;
  isBold := g.qStatusAttr_Tmp1.isBold;
  isItalic := g.qStatusAttr_Tmp1.isItalic;
  isUnderLine := g.qStatusAttr_Tmp1.isUnderLine;
  isStrikeOut := g.qStatusAttr_Tmp1.isStrikeOut;
  panTmp1.Color := BackgroundColor;
  panTmp1.Font.Color := FontColor;
  if isBold then
    panTmp1.Font.Style := panTmp1.Font.Style + [fsBold];
  if isItalic then
    panTmp1.Font.Style := panTmp1.Font.Style + [fsItalic];
  if isUnderLine then
    panTmp1.Font.Style := panTmp1.Font.Style + [fsUnderLine];
  if isStrikeOut then
    panTmp1.Font.Style := panTmp1.Font.Style + [fsStrikeOut];

  BackgroundColor := g.qStatusAttr_Tmp2.BackgroundColor;
  FontColor := g.qStatusAttr_Tmp2.FontColor;
  isBold := g.qStatusAttr_Tmp2.isBold;
  isItalic := g.qStatusAttr_Tmp2.isItalic;
  isUnderLine := g.qStatusAttr_Tmp2.isUnderLine;
  isStrikeOut := g.qStatusAttr_Tmp2.isStrikeOut;
  panTmp2.Color := BackgroundColor;
  panTmp2.Font.Color := FontColor;
  if isBold then
    panTmp2.Font.Style := panTmp2.Font.Style + [fsBold];
  if isItalic then
    panTmp2.Font.Style := panTmp2.Font.Style + [fsItalic];
  if isUnderLine then
    panTmp2.Font.Style := panTmp2.Font.Style + [fsUnderLine];
  if isStrikeOut then
    panTmp2.Font.Style := panTmp2.Font.Style + [fsStrikeOut];
end;

procedure TfrmControlData.__Panel2Click(Sender: TObject);
begin

end;

(*
  callType	int	Checked
  callLogInternal	bit	Checked
  callMinSec	int	Checked
  callStartPrice	float	Checked
  callMinUnits	int	Checked
  callMinPrice	float	Checked
*)

end.






