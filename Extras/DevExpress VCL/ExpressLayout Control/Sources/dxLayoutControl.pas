{********************************************************************}
{                                                                    }
{           Developer Express Visual Component Library               }
{           ExpressLayoutControl main components                     }
{                                                                    }
{           Copyright (c) 2001-2014 Developer Express Inc.           }
{           ALL RIGHTS RESERVED                                      }
{                                                                    }
{   The entire contents of this file is protected by U.S. and        }
{   International Copyright Laws. Unauthorized reproduction,         }
{   reverse-engineering, and distribution of all or any portion of   }
{   the code contained in this file is strictly prohibited and may   }
{   result in severe civil and criminal penalties and will be        }
{   prosecuted to the maximum extent possible under the law.         }
{                                                                    }
{   RESTRICTIONS                                                     }
{                                                                    }
{   THIS SOURCE CODE AND ALL RESULTING INTERMEDIATE FILES            }
{   (DCU, OBJ, DLL, ETC.) ARE CONFIDENTIAL AND PROPRIETARY TRADE     }
{   SECRETS OF DEVELOPER EXPRESS INC. THE REGISTERED DEVELOPER IS    }
{   LICENSED TO DISTRIBUTE THE EXPRESSLAYOUTCONTROL AND ALL          }
{   ACCOMPANYING VCL CONTROLS AS PART OF AN EXECUTABLE PROGRAM       }
{   ONLY.                                                            }
{                                                                    }
{   THE SOURCE CODE CONTAINED WITHIN THIS FILE AND ALL RELATED       }
{   FILES OR ANY PORTION OF ITS CONTENTS SHALL AT NO TIME BE         }
{   COPIED, TRANSFERRED, SOLD, DISTRIBUTED, OR OTHERWISE MADE        }
{   AVAILABLE TO OTHER INDIVIDUALS WITHOUT EXPRESS WRITTEN CONSENT   }
{   AND PERMISSION FROM DEVELOPER EXPRESS INC.                       }
{                                                                    }
{   CONSULT THE END USER LICENSE AGREEMENT FOR INFORMATION ON        }
{   ADDITIONAL RESTRICTIONS.                                         }
{                                                                    }
{********************************************************************}

unit dxLayoutControl;

{$I cxVer.inc}

interface

uses
{$IFDEF DELPHI16}
  System.UITypes,
{$ENDIF}
  Messages, Windows, SysUtils, Classes, Menus, Graphics, DB,
  Forms, Controls {after Forms for D12},
  StdCtrls, ExtCtrls, IniFiles, Contnrs, ImgList,
  dxCore, dxCoreClasses, dxMessages, cxClasses, cxGeometry, cxGraphics, cxControls,
  cxLookAndFeels, cxLibraryConsts, cxLookAndFeelPainters, cxDBEdit,
  dxLayoutLookAndFeels, dxLayoutCommon, dxLayoutSelection, cxPC, dxLayoutContainer;

type
  TdxCustomLayoutControl = class;
  TdxLayoutControlPainter = class;
  TdxLayoutControlPainterClass = class of TdxLayoutControlPainter;
  TdxLayoutControlViewInfo = class;
  TdxLayoutControlViewInfoClass = class of TdxLayoutControlViewInfo;

  { TdxLayoutControlPersistent }

  TdxLayoutControlPersistent = class(TPersistent)
  private
    FControl: TdxCustomLayoutControl;
  protected
    procedure Changed; virtual;
    function GetOwner: TPersistent; override;
  public
    constructor Create(AControl: TdxCustomLayoutControl); virtual;
    property Control: TdxCustomLayoutControl read FControl;
  end;

  { conatiner }

  TdxLayoutControlContainerPainter = class(TdxLayoutContainerPainter);

  TdxLayoutControlContainerViewInfo = class(TdxLayoutContainerViewInfo);

  { TdxLayoutControlContainer }

  TdxLayoutControlContainer = class(TdxLayoutContainer)
  private
    FControl: TdxCustomLayoutControl;
    function GetPainter: TdxLayoutControlContainerPainter;
    function GetViewInfo: TdxLayoutControlContainerViewInfo;
  protected
    function DoGetCustomizationMenuItems(const ASelectedItems: TList): TdxLayoutCustomizeFormMenuItems; override;
    function GetPainterClass: TdxLayoutContainerPainterClass; override;
    function GetViewInfoClass: TdxLayoutContainerViewInfoClass; override;
    // storing custom properties
    procedure GetItemStoredCustomProperties(AItem: TdxCustomLayoutItem;
      AProperties: TStrings); override;
    procedure GetItemStoredCustomPropertyValue(AItem: TdxCustomLayoutItem;
      const AName: string; var AValue: Variant); override;
    procedure SetItemStoredCustomPropertyValue(AItem: TdxCustomLayoutItem;
      const AName: string; const AValue: Variant); override;
    function GetStoredProperties(AProperties: TStrings): Boolean; override;
    procedure GetStoredPropertyValue(const AName: string; var AValue: Variant); override;
    procedure SetStoredPropertyValue(const AName: string; const AValue: Variant); override;

    function CanGetHitTest(const P: TPoint): Boolean; override;
    function CanRestore: Boolean; override;
    procedure Restore; override;
    procedure SizeAdjustment; override;
    procedure Store; override;
    function StoringSupports: Boolean; override;

    function CreateCustomizationControlHelper(AItem: TdxLayoutItem): TdxControlsDesignSelectorHelper; override;
    procedure CustomizationChanged; override;
    procedure CustomizeFormPostUpdate(AUpdateTypes: TdxLayoutCustomizeFormUpdateTypes); override;
    procedure PostBuildSelectionLayer; override;
    procedure PostInvalidateSelectionLayer(const R: TRect); override;
    procedure PostPlaceControls; override;

    function CanProcessKeyboard: Boolean; override;
    function CanUpdate: Boolean; override;
    function GetCanvas: TcxCanvas; override;
    function GetClientBounds: TRect; override;
    function GetClientRect: TRect; override;
    function GetItemsOwner: TComponent; override;
    function GetItemsParent: TcxControl; override;
    function GetItemsParentComponent: TComponent; override;
    function GetScrollOffset: TPoint; override;
    function GetSelectionHelperClass: TdxLayoutRunTimeSelectionHelperClass; override;
    function HasBackground: Boolean; override;
    function IsAutoControlAlignment: Boolean; override;
    function IsAutoControlTabOrders: Boolean; override;
    function IsFocusControlOnItemCaptionClick: Boolean; override;
    function IsShowLockedGroupChildren: Boolean; override;
    function IsSizableHorz: Boolean; override;
    function IsSizableVert: Boolean; override;
    procedure MakeVisible(AItem: TdxCustomLayoutItem); override;

    // font
    function GetBoldFont: TFont; override;
    function GetDefaultFont: TFont; override;

    procedure InitializeSubControlsCxLookAndFeel; override;
    procedure LayoutLookAndFeelUserChanged; override;

    property Painter: TdxLayoutControlContainerPainter read GetPainter;
  public
    constructor Create(AControl: TdxCustomLayoutControl); reintroduce; virtual;

    procedure BeginDragAndDrop; override;
    function CanDragAndDrop: Boolean; override;
    procedure FinishDragAndDrop(Accepted: Boolean); override;

    procedure Modified; override;

    property Control: TdxCustomLayoutControl read FControl;
    property ViewInfo: TdxLayoutControlContainerViewInfo read GetViewInfo;
  end;
  TdxLayoutControlContainerClass = class of TdxLayoutControlContainer;

  { controls }

  { TdxStoringOptions }

  TdxStoringOptions = class(TPersistent)
  private
    FIniFileName: string;
    FRegistryPath: string;
    FStoreToIniFile: Boolean;
    FStoreToRegistry: Boolean;
  protected
    function CanStoreToIniFile: Boolean;
    function CanStoreToRegistry: Boolean;
    function CanRestoreFromIniFile: Boolean;
    function CanRestoreFromRegistry: Boolean;
  public
    procedure Assign(Source: TPersistent); override;
  published
    property IniFileName: string read FIniFileName write FIniFileName;
    property RegistryPath: string read FRegistryPath write FRegistryPath;
    property StoreToIniFile: Boolean read FStoreToIniFile write FStoreToIniFile default False;
    property StoreToRegistry: Boolean read FStoreToRegistry write FStoreToRegistry default False;
  end;

  TdxLayoutItemOptions = class(TdxLayoutControlPersistent)
  private
    FAutoControlAreaAlignment: Boolean;
    FAutoControlTabOrders: Boolean;
    FFocusControlOnItemCaptionClick: Boolean;
    FShowLockedGroupChildren: Boolean;
    FSizableHorz: Boolean;
    FSizableVert: Boolean;

    procedure SetAutoControlAreaAlignment(Value: Boolean);
    procedure SetAutoControlTabOrders(Value: Boolean);
    procedure SetShowLockedGroupChildren(Value: Boolean);
  protected
    procedure Changed; override;
  public
    constructor Create(AControl: TdxCustomLayoutControl); override;
    procedure Assign(Source: TPersistent); override;
  published
    property AutoControlAreaAlignment: Boolean read FAutoControlAreaAlignment write SetAutoControlAreaAlignment default True;
    property AutoControlTabOrders: Boolean read FAutoControlTabOrders write SetAutoControlTabOrders default True;
    property FocusControlOnItemCaptionClick: Boolean read FFocusControlOnItemCaptionClick write FFocusControlOnItemCaptionClick default False;
    property ShowLockedGroupChildren: Boolean read FShowLockedGroupChildren write SetShowLockedGroupChildren default True;
    property SizableHorz: Boolean read FSizableHorz write FSizableHorz default False;
    property SizableVert: Boolean read FSizableVert write FSizableVert default False;
  end;

  TdxLayoutAutoContentSize = (acsWidth, acsHeight);
  TdxLayoutAutoContentSizes = set of TdxLayoutAutoContentSize;

  { TdxCustomLayoutControl }

  { TdxCustomLayoutControlHandler }

  TdxCustomLayoutControlHandler = class(TcxIUnknownObject)
  private
    FControl: TdxCustomLayoutControl;
    function GetViewInfo: TdxLayoutControlViewInfo;
  protected
    property Control: TdxCustomLayoutControl read FControl;
    property ViewInfo: TdxLayoutControlViewInfo read GetViewInfo;
  public
    constructor Create(AControl: TdxCustomLayoutControl); virtual;
  end;

  { TdxCustomLayoutControl }

  TdxLayoutControlGetItemStoredPropertiesEvent = procedure (Sender: TdxCustomLayoutControl;
    AItem: TdxCustomLayoutItem; AProperties: TStrings) of object;
  TdxLayoutControlGetItemStoredPropertyValueEvent = procedure (Sender: TdxCustomLayoutControl;
    AItem: TdxCustomLayoutItem; const AName: string; var AValue: Variant) of object;
  TdxLayoutControlSetItemStoredPropertyValueEvent = procedure (Sender: TdxCustomLayoutControl;
    AItem: TdxCustomLayoutItem; const AName: string; const AValue: Variant) of object;
  TdxLayoutControlGetStoredPropertiesEvent = procedure (Sender: TdxCustomLayoutControl;
    AProperties: TStrings) of object;
  TdxLayoutControlGetStoredPropertyValueEvent = procedure (Sender: TdxCustomLayoutControl;
    const AName: string; var AValue: Variant) of object;
  TdxLayoutControlSetStoredPropertyValueEvent = procedure (Sender: TdxCustomLayoutControl;
    const AName: string; const AValue: Variant) of object;
  TdxLayoutGetCustomizationMenuItemsEvent = procedure(Sender: TObject;
    const ASelectedItems: TList; var AMenuItems: TdxLayoutCustomizeFormMenuItems) of object;

  TdxCustomLayoutControl = class(TcxScrollingControl,
    IdxLayoutComponent,
    IdxSkinSupport,
    IdxCustomizeControlsHelper,
    IcxEditorFieldLink2,
    IdxLayoutContainer)
  private
    FBoldFont: TFont;
    FDragDropHitTest: TdxCustomLayoutHitTest;
    FRightButtonPressed: Boolean;
    FRedrawOnResize: Boolean;

    // Objects
    FOptionsItem: TdxLayoutItemOptions;
    FOptionsStoring: TdxStoringOptions;
    FPainter: TdxLayoutControlPainter;
    FViewInfo: TdxLayoutControlViewInfo;

    FContainer: TdxLayoutControlContainer;

    // Customization
    FIsPopupShown: Boolean;
    // Storing
    FStoredStream: TMemoryStream;

    FOnCustomization: TNotifyEvent;
    FOnGetCustomizationMenuItems: TdxLayoutGetCustomizationMenuItemsEvent;
    FOnGetItemStoredProperties: TdxLayoutControlGetItemStoredPropertiesEvent;
    FOnGetItemStoredPropertyValue: TdxLayoutControlGetItemStoredPropertyValueEvent;
    FOnSetItemStoredPropertyValue: TdxLayoutControlSetItemStoredPropertyValueEvent;
    FOnGetStoredProperties: TdxLayoutControlGetStoredPropertiesEvent;
    FOnGetStoredPropertyValue: TdxLayoutControlGetStoredPropertyValueEvent;
    FOnSetStoredPropertyValue: TdxLayoutControlSetStoredPropertyValueEvent;
    // Get/Set Properties
    function GetAutoContentSizes: TdxLayoutAutoContentSizes;
    function GetContentBounds: TRect;
    function GetCustomization: Boolean;
    function GetCustomizeAvailableItemsViewKind: TdxLayoutAvailableItemsViewKind;
    function GetCustomizeForm: TdxLayoutControlCustomCustomizeForm;
    function GetCustomizeFormBounds: TRect;
    function GetCustomizeFormClass: TdxLayoutControlCustomCustomizeFormClass;
    function GetCustomizeFormTabbedView: Boolean;
    function GetHighlightRoot: Boolean;
    function GetIsLayoutLoading: Boolean;
    function GetItems: TdxLayoutGroup;
    function GetLayoutDirection: TdxLayoutDirection;
    function GetLayoutLookAndFeel: TdxCustomLayoutLookAndFeel;
    function GetMenuItems: TdxLayoutCustomizeFormMenuItems;
    function GetOccupiedClientHeight: Integer;
    function GetOccupiedClientWidth: Integer;
    function GetOptionsImage: TdxLayoutImageOptions;
    function GetShowDesignSelectors: Boolean;
    function GetUndoRedoManager: TdxUndoRedoManager;
    procedure SetAutoContentSizes(Value: TdxLayoutAutoContentSizes);
    procedure SetCustomization(Value: Boolean);
    procedure SetCustomizeAvailableItemsViewKind(Value: TdxLayoutAvailableItemsViewKind);
    procedure SetCustomizeFormBounds(const AValue: TRect);
    procedure SetCustomizeFormClass(AValue: TdxLayoutControlCustomCustomizeFormClass);
    procedure SetCustomizeFormTabbedView(Value: Boolean);
    procedure SetHighlightRoot(Value: Boolean);
    procedure SetLayoutDirection(Value: TdxLayoutDirection);
    procedure SetLayoutLookAndFeel(Value: TdxCustomLayoutLookAndFeel);
    procedure SetMenuItems(Value: TdxLayoutCustomizeFormMenuItems);
    procedure SetOptionsImage(Value: TdxLayoutImageOptions);
    procedure SetOptionsItem(Value: TdxLayoutItemOptions);
    procedure SetShowDesignSelectors(Value: Boolean);

    // Items
    function GetAutoControlAlignment: Boolean;
    function GetAutoControlTabOrders: Boolean;
    function GetAbsoluteItem(Index: Integer): TdxCustomLayoutItem;
    function GetAbsoluteItemCount: Integer;
    function GetAlignmentConstraint(Index: Integer): TdxLayoutAlignmentConstraint;
    function GetAlignmentConstraintCount: Integer;
    function GetAvailableItem(Index: Integer): TdxCustomLayoutItem;
    function GetAvailableItemCount: Integer;
    procedure SetAutoControlAlignment(Value: Boolean);
    procedure SetAutoControlTabOrders(Value: Boolean);

    // Storing
    procedure SetOptionsStoring(Value: TdxStoringOptions);
    function GetIniFileName: string;
    function GetRegistryPath: string;
    function GetStoreInIniFile: Boolean;
    function GetStoreInRegistry: Boolean;
    procedure SetIniFileName(const Value: string);
    procedure SetRegistryPath(const Value: string);
    procedure SetStoreInIniFile(const Value: Boolean);
    procedure SetStoreInRegistry(const Value: Boolean);

    procedure CreateHandlers;
    procedure DestroyHandlers;

    // Other
    procedure ContainerChangedHandler(Sender: TObject);
    procedure ContainerSelectionChangedHandler(Sender: TObject);
    procedure InitializeSubControlsCxLookAndFeel;
    procedure MasterLookAndFeelBeginChangeHandler(Sender: TObject);
    procedure MasterLookAndFeelEndChangeHandler(Sender: TObject);
    procedure RefreshBoldFont;

    procedure WMContextMenu(var Message: TWMContextMenu); message WM_CONTEXTMENU;
    procedure WMEraseBkgnd(var Message: TWMEraseBkgnd); message WM_ERASEBKGND;
    procedure WMGetDlgCode(var Message: TWMGetDlgCode); message WM_GETDLGCODE;
    procedure WMKillFocus(var Message: TWMKillFocus); message WM_KILLFOCUS;
    procedure WMSetFocus(var Message: TWMSetFocus); message WM_SETFOCUS;
    procedure CMChildKey(var Message: TCMChildKey); message CM_CHILDKEY;
    procedure CMControlChange(var Message: TCMControlChange); message CM_CONTROLCHANGE;
    procedure CMControlListChange(var Message: TCMControlListChange); message CM_CONTROLLISTCHANGE;
    procedure CMDialogChar(var Message: TCMDialogChar); message CM_DIALOGCHAR;
    procedure CMDialogKey(var Message: TCMDialogKey); message CM_DIALOGKEY;
    procedure CMHintShow(var Message: TCMHintShow); message CM_HINTSHOW;
    procedure CMTabStopChanged(var Message: TMessage); message CM_TABSTOPCHANGED;
    procedure DXMPlaceControls(var Message: TMessage); message DXM_LAYOUT_PLACECONTROLS;
    procedure DXMBuildSelectionLayer(var Message: TMessage); message DXM_LAYOUT_BUILDSELECTIONLAYER;
    procedure DXMInvalidateSelectionLayer(var Message: TMessage); message DXM_LAYOUT_INVALIDATESELECTIONLAYER;
    procedure DXMCustomizeFormUpdate(var Message: TMessage); message DXM_REFRESHCUSTOMIZATION;
  protected
    //IdxLayoutComponent
    procedure SelectionChanged; stdcall;
    //IdxCustomizeControlsHelper
    function CanProcessChildren: Boolean; virtual;
    //IdxLayoutContainer
    function GetContainer: TdxLayoutContainer;

    function CanGetHitTest(const P: TPoint): Boolean;
    function CanProcessKeyboard: Boolean;
    function GetCanvas: TcxCanvas;
    function GetScrollOffset: TPoint;
    function IsFocusControlOnItemCaptionClick: Boolean;
    function IsShowLockedGroupChildren: Boolean;
    function IsSizableHorz: Boolean;
    function IsSizableVert: Boolean;
    procedure MakeItemVisible(AItem: TdxCustomLayoutItem);
    procedure PostPlaceControls;
    procedure SizeAdjustment;

    procedure ActionChange(Sender: TObject; CheckDefaults: Boolean); override;
    procedure AlignControls(AControl: TControl; var Rect: TRect); override;
    procedure CreateParams(var Params: TCreateParams); override;
  {$IFNDEF DELPHI12}
    procedure GetChildren(Proc: TGetChildProc; Root: TComponent); override;
  {$ENDIF}
    function GetCurrentCursor(X, Y: Integer): TCursor; override;
    procedure DoEnter; override;
    procedure DoExit; override;
    procedure DoGetCustomizationMenuItems(const ASelectedItems: TList; var AMenuItems: TdxLayoutCustomizeFormMenuItems); virtual;
    function DoShowPopupMenu(AMenu: TComponent; X, Y: Integer): Boolean; override;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure Loaded; override;
    procedure Paint; override;
    procedure SetName(const Value: TComponentName); override;
    procedure SetParentBackground(Value: Boolean); override;
    procedure WriteState(Writer: TWriter); override;
    procedure WndProc(var Message: TMessage); override;

    // Conditions
    function CanAutoSize(var NewWidth, NewHeight: Integer): Boolean; override;
    function CanFocusOnClick(X, Y: Integer): Boolean; override;
    function IsInternalControl(AControl: TControl): Boolean; override;
    function NeedRedrawOnResize: Boolean; override;

    // Notifications
    procedure BoundsChanged; override;
    procedure FontChanged; override;
    procedure LayoutChanged(AType: TdxChangeType = ctHard); override;

    // Mouse
    procedure DblClick; override;
    function GetDesignHitTest(X, Y: Integer; Shift: TShiftState): Boolean; override;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure MouseLeave(AControl: TControl); override;
    procedure MouseMove(Shift: TShiftState; X, Y: Integer); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;

    // Scrollbars
    function IsScrollDataValid: Boolean; override;
    function GetContentSize: TSize; override;
    function NeedsToBringInternalControlsToFront: Boolean; override;

    // Drag and Drop
    function AllowAutoDragAndDropAtDesignTime(X, Y: Integer; Shift: TShiftState): Boolean; override;
    function AllowDragAndDropWithoutFocus: Boolean; override;
    function CanDrag(X, Y: Integer): Boolean; override;
    function CanDragAndDrop: Boolean;
    function GetDragAndDropObjectClass: TcxDragAndDropObjectClass; override;
    function StartDragAndDrop(const P: TPoint): Boolean; override;
    procedure EndDragAndDrop(Accepted: Boolean); override;

    function GetCxLookAndFeel: TcxLookAndFeel;
    function GetPainterClass: TdxLayoutControlPainterClass; virtual;
    function GetViewInfoClass: TdxLayoutControlViewInfoClass; virtual;

    function CanMultiSelect: Boolean; virtual;
    function CanShowSelection: Boolean; virtual;
    procedure CustomizeFormPostUpdate(AUpdateTypes: TdxLayoutCustomizeFormUpdateTypes);
    procedure DoCustomization; virtual;
    procedure DoGetItemStoredProperties(AItem: TdxCustomLayoutItem; AProperties: TStrings); virtual;
    procedure DoGetItemStoredPropertyValue(AItem: TdxCustomLayoutItem;
      const AName: string; var AValue: Variant); virtual;
    procedure DoSetItemStoredPropertyValue(AItem: TdxCustomLayoutItem;
      const AName: string; const AValue: Variant); virtual;
    procedure DoGetStoredProperties(AProperties: TStrings); virtual;
    procedure DoGetStoredPropertyValue(const AName: string; var AValue: Variant); virtual;
    procedure DoSetStoredPropertyValue(const AName: string; const AValue: Variant); virtual;
    function GetAlignmentConstraintClass: TdxLayoutAlignmentConstraintClass; virtual;
    function GetContainerClass: TdxLayoutControlContainerClass; virtual;
    function GetDesignSelectorRect: TRect;
    function IsToolSelected: Boolean;
    function IsUpdateLocked: Boolean;

    // selections
    procedure PostBuildSelectionLayer; virtual;
    procedure PostInvalidateSelectionLayer(const R: TRect); virtual;

    // storing
    function OldLoadFromIniFile(const AFileName: string): Boolean;
    function OldLoadFromRegistry(const ARegistryPath: string): Boolean;
    function OldLoadFromStream(AStream: TStream): Boolean;

    // IcxEditorFieldLink
    function CreateFieldControls(X, Y: Integer; ADataSource: TObject; AFieldList: TList): Boolean;
    procedure DoCreateFieldControl(AControl: TControl; AField: TField);
    function NeedCreateCaption: Boolean;

    // undo
    procedure CancelLastUndo;
    procedure SaveToUndo;

    procedure CreateBoldFont;
    procedure CreateContainer;
    procedure CreateOptions;
    procedure DestroyBoldFont;
    procedure DestroyContainer;
    procedure DestroyOptions;

    property BoldFont: TFont read FBoldFont;
    property cxLookAndFeel: TcxLookAndFeel read GetCxLookAndFeel;
    property IsLayoutLoading: Boolean read GetIsLayoutLoading;
    property MenuItems: TdxLayoutCustomizeFormMenuItems read GetMenuItems write SetMenuItems;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    procedure BeginDragAndDrop; override;
    procedure GetTabOrderList(List: TList); override;
  {$IFDEF DELPHI12}
    procedure GetChildren(Proc: TGetChildProc; Root: TComponent); override;
  {$ENDIF}

    procedure Clear;
    function CreateAlignmentConstraint: TdxLayoutAlignmentConstraint;
    function FindItem(AControl: TControl): TdxLayoutItem; overload;
    function FindItem(AControlHandle: THandle): TdxLayoutItem; overload;
    function FindItem(const AName: string): TdxCustomLayoutItem; overload;
    function GetHitTest(const P: TPoint): TdxCustomLayoutHitTest; overload;
    function GetHitTest(X, Y: Integer): TdxCustomLayoutHitTest; overload;

    procedure BeginUpdate;
    procedure CancelUpdate;
    procedure EndUpdate(ANeedPack: Boolean = True);

    function CreateGroup(AGroupClass: TdxLayoutGroupClass = nil; AParent: TdxLayoutGroup = nil): TdxLayoutGroup;
    function CreateItem(AItemClass: TdxCustomLayoutItemClass = nil; AParent: TdxLayoutGroup = nil): TdxCustomLayoutItem;
    function CreateItemForControl(AControl: TControl; AParent: TdxLayoutGroup = nil): TdxLayoutItem;

    // Storing
    function CanRestore: Boolean;
    procedure Restore;
    procedure Store;

    procedure LoadFromIniFile(const AFileName: string);
    procedure LoadFromRegistry(const ARegistryPath: string);
    procedure LoadFromStream(AStream: TStream);
    procedure SaveToIniFile(const AFileName: string; ARecreate: Boolean = True);
    procedure SaveToRegistry(const ARegistryPath: string; ARecreate: Boolean = True);
    procedure SaveToStream(AStream: TStream);

    property AutoSize;

    property AutoContentSizes: TdxLayoutAutoContentSizes read GetAutoContentSizes write SetAutoContentSizes;
    property Container: TdxLayoutControlContainer read FContainer;
    property LayoutDirection: TdxLayoutDirection read GetLayoutDirection write SetLayoutDirection;

    property LookAndFeel: TdxCustomLayoutLookAndFeel read GetLayoutLookAndFeel write SetLayoutLookAndFeel;
    property LayoutLookAndFeel: TdxCustomLayoutLookAndFeel read GetLayoutLookAndFeel write SetLayoutLookAndFeel;

    property RedrawOnResize: Boolean read FRedrawOnResize write FRedrawOnResize;

    // Customization properties
    property Customization: Boolean read GetCustomization write SetCustomization;
    property CustomizeAvailableItemsViewKind: TdxLayoutAvailableItemsViewKind read GetCustomizeAvailableItemsViewKind
      write SetCustomizeAvailableItemsViewKind;
    property CustomizeForm: TdxLayoutControlCustomCustomizeForm read GetCustomizeForm;
    property CustomizeFormBounds: TRect read GetCustomizeFormBounds write SetCustomizeFormBounds;
    property CustomizeFormClass: TdxLayoutControlCustomCustomizeFormClass read GetCustomizeFormClass write SetCustomizeFormClass;
    property CustomizeFormTabbedView: Boolean read GetCustomizeFormTabbedView write SetCustomizeFormTabbedView;
    property ShowDesignSelectors: Boolean read GetShowDesignSelectors write SetShowDesignSelectors;
    property HighlightRoot: Boolean read GetHighlightRoot write SetHighlightRoot;

    property ContentBounds: TRect read GetContentBounds;
    property OccupiedClientWidth: Integer read GetOccupiedClientWidth;
    property OccupiedClientHeight: Integer read GetOccupiedClientHeight;

    // Options
    property OptionsImage: TdxLayoutImageOptions read GetOptionsImage write SetOptionsImage;

    // Item properies
    property OptionsItem: TdxLayoutItemOptions read FOptionsItem write SetOptionsItem;
    property AutoControlAlignment: Boolean read GetAutoControlAlignment write SetAutoControlAlignment default True;
    property AutoControlTabOrders: Boolean read GetAutoControlTabOrders write SetAutoControlTabOrders default True;
    property AbsoluteItemCount: Integer read GetAbsoluteItemCount;
    property AbsoluteItems[Index: Integer]: TdxCustomLayoutItem read GetAbsoluteItem;
    property AvailableItemCount: Integer read GetAvailableItemCount;
    property AvailableItems[Index: Integer]: TdxCustomLayoutItem read GetAvailableItem;
    property AlignmentConstraintCount: Integer read GetAlignmentConstraintCount;
    property AlignmentConstraints[Index: Integer]: TdxLayoutAlignmentConstraint read GetAlignmentConstraint;
    property Items: TdxLayoutGroup read GetItems;

    // Storing properties
    property OptionsStoring: TdxStoringOptions read FOptionsStoring write SetOptionsStoring;
    property IniFileName: string read GetIniFileName write SetIniFileName;
    property RegistryPath: string read GetRegistryPath write SetRegistryPath;
    property StoreInIniFile: Boolean read GetStoreInIniFile write SetStoreInIniFile;
    property StoreInRegistry: Boolean read GetStoreInRegistry write SetStoreInRegistry;

    // Undo
    property UndoRedoManager: TdxUndoRedoManager read GetUndoRedoManager;

    property Painter: TdxLayoutControlPainter read FPainter;
    property ViewInfo: TdxLayoutControlViewInfo read FViewInfo;

    property OnCustomization: TNotifyEvent read FOnCustomization write FOnCustomization;
    property OnGetCustomizationMenuItems: TdxLayoutGetCustomizationMenuItemsEvent
      read FOnGetCustomizationMenuItems write FOnGetCustomizationMenuItems;
    property OnGetItemStoredProperties: TdxLayoutControlGetItemStoredPropertiesEvent
      read FOnGetItemStoredProperties write FOnGetItemStoredProperties;
    property OnGetItemStoredPropertyValue: TdxLayoutControlGetItemStoredPropertyValueEvent
      read FOnGetItemStoredPropertyValue write FOnGetItemStoredPropertyValue;
    property OnSetItemStoredPropertyValue: TdxLayoutControlSetItemStoredPropertyValueEvent
      read FOnSetItemStoredPropertyValue write FOnSetItemStoredPropertyValue;
    property OnGetStoredProperties: TdxLayoutControlGetStoredPropertiesEvent
      read FOnGetStoredProperties write FOnGetStoredProperties;
    property OnGetStoredPropertyValue: TdxLayoutControlGetStoredPropertyValueEvent
      read FOnGetStoredPropertyValue write FOnGetStoredPropertyValue;
    property OnSetStoredPropertyValue: TdxLayoutControlSetStoredPropertyValueEvent
      read FOnSetStoredPropertyValue write FOnSetStoredPropertyValue;
  end;

  TdxLayoutControl = class(TdxCustomLayoutControl)
  published
    property Align;
    property Anchors;
    property BevelEdges;
    property BevelInner;
    property BevelOuter;
    property BevelKind;
    property BevelWidth;
    property BorderWidth;
    property Constraints;
    property DragCursor;
    property DragKind;
    property DragMode;
    property Enabled;
    property FocusOnClick;
    property Font;
    property MenuItems default dxDefaultLayoutCustomizeFormMenuItems;
    property ParentBackground default False;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property ShowHint;
    property TabOrder;
    property TabStop;  // obsolete
    property Visible;

    property AutoContentSizes stored False; // obsolete
    property AutoControlAlignment stored False; // obsolete
    property AutoControlTabOrders stored False; // obsolete
    property AutoSize;

    property LookAndFeel stored False; // obsolete
    property LayoutLookAndFeel;

    property RedrawOnResize default True;
    
    // Customization properties
    property CustomizeFormTabbedView default False;
    property ShowDesignSelectors default True;
    property HighlightRoot default True;

    // Options
    property OptionsImage;
    property OptionsItem;

    // Storing properties
    property OptionsStoring;
    property IniFileName stored False; // obsolete
    property RegistryPath stored False; // obsolete
    property StoreInIniFile stored False; // obsolete
    property StoreInRegistry stored False; // obsolete

    property OnClick;
    property OnContextPopup;
    property OnDblClick;
    property OnDragDrop;
    property OnDragOver;
    property OnEndDock;
    property OnEndDrag;
    property OnEnter;
    property OnExit;
    property OnKeyDown;
    property OnKeyPress;
    property OnKeyUp;
    property OnMouseDown;
    property OnMouseEnter;
    property OnMouseLeave;
    property OnMouseMove;
    property OnMouseUp;
    property OnMouseWheel;
    property OnMouseWheelDown;
    property OnMouseWheelUp;
    property OnResize;
    property OnStartDock;
    property OnStartDrag;

    property OnCustomization;
    property OnGetCustomizationMenuItems;
    property OnGetItemStoredProperties;
    property OnGetItemStoredPropertyValue;
    property OnSetItemStoredPropertyValue;
    property OnGetStoredProperties;
    property OnGetStoredPropertyValue;
    property OnSetStoredPropertyValue;
  end;

  { TdxLayoutControlPainter }

  TdxLayoutControlPainter = class(TdxCustomLayoutControlHandler)
  protected
    function GetInternalCanvas: TcxCanvas; virtual;
    procedure MakeCanvasClipped(ACanvas: TcxCanvas);

    procedure DrawBackground(ACanvas: TcxCanvas); virtual;
    procedure DrawDesignSelector(ACanvas: TcxCanvas); virtual;
    procedure DrawItems(ACanvas: TcxCanvas); virtual;
    procedure DrawDesignFeatures(ACanvas: TcxCanvas);

    property InternalCanvas: TcxCanvas read GetInternalCanvas;
  public
    function GetCanvas: TcxCanvas; virtual;

    procedure Paint; virtual;
  end;

  { TdxLayoutControlViewInfo }
  
  TdxLayoutControlViewInfo = class(TdxCustomLayoutControlHandler)
  private
    FCanvas: TcxCanvas;

    function GetClientHeight: Integer;
    function GetClientWidth: Integer;
    function GetContainerViewInfo: TdxLayoutControlContainerViewInfo;
    function GetContentHeight: Integer;
    function GetContentWidth: Integer;
    function GetItemsViewInfo: TdxLayoutGroupViewInfo;
    function GetLayoutLookAndFeel: TdxCustomLayoutLookAndFeel;
    function GetIsValid: Boolean;
  protected
    procedure CreateViewInfos; virtual;
    procedure DestroyViewInfos; virtual;
    procedure RecreateViewInfos;

    procedure AlignItems; virtual;
    procedure AutoAlignControls; virtual;
    procedure CalculateItemsViewInfo; virtual;
    function GetIsTransparent: Boolean; virtual;
    function HasBackground: Boolean;
    procedure InvalidateRect(const R: TRect; EraseBackground: Boolean);
    function IsCustomization: Boolean;
    procedure PrepareData; virtual;

    function GetCanvas: TcxCanvas; virtual;
    function GetClientBounds: TRect; virtual;
    function GetContentBounds: TRect; virtual;

    property Canvas: TcxCanvas read GetCanvas;
    property ContainerViewInfo: TdxLayoutControlContainerViewInfo read GetContainerViewInfo;
    property IsTransparent: Boolean read GetIsTransparent;
    property IsValid: Boolean read GetIsValid;
  public
    constructor Create(AControl: TdxCustomLayoutControl); override;
    destructor Destroy; override;
    procedure Calculate; virtual;
    function GetItemWithMouse(const P: TPoint): TdxCustomLayoutItem;

    property ClientBounds: TRect read GetClientBounds;
    property ClientHeight: Integer read GetClientHeight;
    property ClientWidth: Integer read GetClientWidth;
    property ContentBounds: TRect read GetContentBounds;
    property ContentHeight: Integer read GetContentHeight;
    property ContentWidth: Integer read GetContentWidth;
    property ItemsViewInfo: TdxLayoutGroupViewInfo read GetItemsViewInfo;
    property LayoutLookAndFeel: TdxCustomLayoutLookAndFeel read GetLayoutLookAndFeel;
  end;

var
  dxLayoutDesignTimeSelectionHelperClass: TdxLayoutRunTimeSelectionHelperClass;

implementation

{$R *.res}

uses
  Types, TypInfo, Registry, Math, Variants,
  UxTheme, Themes,
  cxContainer, dxOffice11, cxButtons, dxLayoutControlAdapters, dxLayoutCustomizeForm,
  dxLayoutStrs, dxLayoutDragAndDrop, dxHooks;

type
  TControlAccess = class(TControl);
  TdxLayoutItemAccess = class(TdxLayoutItem);
  TdxLayoutGroupAccess = class(TdxLayoutGroup);
  TdxCustomLayoutItemViewInfoAccess = class(TdxCustomLayoutItemViewInfo);
  TdxLayoutItemViewInfoAccess = class(TdxLayoutItemViewInfo);
  TdxLayoutGroupViewInfoAccess = class(TdxLayoutGroupViewInfo);
  TdxCustomLayoutItemAccess = class(TdxCustomLayoutItem);
  TdxUndoRedoManagerAccess = class(TdxUndoRedoManager);

const
  ScrollStep = 10;

  dxLayoutSignature: Integer = $4C434458;

function dxGetSelectionMarker(const P: TPoint; AMarkerWidth: Integer): TRect;
begin
  Result := cxRectInflate(cxRect(P, P), (AMarkerWidth - 1) div 2, (AMarkerWidth - 1) div 2);
  Inc(Result.Bottom);
  Inc(Result.Right);
end;

function dxGetSelectionMarkers(const ABorderBounds: TRect; AMarkerWidth: Integer): TRects;
var
  AMiddleX, AMiddleY: Integer;
begin
  SetLength(Result, 8);
  with ABorderBounds do
  begin
    AMiddleX := (Left + Right - 1) div 2;
    AMiddleY := (Top + Bottom - 1) div 2;
    Result[0] := dxGetSelectionMarker(TopLeft, AMarkerWidth);
    Result[1] := dxGetSelectionMarker(Point(AMiddleX, Top), AMarkerWidth);
    Result[2] := dxGetSelectionMarker(Point(Right - 1, Top), AMarkerWidth);
    Result[3] := dxGetSelectionMarker(Point(Right - 1, AMiddleY), AMarkerWidth);
    Result[4] := dxGetSelectionMarker(Point(Right - 1, Bottom - 1), AMarkerWidth);
    Result[5] := dxGetSelectionMarker(Point(AMiddleX, Bottom - 1), AMarkerWidth);
    Result[6] := dxGetSelectionMarker(Point(Left, Bottom - 1), AMarkerWidth);
    Result[7] := dxGetSelectionMarker(Point(Left, AMiddleY), AMarkerWidth);
  end;
end;

procedure dxDrawSelectionMarkers(ACanvas: TcxCanvas; AMarkers: TRects;
  ABorderColor, ABorderMarkerInnerColor: TColor);

  procedure DrawSelectionBorderMarker(const R: TRect);
  begin
    ACanvas.Brush.Color := ABorderMarkerInnerColor;
    ACanvas.Pen.Color := ABorderColor;
    ACanvas.Canvas.Rectangle(R);
    ACanvas.ExcludeClipRect(R);
  end;

var
  I: Integer;
begin
  for I := Low(AMarkers) to High(AMarkers) do
    DrawSelectionBorderMarker(AMarkers[I]);
end;

type

  { TdxCustomizationControlHelper }

  TdxCustomizationControlHelper = class(TdxControlsDesignSelectorHelper)
  private
    FLayoutControl: TdxCustomLayoutControl;
    FLayoutItem: TdxLayoutItem;
    procedure SetLayoutControl(AValue: TdxCustomLayoutControl);
    procedure SetLayoutItem(AValue: TdxLayoutItem);
  protected
    function DoControlWndProc(var Message: TMessage): Boolean; override;
    function GetChildClass: TdxControlsDesignSelectorHelperClass; override;

    function IsActiveDesignSelector: Boolean; override;
    function IsHitTestTransparent(const P: TPoint): Boolean; override;
    function IsSelected: Boolean; override;
    function IsValid: Boolean; override;

    function CanDrawDesignSelector: Boolean; override;

    function IsCustomization: Boolean;
    function IsDesigning: Boolean;
  public
    procedure Assign(Source: TPersistent); override;
    property LayoutControl: TdxCustomLayoutControl read FLayoutControl write SetLayoutControl;
    property LayoutItem: TdxLayoutItem read FLayoutItem write SetLayoutItem;
  end;

  { TdxDesignCustomizationHelper }

  TdxDesignCustomizationHelper = class
  private
    FLayoutControls: TcxComponentList;
    function GetCount: Integer;
    function GetItem(AIndex: Integer): TdxCustomLayoutControl;
  protected
    function FindActiveDesigner(out ADesigner: IdxLayoutDesignerHelper): Boolean;
  public
    constructor Create;
    destructor Destroy; override;

    class procedure AddLayout(ALayout: TdxCustomLayoutControl);
    class procedure RemoveLayout(ALayout: TdxCustomLayoutControl);

    property Count: Integer read GetCount;
    property Items[AIndex: Integer]: TdxCustomLayoutControl read GetItem;
  end;

var
  FDesignCustomizationHelper: TdxDesignCustomizationHelper;

function dxDesignCustomizationHelper: TdxDesignCustomizationHelper;
begin
  if FDesignCustomizationHelper = nil then
    FDesignCustomizationHelper := TdxDesignCustomizationHelper.Create;
  Result := FDesignCustomizationHelper;
end;

{#$ SEGMENT0}

{ TdxCustomizationControlHelper }

procedure TdxCustomizationControlHelper.Assign(Source: TPersistent);
var
  AItem: TdxCustomizationControlHelper;
begin
  if Source is TdxCustomizationControlHelper then
  begin
    AItem := Source as TdxCustomizationControlHelper;
    FLayoutItem := AItem.LayoutItem;
    FLayoutControl := AItem.LayoutControl;
  end;
  inherited Assign(Source);
end;

function TdxCustomizationControlHelper.DoControlWndProc(var Message: TMessage): Boolean;
begin
  case Message.Msg of
    WM_PAINT, WM_ERASEBKGND, WM_NCPAINT, CM_TEXTCHANGED:
      if IsValid and ((Control = nil) or not (csPaintCopy in Control.ControlState)) then
        LayoutControl.PostInvalidateSelectionLayer(LayoutItem.ViewInfo.ControlViewInfo.Bounds);
  end;
  Result := inherited DoControlWndProc(Message);
end;

function TdxCustomizationControlHelper.GetChildClass: TdxControlsDesignSelectorHelperClass;
begin
  Result := TdxCustomizationControlHelper;
end;

function TdxCustomizationControlHelper.IsActiveDesignSelector: Boolean;
begin
  Result := inherited IsActiveDesignSelector and TdxLayoutItemAccess(LayoutItem).IsDesignSelectorVisible;
end;

function TdxCustomizationControlHelper.IsHitTestTransparent(const P: TPoint): Boolean;
begin
  if LayoutControl.Customization then
    Result := True
  else
    Result := inherited IsHitTestTransparent(P);
end;

function TdxCustomizationControlHelper.IsSelected: Boolean;
begin
  Result := (not LayoutControl.Customization and LayoutItem.ViewInfo.Selected) or
    (LayoutControl.Customization and LayoutControl.Container.IsComponentSelected(LayoutItem.Control));
end;

function TdxCustomizationControlHelper.IsCustomization: Boolean;
begin
  Result := LayoutControl.Customization;
end;

function TdxCustomizationControlHelper.IsDesigning: Boolean;
begin
  Result := TdxLayoutItemAccess(LayoutItem).IsDesigning;
end;

function TdxCustomizationControlHelper.IsValid: Boolean;
begin
  Result := inherited IsValid and (LayoutControl <> nil) and
    (LayoutItem <> nil) and TdxLayoutItemAccess(LayoutItem).IsViewInfoValid;
end;

function TdxCustomizationControlHelper.CanDrawDesignSelector: Boolean;
begin
  Result := inherited CanDrawDesignSelector and LayoutItem.ActuallyVisible;
end;

procedure TdxCustomizationControlHelper.SetLayoutControl(AValue: TdxCustomLayoutControl);
begin
  if FLayoutControl <> AValue then
  begin
    FLayoutControl := AValue;
    CheckChildren;
  end;
end;

procedure TdxCustomizationControlHelper.SetLayoutItem(AValue: TdxLayoutItem);
begin
  if AValue <> FLayoutItem then
  begin
    FLayoutItem := AValue;
    CheckChildren;
  end;
end;

{ TdxDesignCustomizationHelper }

function IsParentFocused(AParent: THandle): Boolean;
begin
  Result := (AParent <> 0) and ((AParent = GetFocus) or IsChildClassWindow(AParent) and IsParentFocused(GetParent(AParent)));
end;

function ProcessKeyboardMessage(AKey: WPARAM; AFlags: LPARAM): Boolean;

  function SelectItemParent(AComponent: TComponent): Boolean;
  var
    AIntf: IdxLayoutSelectableItem;
  begin
    Result := Supports(AComponent, IdxLayoutSelectableItem, AIntf);
    if Result then
      AIntf.SelectParent;
  end;

  function KeyPressed: Boolean;
  begin
    Result := (AFlags shr 31) and 1 = 0;
  end;

var
  AList: TcxComponentList;
  ADesigner: IdxLayoutDesignerHelper;
begin
  Result := KeyPressed;
  if Result then
  begin
    AList := TcxComponentList.Create;
    try
      if dxDesignCustomizationHelper.FindActiveDesigner(ADesigner) and ADesigner.CanProcessKeyboard then
        ADesigner.GetSelection(AList);
      Result := (AList.Count > 0);
      if Result then
        case AKey of
          VK_DELETE:
            begin
              ADesigner.DeleteSelection;
              Result := False;
            end;
          VK_ESCAPE:
            Result := SelectItemParent(AList[0]);
        else
          Result := False;
        end;
    finally
      AList.Free;
    end;
  end;
end;

procedure dxLayoutKeyboardHook(ACode: Integer; wParam: WPARAM; lParam: LPARAM; var AHookResult: LRESULT);
begin
  if (ACode = HC_ACTION) and ProcessKeyboardMessage(wParam, lParam) then
    AHookResult := 1
end;

constructor TdxDesignCustomizationHelper.Create;
begin
  inherited;
  FLayoutControls := TcxComponentList.Create(False);
  dxSetHook(htKeyboard, dxLayoutKeyboardHook);
end;

destructor TdxDesignCustomizationHelper.Destroy;
begin
  dxReleaseHook(dxLayoutKeyboardHook);
  FreeAndNil(FLayoutControls);
  inherited;
end;

class procedure TdxDesignCustomizationHelper.AddLayout(ALayout: TdxCustomLayoutControl);
begin
  if dxDesignCustomizationHelper.FLayoutControls.IndexOf(ALayout) = -1 then
    dxDesignCustomizationHelper.FLayoutControls.Add(ALayout);
end;

class procedure TdxDesignCustomizationHelper.RemoveLayout(ALayout: TdxCustomLayoutControl);
begin
  dxDesignCustomizationHelper.FLayoutControls.Extract(ALayout);
end;

function TdxDesignCustomizationHelper.FindActiveDesigner(out ADesigner: IdxLayoutDesignerHelper): Boolean;
var
  I: Integer;
  ALayout: TdxCustomLayoutControl;
begin
  Result := False;
  for I := 0 to FLayoutControls.Count - 1 do
  begin
    ALayout := FLayoutControls[I] as TdxCustomLayoutControl;
    Result := Supports(ALayout.Container, IdxLayoutDesignerHelper, ADesigner) and ADesigner.IsActive and ALayout.HandleAllocated and
      ((ALayout.Handle = GetFocus) or ((ALayout.Parent <> nil) and ALayout.Parent.HandleAllocated and IsParentFocused(ALayout.Parent.Handle)));
    if Result then
      Break;
  end;
end;

function TdxDesignCustomizationHelper.GetCount: Integer;
begin
  Result := FLayoutControls.Count;
end;

function TdxDesignCustomizationHelper.GetItem(AIndex: Integer): TdxCustomLayoutControl;
begin
  Result := FLayoutControls[AIndex] as TdxCustomLayoutControl;
end;

{#$ SEGMENT1}

{ TdxLayoutControlPersistent }

constructor TdxLayoutControlPersistent.Create(AControl: TdxCustomLayoutControl);
begin
  inherited Create;
  FControl := AControl;
end;

procedure TdxLayoutControlPersistent.Changed;
begin
end;

function TdxLayoutControlPersistent.GetOwner: TPersistent;
begin
  Result := FControl;
end;

{ TdxLayoutControlContainer }

constructor TdxLayoutControlContainer.Create(AControl: TdxCustomLayoutControl);
begin
  inherited Create(AControl);
  FControl := AControl;
end;

procedure TdxLayoutControlContainer.BeginDragAndDrop;
begin
  inherited;
  Control.BeginDragAndDrop;
end;

function TdxLayoutControlContainer.CanDragAndDrop: Boolean;
begin
  Result := Control.CanDragAndDrop;
end;

procedure TdxLayoutControlContainer.FinishDragAndDrop(Accepted: Boolean);
begin
  inherited;
  Control.FinishDragAndDrop(Accepted);
end;

function TdxLayoutControlContainer.DoGetCustomizationMenuItems(
  const ASelectedItems: TList): TdxLayoutCustomizeFormMenuItems;
begin
  Result := inherited DoGetCustomizationMenuItems(ASelectedItems);
  Control.DoGetCustomizationMenuItems(ASelectedItems, Result);
end;

function TdxLayoutControlContainer.GetPainterClass: TdxLayoutContainerPainterClass;
begin
  Result := TdxLayoutControlContainerPainter;
end;

function TdxLayoutControlContainer.GetStoredProperties(
  AProperties: TStrings): Boolean;
begin
  Result := inherited GetStoredProperties(AProperties);
  Control.DoGetStoredProperties(AProperties);
end;

procedure TdxLayoutControlContainer.GetStoredPropertyValue(const AName: string;
  var AValue: Variant);
begin
  inherited GetStoredPropertyValue(AName, AValue);
  Control.DoGetStoredPropertyValue(AName, AValue);
end;

function TdxLayoutControlContainer.GetViewInfoClass: TdxLayoutContainerViewInfoClass;
begin
  Result := TdxLayoutControlContainerViewInfo;
end;

procedure TdxLayoutControlContainer.GetItemStoredCustomProperties(
  AItem: TdxCustomLayoutItem; AProperties: TStrings);
begin
  Control.DoGetItemStoredProperties(AItem, AProperties);
end;

procedure TdxLayoutControlContainer.GetItemStoredCustomPropertyValue(
  AItem: TdxCustomLayoutItem; const AName: string; var AValue: Variant);
begin
  Control.DoGetItemStoredPropertyValue(AItem, AName, AValue);
end;

procedure TdxLayoutControlContainer.SetItemStoredCustomPropertyValue(
  AItem: TdxCustomLayoutItem; const AName: string; const AValue: Variant);
begin
  Control.DoSetItemStoredPropertyValue(AItem, AName, AValue);
end;

procedure TdxLayoutControlContainer.SetStoredPropertyValue(const AName: string;
  const AValue: Variant);
begin
  inherited SetStoredPropertyValue(AName, AValue);
  Control.DoSetStoredPropertyValue(AName, AValue);
end;

function TdxLayoutControlContainer.CanGetHitTest(const P: TPoint): Boolean;
begin
  Result := Control.CanGetHitTest(P);
end;

function TdxLayoutControlContainer.CanRestore: Boolean;
begin
  Result := Control.CanRestore;
end;

procedure TdxLayoutControlContainer.Restore;
begin
  inherited;
  Control.Restore;
end;

procedure TdxLayoutControlContainer.SizeAdjustment;
begin
  inherited;
  Control.SizeAdjustment;
end;

procedure TdxLayoutControlContainer.Store;
begin
  inherited;
  Control.Store;
end;

function TdxLayoutControlContainer.StoringSupports: Boolean;
begin
  Result := True;
end;

function TdxLayoutControlContainer.CanProcessKeyboard: Boolean;
begin
  Result := Control.CanProcessKeyboard;
end;

function TdxLayoutControlContainer.CanUpdate: Boolean;
begin
  Result := Control.HandleAllocated;
end;

function TdxLayoutControlContainer.GetCanvas: TcxCanvas;
begin
  Result := Control.GetCanvas;
end;

function TdxLayoutControlContainer.CreateCustomizationControlHelper(AItem: TdxLayoutItem): TdxControlsDesignSelectorHelper;
begin
  Result := TdxCustomizationControlHelper.Create(AItem.Control);
  TdxCustomizationControlHelper(Result).LayoutControl := Control;
  TdxCustomizationControlHelper(Result).LayoutItem := AItem;
end;

procedure TdxLayoutControlContainer.CustomizationChanged;
begin
  inherited;
  Control.DoCustomization;  
end;

procedure TdxLayoutControlContainer.CustomizeFormPostUpdate(AUpdateTypes: TdxLayoutCustomizeFormUpdateTypes);
begin
  inherited;
  Control.CustomizeFormPostUpdate(AUpdateTypes);
end;

procedure TdxLayoutControlContainer.PostBuildSelectionLayer;
begin
  inherited;
  Control.PostBuildSelectionLayer;
end;

procedure TdxLayoutControlContainer.PostInvalidateSelectionLayer(const R: TRect);
begin
  inherited;
  Control.PostInvalidateSelectionLayer(R);
end;

procedure TdxLayoutControlContainer.PostPlaceControls;
begin
  inherited;
  Control.PostPlaceControls;
end;

function TdxLayoutControlContainer.GetClientBounds: TRect;
begin
  Result := Control.ClientBounds;
end;

function TdxLayoutControlContainer.GetClientRect: TRect;
begin
  Result := Control.ClientRect;
end;

function TdxLayoutControlContainer.GetItemsOwner: TComponent;
begin
  Result := Control.Owner;
end;

function TdxLayoutControlContainer.GetItemsParent: TcxControl;
begin
  Result := Control;
end;

function TdxLayoutControlContainer.GetItemsParentComponent: TComponent;
begin
  Result := Control;
end;

function TdxLayoutControlContainer.GetScrollOffset: TPoint;
begin
  Result := Control.GetScrollOffset;
end;

function TdxLayoutControlContainer.GetSelectionHelperClass: TdxLayoutRunTimeSelectionHelperClass;
begin
  if IsDesigning then
    Result := dxLayoutDesignTimeSelectionHelperClass
  else
    Result := dxLayoutRunTimeSelectionHelperClass;
end;

function TdxLayoutControlContainer.HasBackground: Boolean;
begin
  Result := Control.HasBackground;
end;

function TdxLayoutControlContainer.IsShowLockedGroupChildren: Boolean;
begin
  Result := Control.IsShowLockedGroupChildren;
end;

function TdxLayoutControlContainer.IsAutoControlAlignment: Boolean;
begin
  Result := Control.AutoControlAlignment;
end;

function TdxLayoutControlContainer.IsAutoControlTabOrders: Boolean;
begin
  Result := Control.AutoControlTabOrders;
end;

function TdxLayoutControlContainer.IsFocusControlOnItemCaptionClick: Boolean;
begin
  Result := Control.IsFocusControlOnItemCaptionClick;
end;

function TdxLayoutControlContainer.IsSizableHorz: Boolean;
begin
  Result := Control.IsSizableHorz;
end;

function TdxLayoutControlContainer.IsSizableVert: Boolean;
begin
  Result := Control.IsSizableVert;
end;

procedure TdxLayoutControlContainer.MakeVisible(AItem: TdxCustomLayoutItem);
begin
  inherited;
  Control.MakeItemVisible(AItem);
end;

procedure TdxLayoutControlContainer.Modified;
begin
  inherited;
  Control.Modified;
end;

function TdxLayoutControlContainer.GetBoldFont: TFont;
begin
  Result := Control.BoldFont;
end;

function TdxLayoutControlContainer.GetDefaultFont: TFont;
begin
  Result := Control.Font;
end;

procedure TdxLayoutControlContainer.InitializeSubControlsCxLookAndFeel;
begin
  inherited;
  Control.InitializeSubControlsCxLookAndFeel;
end;

procedure TdxLayoutControlContainer.LayoutLookAndFeelUserChanged;
begin
  if IsDestroying then
    Exit;
  if (LayoutLookAndFeel <> nil) and not Control.DoubleBuffered then
    Control.DoubleBuffered := LayoutLookAndFeel.NeedDoubleBuffered;
  inherited;
end;

function TdxLayoutControlContainer.GetPainter: TdxLayoutControlContainerPainter;
begin
  Result := TdxLayoutControlContainerPainter(inherited Painter);
end;

function TdxLayoutControlContainer.GetViewInfo: TdxLayoutControlContainerViewInfo;
begin
  Result := TdxLayoutControlContainerViewInfo(inherited ViewInfo);
end;

{#$ SEGMENT11}
{ TdxStoringOptions }

procedure TdxStoringOptions.Assign(Source: TPersistent);
var
  ASourceOptions: TdxStoringOptions;
begin
  if Source is TdxStoringOptions then
  begin
    ASourceOptions := TdxStoringOptions(Source);
    IniFileName := ASourceOptions.IniFileName;
    RegistryPath := ASourceOptions.RegistryPath;
    StoreToIniFile := ASourceOptions.StoreToIniFile;
    StoreToRegistry := ASourceOptions.StoreToRegistry;
  end
  else
    inherited;
end;

function TdxStoringOptions.CanStoreToIniFile: Boolean;
begin
  Result := StoreToIniFile and (IniFileName <> '');
end;

function TdxStoringOptions.CanStoreToRegistry: Boolean;
begin
  Result := StoreToRegistry and (RegistryPath <> '');
end;

function TdxStoringOptions.CanRestoreFromIniFile: Boolean;
begin
  Result := CanStoreToIniFile and FileExists(IniFileName);
end;

function TdxStoringOptions.CanRestoreFromRegistry: Boolean;
var
  ARegistry: TRegistry;
begin
  Result := CanStoreToRegistry;
  if Result then
  begin
    ARegistry := TRegistry.Create(KEY_ALL_ACCESS);
    try
      Result := ARegistry.OpenKey(RegistryPath, False);
      ARegistry.CloseKey;
    finally
      ARegistry.Free;
    end;
  end;
end;

{ TdxLayoutItemOptions }

constructor TdxLayoutItemOptions.Create(AControl: TdxCustomLayoutControl);
begin
  inherited;
  FAutoControlAreaAlignment := True;
  FAutoControlTabOrders := True;
  FShowLockedGroupChildren := True;
end;

procedure TdxLayoutItemOptions.Assign(Source: TPersistent);
begin
  if Source is TdxLayoutItemOptions then
  begin
    Control.BeginUpdate;
    try
      AutoControlAreaAlignment := TdxLayoutItemOptions(Source).AutoControlAreaAlignment;
      AutoControlTabOrders := TdxLayoutItemOptions(Source).AutoControlTabOrders;
      FocusControlOnItemCaptionClick := TdxLayoutItemOptions(Source).FocusControlOnItemCaptionClick;
      SizableHorz := TdxLayoutItemOptions(Source).SizableHorz;
      SizableVert := TdxLayoutItemOptions(Source).SizableVert;
      ShowLockedGroupChildren := TdxLayoutItemOptions(Source).ShowLockedGroupChildren;
    finally
      Control.CancelUpdate;
      Changed;
    end;
  end
  else
    inherited;
end;

procedure TdxLayoutItemOptions.Changed;
begin
  Control.LayoutChanged;
end;

procedure TdxLayoutItemOptions.SetAutoControlAreaAlignment(Value: Boolean);
begin
  if FAutoControlAreaAlignment <> Value then
  begin
    FAutoControlAreaAlignment := Value;
    Changed;
  end;
end;

procedure TdxLayoutItemOptions.SetAutoControlTabOrders(Value: Boolean);
begin
  if FAutoControlTabOrders <> Value then
  begin
    FAutoControlTabOrders := Value;
    Changed;
  end;
end;

procedure TdxLayoutItemOptions.SetShowLockedGroupChildren(Value: Boolean);
begin
  if FShowLockedGroupChildren <> Value then
  begin
    FShowLockedGroupChildren := Value;
    Control.CustomizeFormPostUpdate([cfutAvailableItems, cfutVisibleItems]);
  end;
end;

{ TdxCustomLayoutControl }

constructor TdxCustomLayoutControl.Create(AOwner: TComponent);
begin
  inherited;

  cxLookAndFeel.OnMasterBeginChange := MasterLookAndFeelBeginChangeHandler;
  cxLookAndFeel.OnMasterEndChange := MasterLookAndFeelEndChangeHandler;

  ControlStyle := ControlStyle + [csAcceptsControls, csOpaque];
  ParentBackground := False;
  RedrawOnResize := True;
  SetBounds(Left, Top, 300, 250);

  CreateOptions;
  FStoredStream := TMemoryStream.Create;
  CreateBoldFont;

  CreateContainer;
  CreateHandlers;

  InitializeSubControlsCxLookAndFeel;

  if IsDesigning then
    dxDesignCustomizationHelper.AddLayout(Self);
end;

destructor TdxCustomLayoutControl.Destroy;
begin
  dxDesignCustomizationHelper.RemoveLayout(Self);
  if not IsDesigning then
    Store;
  DestroyHandlers;
  DestroyContainer;
  DestroyBoldFont;
  FreeAndNil(FStoredStream);
  DestroyOptions;
  inherited Destroy;
end;

procedure TdxCustomLayoutControl.BeginDragAndDrop;
begin
  DragAndDropState := ddsInProcess;
  inherited BeginDragAndDrop;
end;

procedure TdxCustomLayoutControl.GetTabOrderList(List: TList);
begin
  if (List.Count > 0) and (List.Last = Self) then
    List.Extract(List.Last);
  Container.GetTabOrderList(List);
end;

function TdxCustomLayoutControl.GetAutoControlAlignment: Boolean;
begin
  Result := OptionsItem.AutoControlAreaAlignment;
end;

function TdxCustomLayoutControl.GetAutoControlTabOrders: Boolean;
begin
  Result := OptionsItem.AutoControlTabOrders;
end;

function TdxCustomLayoutControl.GetAbsoluteItem(Index: Integer): TdxCustomLayoutItem;
begin
  Result := FContainer.AbsoluteItems[Index];
end;

function TdxCustomLayoutControl.GetAbsoluteItemCount: Integer;
begin
  Result := FContainer.AbsoluteItemCount;
end;

function TdxCustomLayoutControl.GetAlignmentConstraint(Index: Integer): TdxLayoutAlignmentConstraint;
begin
  Result := FContainer.AlignmentConstraints[Index];
end;

function TdxCustomLayoutControl.GetAlignmentConstraintCount: Integer;
begin
  Result := FContainer.AlignmentConstraintCount;
end;

function TdxCustomLayoutControl.GetAvailableItem(Index: Integer): TdxCustomLayoutItem;
begin
  Result := FContainer.AvailableItems[Index];
end;

function TdxCustomLayoutControl.GetAvailableItemCount: Integer;
begin
  Result := FContainer.AvailableItemCount;
end;

function TdxCustomLayoutControl.GetContentBounds: TRect;
begin
  Result := ViewInfo.ContentBounds;
end;

function TdxCustomLayoutControl.GetCustomization: Boolean;
begin
  Result := Container.Customization;
end;

function TdxCustomLayoutControl.GetCustomizeAvailableItemsViewKind: TdxLayoutAvailableItemsViewKind;
begin
  Result := Container.CustomizeAvailableItemsViewKind;
end;

function TdxCustomLayoutControl.GetCustomizeForm: TdxLayoutControlCustomCustomizeForm;
begin
  Result := Container.CustomizeForm;
end;

function TdxCustomLayoutControl.GetCustomizeFormBounds: TRect;
begin
  Result := Container.CustomizeFormBounds;
end;

function TdxCustomLayoutControl.GetCustomizeFormClass: TdxLayoutControlCustomCustomizeFormClass;
begin
  Result := Container.CustomizeFormClass;
end;

function TdxCustomLayoutControl.GetCustomizeFormTabbedView: Boolean;
begin
  Result := Container.CustomizeFormTabbedView;
end;

function TdxCustomLayoutControl.GetHighlightRoot: Boolean;
begin
  Result := Container.HighlightRoot;
end;

function TdxCustomLayoutControl.GetIsLayoutLoading: Boolean;
begin
  Result := Container.IsRestoring;
end;

function TdxCustomLayoutControl.GetItems: TdxLayoutGroup;
begin
  Result := Container.Root;
end;

function TdxCustomLayoutControl.GetOccupiedClientWidth: Integer;
begin
  if ViewInfo.IsValid then
    Result := TdxLayoutGroupViewInfoAccess(ViewInfo.ItemsViewInfo).CalculateWidth
  else
    Result := -1;
end;

function TdxCustomLayoutControl.GetOptionsImage: TdxLayoutImageOptions;
begin
  if Container <> nil then 
    Result := Container.ImageOptions
  else
    Result := nil;
end;

function TdxCustomLayoutControl.GetShowDesignSelectors: Boolean;
begin
  Result := Container.ShowDesignSelectors;
end;

function TdxCustomLayoutControl.GetOccupiedClientHeight: Integer;
begin
  if ViewInfo.IsValid then
    Result := TdxLayoutGroupViewInfoAccess(ViewInfo.ItemsViewInfo).CalculateHeight
  else
    Result := -1;
end;

function TdxCustomLayoutControl.GetLayoutDirection: TdxLayoutDirection;
begin
  Result := Items.LayoutDirection;
end;

function TdxCustomLayoutControl.GetLayoutLookAndFeel: TdxCustomLayoutLookAndFeel;
begin
  Result := Container.LayoutLookAndFeel;
end;

function TdxCustomLayoutControl.GetMenuItems: TdxLayoutCustomizeFormMenuItems;
begin
  Result := Container.MenuItems;
end;

function TdxCustomLayoutControl.GetAutoContentSizes: TdxLayoutAutoContentSizes;
begin
  Result := TdxLayoutAutoContentSizes(Items.AutoAligns);
end;

function TdxCustomLayoutControl.GetUndoRedoManager: TdxUndoRedoManager;
begin
  Result := Container.UndoRedoManager;
end;

procedure TdxCustomLayoutControl.SetAutoContentSizes(Value: TdxLayoutAutoContentSizes);
begin
  Items.AutoAligns := TdxLayoutAutoAligns(Value);
end;

procedure TdxCustomLayoutControl.SetAutoControlAlignment(Value: Boolean);
begin
  OptionsItem.AutoControlAreaAlignment := Value;
end;

procedure TdxCustomLayoutControl.SetAutoControlTabOrders(Value: Boolean);
begin
  OptionsItem.AutoControlTabOrders := Value;
end;

procedure TdxCustomLayoutControl.SetCustomization(Value: Boolean);
begin
  Container.Customization := Value;
end;

procedure TdxCustomLayoutControl.SetCustomizeAvailableItemsViewKind(Value: TdxLayoutAvailableItemsViewKind);
begin
  Container.CustomizeAvailableItemsViewKind := Value;
end;

procedure TdxCustomLayoutControl.SetCustomizeFormBounds(const AValue: TRect);
begin
  Container.CustomizeFormBounds := AValue;
end;

procedure TdxCustomLayoutControl.SetCustomizeFormClass(
  AValue: TdxLayoutControlCustomCustomizeFormClass);
begin
  Container.CustomizeFormClass := AValue;
end;

procedure TdxCustomLayoutControl.SetCustomizeFormTabbedView(Value: Boolean);
begin
  Container.CustomizeFormTabbedView := Value;
end;

procedure TdxCustomLayoutControl.SetShowDesignSelectors(Value: Boolean);
begin
  Container.ShowDesignSelectors := Value;
end;

procedure TdxCustomLayoutControl.SetHighlightRoot(Value: Boolean);
begin
  Container.HighlightRoot := Value;
end;

procedure TdxCustomLayoutControl.SetOptionsImage(Value: TdxLayoutImageOptions);
begin
  Container.ImageOptions := Value;
end;

procedure TdxCustomLayoutControl.SetOptionsItem(Value: TdxLayoutItemOptions);
begin
  FOptionsItem.Assign(Value);
end;

procedure TdxCustomLayoutControl.SetLayoutDirection(Value: TdxLayoutDirection);
begin
  Items.LayoutDirection := Value;
end;

procedure TdxCustomLayoutControl.SetMenuItems(Value: TdxLayoutCustomizeFormMenuItems);
begin
  Container.MenuItems := Value;
end;

procedure TdxCustomLayoutControl.SetLayoutLookAndFeel(Value: TdxCustomLayoutLookAndFeel);
begin
  Container.LayoutLookAndFeel := Value;
end;


function TdxCustomLayoutControl.GetIniFileName: string;
begin
  Result := OptionsStoring.IniFileName;
end;

function TdxCustomLayoutControl.GetRegistryPath: string;
begin
  Result := OptionsStoring.RegistryPath;
end;

function TdxCustomLayoutControl.GetStoreInIniFile: Boolean;
begin
  Result := OptionsStoring.StoreToIniFile;
end;

function TdxCustomLayoutControl.GetStoreInRegistry: Boolean;
begin
  Result := OptionsStoring.StoreToRegistry;
end;

procedure TdxCustomLayoutControl.SetIniFileName(const Value: string);
begin
  OptionsStoring.IniFileName := Value;
end;

procedure TdxCustomLayoutControl.SetRegistryPath(const Value: string);
begin
  OptionsStoring.RegistryPath := Value;
end;

procedure TdxCustomLayoutControl.SetStoreInIniFile(const Value: Boolean);
begin
  OptionsStoring.StoreToIniFile := Value;
end;

procedure TdxCustomLayoutControl.SetStoreInRegistry(const Value: Boolean);
begin
  OptionsStoring.StoreToRegistry := Value;
end;

procedure TdxCustomLayoutControl.SetOptionsStoring(Value: TdxStoringOptions);
begin
  FOptionsStoring.Assign(Value);
end;

procedure TdxCustomLayoutControl.CreateHandlers;
begin
  FPainter := GetPainterClass.Create(Self);
  FViewInfo := GetViewInfoClass.Create(Self);
end;

procedure TdxCustomLayoutControl.DestroyHandlers;
begin
  FreeAndNil(FViewInfo);
  FreeAndNil(FPainter);
end;

procedure TdxCustomLayoutControl.RefreshBoldFont;
begin
  FBoldFont.Assign(Font);
  FBoldFont.Style := FBoldFont.Style + [fsBold];
  dxLayoutTextMetrics.Unregister(FBoldFont);
end;

procedure TdxCustomLayoutControl.ContainerChangedHandler(Sender: TObject);
begin
  CheckPositions;
  Invalidate;
  PostBuildSelectionLayer;
end;

procedure TdxCustomLayoutControl.ContainerSelectionChangedHandler(Sender: TObject);
begin
  if IsDesigning then
    InvalidateRect(GetDesignSelectorRect, True);
end;

procedure TdxCustomLayoutControl.InitializeSubControlsCxLookAndFeel;
begin
  Container.GetLayoutLookAndFeel.InitializeSubControlCxLookAndFeel(HScrollBar.Control.LookAndFeel);
  Container.GetLayoutLookAndFeel.InitializeSubControlCxLookAndFeel(VScrollBar.Control.LookAndFeel);
  Container.GetLayoutLookAndFeel.InitializeSubControlCxLookAndFeel(SizeGrip.LookAndFeel);
end;

procedure TdxCustomLayoutControl.MasterLookAndFeelEndChangeHandler(Sender: TObject);
begin
  EndUpdate;
end;

procedure TdxCustomLayoutControl.MasterLookAndFeelBeginChangeHandler(Sender: TObject);
begin
  BeginUpdate;
end;

procedure TdxCustomLayoutControl.WMContextMenu(var Message: TWMContextMenu);
begin
  FIsPopupShown := True;
  try
    inherited;
  finally
    FIsPopupShown := False;
  end;
end;

procedure TdxCustomLayoutControl.WMEraseBkgnd(var Message: TWMEraseBkgnd);
begin
  if HasBackground or cxIsDrawToMemory(Message) then
  begin
    EraseBackground(Message.DC);
    Message.Result := 1;
  end
  else
    Message.Result := 0;
end;

procedure TdxCustomLayoutControl.WMGetDlgCode(var Message: TWMGetDlgCode);
begin
  inherited;
  Message.Result := Message.Result or DLGC_WANTARROWS;
end;

procedure TdxCustomLayoutControl.WMKillFocus(var Message: TWMKillFocus);
begin
  inherited;
  if not IsDestroying then
    Container.KillFocus;
end;

procedure TdxCustomLayoutControl.WMSetFocus(var Message: TWMSetFocus);
begin
  inherited;
  if not IsDestroying then
    Container.SetFocus;
end;

procedure TdxCustomLayoutControl.CMChildKey(var Message: TCMChildKey);
begin
  if not Container.IsCustomization and Container.IsChildKey(Message.CharCode) and
      (Message.Sender.Perform(WM_GETDLGCODE, 0, 0) and DLGC_WANTTAB = 0) and
      Container.FocusController.SetNextFocusControl(Message.Sender) then
    Message.Result := 1
  else
    inherited;
end;

procedure TdxCustomLayoutControl.CMControlChange(var Message: TCMControlChange);
var
  AControl: TControl;
  P: TPoint;
  AGroup: TdxLayoutGroup;
  AIndex: Integer;
begin
  inherited;
  AControl := Message.Control;
  if not (IsLoading or IsDestroying) and Message.Inserting and not IsInternalControl(AControl) and
    not (csAncestor in AControl.ComponentState) and (FindItem(AControl) = nil) then
  begin
    P := AControl.BoundsRect.TopLeft;
    AGroup := GetHitTest(P).GetGroupForInsert;
    if AGroup = nil then
      AGroup := Items;
    AIndex := AGroup.ViewInfo.GetInsertionPos(P);
    AGroup.CreateItemForControl(AControl).VisibleIndex := AIndex;
  end;
end;

procedure TdxCustomLayoutControl.CMControlListChange(var Message: TCMControlListChange);
var
  AControl: TControl;
  AItem: TdxLayoutItem;
begin
  inherited;
  if Container <> nil {IsDestroying} then
  begin
    AControl := Message.Control;
    if not IsInternalControl(AControl) and not Message.Inserting then
    begin
      AItem := FindItem(AControl);
      if (AItem <> nil) and not TdxLayoutItemAccess(AItem).ControlLocked then
        AItem.Free;
    end;
  end;
end;

procedure TdxCustomLayoutControl.CMDialogChar(var Message: TCMDialogChar);
begin
  if HandleAllocated and Container.ProcessDialogChar(Message.CharCode) then
    Message.Result := 1
  else
    inherited;
end;

procedure TdxCustomLayoutControl.CMDialogKey(var Message: TCMDialogKey);
begin
  if Container.ProcessDialogKey(Message.CharCode, Message.KeyData) then
    Message.Result := 1
  else
    inherited;
end;

procedure TdxCustomLayoutControl.CMHintShow(var Message: TCMHintShow);
var
  P: TPoint;
begin
  P := ScreenToClient(GetMouseCursorPos);
  if not Container.IsCustomization and Container.ShowHint(Message.HintInfo^, P.X, P.Y) then
    Message.Result := 0
  else
    inherited;
end;

procedure TdxCustomLayoutControl.CMTabStopChanged(var Message: TMessage);
begin
  inherited;
  TabStop := True;
end;

procedure TdxCustomLayoutControl.DXMPlaceControls(var Message: TMessage);
begin
  dxMessagesController.KillMessages(Handle, DXM_LAYOUT_PLACECONTROLS);
  Container.Painter.PlaceControls(ViewInfo.ItemsViewInfo);
end;

procedure TdxCustomLayoutControl.DXMBuildSelectionLayer(var Message: TMessage);
begin
  Container.BuildSelectionLayer;
end;

procedure TdxCustomLayoutControl.DXMInvalidateSelectionLayer(var Message: TMessage);
var
  R: TRect;
begin
  with Message do
    R := Rect(WParamLo, WParamHi, LParamLo, LParamHi);
  Container.InvalidateSelectionLayer(R);
end;

procedure TdxCustomLayoutControl.DXMCustomizeFormUpdate(var Message: TMessage);
var
  AMSG: TMsg;
  AUpdateTypes: TdxLayoutCustomizeFormUpdateTypes;
begin
  AUpdateTypes := TdxLayoutCustomizeFormUpdateTypes(Byte(Message.WParam));
  while PeekMessage(AMsg, Handle, DXM_REFRESHCUSTOMIZATION, DXM_REFRESHCUSTOMIZATION, PM_REMOVE) do
    AUpdateTypes := AUpdateTypes + TdxLayoutCustomizeFormUpdateTypes(Byte(AMsg.wParam));
  Container.CustomizeFormUpdate(AUpdateTypes);
end;

function TdxCustomLayoutControl.CanAutoSize(var NewWidth, NewHeight: Integer): Boolean;

  function GetBorderSizes: TSize;
  begin
    Result := cxSize(Width - ClientWidth, Height - ClientHeight);
  end;

begin
  if IsDesigning or not ViewInfo.IsValid then
    Result := False
  else
  begin
    Result := True;
    if (ViewInfo.ItemsViewInfo.AlignHorz <> ahClient) and (Align in [alNone, alLeft, alRight]) then
      NewWidth := cxRectWidth(ContentBounds) + GetBorderSizes.cx;
    if (ViewInfo.ItemsViewInfo.AlignVert <> avClient) and (Align in [alNone, alTop, alBottom]) then
      NewHeight := cxRectHeight(ContentBounds) + GetBorderSizes.cy;
  end;
end;

procedure TdxCustomLayoutControl.ActionChange(Sender: TObject; CheckDefaults: Boolean);
begin
  if not Customization then
    inherited;
end;

procedure TdxCustomLayoutControl.AlignControls(AControl: TControl; var Rect: TRect);
begin
end;

function TdxCustomLayoutControl.AllowAutoDragAndDropAtDesignTime(X, Y: Integer;
  Shift: TShiftState): Boolean;
begin
  Result := not GetDesignHitTest(X, Y, Shift);
end;

function TdxCustomLayoutControl.AllowDragAndDropWithoutFocus: Boolean;
begin
  Result := Customization;
end;

procedure TdxCustomLayoutControl.BoundsChanged;
begin
  if not IsDestroying then
    LayoutChanged(ctMedium);
end;

function TdxCustomLayoutControl.CanDrag(X, Y: Integer): Boolean;
begin
  Result := inherited CanDrag(X, Y) and not IsDesigning;
end;

function TdxCustomLayoutControl.CanFocusOnClick(X, Y: Integer): Boolean;
begin
  Result := not IsDesigning and (FocusOnClick or Customization) and
    MayFocus and CanFocus and Container.CanFocusOnClick(X, Y);
end;

procedure TdxCustomLayoutControl.CreateParams(var Params: TCreateParams);
begin
  inherited;
  with Params do
    WindowClass.style := WindowClass.style and not (CS_HREDRAW or CS_VREDRAW);
end;

procedure TdxCustomLayoutControl.DblClick;
begin
  inherited;
  if IsDesigning then
    Customization := True;
end;

procedure TdxCustomLayoutControl.FontChanged;
begin
  inherited;
  dxLayoutTextMetrics.Unregister(Font);
  RefreshBoldFont;
  Container.LayoutLookAndFeelUserChanged;
end;

procedure TdxCustomLayoutControl.GetChildren(Proc: TGetChildProc; Root: TComponent);
begin
  inherited GetChildren(Proc, Root);
  if Owner = Root then
    FContainer.StoreChildren(Proc);
end;

function TdxCustomLayoutControl.GetCurrentCursor(X, Y: Integer): TCursor;
var
  AHitTest: TdxCustomLayoutHitTest;
begin
  if DragAndDropState = ddsNone then
    AHitTest := GetHitTest(X, Y)
  else
    AHitTest := FDragDropHitTest;

  if AHitTest <> nil then
  begin
    Result := AHitTest.GetCursor;
    if (Result = crDefault) and (AHitTest.Item <> nil) then
      Result := TdxCustomLayoutItemAccess(AHitTest.Item).GetCursor(X, Y);
  end
  else
    Result := crDefault;

  if Result = crDefault then
    Result := inherited GetCurrentCursor(X, Y);
end;

procedure TdxCustomLayoutControl.DoEnter;
begin
  inherited;
  if not IsDestroying then
    Container.DoEnter;
end;

procedure TdxCustomLayoutControl.DoExit;
begin
  if not IsDestroying then
    Container.DoExit;
  inherited DoExit;
end;

procedure TdxCustomLayoutControl.DoGetCustomizationMenuItems(const ASelectedItems: TList; var AMenuItems: TdxLayoutCustomizeFormMenuItems);
begin
  if Assigned(FOnGetCustomizationMenuItems) then
    FOnGetCustomizationMenuItems(Self, ASelectedItems, AMenuItems);
end;

function TdxCustomLayoutControl.DoShowPopupMenu(AMenu: TComponent; X, Y: Integer): Boolean;
var
  APopupMenu: TPopupMenu;
begin
  if Customization then
  begin
    APopupMenu := Container.CustomizeForm.LayoutPopupMenu;
    Result := (APopupMenu <> nil) and ShowPopupMenu(Self, APopupMenu, X, Y);
  end
  else
    Result := inherited DoShowPopupMenu(AMenu, X, Y);
end;

procedure TdxCustomLayoutControl.KeyDown(var Key: Word; Shift: TShiftState);
begin
  inherited;
  Container.KeyDown(Key, Shift);
end;

type
  TGrabHandleInfo = record
    P: TPoint;
    Contains: Boolean;
  end;
  PGrabHandleInfo = ^TGrabHandleInfo;

function CheckMarker(AWindow: HWND; AData: PGrabHandleInfo): BOOL; stdcall;
begin
  if cxGetClassName(AWindow) = 'TGrabHandle' then
  begin
    AData.Contains := cxRectPtIn(cxGetWindowRect(AWindow), AData.P);
    Result := not AData.Contains;
  end
  else
    Result := True;
end;

function TdxCustomLayoutControl.GetDesignHitTest(X, Y: Integer; Shift: TShiftState): Boolean;
var
  AHitTest: TdxCustomLayoutHitTest;
  AInfo: TGrabHandleInfo;
begin
  Result := inherited GetDesignHitTest(X, Y, Shift);
  if not Result then
  begin
    AHitTest := GetHitTest(X, Y);
    Result := not (ssRight in Shift) and not FRightButtonPressed and
      (AHitTest is TdxCustomLayoutItemHitTest) and not IsToolSelected;
    if Result then
    begin
      AInfo.P := GetMouseCursorPos;
      AInfo.Contains := False;
      EnumChildWindows(Handle, @CheckMarker, LPARAM(@AInfo));
      Result := not AInfo.Contains;
    end;
  end;
  FRightButtonPressed := ssRight in Shift;
end;

function TdxCustomLayoutControl.IsInternalControl(AControl: TControl): Boolean;
begin
  Result := inherited IsInternalControl(AControl) or (AControl is TdxSelectionLayer);
end;

function TdxCustomLayoutControl.NeedRedrawOnResize: Boolean;
begin
  Result := RedrawOnResize and ViewInfo.LayoutLookAndFeel.NeedRedrawOnResize;
end;

procedure TdxCustomLayoutControl.Loaded;
begin
  inherited Loaded;
  if not IsDesigning then
    Restore;
  Container.LayoutChanged(False);
end;

procedure TdxCustomLayoutControl.MouseDown(Button: TMouseButton; Shift: TShiftState;
  X, Y: Integer);
var
  AForm: TCustomForm;
begin
  inherited;
  if not IsDesigning and Customization then
  begin
    AForm := GetParentForm(Self);
    if AForm <> nil then
      AForm.SetFocus;
  end;
  Container.MouseDown(Button, Shift, X, Y);
end;

procedure TdxCustomLayoutControl.MouseLeave(AControl: TControl);
begin
  inherited;
  Container.MouseLeave(AControl);
end;

procedure TdxCustomLayoutControl.MouseMove(Shift: TShiftState; X, Y: Integer);
begin
  Container.MouseMove(Shift, X, Y);
  inherited MouseMove(Shift, X, Y);
end;

procedure TdxCustomLayoutControl.MouseUp(Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  Container.MouseUp(Button, Shift, X, Y);
end;

procedure TdxCustomLayoutControl.Paint;
begin
  if not IsUpdateLocked and not IsLoading then
  begin
    inherited;
    Painter.Paint;
  end;
end;

procedure TdxCustomLayoutControl.SetName(const Value: TComponentName);
var
  AOldName: string;
begin
  AOldName := Name;
  inherited;
  Container.CheckItemNames(AOldName, Name);
end;

procedure TdxCustomLayoutControl.SetParentBackground(Value: Boolean);
begin
  if Value then
    ControlStyle := ControlStyle - [csOpaque]
  else
    ControlStyle := ControlStyle + [csOpaque];
  inherited;
end;

procedure TdxCustomLayoutControl.WriteState(Writer: TWriter);
begin
  if HandleAllocated then
    SendMessage(Handle, WM_SETREDRAW, 0, 0);
  try
    TdxCustomLayoutItemAccess(Items).RestoreItemControlSize;
    inherited;
  finally
    if HandleAllocated then
      SendMessage(Handle, WM_SETREDRAW, 1, 0);
    LayoutChanged;
  end;
end;

procedure TdxCustomLayoutControl.WndProc(var Message: TMessage);

  function PtInDesignSelectorRect(const P: TPoint): Boolean;
  var
    AControl: TControl;
    AHitTest: TdxCustomLayoutHitTest;
  begin
    Result := False;
    AControl := ControlAtPos(P, True);
    if (AControl <> nil) and not (AControl is TWinControl) then
    begin
      AHitTest := GetHitTest(P);
      Result := (AHitTest <> nil) and
        (AHitTest is TdxLayoutItemHitTest) and
        TdxLayoutItemViewInfoAccess((AHitTest as TdxLayoutItemHitTest).Item.ViewInfo).PtInDesignSelectorRect(P);
    end;
  end;

begin
  case Message.Msg of
    WM_LBUTTONDOWN:
      if (IsDesigning or Customization) and HandleAllocated and (GetCapture <> Handle) and
          (Customization or PtInDesignSelectorRect(SmallPointToPoint(TWMMouse(Message).Pos))) then
        SetCaptureControl(Self);
  end;
  inherited WndProc(Message);
end;

function TdxCustomLayoutControl.IsScrollDataValid: Boolean;
begin
  Result := inherited IsScrollDataValid and ViewInfo.IsValid;
end;

function TdxCustomLayoutControl.GetContentSize: TSize;
begin
  if ViewInfo.IsValid then
    Result := cxSize(ViewInfo.ContentBounds)
  else
    Result := inherited GetContentSize;
end;

function TdxCustomLayoutControl.NeedsToBringInternalControlsToFront: Boolean;
begin
  Result := True;
end;

function TdxCustomLayoutControl.CanDragAndDrop: Boolean;
begin
  Result := not IsDesigning or not (csInline in Owner.ComponentState);
end;

function TdxCustomLayoutControl.GetDragAndDropObjectClass: TcxDragAndDropObjectClass;
begin
  if FDragDropHitTest <> nil then
    Result := FDragDropHitTest.GetDragAndDropObjectClass
  else
    Result := TdxLayoutDragAndDropObject;
end;

function TdxCustomLayoutControl.StartDragAndDrop(const P: TPoint): Boolean;
var
  AItem: TdxCustomLayoutItem;
  AHitTest: TdxCustomLayoutHitTest;
begin
  Result := False;
  AHitTest := GetHitTest(P);
  AItem := AHitTest.GetSourceItem;
  if CanDragAndDrop and AHitTest.CanDragAndDrop and (AItem <> nil) and TdxCustomLayoutItemAccess(AItem).CanDragAndDrop(P) then
  begin
    FDragDropHitTest := AHitTest;
    (DragAndDropObject as TdxLayoutCustomDragAndDropObject).Init(dsControl, AItem, P);
    Result := True;
  end;
end;

procedure TdxCustomLayoutControl.EndDragAndDrop(Accepted: Boolean);
begin
  FDragDropHitTest := nil;
  inherited;
end;

function TdxCustomLayoutControl.GetCxLookAndFeel: TcxLookAndFeel;
begin
  Result := inherited LookAndFeel;
end;

procedure TdxCustomLayoutControl.SelectionChanged;
begin
  TdxCustomLayoutItemAccess(Items).SelectionChanged;
end;

function TdxCustomLayoutControl.CanProcessChildren: Boolean;
begin
  Result := True;
end;

function TdxCustomLayoutControl.GetPainterClass: TdxLayoutControlPainterClass;
begin
  Result := TdxLayoutControlPainter;
end;

function TdxCustomLayoutControl.GetViewInfoClass: TdxLayoutControlViewInfoClass;
begin
  Result := TdxLayoutControlViewInfo;
end;

function TdxCustomLayoutControl.CanMultiSelect: Boolean;
begin
  Result := True;
end;

function TdxCustomLayoutControl.CanShowSelection: Boolean;
begin
  Result := True;
end;

procedure TdxCustomLayoutControl.PostBuildSelectionLayer;
begin
  if HandleAllocated then
    PostMessage(Handle, DXM_LAYOUT_BUILDSELECTIONLAYER, 0, 0);
end;

procedure TdxCustomLayoutControl.PostInvalidateSelectionLayer(const R: TRect);
begin
  if HandleAllocated then
    with R do
      PostMessage(Handle, DXM_LAYOUT_INVALIDATESELECTIONLAYER, MakeWParam(Left, Top), MakeLParam(Right, Bottom));
end;

procedure TdxCustomLayoutControl.CustomizeFormPostUpdate(AUpdateTypes: TdxLayoutCustomizeFormUpdateTypes);
begin
  if HandleAllocated then
    PostMessage(Handle, DXM_REFRESHCUSTOMIZATION, Byte(AUpdateTypes), 0);
end;

procedure TdxCustomLayoutControl.DoCustomization;
begin
  PostBuildSelectionLayer;
  CallNotify(FOnCustomization, Self);
end;

procedure TdxCustomLayoutControl.DoGetItemStoredProperties(
  AItem: TdxCustomLayoutItem; AProperties: TStrings);
begin
  if Assigned(FOnGetItemStoredProperties) then
    FOnGetItemStoredProperties(Self, AItem, AProperties);
end;

procedure TdxCustomLayoutControl.DoGetItemStoredPropertyValue(
  AItem: TdxCustomLayoutItem; const AName: string; var AValue: Variant);
begin
  if Assigned(FOnGetItemStoredPropertyValue) then
    FOnGetItemStoredPropertyValue(Self, AItem, AName, AValue);
end;

procedure TdxCustomLayoutControl.DoSetItemStoredPropertyValue(
  AItem: TdxCustomLayoutItem; const AName: string; const AValue: Variant);
begin
  if Assigned(FOnSetItemStoredPropertyValue) then
    FOnSetItemStoredPropertyValue(Self, AItem, AName, AValue);
end;

procedure TdxCustomLayoutControl.DoGetStoredProperties(AProperties: TStrings);
begin
  if Assigned(FOnGetStoredProperties) then
    FOnGetStoredProperties(Self, AProperties);
end;

procedure TdxCustomLayoutControl.DoGetStoredPropertyValue(const AName: string; var AValue: Variant);
begin
  if Assigned(FOnGetStoredPropertyValue) then
    FOnGetStoredPropertyValue(Self, AName, AValue);
end;

procedure TdxCustomLayoutControl.DoSetStoredPropertyValue(const AName: string; const AValue: Variant);
begin
  if Assigned(FOnSetStoredPropertyValue) then
    FOnSetStoredPropertyValue(Self, AName, AValue);
end;

function TdxCustomLayoutControl.GetAlignmentConstraintClass: TdxLayoutAlignmentConstraintClass;
begin
  Result := TdxLayoutAlignmentConstraint;
end;

function TdxCustomLayoutControl.GetContainerClass: TdxLayoutControlContainerClass;
begin
  Result := TdxLayoutControlContainer;
end;

function TdxCustomLayoutControl.GetDesignSelectorRect: TRect;
const
  AOffset = 3;
  AWidth = 16;
begin
  with ClientBounds do
    Result := Rect(Right - AWidth - AOffset, Bottom - AWidth - AOffset, Right - AOffset, Bottom - AOffset);
end;

function TdxCustomLayoutControl.IsToolSelected: Boolean;
begin
  Result := IsDesigning and (dxLayoutDesignTimeHelper <> nil) and
    dxLayoutDesignTimeHelper.IsToolSelected;
end;

function TdxCustomLayoutControl.IsUpdateLocked: Boolean;
begin
  Result := Container.IsUpdateLocked;
end;

procedure TdxCustomLayoutControl.LayoutChanged(AType: TdxChangeType);
begin
  Container.LayoutChanged(AType = ctHard);
end;

function TdxCustomLayoutControl.OldLoadFromIniFile(const AFileName: string): Boolean;
var
  AIniFile: TMemIniFile;
begin
  AIniFile := TMemIniFile.Create(AFileName);
  try
    Result := Container.LoadPreviousVersions(AIniFile);
  finally
    AIniFile.Free;
  end;
end;

function TdxCustomLayoutControl.OldLoadFromRegistry(const ARegistryPath: string): Boolean;
var
  AIniFile: TRegistryIniFile;
begin
  AIniFile := TRegistryIniFile.Create(ARegistryPath);
  try
    Result := Container.LoadPreviousVersions(AIniFile);
  finally
    AIniFile.Free;
  end;
end;

function TdxCustomLayoutControl.OldLoadFromStream(AStream: TStream): Boolean;

  function GetBufferSize: Integer;
  var
    APosition: Integer;
    ASignature: Integer;
    AVersion: Word;
  begin
    APosition := AStream.Position;
    AStream.Read(Result, SizeOf(Result));
    AStream.Read(ASignature, SizeOf(ASignature));
    AStream.Read(AVersion, SizeOf(AVersion));
    if ASignature <> dxLayoutSignature then
    begin
      Result := -1;
      AStream.Position := APosition;
    end;
  end;

var
  AIniFile: TMemIniFile;
  AStrings: TStringList;
  ABufferSize: Integer;
  AMemoryStream: TMemoryStream;
begin
  AIniFile := TMemIniFile.Create('');
  AStrings := TStringList.Create;
  try
    ABufferSize := GetBufferSize;
    if ABufferSize > -1 then
    begin
      AMemoryStream := TMemoryStream.Create;
      try
        AMemoryStream.CopyFrom(AStream, ABufferSize);
        AMemoryStream.Position := 0;
        AStrings.LoadFromStream(AMemoryStream);
      finally
        AMemoryStream.Free;
      end;
    end
    else
      AStrings.LoadFromStream(AStream);

    AIniFile.SetStrings(AStrings);
    Result := Container.LoadPreviousVersions(AIniFile);
  finally
    AStrings.Free;
    AIniFile.Free;
  end;
end;

function TdxCustomLayoutControl.CreateFieldControls(X, Y: Integer; ADataSource: TObject; AFieldList: TList): Boolean;
begin
  Result := False;
end;

procedure TdxCustomLayoutControl.DoCreateFieldControl(AControl: TControl; AField: TField);
var
  AItem: TdxLayoutItem;
begin
  AItem := FindItem(AControl);
  if AItem <> nil then
    AItem.Caption := AField.DisplayName;
end;

function TdxCustomLayoutControl.NeedCreateCaption: Boolean;
begin
  Result := False;
end;

procedure TdxCustomLayoutControl.CancelLastUndo;
begin
  if [csLoading, csReading, csDestroying] * ComponentState = [] then
    Container.CancelLastUndo;
end;

procedure TdxCustomLayoutControl.SaveToUndo;
begin
  if [csLoading, csReading, csDestroying] * ComponentState = [] then
    Container.SaveToUndo;
end;

procedure TdxCustomLayoutControl.CreateBoldFont;
begin
  FBoldFont := TFont.Create;
  RefreshBoldFont;
end;

procedure TdxCustomLayoutControl.CreateContainer;
begin
  FContainer := GetContainerClass.Create(Self);
  FContainer.Initialize;
  FContainer.OnChanged := ContainerChangedHandler;
  FContainer.OnSelectionChanged := ContainerSelectionChangedHandler;
end;

procedure TdxCustomLayoutControl.CreateOptions;
begin
  FOptionsStoring := TdxStoringOptions.Create;
  FOptionsItem := TdxLayoutItemOptions.Create(Self);
end;

procedure TdxCustomLayoutControl.DestroyBoldFont;
begin
  dxLayoutTextMetrics.Unregister(FBoldFont);
  dxLayoutTextMetrics.Unregister(Font);
  FreeAndNil(FBoldFont);
end;

procedure TdxCustomLayoutControl.DestroyContainer;
begin
  FreeAndNil(FContainer);
end;

procedure TdxCustomLayoutControl.DestroyOptions;
begin
  FreeAndNil(FOptionsItem);
  FreeAndNil(FOptionsStoring);
end;

function TdxCustomLayoutControl.CanGetHitTest(const P: TPoint): Boolean;
begin
  Result := IsWindowVisible(Handle) and PtInRect(ClientBounds, P) and not
    (ShowDesignSelectors and PtInRect(GetDesignSelectorRect, P));
end;

function TdxCustomLayoutControl.CanProcessKeyboard: Boolean;
begin
  Result := (dxLayoutDragAndDropObject = nil) and (dxLayoutSizingDragAndDropObject = nil) and not FIsPopupShown;
end;

function TdxCustomLayoutControl.GetCanvas: TcxCanvas;
begin
  Result := ViewInfo.Canvas;
end;

function TdxCustomLayoutControl.IsFocusControlOnItemCaptionClick: Boolean;
begin
  Result := OptionsItem.FocusControlOnItemCaptionClick;
end;

function TdxCustomLayoutControl.IsSizableHorz: Boolean;
begin
  Result := OptionsItem.SizableHorz;
end;

function TdxCustomLayoutControl.IsSizableVert: Boolean;
begin
  Result := OptionsItem.SizableVert;
end;

function TdxCustomLayoutControl.GetScrollOffset: TPoint;
begin
  Result := Point(LeftPos, TopPos);
end;

function TdxCustomLayoutControl.IsShowLockedGroupChildren: Boolean;
begin
  Result := OptionsItem.ShowLockedGroupChildren;
end;

procedure TdxCustomLayoutControl.MakeItemVisible(AItem: TdxCustomLayoutItem);

  procedure MakeActuallyVisible(AItem: TdxCustomLayoutItem);
  begin
    if AItem.Parent <> nil then
    begin
      AItem.Parent.ItemIndex := AItem.Index;
      MakeActuallyVisible(AItem.Parent);
    end;
  end;

  function CanBeActuallyVisible(AItem: TdxCustomLayoutItem): Boolean;
  begin
    Result := (TdxLayoutItemAccess(AItem).GetVisible or IsDesigning) and
      TdxLayoutItemAccess(AItem).IsViewInfoValid and
      (AItem.IsRoot or (AItem.Parent <> nil) and TdxLayoutGroupAccess(AItem.Parent).AllowShowChild(AItem) and CanBeActuallyVisible(AItem.Parent));
  end;

begin
  if not CanBeActuallyVisible(AItem) then Exit;
  if not AItem.ActuallyVisible then
    MakeActuallyVisible(AItem);
  MakeVisible(AItem.ViewInfo.Bounds, False);
end;

procedure TdxCustomLayoutControl.PostPlaceControls;
begin
  if HandleAllocated then
    PostMessage(Handle, DXM_LAYOUT_PLACECONTROLS, 0, 0)
end;

procedure TdxCustomLayoutControl.SizeAdjustment;

  procedure ChainSizeAdjustments(AControl: TControl);
  begin
    if (AControl <> nil) and TControlAccess(AControl).AutoSize then
    begin
      TControlAccess(AControl).AdjustSize;
      ChainSizeAdjustments(AControl.Parent);
    end;
  end;

begin
  ChainSizeAdjustments(Self);
  UpdateScrollBars;
end;

function TdxCustomLayoutControl.GetContainer: TdxLayoutContainer;
begin
  Result := FContainer;
end;

procedure TdxCustomLayoutControl.Clear;
begin
  Container.Clear;
end;

function TdxCustomLayoutControl.CreateAlignmentConstraint: TdxLayoutAlignmentConstraint;
begin
  Result := FContainer.CreateAlignmentConstraint;
end;

function TdxCustomLayoutControl.FindItem(AControl: TControl): TdxLayoutItem;
begin
  Result := Container.FindItem(AControl);
end;

function TdxCustomLayoutControl.FindItem(AControlHandle: THandle): TdxLayoutItem;
begin
  Result := Container.FindItem(AControlHandle);
end;

function TdxCustomLayoutControl.FindItem(const AName: string): TdxCustomLayoutItem;
begin
  Result := Container.FindItem(AName);
end;

function TdxCustomLayoutControl.GetHitTest(const P: TPoint): TdxCustomLayoutHitTest;
begin
  Result := Container.GetHitTest(P);
end;

function TdxCustomLayoutControl.GetHitTest(X, Y: Integer): TdxCustomLayoutHitTest;
begin
  Result := GetHitTest(Point(X, Y));
end;

procedure TdxCustomLayoutControl.BeginUpdate;
begin
  Container.BeginUpdate;
end;

procedure TdxCustomLayoutControl.CancelUpdate;
begin
  Container.CancelUpdate;
end;

procedure TdxCustomLayoutControl.EndUpdate(ANeedPack: Boolean = True);
begin
  Container.EndUpdate(ANeedPack);
end;

function TdxCustomLayoutControl.CreateGroup(AGroupClass: TdxLayoutGroupClass = nil;
  AParent: TdxLayoutGroup = nil): TdxLayoutGroup;
begin
  Result := Container.CreateGroup(AGroupClass, AParent);
end;

function TdxCustomLayoutControl.CreateItem(AItemClass: TdxCustomLayoutItemClass = nil;
  AParent: TdxLayoutGroup = nil): TdxCustomLayoutItem;
begin
  Result := Container.CreateItem(AItemClass, AParent);
end;

function TdxCustomLayoutControl.CreateItemForControl(AControl: TControl;
  AParent: TdxLayoutGroup = nil): TdxLayoutItem;
begin
  Result := Container.CreateItemForControl(AControl, AParent);
end;

function TdxCustomLayoutControl.CanRestore: Boolean;
begin
  Result := OptionsStoring.CanRestoreFromIniFile or OptionsStoring.CanRestoreFromRegistry or (FStoredStream.Size > 0);
end;

procedure TdxCustomLayoutControl.Restore;
begin
  if not CanRestore then
    Exit;
  if OptionsStoring.CanRestoreFromRegistry then
    LoadFromRegistry(OptionsStoring.RegistryPath)
  else
    if OptionsStoring.CanRestoreFromIniFile then
      LoadFromIniFile(OptionsStoring.IniFileName)
    else
    begin
      FStoredStream.Position := 0;
      LoadFromStream(FStoredStream);
    end;
end;

procedure TdxCustomLayoutControl.Store;
begin
  if OptionsStoring.CanStoreToIniFile then
    SaveToIniFile(OptionsStoring.IniFileName);
  if OptionsStoring.CanStoreToRegistry then
    SaveToRegistry(OptionsStoring.RegistryPath);
  if not IsDestroying then
  begin
    FStoredStream.Clear;
    SaveToStream(FStoredStream);
  end;
end;

procedure TdxCustomLayoutControl.LoadFromIniFile(const AFileName: string);
begin
  if AFileName = '' then Exit;
  BeginUpdate;
  try
    if not OldLoadFromIniFile(AFileName) then
      Container.RestoreFromIniFile(AFileName);
  finally
    EndUpdate(False);
  end;
end;

procedure TdxCustomLayoutControl.LoadFromRegistry(const ARegistryPath: string);
begin
  if ARegistryPath = '' then Exit;
  BeginUpdate;
  try
    if not OldLoadFromRegistry(ARegistryPath) then
      Container.RestoreFromRegistry(ARegistryPath);
  finally
    EndUpdate;
  end;
end;

procedure TdxCustomLayoutControl.LoadFromStream(AStream: TStream);
var
  APosition: Int64;
begin
  BeginUpdate;
  try
    APosition := AStream.Position;
    if not OldLoadFromStream(AStream) then
    begin
      AStream.Position := APosition;
      Container.RestoreFromStream(AStream);
    end;
  finally
    EndUpdate;
  end;
end;

procedure TdxCustomLayoutControl.SaveToIniFile(const AFileName: string; ARecreate: Boolean = True);
begin
  if AFileName = '' then Exit;
  Container.StoreToIniFile(AFileName, ARecreate);
end;

procedure TdxCustomLayoutControl.SaveToRegistry(const ARegistryPath: string; ARecreate: Boolean = True);
begin
  if ARegistryPath = '' then Exit;
  Container.StoreToRegistry(ARegistryPath, ARecreate);
end;

procedure TdxCustomLayoutControl.SaveToStream(AStream: TStream);
begin
  Container.StoreToStream(AStream);
end;

{ TdxCustomLayoutControlHandler }

constructor TdxCustomLayoutControlHandler.Create(AControl: TdxCustomLayoutControl);
begin
  inherited Create;
  FControl := AControl;
end;

function TdxCustomLayoutControlHandler.GetViewInfo: TdxLayoutControlViewInfo;
begin
  Result := FControl.ViewInfo;
end;

{ TdxLayoutControlPainter }

function TdxLayoutControlPainter.GetInternalCanvas: TcxCanvas;
begin
  Result := FControl.Canvas;
end;

procedure TdxLayoutControlPainter.MakeCanvasClipped(ACanvas: TcxCanvas);
begin
  ACanvas.IntersectClipRect(ViewInfo.ClientBounds);
end;

procedure TdxLayoutControlPainter.DrawBackground(ACanvas: TcxCanvas);
begin
  if not ViewInfo.IsTransparent then
    ViewInfo.LayoutLookAndFeel.DrawLayoutControlBackground(ACanvas, ViewInfo.ClientBounds)
  else
    cxDrawTransparentControlBackground(ViewInfo.Control, ACanvas, ViewInfo.ClientBounds);
end;

procedure TdxLayoutControlPainter.DrawDesignSelector(ACanvas: TcxCanvas);
begin
  if Control.Container.IsDesignSelectorsVisible then
    cxDrawDesignRect(ACanvas, Control.GetDesignSelectorRect, Control.Container.IsComponentSelected(Control));
end;

procedure TdxLayoutControlPainter.DrawItems(ACanvas: TcxCanvas);
begin
  Control.Container.Painter.Paint(ACanvas);
end;

procedure TdxLayoutControlPainter.DrawDesignFeatures(ACanvas: TcxCanvas);
begin
  Control.Container.Painter.DrawDesignFeatures(ACanvas);
end;

function TdxLayoutControlPainter.GetCanvas: TcxCanvas;
begin
  Result := InternalCanvas;
  MakeCanvasClipped(Result);
end;

procedure TdxLayoutControlPainter.Paint;
var
  ACanvas: TcxCanvas;
begin
  ACanvas := GetCanvas;
  ACanvas.SaveState;
  try
    DrawBackground(ACanvas);
    DrawItems(ACanvas);
    DrawDesignFeatures(ACanvas);
    DrawDesignSelector(ACanvas);
  finally
    ACanvas.RestoreState;
  end;
end;

{ TdxLayoutControlViewInfo }

constructor TdxLayoutControlViewInfo.Create(AControl: TdxCustomLayoutControl);
begin
  inherited;
  CreateViewInfos;
end;

destructor TdxLayoutControlViewInfo.Destroy;
begin
  DestroyViewInfos;
  FCanvas.Free;
  inherited;
end;

function TdxLayoutControlViewInfo.GetClientHeight: Integer;
begin
  Result := cxRectHeight(ClientBounds);
end;

function TdxLayoutControlViewInfo.GetClientWidth: Integer;
begin
  Result := cxRectWidth(ClientBounds);
end;

function TdxLayoutControlViewInfo.GetContainerViewInfo: TdxLayoutControlContainerViewInfo;
begin
  Result := Control.Container.ViewInfo;
end;

function TdxLayoutControlViewInfo.GetContentHeight: Integer;
begin
  Result := cxRectHeight(ContentBounds);
end;

function TdxLayoutControlViewInfo.GetContentWidth: Integer;
begin
  Result := cxRectWidth(ContentBounds);
end;

function TdxLayoutControlViewInfo.GetItemsViewInfo: TdxLayoutGroupViewInfo;
begin
  Result := ContainerViewInfo.ItemsViewInfo;
end;

function TdxLayoutControlViewInfo.GetLayoutLookAndFeel: TdxCustomLayoutLookAndFeel;
begin
  Result := ContainerViewInfo.GetLayoutLookAndFeel;
end;

function TdxLayoutControlViewInfo.GetIsValid: Boolean;
begin
  Result := (ItemsViewInfo <> nil) and TdxCustomLayoutItemViewInfoAccess(ItemsViewInfo).IsValid;
end;

procedure TdxLayoutControlViewInfo.CreateViewInfos;
begin
end;

procedure TdxLayoutControlViewInfo.DestroyViewInfos;
begin
end;

procedure TdxLayoutControlViewInfo.RecreateViewInfos;
begin
  DestroyViewInfos;
  CreateViewInfos;
end;

procedure TdxLayoutControlViewInfo.AlignItems;
var
  I: Integer;

  procedure ProcessConstraint(AConstraint: TdxLayoutAlignmentConstraint);
  var
    AItemViewInfos: TList;

    procedure RetrieveItemViewInfos;
    var
      I: Integer;
      AViewInfo: TdxCustomLayoutItemViewInfo;
    begin
      for I := 0 to AConstraint.Count - 1 do
      begin
        AViewInfo := AConstraint.Items[I].ViewInfo;
        if AViewInfo <> nil then
          AItemViewInfos.Add(AViewInfo);
      end;
    end;

    function GetSide: TdxLayoutSide;
    begin
      if AConstraint.Kind in [ackLeft, ackRight] then
        Result := sdLeft
      else
        Result := sdTop;
    end;

    function AlignItemViewInfos: Boolean;
    var
      AMaxBorderValue, I: Integer;

      function GetBorderValue(AItemViewInfoIndex: Integer): Integer;
      begin
        with TdxCustomLayoutItemViewInfoAccess(AItemViewInfos[AItemViewInfoIndex]) do
          case AConstraint.Kind of
            ackLeft:
              Result := Bounds.Left - CalculateOffset(sdLeft);
            ackTop:
              Result := Bounds.Top - CalculateOffset(sdTop);
            ackRight:
              Result := Bounds.Right + CalculateOffset(sdRight);
            ackBottom:
              Result := Bounds.Bottom + CalculateOffset(sdBottom);
          else
            Result := 0;
          end;
      end;

      function FindMaxBorderValue: Integer;
      var
        I: Integer;
      begin
        Result := -MaxInt;
        for I := 0 to AItemViewInfos.Count - 1 do
          Result := Max(Result, GetBorderValue(I));
      end;

      procedure ChangeOffset(AItemViewInfoIndex, ADelta: Integer);
      begin
        with TdxCustomLayoutItemViewInfo(AItemViewInfos[AItemViewInfoIndex]) do
          Offsets[GetSide] := Offsets[GetSide] + ADelta;
      end;

      function AreItemViewInfosAligned: Boolean;
      var
        I, ABorderValue: Integer;
      begin
        ABorderValue := 0;
        for I := 0 to AItemViewInfos.Count - 1 do
          if I = 0 then
            ABorderValue := GetBorderValue(I)
          else
          begin
            Result := GetBorderValue(I) = ABorderValue;
            if not Result then Exit;
          end;
        Result := True;
      end;

    begin
      AMaxBorderValue := FindMaxBorderValue;
      for I := 0 to AItemViewInfos.Count - 1 do
        ChangeOffset(I, AMaxBorderValue - GetBorderValue(I));
      CalculateItemsViewInfo;
      Result := AreItemViewInfosAligned;
    end;

    procedure ResetOffsets;
    var
      I: Integer;
    begin
      for I := 0 to AItemViewInfos.Count - 1 do
        TdxCustomLayoutItemViewInfo(AItemViewInfos[I]).ResetOffset(GetSide);
      CalculateItemsViewInfo;
    end;

  begin
    AItemViewInfos := TList.Create;
    try
      RetrieveItemViewInfos;
      while not AlignItemViewInfos do  //!!! to think about invisible items if items will be deleted
      begin
        ResetOffsets;
        if AItemViewInfos.Count > 2 then
          AItemViewInfos.Count := AItemViewInfos.Count - 1
        else
          Break;
      end;
    finally
      AItemViewInfos.Free;
    end;
  end;

begin
  for I := 0 to FControl.AlignmentConstraintCount - 1 do
    ProcessConstraint(FControl.AlignmentConstraints[I]);
end;

procedure TdxLayoutControlViewInfo.AutoAlignControls;
begin
  ContainerViewInfo.AutoAlignControls;
end;

procedure TdxLayoutControlViewInfo.CalculateItemsViewInfo;
begin
  ContainerViewInfo.CalculateItemsViewInfo;
end;

function TdxLayoutControlViewInfo.GetIsTransparent: Boolean;
begin
  Result := HasBackground;
end;

function TdxLayoutControlViewInfo.HasBackground: Boolean;
begin
  Result := Control.HasBackground;
end;

procedure TdxLayoutControlViewInfo.InvalidateRect(const R: TRect; EraseBackground: Boolean);
begin
  Control.InvalidateRect(R, EraseBackground);
end;

function TdxLayoutControlViewInfo.IsCustomization: Boolean;
begin
  Result := Control.Container.IsCustomization;
end;

procedure TdxLayoutControlViewInfo.PrepareData;
begin
  RecreateViewInfos;
end;

function TdxLayoutControlViewInfo.GetCanvas: TcxCanvas;
begin
  if Control.HandleAllocated then
  begin
    FreeAndNil(FCanvas);
    Result := Control.Canvas;
  end
  else
  begin
    if FCanvas = nil then
      FCanvas := TcxScreenCanvas.Create;
    Result := FCanvas;
  end;
end;

function TdxLayoutControlViewInfo.GetClientBounds: TRect;
begin
  Result := FControl.ClientBounds;
end;

function TdxLayoutControlViewInfo.GetContentBounds: TRect;
begin
  Result := ContainerViewInfo.ContentBounds;
end;

procedure TdxLayoutControlViewInfo.Calculate;
begin
  ContainerViewInfo.Calculate;
end;

function TdxLayoutControlViewInfo.GetItemWithMouse(const P: TPoint): TdxCustomLayoutItem;
begin
  Result := ContainerViewInfo.GetItemWithMouse(P);
end;

initialization
  dxLayoutDesignTimeSelectionHelperClass := TdxLayoutRunTimeSelectionHelper;

finalization
  FreeAndNil(FDesignCustomizationHelper);
end.