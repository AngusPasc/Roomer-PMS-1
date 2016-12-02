unit uPMSSettings;

interface

uses
  SysUtils
  , cmpRoomerDataset
  , uMandatoryFIeldDefinitions
  ;

type

  EPMSSettingsKeyValueNotFound = class(Exception);


  /// <summary>
  ///   Provides access to PMS configuration-items stored in PMSSettings table in database
  /// </summary>
  TPMSSettings = class
  private
    FPMSDataset: TRoomerDataset;
    procedure PutSettingsValue(KeyGroup, Key, Value: String; CreateIfNotExists : Boolean = False);
    function GetSettingsAsBoolean(KeyGroup, Key : String; ExceptionOnNotFound : Boolean = false; Default : Boolean = False) : Boolean;
    procedure SetSettingsAsBoolean(KeyGroup, Key: String; Value : Boolean; CreateIfNotExists: Boolean = False);
    function GetSettingsAsInteger(KeyGroup, Key : String; ExceptionOnNotFound : Boolean = false; Default : Integer = 0) : Integer;
    procedure SetSettingsAsInteger(KeyGroup, Key : String; Value : Integer; CreateIfNotExists : Boolean = False);
    function GetSettingsAsString(KeyGroup, Key : String; ExceptionOnNotFound : Boolean = false; Default : String = '') : String;
    procedure SetSettingsAsString(KeyGroup, Key : String; Value : String; CreateIfNotExists : Boolean = False);

    function GetMandatoryCheckinFields: TMandatoryCheckInFieldSet;
    procedure SetMandatoryCheckinFields(const Value: TMandatoryCheckInFieldSet);
    function GetBetaFunctionsAvailable: boolean;
    procedure SetBetaFunctionsAvailable(const Value: boolean);
    function GetEditAllGuestsNationality: boolean;
    procedure SetEditAllGuestsNationality(const Value: boolean);
    function GetShowInvoiceAsPaidWhenStatusIsZero: boolean;
    procedure SetShowInvoiceAsPaidWhenStatusIsZero(const Value: boolean);
    function GetShowIncludedBreakfastOnInvoice: boolean;
    procedure SetShowIncludedBreakfastOnInvoice(const Value: boolean);
    function GetAllowPaymentModification: boolean;
    procedure SetAllowPaymentModification(const Value: boolean);
    function GetAllowDeletingItemsFromInvoice: boolean;
    procedure SetAllowDeletingItemsFromInvoice(const Value: boolean);

  public
    constructor Create(aPMSDataset: TRoomerDataset);

    /// <summary>
    ///   Currently enabled TMandatoryCheckinFields in PMS settings
    /// </summary>
    property MandatoryCheckinFields: TMandatoryCheckInFieldSet read GetMandatoryCheckinFields write SetMandatoryCheckinFields;
    /// <summary>
    ///   If true then functions marked as Beta are available in the PMS
    /// </summary>
    property BetaFunctionsAvailable: boolean read GetBetaFunctionsAvailable write SetBetaFunctionsAvailable;
    /// <summary>
    ///   If true then the reservation profile window contains function to change nationality of all guests
    /// </summary>
    property EditAllGuestsNationality: boolean read GetEditAllGuestsNationality write SetEditAllGuestsNationality;
    /// <summary>
    ///   If true then the room will appear as paid in the main-window of Roomer when the invoice balance for the Room-rent is zero
    /// </summary>
    property ShowInvoiceAsPaidWhenStatusIsZero: boolean read GetShowInvoiceAsPaidWhenStatusIsZero write SetShowInvoiceAsPaidWhenStatusIsZero;
    property ShowIncludedBreakfastOnInvoice: boolean read GetShowIncludedBreakfastOnInvoice write SetShowIncludedBreakfastOnInvoice;

    property AllowPaymentModification: boolean read GetAllowPaymentModification write SetAllowPaymentModification;
    property AllowDeletingItemsFromInvoice: boolean read GetAllowDeletingItemsFromInvoice write SetAllowDeletingItemsFromInvoice;
  end;

implementation

uses
  Variants
  , uUtils
  ;

const
  cBetaFunctionsGroup = 'BETA_FUNCTIONS';
  cBetaFunctionsAvailableName = 'BETA_FUNCTIONS_AVAILABLE';
  cAllGuestsNationalityGroup = 'RESERVATIONPROFILE_FUNCTIONS';
  cAllGuestsNationality = 'EDIT_ALLGUESTS_NATIONALITY';
  cInvoiceHandlingGroup = 'INVOICE_HANDLING_FUNCTIONS';
  cInvoiceHandlingShowAsPaidWhenZero = 'SHOW_AS_PAID_WHEN_ZERO';
  cAllowPaymentModifications = 'ALLOW_PAYMENT_MODIFICATIONS';
  cAllowDeletingItemsFromInvoice = 'ALLOW_DELETING_FROM_INVOICE';
  cShowIncludedBreakfastOnInvoice = 'SHOW_INCLUDED_BREAKFAST_ON_INVOICE';

procedure TPmsSettings.PutSettingsValue(KeyGroup, Key, Value : String; CreateIfNotExists : Boolean = False);
begin
  if FPMSDataset.Locate('KeyGroup;key', VarArrayOf([KeyGroup, Key]), []) then
  begin
    FPMSDataset.Edit;
    try
      FPMSDataset['value'] := Value;
      FPMSDataset.Post;
    except
      FPMSDataset.Cancel;
      raise;
    end;
  end else
  if CreateIfNotExists then
  begin
    FPMSDataset.Insert;
    try
      FPMSDataset['KeyGroup'] := KeyGroup;
      FPMSDataset['Key'] := Key;
      FPMSDataset['value'] := Value;
      FPMSDataset.Post;
    except
      FPMSDataset.Cancel;
      raise;
    end;
  end;
end;

constructor TPmsSettings.Create(aPMSDataset: TRoomerDataset);
begin
  FPMSDataset := aPMSDataset;
end;

function TPmsSettings.GetSettingsAsBoolean(KeyGroup, Key : String; ExceptionOnNotFound : Boolean = false; Default : Boolean = False) : Boolean;
begin
  result := Default;
  if FPMSDataset.Locate('KeyGroup;key', VarArrayOf([KeyGroup, Key]), []) then
    result := FPMSDataset['value'] = 'TRUE'
  else
    if ExceptionOnNotFound then
      raise EPMSSettingsKeyValueNotFound.Create('Key ' + Key + ' was not found in settings.');
end;

function TPmsSettings.GetSettingsAsInteger(KeyGroup, Key : String; ExceptionOnNotFound : Boolean = false; Default : Integer = 0) : Integer;
begin
  result := Default;
  if FPMSDataset.Locate('KeyGroup;key', VarArrayOf([KeyGroup, Key]), []) then
    result := StrToIntDef(FPMSDataset['value'], Default)
  else
    if ExceptionOnNotFound then
      raise EPMSSettingsKeyValueNotFound.Create('Key ' + Key + ' was not found in settings.');
end;


procedure TPmsSettings.SetSettingsAsInteger(KeyGroup, Key : String; Value : Integer; CreateIfNotExists : Boolean = False);
begin
  PutSettingsValue(KeyGroup, Key, IntToStr(Value), CreateIfNotExists);
end;


function TPmsSettings.GetSettingsAsString(KeyGroup, Key : String; ExceptionOnNotFound : Boolean = false; Default : String = '') : String;
begin
  result := Default;
  if FPMSDataset.Locate('KeyGroup;key', VarArrayOf([KeyGroup, Key]), []) then
    result := FPMSDataset['value']
  else
    if ExceptionOnNotFound then
      raise EPMSSettingsKeyValueNotFound.Create('Key ' + Key + ' was not found in settings.');
end;

procedure TPmsSettings.SetSettingsAsString(KeyGroup, Key : String; Value : String; CreateIfNotExists : Boolean = False);
begin
  PutSettingsValue(KeyGroup, Key, Value, CreateIfNotExists);
end;

procedure TPmsSettings.SetSettingsAsBoolean(KeyGroup, Key : String; Value : Boolean; CreateIfNotExists : Boolean = False);
begin
  PutSettingsValue(KeyGroup, Key, IIF(Value, 'TRUE', 'FALSE'), CreateIfNotExists);
end;

procedure TPMSSettings.SetAllowDeletingItemsFromInvoice(const Value: boolean);
begin
  SetSettingsAsBoolean(cInvoiceHandlingGroup, cAllowDeletingItemsFromInvoice, Value, True);
end;

procedure TPMSSettings.SetAllowPaymentModification(const Value: boolean);
begin
  SetSettingsAsBoolean(cInvoiceHandlingGroup, cAllowPaymentModifications, Value, True);
end;

procedure TPmsSettings.SetBetaFunctionsAvailable(const Value: boolean);
begin
  SetSettingsAsBoolean(cBetaFunctionsGroup, cBetaFunctionsAvailableName, Value, True);
end;

procedure TPMSSettings.SetEditAllGuestsNationality(const Value: boolean);
begin
  SetSettingsAsBoolean(cAllGuestsNationalityGroup, cAllGuestsNationality, Value, True);
end;

procedure TPMSSettings.SetShowIncludedBreakfastOnInvoice(const Value: boolean);
begin
  SetSettingsAsBoolean(cInvoiceHandlingGroup, cShowIncludedBreakfastOnInvoice, Value, True);
end;

procedure TPMSSettings.SetShowInvoiceAsPaidWhenStatusIsZero(const Value: boolean);
begin
  SetSettingsAsBoolean(cInvoiceHandlingGroup, cInvoiceHandlingShowAsPaidWhenZero, Value, True);
end;

procedure TPmsSettings.SetMandatoryCheckinFields(const Value: TMandatoryCheckInFieldSet);
var
  lMF: TMandatoryCheckinField;
begin
  for lMF := low(lMF) to high(lMF) do
    SetSettingsAsBoolean(lMF.PMSSettingGroup, lMF.PMSSettingName, (lMF in Value), True);
end;

function TPMSSettings.GetAllowDeletingItemsFromInvoice: boolean;
begin
  Result := GetSettingsAsBoolean(cInvoiceHandlingGroup , cAllowDeletingItemsFromInvoice, False, True);
end;

function TPMSSettings.GetAllowPaymentModification: boolean;
begin
  Result := GetSettingsAsBoolean(cInvoiceHandlingGroup , cAllowPaymentModifications, False, True);
end;

function TPmsSettings.GetBetaFunctionsAvailable: boolean;
begin
  Result := GetSettingsAsBoolean(cBetaFunctionsGroup , cBetaFunctionsAvailableName, False, False );
end;

function TPMSSettings.GetEditAllGuestsNationality: boolean;
begin
  Result := GetSettingsAsBoolean(cAllGuestsNationalityGroup, cAllGuestsNationality, False, True );
end;

function TPMSSettings.GetShowIncludedBreakfastOnInvoice: boolean;
begin
  Result := GetSettingsAsBoolean(cInvoiceHandlingGroup, cShowIncludedBreakfastOnInvoice, False, False);
end;

function TPMSSettings.GetShowInvoiceAsPaidWhenStatusIsZero: boolean;
begin
  Result := GetSettingsAsBoolean(cInvoiceHandlingGroup, cInvoiceHandlingShowAsPaidWhenZero, False);
end;

function TPmsSettings.GetMandatoryCheckinFields: TMandatoryCheckInFieldSet;
var
  lMF: TMandatoryCheckinField;
begin
  Result := [];
  for lMF := low(lMF) to high(lMF) do
    if GetSettingsAsBoolean(lMF.PMsSettingGroup, lMF.PMSSettingName, False, True) then
      Include(Result, lMF);
end;





end.
