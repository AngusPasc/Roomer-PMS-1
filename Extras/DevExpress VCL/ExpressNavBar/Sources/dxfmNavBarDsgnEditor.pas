{*******************************************************************}
{                                                                   }
{       Developer Express Visual Component Library                  }
{       ExpressNavBar                                               }
{                                                                   }
{       Copyright (c) 2002-2014 Developer Express Inc.              }
{       ALL RIGHTS RESERVED                                         }
{                                                                   }
{   The entire contents of this file is protected by U.S. and       }
{   International Copyright Laws. Unauthorized reproduction,        }
{   reverse-engineering, and distribution of all or any portion of  }
{   the code contained in this file is strictly prohibited and may  }
{   result in severe civil and criminal penalties and will be       }
{   prosecuted to the maximum extent possible under the law.        }
{                                                                   }
{   RESTRICTIONS                                                    }
{                                                                   }
{   THIS SOURCE CODE AND ALL RESULTING INTERMEDIATE FILES           }
{   (DCU, OBJ, DLL, ETC.) ARE CONFIDENTIAL AND PROPRIETARY TRADE    }
{   SECRETS OF DEVELOPER EXPRESS INC. THE REGISTERED DEVELOPER IS   }
{   LICENSED TO DISTRIBUTE THE EXPRESSNAVBAR AND ALL ACCOMPANYING   }
{   VCL CONTROLS AS PART OF AN EXECUTABLE PROGRAM ONLY.             }
{                                                                   }
{   THE SOURCE CODE CONTAINED WITHIN THIS FILE AND ALL RELATED      }
{   FILES OR ANY PORTION OF ITS CONTENTS SHALL AT NO TIME BE        }
{   COPIED, TRANSFERRED, SOLD, DISTRIBUTED, OR OTHERWISE MADE       }
{   AVAILABLE TO OTHER INDIVIDUALS WITHOUT EXPRESS WRITTEN CONSENT  }
{   AND PERMISSION FROM DEVELOPER EXPRESS INC.                      }
{                                                                   }
{   CONSULT THE END USER LICENSE AGREEMENT FOR INFORMATION ON       }
{   ADDITIONAL RESTRICTIONS.                                        }
{                                                                   }
{*******************************************************************}

unit dxfmNavBarDsgnEditor;

{$I cxVer.inc}

interface

uses
  Dialogs, Classes, Controls, Messages, Forms, StdCtrls, ExtCtrls, Menus, ImgList,
  ComCtrls, ToolWin, ActnList, Types, DesignWindows, DesignIntf, DesignEditors,
  dxNavBar, dxNavBarBase, dxNavBarCollns, dxNavBarStyles, dxNavBarDsgnUtils,
  cxClasses, cxDesignWindows, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters;

type
  TdxfmNavBarDesignWindow = class;

{$IFDEF DELPHI17}
  TToolButton = class(ComCtrls.TToolButton)
  private
    procedure CMEnabledChanged(var Message: TMessage); message CM_ENABLEDCHANGED;
  end;
{$ENDIF}

  TdxNavBarDsgnWindowPageHandler = class
  private
    FLockCount: Integer;
    FDsgnWindow: TdxfmNavBarDesignWindow;
    function GetNavBar: TdxCustomNavBar;
  protected
    function DesignerCaptionPostfix: string; virtual;
    function ItemNamePrefix: string; virtual;

    function CanAdd: Boolean; virtual;
    function CanCopy: Boolean; virtual;
    function CanCut: Boolean; virtual;
    function CanDelete: Boolean; virtual;
    function CanSelectAll: Boolean; virtual;
    function CanMoveUp: Boolean; virtual;
    function CanMoveDown: Boolean; virtual;
    function CanPaste: Boolean; virtual;
  public
    constructor Create(ADsgnWindow: TdxfmNavBarDesignWindow);
    destructor Destroy; override;

    procedure Activate;
    procedure Add(AItemClass: TClass); virtual;
    procedure Copy; virtual;
    procedure Cut; virtual;
    procedure Delete; virtual;
    procedure ItemDeleted(AItem: TPersistent); virtual;
    procedure GetSelections(const ASelections: IDesignerSelections); virtual;
    procedure MoveSelection(ADelta: Integer); virtual;
    procedure Paste; virtual;
    procedure SelectAll; virtual;
    procedure UpdateContent; virtual;
    procedure UpdateScrollBar; virtual;
    procedure UpdateSelections(const ASelections: IDesignerSelections); virtual;

    function IsLocked: Boolean;
    procedure Lock;
    procedure UnLock;

    property DsgnWindow: TdxfmNavBarDesignWindow read FDsgnWindow;
    property NavBar: TdxCustomNavBar read GetNavBar;
  end;

  IdxNavBarDesignEditor = interface
  ['{1A11AE34-8BF4-40A6-8B0E-F37399A236CC}']
    procedure Activate;
  end;

  TdxNavBarDesigner = class(TcxDesignHelper, IdxNavBarDesignEditor)
  private
    FDesignWindow: TdxfmNavBarDesignWindow;
    FIsBeingModified: Boolean;

    procedure Activate; { IdxNavBarDesignEditor }
    function GetDesignWindow: TdxfmNavBarDesignWindow;
  public
    constructor Create(AComponent: TComponent); override;
    destructor Destroy; override;
    procedure Modified; override; { IcxDesignHelper }

    property DesignWindow: TdxfmNavBarDesignWindow read GetDesignWindow;
  end;

  TdxfmNavBarDesignWindow = class(TDesignWindow)
    ilActions: TcxImageList;
    pmMain: TPopupMenu;
    miAdd: TMenuItem;
    N2: TMenuItem;
    miEdit: TMenuItem;
    miCut: TMenuItem;
    miCopy: TMenuItem;
    miPaste: TMenuItem;
    miDelete: TMenuItem;
    N3: TMenuItem;
    miSelectAll: TMenuItem;
    N4: TMenuItem;
    miMoveUp: TMenuItem;
    miMoveDown: TMenuItem;
    nbMain: TdxNavBar;
    bgMain: TdxNavBarGroup;
    bgStyles: TdxNavBarGroup;
    biGroups: TdxNavBarItem;
    biLinks: TdxNavBarItem;
    biViews: TdxNavBarItem;
    biDefaultStyles: TdxNavBarItem;
    biCustomStyles: TdxNavBarItem;
    pnCommonButtons: TPanel;
    btCancel: TButton;
    pcMain: TPageControl;
    tsGroups: TTabSheet;
    lbxGroups: TListBox;
    tsLinks: TTabSheet;
    Splitter1: TSplitter;
    tsViews: TTabSheet;
    Label3: TLabel;
    Label4: TLabel;
    nbPreview: TdxNavBar;
    bgLocal: TdxNavBarGroup;
    bgContacts: TdxNavBarGroup;
    biInbox: TdxNavBarItem;
    biOutbox: TdxNavBarItem;
    biSentItems: TdxNavBarItem;
    biDeletedItems: TdxNavBarItem;
    biReport: TdxNavBarItem;
    lbxViewStyles: TListBox;
    tsDefaultStyles: TTabSheet;
    lbxDefaultStyles: TListBox;
    tsCustomStyles: TTabSheet;
    lbxCustomStyles: TListBox;
    actlCommands: TActionList;
    actAdd: TAction;
    actMoveUp: TAction;
    actMoveDown: TAction;
    pnButtons: TPanel;
    tlbGroups: TToolBar;
    ToolButton3: TToolButton;
    ToolButton6: TToolButton;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton7: TToolButton;
    ToolButton5: TToolButton;
    ToolButton12: TToolButton;
    Panel6: TPanel;
    tlbCustomStyles: TToolBar;
    ToolButton15: TToolButton;
    ToolButton16: TToolButton;
    ToolButton17: TToolButton;
    ToolButton18: TToolButton;
    ToolButton19: TToolButton;
    ToolButton20: TToolButton;
    ToolButton21: TToolButton;
    Panel2: TPanel;
    tlbLinkDesigner: TToolBar;
    ToolButton22: TToolButton;
    ToolButton23: TToolButton;
    ToolButton24: TToolButton;
    ToolButton25: TToolButton;
    ToolButton26: TToolButton;
    biItems: TdxNavBarItem;
    tsItems: TTabSheet;
    Panel1: TPanel;
    tlbItems: TToolBar;
    ToolButton4: TToolButton;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    ToolButton10: TToolButton;
    ToolButton11: TToolButton;
    ToolButton13: TToolButton;
    ToolButton14: TToolButton;
    lbxItems: TListBox;
    Panel3: TPanel;
    lbxLinkDesignerItems: TListView;
    Panel4: TPanel;
    tvLinkDesignerGroups: TTreeView;
    Panel5: TPanel;
    Panel7: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Panel8: TPanel;
    tlbDefaultStyles: TToolBar;
    ToolButton27: TToolButton;
    actDefaultSettings: TAction;
    actDelete: TAction;
    actCut: TAction;
    actCopy: TAction;
    actPaste: TAction;
    actSelectAll: TAction;
    ilNavBarLarge: TcxImageList;
    ilNavBarSmall: TcxImageList;
    ilLinkDesigner: TcxImageList;
    ilToolBar: TcxImageList;
    ilTreeView: TcxImageList;
    ilToolBarDisabled: TcxImageList;
    pmGroupItemClasses: TPopupMenu;
    msiAdd: TMenuItem;
    cbColorScheme: TComboBox;
    lblColorScheme: TLabel;
    ilPreviewSmall: TcxImageList;
    ilPreviewLarge: TcxImageList;
    nbCalendar: TdxNavBarItem;
    nbTask: TdxNavBarItem;
    TabSheet1: TTabSheet;
    biLookAndFeelViews: TdxNavBarItem;
    Label5: TLabel;
    cbCategories: TComboBox;
    Label6: TLabel;
    cbFlat: TComboBox;
    Label7: TLabel;
    cbStandard: TComboBox;
    Label8: TLabel;
    cbUltraFlat: TComboBox;
    Label9: TLabel;
    cbOffice11: TComboBox;
    Label10: TLabel;
    cbNative: TComboBox;
    Label11: TLabel;
    cbSkin: TComboBox;
    Label12: TLabel;
    cbLookAndFeelSchemes: TComboBox;
    chSortViews: TCheckBox;
    procedure ListBoxClick(Sender: TObject);
    procedure AddClick(Sender: TObject);
    procedure ActionClick(Sender: TObject);
    procedure MoveUpClick(Sender: TObject);
    procedure MoveDownClick(Sender: TObject);
    procedure tvLinkDesignerGroupsDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure tvLinkDesignerGroupsDragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
    procedure tvLinkDesignerGroupsStartDrag(Sender: TObject; var DragObject: TDragObject);
    procedure lbxLinkDesignerItemsDragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
    procedure lbxLinkDesignerItemsDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure lbxLinkDesignerItemsStartDrag(Sender: TObject; var DragObject: TDragObject);
    procedure tvLinkDesignerGroupsExit(Sender: TObject);
    procedure tvLinkDesignerGroupsEndDrag(Sender, Target: TObject; X,
      Y: Integer);
    procedure lbxLinkDesignerItemsEndDrag(Sender, Target: TObject; X,
      Y: Integer);
    procedure nbMainLinkClick(Sender: TObject; ALink: TdxNavBarItemLink);
    procedure DefaultSettingsClick(Sender: TObject);
    procedure lbxViewStylesChange(Sender: TObject);
    procedure btCancelClick(Sender: TObject);
    procedure lbxItemsContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure lbxContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure cbColorSchemeChange(Sender: TObject);
    procedure cbCategoriesChange(Sender: TObject);
    procedure cbFlatChange(Sender: TObject);
    procedure cbLookAndFeelSchemesChange(Sender: TObject);
    procedure chSortViewsClick(Sender: TObject);
    procedure actlCommandsUpdate(Action: TBasicAction; var Handled: Boolean);
  private
    FNavBar: TdxCustomNavBar;
    FHandlers: TList;
    FCurrentHandler: TdxNavBarDsgnWindowPageHandler;
    FSaveCursor: TCursor;

    function GetNavBarDesigner: IcxDesignHelper;
    procedure SetNavBar(Value: TdxCustomNavBar);

    procedure ActivatePage(APageIndex: Integer);
    function CanAdd: Boolean;
    function CanCopy: Boolean;
    function CanCut: Boolean;
    function CanDelete: Boolean;
    function CanMoveDown: Boolean;
    function CanMoveUp: Boolean;
    function CanPaste: Boolean;
    function CanSelectAll: Boolean;
    procedure Copy;
    procedure Cut;
    procedure Delete;
    procedure HandleException;
    function GetRegistryPath: string;
    procedure Paste;
    procedure RestoreLayout;
    procedure SafeChangeLookAndFeelScheme(ALookAndFeelStyle: TcxLookAndFeelStyle;
      ANavBarID: Integer);
    procedure Select(AComponent: TComponent; AddToSelection: Boolean);
    procedure SelectAll;
    procedure SelectNavBar;
    procedure StartWait;
    procedure StopWait;
    procedure StoreLayout;
    procedure UpdateCaption;
    procedure UpdateSelections(const ASelections: IDesignerSelections);

    function GetCategories(AIndex: Integer): TdxNavBarViewCategories;
    function GetHandler(Index: Integer): TdxNavBarDsgnWindowPageHandler;
    function GetHandlerCount: Integer;
  protected
    procedure Activated; override;
  {$IFDEF DELPHI9}
    procedure CreateParams(var Params: TCreateParams); override;
  {$ENDIF}
    function UniqueName(Component: TComponent): string; override;

    procedure ActiveDesignerPageChanged;
    procedure CheckViewCategories;
    procedure InitializeHandlers;
    procedure InitializeViewStyles;
    function IsCategoriesSuitable(ACategories: TdxNavBarViewCategories): Boolean;
    procedure FinalizeHandlers;
    procedure SynchronizeViewStyleSelection;

    function GetSchemeComboByLookAndFeelStyle(ALookAndFeelStyle: TcxLookAndFeelStyle): TComboBox;
    function GetLookAndFeelBySchemeCombo(ACombo: TComboBox): TcxLookAndFeelStyle;
    procedure UpdateNavBarLookAndFeelScheme;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    function ClipboardComponents: Boolean;

    function EditAction(Action: TEditAction): Boolean; override;
    function GetEditState: TEditState; override;

    procedure ItemDeleted(const ADesigner: IDesigner; Item: TPersistent); override;
    procedure ItemsModified(const Designer: IDesigner); override;
    procedure SelectionChanged(const ADesigner: IDesigner; const ASelection: IDesignerSelections); override;

    property CurrentHandler: TdxNavBarDsgnWindowPageHandler read FCurrentHandler write FCurrentHandler;
    property HandlerCount: Integer read GetHandlerCount;
    property Handlers[Index: Integer]: TdxNavBarDsgnWindowPageHandler read GetHandler;
    property NavBar: TdxCustomNavBar read FNavBar write SetNavBar;
    property NavBarDesigner: IcxDesignHelper read GetNavBarDesigner;
  end;

function dxNavBarViewStyleHasColorSchemes(AViewStyle: TdxNavBarPainter): Boolean;
procedure dxShowNavBarDesigner(ANavBar: TdxCustomNavBar);

implementation

{$R *.DFM}

uses
  Windows, SysUtils, TypInfo, Registry, Math, Graphics, Variants,
  ToolsAPI, dxNavBarViewsFact, dxNavBarDsgnConsts, dxNavBarGroupItems,
  dxNavBarSkinBasedViews, dxNavBarConsts, dxCore;

type
  TdxCustomNavBarAccess = class(TdxCustomNavBar);

const
  dxNavBarPredefinedLookAndFeelScheme: array [0..1, TcxLookAndFeelStyle] of Integer =
    ((dxNavBarExplorerBarView, dxNavBarExplorerBarView, dxNavBarUltraFlatExplorerView,
      dxNavBarOffice12ExplorerBarView, dxNavBarOffice11ExplorerBarView, dxNavBarSkinExplorerBarView),
     (dxNavBarFlatView, dxNavBarBaseView, dxNavBarFlatView, dxNavBarOffice12NavigatorPaneView,
      dxNavBarOffice11NavigatorPaneView, dxNavBarSkinNavigatorPaneView)
    );

function dxNavBarViewStyleHasColorSchemes(AViewStyle: TdxNavBarPainter): Boolean;
var
  AColorSchemes: IdxNavBarColorSchemes;
  AColorSchemesList: TStringList;
begin
  AColorSchemesList := TStringList.Create;
  try
    Result := False;
    if Supports(AViewStyle, IdxNavBarColorSchemes, AColorSchemes) then
    begin
      AColorSchemes.PopulateNames(AColorSchemesList);
      Result := AColorSchemesList.Count > 1;
    end;
  finally
    AColorSchemesList.Free;
  end;
end;

procedure dxShowNavBarDesigner(ANavBar: TdxCustomNavBar);
var
  ANavBarDesignEditor: IdxNavBarDesignEditor;
begin
  if Supports(TdxCustomNavBarAccess(ANavBar).FDesignHelper, IdxNavBarDesignEditor, ANavBarDesignEditor) then
    ANavBarDesignEditor.Activate;
end;

{ TdxNavBarDesigner }

constructor TdxNavBarDesigner.Create(AComponent: TComponent);
begin
  inherited Create(AComponent);
  AddSelectionChangedListener(AComponent);
end;

destructor TdxNavBarDesigner.Destroy;
begin
  if FDesignWindow <> nil then
  begin
    FDesignWindow.Designer := nil;
    FDesignWindow.Free;
  end;
  RemoveSelectionChangedListener(Component);
  inherited Destroy;
end;

function TdxNavBarDesigner.GetDesignWindow: TdxfmNavBarDesignWindow;
begin
  if FDesignWindow = nil then
  begin
    FDesignWindow := TdxfmNavBarDesignWindow.Create(nil);
    FDesignWindow.Designer := Designer;
    FDesignWindow.NavBar := TdxCustomNavBar(Component);
  end;
  Result := FDesignWindow;
end;

procedure TdxNavBarDesigner.Activate;
begin
  DesignWindow.Show;
end;

procedure TdxNavBarDesigner.Modified;
begin
  if not FIsBeingModified and (Designer <> nil) then
  begin
    FIsBeingModified := True;
    try
      inherited Modified;
    finally
      FIsBeingModified := False
    end;
  end;
end;

type
  TdxNavBarDsgnWindowComponentCollectionPageHandler = class(TdxNavBarDsgnWindowPageHandler)
  private
    function GetItem(Index: Integer): TdxNavBarComponentCollectionItem;
    function GetItemCount: Integer;
    function GetSelected(Index: Integer): Boolean;
    function GetSelectedCount: Integer;
    procedure SetSelected(Index: Integer; const Value: Boolean);
  protected
    function AddNavBarCollectionItem(AItemClass: TClass): TdxNavBarComponentCollectionItem; virtual;
    function GetNavBarComponentCollection: TdxNavBarComponentCollection; virtual;
    function MainList: TListBox; virtual;
    function ItemClass: TComponentClass; virtual;
    procedure SetCollectionItemName(ANavBarCollectionItem: TdxNavBarComponentCollectionItem); virtual;

    function CanAdd: Boolean; override;
    function CanCopy: Boolean; override;
    function CanCut: Boolean; override;
    function CanDelete: Boolean; override;
    function CanSelectAll: Boolean; override;
    function CanMoveUp: Boolean; override;
    function CanMoveDown: Boolean; override;
    function CanPaste: Boolean; override;
  public
    procedure Add(AItemClass: TClass); override;
    procedure Copy; override;
    procedure Cut; override;
    procedure Delete; override;
    procedure ItemDeleted(AItem: TPersistent); override;
    function IndexOf(AItem: TComponent): Integer;
    procedure GetSelections(const ASelections: IDesignerSelections); override;
    procedure MoveSelection(ADelta: Integer); override;
    procedure Paste; override;
    procedure RefreshListValues; virtual;
    procedure SelectAll; override;
    procedure UpdateContent; override;
    procedure UpdateScrollBar; override;
    procedure UpdateSelections(const ASelections: IDesignerSelections); override;

    property Selected[Index: Integer]: Boolean read GetSelected write SetSelected;
    property SelectedCount: Integer read GetSelectedCount;
    property Items[Index: Integer]: TdxNavBarComponentCollectionItem read GetItem;
    property ItemCount: Integer read GetItemCount;
    property NavBarCollection: TdxNavBarComponentCollection read GetNavBarComponentCollection;

    property DsgnWindow: TdxfmNavBarDesignWindow read FDsgnWindow;
    property NavBar: TdxCustomNavBar read GetNavBar;
  end;

{ TdxNavBarDsgnWindowComponentCollectionPageHandler }

procedure TdxNavBarDsgnWindowComponentCollectionPageHandler.Add(AItemClass: TClass);
var
  ANavBarCollectionItem: TdxNavBarComponentCollectionItem;
begin
  ANavBarCollectionItem := AddNavBarCollectionItem(AItemClass);
  SetCollectionItemName(ANavBarCollectionItem);
  MainList.Items.AddObject(ANavBarCollectionItem.Name, ANavBarCollectionItem);
  DsgnWindow.Select(ANavBarCollectionItem, False);
  UpdateScrollBar;
  MainList.Update;
  NavBar.DesignerModified;
end;

procedure TdxNavBarDsgnWindowComponentCollectionPageHandler.Copy;
var
  Components: IDesignerSelections;
begin
//DsgnWindow.Designer.CopySelection
  Components := CreateSelectionList;
  GetSelections(Components);
  DsgnWindow.CopyComponents(NavBar.Owner, Components);
  UpdateScrollBar;
end;

procedure TdxNavBarDsgnWindowComponentCollectionPageHandler.Cut;
begin
  Copy;
  Delete;
end;

procedure TdxNavBarDsgnWindowComponentCollectionPageHandler.Delete;
var
  Selections: IDesignerSelections;
  I: Integer;
begin
  DsgnWindow.StartWait;
  try
    Selections := CreateSelectionList;
    GetSelections(Selections);
    for I := 0 to Selections.Count - 1 do
      dxNavBarDsgnUtils.TryExtractPersistent(Selections[I]).Free;
  finally
    DsgnWindow.StopWait;
  end;
end;

procedure TdxNavBarDsgnWindowComponentCollectionPageHandler.ItemDeleted(
  AItem: TPersistent);
var
  Index, ItemIndex: Integer;
begin
  if (AItem = nil) or not AItem.InheritsFrom(ItemClass) then exit;

  Index := IndexOf(TComponent(AItem));
  if Index <> -1 then
  begin
    ItemIndex := MainList.ItemIndex;
    MainList.Items.Delete(Index);

    ItemIndex := Min(ItemIndex, ItemCount - 1);
    if ItemIndex <> -1 then
      DsgnWindow.Select(Items[ItemIndex], False)
    else
      DsgnWindow.SelectNavBar;
    UpdateScrollBar;
  end;
end;

procedure TdxNavBarDsgnWindowComponentCollectionPageHandler.GetSelections(
  const ASelections: IDesignerSelections);
var
  I: Integer;
begin
  for I := 0 to ItemCount - 1 do
    if Selected[I] then
      ASelections.Add(dxNavBarDsgnUtils.MakeIComponent(Items[I]));
  if ASelections.Count = 0 then
    ASelections.Add(dxNavBarDsgnUtils.MakeIComponent(NavBar));
end;

function TdxNavBarDsgnWindowComponentCollectionPageHandler.IndexOf(
  AItem: TComponent): Integer;
begin
  Result := MainList.Items.IndexOfObject(AItem);
end;

procedure TdxNavBarDsgnWindowComponentCollectionPageHandler.MoveSelection(
  ADelta: Integer);

  procedure MoveDown(ADelta: Integer);
  var
    I, Index: Integer;
  begin
    for I := 0 to ItemCount - 1 do
      if Selected[I] then
      begin
        Index := Items[I].Index;
        Inc(Index, ADelta);
        if Index > ItemCount - 1 then
          Index := ItemCount - 1;
        while (Index < ItemCount) and Selected[Index] do
          Inc(Index);
        Items[I].Index := Index;
      end;
  end;

  procedure MoveUp(ADelta: Integer);
  var
    I, Index: Integer;
  begin
    for I := ItemCount - 1 downto 0 do
      if Selected[I] then
      begin
        Index := Items[I].Index;
        Inc(Index, ADelta);
        if Index < 0 then
          Index := 0;
        while (Index > -1) and Selected[Index] do
          Dec(Index);
        Items[I].Index := Index;
      end;
  end;

begin
  if ADelta > 0 then
    MoveDown(ADelta)
  else
    MoveUp(ADelta);
  NavBar.DesignerModified;
end;

procedure TdxNavBarDsgnWindowComponentCollectionPageHandler.Paste;
var
  Components: IDesignerSelections;
  I: Integer;
begin
//DsgnWindow.Designer.PasteSelection
  Components := CreateSelectionList;
  DsgnWindow.StartWait;
  try
    MainList.Items.BeginUpdate;
    try
      DsgnWindow.PasteComponents(NavBar.Owner, NavBar, Components);
      UpdateContent;
      for I := ItemCount - 1 downto ItemCount - Components.Count do
        Selected[I] := True;
      DsgnWindow.Designer.SetSelections(Components);
    finally
      MainList.Items.EndUpdate;
    end;
  finally
    DsgnWindow.StopWait;
  end;
  UpdateScrollBar;
end;

procedure TdxNavBarDsgnWindowComponentCollectionPageHandler.UpdateContent;
var
  Selections: IDesignerSelections;
  I, Index: Integer;
  Component: TComponent;
begin
  MainList.Items.BeginUpdate;
  try
    Selections := CreateSelectionList;
    GetSelections(Selections);

    MainList.Items.Clear;
    if NavBar = nil then Exit;
    RefreshListValues;

    for I := 0 to Selections.Count - 1 do
    begin
      Component := dxNavBarDsgnUtils.TryExtractComponent(Selections[I]);
      if Component is ItemClass then
      begin
        Index := IndexOf(Component);
        if Index <> -1 then Selected[Index] := True;
      end;
    end;
  finally
    MainList.Items.EndUpdate;
  end;
end;

procedure TdxNavBarDsgnWindowComponentCollectionPageHandler.RefreshListValues;
var
  I: Integer;
  ANavBarCollectionItem: TcxComponentCollectionItem;
begin
  for I := 0 to NavBarCollection.Count - 1 do
  begin
    ANavBarCollectionItem := NavBarCollection.Items[I];
    if ANavBarCollectionItem.Owner = NavBar.Owner then
      MainList.Items.AddObject(ANavBarCollectionItem.Name, ANavBarCollectionItem);
  end;
end;

procedure TdxNavBarDsgnWindowComponentCollectionPageHandler.SelectAll;
var
  Selections: IDesignerSelections;
  I: Integer;
begin
  Selections := CreateSelectionList;
  for I := 0 to ItemCount - 1 do
    Selections.Add(dxNavBarDsgnUtils.MakeIComponent(Items[I]));
  DsgnWindow.Designer.SetSelections(Selections);
end;

procedure TdxNavBarDsgnWindowComponentCollectionPageHandler.SetSelected(
  Index: Integer; const Value: Boolean);
begin
  if MainList <> nil then
    MainList.Selected[Index] := Value;
end;

procedure TdxNavBarDsgnWindowComponentCollectionPageHandler.UpdateScrollBar;
var
  I, NewWidth, CurrentWidth: Integer;
begin
  NewWidth := 0;
  with MainList do
  begin
    for I := 0 to Items.Count - 1 do
    begin
      CurrentWidth := 2 + Canvas.TextWidth(Items[I]) + 1;
      if CurrentWidth > NewWidth then NewWidth := CurrentWidth;
    end;
    SendMessage(Handle, LB_SETHORIZONTALEXTENT, NewWidth, 0);
  end;
end;

procedure TdxNavBarDsgnWindowComponentCollectionPageHandler.UpdateSelections(const ASelections: IDesignerSelections);

  function InSelection(AItem: TComponent): Boolean;
  var
    I: Integer;
  begin
    Result := False;
    for I := 0 to ASelections.Count - 1 do
      if AItem = dxNavBarDsgnUtils.TryExtractComponent(ASelections[I]) then
      begin
        Result := True;
        break;
      end;
  end;

var
  I: Integer;
begin
  for I := 0 to ItemCount - 1 do
    if Selected[I] xor InSelection(Items[I]) then
      Selected[I] := not Selected[I];
end;

function TdxNavBarDsgnWindowComponentCollectionPageHandler.AddNavBarCollectionItem(AItemClass: TClass): TdxNavBarComponentCollectionItem;
begin
  Result := nil;
end;

function TdxNavBarDsgnWindowComponentCollectionPageHandler.GetNavBarComponentCollection: TdxNavBarComponentCollection;
begin
  Result := nil;
end;

function TdxNavBarDsgnWindowComponentCollectionPageHandler.MainList: TListBox;
begin
  Result := nil;
end;

function TdxNavBarDsgnWindowComponentCollectionPageHandler.ItemClass: TComponentClass;
begin
  Result := nil;
end;

procedure TdxNavBarDsgnWindowComponentCollectionPageHandler.SetCollectionItemName(
  ANavBarCollectionItem: TdxNavBarComponentCollectionItem);
begin
  ANavBarCollectionItem.Name := DsgnWindow.UniqueName(ANavBarCollectionItem);
end;

function TdxNavBarDsgnWindowComponentCollectionPageHandler.CanAdd: Boolean;
begin
  Result := (NavBar <> nil) and (NavBar.Owner <> nil);
  if Result then
    Result := not (csInline in NavBar.Owner.ComponentState);
end;

function TdxNavBarDsgnWindowComponentCollectionPageHandler.CanCopy: Boolean;
begin
  Result := SelectedCount <> 0;
end;

function TdxNavBarDsgnWindowComponentCollectionPageHandler.CanCut: Boolean;
begin
  Result := CanCopy and CanDelete;
end;

function TdxNavBarDsgnWindowComponentCollectionPageHandler.CanDelete: Boolean;
var
  I: Integer;
begin
  Result := SelectedCount <> 0;
  if Result then
    for I := 0 to ItemCount - 1 do
      if Selected[I] and (csAncestor in Items[I].ComponentState) then
      begin
        Result := False;
        Exit;
      end;
end;

function TdxNavBarDsgnWindowComponentCollectionPageHandler.CanMoveDown: Boolean;
var
  I, Counter: Integer;
begin
  Counter := 0;
  for I := ItemCount - 1 downto 0 do
  begin
    if not Selected[I] then
    begin
      Result := Counter < SelectedCount;
      Exit;
    end;
    Inc(Counter);
  end;
  Result := False;
end;

function TdxNavBarDsgnWindowComponentCollectionPageHandler.CanMoveUp: Boolean;
var
  I: Integer;
begin
  for I := 0 to ItemCount - 1 do
    if not Selected[I] then
    begin
      Result := I < SelectedCount;
      Exit;
    end;
  Result := False;
end;

function TdxNavBarDsgnWindowComponentCollectionPageHandler.CanPaste: Boolean;
begin
  Result := CanAdd and DsgnWindow.ClipboardComponents and DsgnWindow.Designer.CanPaste;
end;

function TdxNavBarDsgnWindowComponentCollectionPageHandler.CanSelectAll: Boolean;
begin
  Result := ItemCount <> SelectedCount;
end;

function TdxNavBarDsgnWindowComponentCollectionPageHandler.GetItem(
  Index: Integer): TdxNavBarComponentCollectionItem;
begin
  if MainList <> nil then
    Result := TdxNavBarComponentCollectionItem(MainList.Items.Objects[Index])
  else Result := nil;
end;

function TdxNavBarDsgnWindowComponentCollectionPageHandler.GetItemCount: Integer;
begin
  if MainList <> nil then
    Result := MainList.Items.Count
  else Result := 0;
end;

function TdxNavBarDsgnWindowComponentCollectionPageHandler.GetSelected(
  Index: Integer): Boolean;
begin
  if MainList <> nil then
    Result := MainList.Selected[Index]
  else Result := False;
end;

function TdxNavBarDsgnWindowComponentCollectionPageHandler.GetSelectedCount: Integer;
begin
  if MainList <> nil then
    Result := MainList.SelCount
  else Result := 0;
end;

type
  TdxNavBarDsgnWindowGroupsHandler = class(TdxNavBarDsgnWindowComponentCollectionPageHandler)
  protected
    function AddNavBarCollectionItem(AItemClass: TClass): TdxNavBarComponentCollectionItem; override;
    function DesignerCaptionPostfix: string; override;
    function GetNavBarComponentCollection: TdxNavBarComponentCollection; override;
    function MainList: TListBox; override;
    function ItemNamePrefix: string; override;
    function ItemClass: TComponentClass; override;
  end;

{ TdxNavBarDsgnWindowGroupsHandler }

function TdxNavBarDsgnWindowGroupsHandler.AddNavBarCollectionItem(AItemClass: TClass): TdxNavBarComponentCollectionItem;
begin
  Result := TdxNavBarGroups(NavBarCollection).Add;
end;

function TdxNavBarDsgnWindowGroupsHandler.DesignerCaptionPostfix: string;
begin
  Result := sdxGroupsDesigner;
end;

function TdxNavBarDsgnWindowGroupsHandler.GetNavBarComponentCollection: TdxNavBarComponentCollection;
begin
  Result := NavBar.Groups;
end;

function TdxNavBarDsgnWindowGroupsHandler.MainList: TListBox;
begin
  Result := DsgnWindow.lbxGroups;
end;

function TdxNavBarDsgnWindowGroupsHandler.ItemNamePrefix: string;
begin
  Result := sdxGroup;
end;

function TdxNavBarDsgnWindowGroupsHandler.ItemClass: TComponentClass;
begin
  Result := TdxNavBarGroup;
end;

type
  TdxNavBarDsgnWindowItemsHandler = class(TdxNavBarDsgnWindowComponentCollectionPageHandler)
  protected
    function AddNavBarCollectionItem(AItemClass: TClass): TdxNavBarComponentCollectionItem; override;
    function DesignerCaptionPostfix: string; override;
    function GetNavBarComponentCollection: TdxNavBarComponentCollection; override;
    function MainList: TListBox; override;
    function ItemNamePrefix: string; override;
    function ItemClass: TComponentClass; override;
  end;

{ TdxNavBarDsgnWindowItemsHandler }

function TdxNavBarDsgnWindowItemsHandler.AddNavBarCollectionItem(AItemClass: TClass): TdxNavBarComponentCollectionItem;
begin
  if (AItemClass <> nil) and AItemClass.InheritsFrom(TdxNavBarItem) then
    Result := TdxNavBarItems(NavBarCollection).Add(TdxNavBarItemClass(AItemClass))
  else
    Result := TdxNavBarItems(NavBarCollection).Add;
end;

function TdxNavBarDsgnWindowItemsHandler.DesignerCaptionPostfix: string;
begin
  Result := sdxItemsDesigner;
end;

function TdxNavBarDsgnWindowItemsHandler.GetNavBarComponentCollection: TdxNavBarComponentCollection;
begin
  Result := NavBar.Items;
end;

function TdxNavBarDsgnWindowItemsHandler.MainList: TListBox;
begin
  Result := DsgnWindow.lbxItems;
end;

function TdxNavBarDsgnWindowItemsHandler.ItemNamePrefix: string;
begin
  Result := sdxItem;
end;

function TdxNavBarDsgnWindowItemsHandler.ItemClass: TComponentClass;
begin
  Result := TdxNavBarItem;
end;

type
  TdxNavBarDsgnWindowCustomStylesHandler = class(TdxNavBarDsgnWindowComponentCollectionPageHandler)
  protected
    function AddNavBarCollectionItem(AItemClass: TClass): TdxNavBarComponentCollectionItem; override;
    function MainList: TListBox; override;
    function DesignerCaptionPostfix: string; override;
    function GetNavBarComponentCollection: TdxNavBarComponentCollection; override;
    function ItemNamePrefix: string; override;
    function ItemClass: TComponentClass; override;
    procedure SetCollectionItemName(ANavBarCollectionItem: TdxNavBarComponentCollectionItem); override;
  end;

{ TdxNavBarDsgnWindowSlylesHandler }

function TdxNavBarDsgnWindowCustomStylesHandler.AddNavBarCollectionItem(AItemClass: TClass): TdxNavBarComponentCollectionItem;
begin
  Result := TdxNavBarStyleRepository(NavBarCollection).Add;
end;

function TdxNavBarDsgnWindowCustomStylesHandler.MainList: TListBox;
begin
  Result := DsgnWindow.lbxCustomStyles;
end;

function TdxNavBarDsgnWindowCustomStylesHandler.DesignerCaptionPostfix: string;
begin
  Result := sdxCustomStylesDesigner;
end;

function TdxNavBarDsgnWindowCustomStylesHandler.GetNavBarComponentCollection: TdxNavBarComponentCollection;
begin
  Result := NavBar.Styles;
end;

function TdxNavBarDsgnWindowCustomStylesHandler.ItemNamePrefix: string;
begin
  Result := sdxStyleItem;
end;

function TdxNavBarDsgnWindowCustomStylesHandler.ItemClass: TComponentClass;
begin
  Result := TdxNavBarStyleItem;
end;

procedure TdxNavBarDsgnWindowCustomStylesHandler.SetCollectionItemName(ANavBarCollectionItem: TdxNavBarComponentCollectionItem);
begin
//do nothing
end;

type
  TdxNavBarDsgnWindowLinksHandler = class(TdxNavBarDsgnWindowPageHandler)
  private
    FLockUpdateContent: Boolean;
    FSourceItem: TdxNavBarItem;
    FSourceLink: TdxNavBarItemLink;
    FTargetGroup: TdxNavBarGroup;
    FTargetLink: TdxNavBarItemLink;

    function GetSelectedGroup: TdxNavBarGroup;
    function GetSelectedItem: TdxNavBarItem;
    function GetSelectedLink: TdxNavBarItemLink;
  protected
    function CanAdd: Boolean; override;
    function CanDelete: Boolean; override;
    function CanSelectAll: Boolean; override;
    function CanMoveUp: Boolean; override;
    function CanMoveDown: Boolean; override;
    function DesignerCaptionPostfix: string; override;

    function ItemsLV: TListView;
    function LinksTV: TTreeView;
    procedure RefreshGroupTreeView;
    procedure RefreshItemList;
    function GetGroupByNode(ANode: TTreeNode): TdxNavBarGroup;
    function GetLinkByNode(ANode: TTreeNode): TdxNavBarItemLink;
    function GetItemByNode(ANode: TListItem): TdxNavBarItem;
    function GetNodeByGroup(AGroup: TdxNavBarGroup): TTreeNode;
    function GetNodeByLink(ALink: TdxNavBarItemLink): TTreeNode;
    procedure CreateNodeByLink(ALink: TdxNavBarItemLink);
    procedure RemoveNodeByLink(ALink: TdxNavBarItemLink);

    function GetGroupNodeCaption(AGroup: TdxNavBarGroup): string;
    function GetItemNodeCaption(AItem: TdxNavBarItem): string;
    procedure SetTargetGroupNodeImage(AImageIndex: Integer);
    procedure SetTargetLinkNodeImage(AImageIndex: Integer);
    procedure UpdateTargets(ANode: TTreeNode);
    procedure ClearTargets;

    procedure CreateLink(AItem: TdxNavBarItem; AGroup: TdxNavBarGroup; AIndex: Integer);
    procedure MoveLink(ALink: TdxNavBarItemLink; AGroup: TdxNavBarGroup; AIndex: Integer);
    procedure RemoveLink(ALink: TdxNavBarItemLink);
  public
    procedure Add(AItemClass: TClass); override;
    procedure Delete; override;
    procedure ItemDeleted(AItem: TPersistent); override;
    procedure MoveSelection(ADelta: Integer); override;
    procedure UpdateContent; override;

    property SelectedGroup: TdxNavBarGroup read GetSelectedGroup;
    property SelectedItem: TdxNavBarItem read GetSelectedItem;
    property SelectedLink: TdxNavBarItemLink read GetSelectedLink;
    property SourceItem: TdxNavBarItem read FSourceItem write FSourceItem;
    property SourceLink: TdxNavBarItemLink read FSourceLink write FSourceLink;
    property TargetGroup: TdxNavBarGroup read FTargetGroup;
    property TargetLink: TdxNavBarItemLink read FTargetLink;
  end;

{ TdxNavBarDsgnWindowLinksHandler }

function TdxNavBarDsgnWindowLinksHandler.CanAdd: Boolean;
begin
  Result := (SelectedItem <> nil) and (SelectedGroup <> nil);
end;

function TdxNavBarDsgnWindowLinksHandler.CanDelete: Boolean;
begin
  Result := SelectedLink <> nil;
end;

function TdxNavBarDsgnWindowLinksHandler.CanSelectAll: Boolean;
begin
  Result := False;
end;

function TdxNavBarDsgnWindowLinksHandler.CanMoveUp: Boolean;
begin
  Result := (SelectedLink <> nil) and (SelectedLink.Index > 0);
end;

function TdxNavBarDsgnWindowLinksHandler.CanMoveDown: Boolean;
begin
  Result := (SelectedLink <> nil) and (SelectedLink.Index < SelectedLink.Group.LinkCount - 1);
end;

function TdxNavBarDsgnWindowLinksHandler.DesignerCaptionPostfix: string;
begin
  Result := sdxLinksDesigner;
end;

function TdxNavBarDsgnWindowLinksHandler.GetGroupByNode(ANode: TTreeNode): TdxNavBarGroup;
begin
  if TObject(ANode.Data) is TdxNavBarGroup then
    Result := TdxNavBarGroup(ANode.Data)
  else Result := nil;
end;

function TdxNavBarDsgnWindowLinksHandler.GetLinkByNode(ANode: TTreeNode): TdxNavBarItemLink;
begin
  if TObject(ANode.Data) is TdxNavBarItemLink then
    Result := TdxNavBarItemLink(ANode.Data)
  else Result := nil;
end;

function TdxNavBarDsgnWindowLinksHandler.GetItemByNode(ANode: TListItem): TdxNavBarItem;
begin
  if TObject(ANode.Data) is TdxNavBarItem then
    Result := TdxNavBarItem(ANode.Data)
  else Result := nil;
end;

function TdxNavBarDsgnWindowLinksHandler.GetNodeByGroup(AGroup: TdxNavBarGroup): TTreeNode;
var
  I: Integer;
begin
  Result := nil;
  for I := 0 to DsgnWindow.tvLinkDesignerGroups.Items.Count - 1 do
    if TObject(DsgnWindow.tvLinkDesignerGroups.Items[I].Data) = AGroup then
    begin
      Result := DsgnWindow.tvLinkDesignerGroups.Items[I];
      break;
    end;
end;

function TdxNavBarDsgnWindowLinksHandler.GetNodeByLink(ALink: TdxNavBarItemLink): TTreeNode;
var
  I: Integer;
begin
  Result := nil;
  for I := 0 to DsgnWindow.tvLinkDesignerGroups.Items.Count - 1 do
    if TObject(DsgnWindow.tvLinkDesignerGroups.Items[I].Data) = ALink then
    begin
      Result := DsgnWindow.tvLinkDesignerGroups.Items[I];
      break;
    end;
end;

procedure TdxNavBarDsgnWindowLinksHandler.CreateNodeByLink(ALink: TdxNavBarItemLink);
var
  ANode: TTreeNode;
begin
  ANode := GetNodeByGroup(ALink.Group);
  if ANode <> nil then
  begin
    if ALink.Index = ALink.Group.LinkCount - 1 then
      ANode := LinksTV.Items.AddChildObject(ANode, GetItemNodeCaption(ALink.Item), ALink)
    else
    begin
      ANode := GetNodeByLink(ALink.Group.Links[ALink.Index + 1]);
      ANode := LinksTV.Items.InsertObject(ANode, GetItemNodeCaption(ALink.Item), ALink);
    end;
    with ANode do
    begin
      ImageIndex := 2;
      SelectedIndex := 2;
    end;
    LinksTV.Selected := ANode;
  end;
end;

procedure TdxNavBarDsgnWindowLinksHandler.RemoveNodeByLink(ALink: TdxNavBarItemLink);
var
  ANode: TTreeNode;
begin
  ANode := GetNodeByLink(ALink);
  if ANode <> nil then
    LinksTV.Items.Delete(ANode);
end;

function TdxNavBarDsgnWindowLinksHandler.GetGroupNodeCaption(AGroup: TdxNavBarGroup): string;
begin
  Result := AGroup.Caption + ' [' + AGroup.Name + ']';
end;

function TdxNavBarDsgnWindowLinksHandler.GetItemNodeCaption(AItem: TdxNavBarItem): string;
begin
  Result := AItem.Caption + ' [' + AItem.Name + ']';
end;

procedure TdxNavBarDsgnWindowLinksHandler.SetTargetGroupNodeImage(AImageIndex: Integer);
var
  ANode: TTreeNode;
begin
  if TargetGroup <> nil then
  begin
    ANode := GetNodeByGroup(TargetGroup);
    if ANode <> nil then
      with ANode do
      begin
        ImageIndex := AImageIndex;
        SelectedIndex := AImageIndex;
      end;
  end;
end;

procedure TdxNavBarDsgnWindowLinksHandler.SetTargetLinkNodeImage(AImageIndex: Integer);
var
  ANode: TTreeNode;
begin
  if TargetLink <> nil then
  begin
    ANode := GetNodeByLink(TargetLink);
    if ANode <> nil then
      with ANode do
      begin
        ImageIndex := AImageIndex;
        SelectedIndex := AImageIndex;
      end;
  end;
end;

procedure TdxNavBarDsgnWindowLinksHandler.UpdateTargets(ANode: TTreeNode);
var
  AGroup: TdxNavBarGroup;
  ALink: TdxNavBarItemLink;
begin
  if ANode <> nil then
  begin
    ALink := GetLinkByNode(ANode);
    AGroup := GetGroupByNode(ANode);
  end
  else
  begin
    AGroup := nil;
    ALink := nil;
  end;
  if FTargetGroup <> AGroup then
  begin
    SetTargetGroupNodeImage(1);
    FTargetGroup := AGroup;
    SetTargetGroupNodeImage(3);
  end;
  if FTargetLink <> ALink then
  begin
    SetTargetLinkNodeImage(2);
    FTargetLink := ALink;
    SetTargetLinkNodeImage(4);
  end;
end;

procedure TdxNavBarDsgnWindowLinksHandler.ClearTargets;
begin
  SetTargetGroupNodeImage(1);
  SetTargetLinkNodeImage(2);
  FTargetGroup := nil;
  FTargetLink := nil;;
end;

procedure TdxNavBarDsgnWindowLinksHandler.Add;
begin
  CreateLink(SelectedItem, SelectedGroup, -1);
end;

procedure TdxNavBarDsgnWindowLinksHandler.Delete;
begin
  RemoveLink(SelectedLink);
end;

procedure TdxNavBarDsgnWindowLinksHandler.ItemDeleted(AItem: TPersistent);
begin
  if (AItem <> nil) and (AItem.ClassType = TdxNavBarItemLink) then
    RemoveNodeByLink(TdxNavBarItemLink(AItem));
end;

procedure TdxNavBarDsgnWindowLinksHandler.MoveSelection(ADelta: Integer);
begin
  MoveLink(SelectedLink, SelectedGroup, SelectedLink.Index + ADelta);
end;

procedure TdxNavBarDsgnWindowLinksHandler.UpdateContent;
begin
  if not FLockUpdateContent then
  begin
    RefreshItemList;
    RefreshGroupTreeView;
  end;
end;

function TdxNavBarDsgnWindowLinksHandler.ItemsLV: TListView;
begin
  Result := DsgnWindow.lbxLinkDesignerItems;
end;

function TdxNavBarDsgnWindowLinksHandler.LinksTV: TTreeView;
begin
  Result := DsgnWindow.tvLinkDesignerGroups;
end;

procedure TdxNavBarDsgnWindowLinksHandler.CreateLink(AItem: TdxNavBarItem; AGroup: TdxNavBarGroup; AIndex: Integer);
var
  ALink: TdxNavBarItemLink;
begin
  DsgnWindow.tvLinkDesignerGroups.Items.BeginUpdate;
  try
    ALink := AGroup.CreateLink(AItem);
    if (AIndex >= 0) and (AIndex < AGroup.LinkCount) then
      ALink.Index := AIndex;
    CreateNodeByLink(ALink);
  finally
    DsgnWindow.tvLinkDesignerGroups.FullExpand;
    DsgnWindow.tvLinkDesignerGroups.Items.EndUpdate;
  end;
  FLockUpdateContent := True;
  NavBar.DesignerModified;
  FLockUpdateContent := False;
end;

procedure TdxNavBarDsgnWindowLinksHandler.MoveLink(ALink: TdxNavBarItemLink; AGroup: TdxNavBarGroup; AIndex: Integer);
var
  AItem: TdxNavBarItem;
begin
  AItem := ALink.Item;
  RemoveLink(ALink);
  CreateLink(AItem, AGroup, AIndex);
end;

procedure TdxNavBarDsgnWindowLinksHandler.RemoveLink(ALink: TdxNavBarItemLink);
begin
  ALink.Group.RemoveLink(ALink.Index);
  FLockUpdateContent := True;
  NavBar.DesignerModified;
  FLockUpdateContent := False;
end;

procedure TdxNavBarDsgnWindowLinksHandler.RefreshGroupTreeView;
var
  I, J: Integer;
  Group: TdxNavBarGroup;
  Node: TTreeNode;
begin
  LinksTV.Items.BeginUpdate;
  try
    LinksTV.Items.Clear;
    if NavBar = nil then Exit;

    for I := 0 to NavBar.Groups.Count - 1 do
    begin
      Group := NavBar.Groups[I];
      if Group.Owner = NavBar.Owner then
      begin
        Node := LinksTV.Items.AddObject(nil, GetGroupNodeCaption(Group), Group);
        Node.ImageIndex := 1;
        Node.SelectedIndex := 1;
        for J := 0 to Group.LinkCount - 1 do
        begin
          with LinksTV.Items.AddChildObject(Node, GetItemNodeCaption(Group.Links[J].Item), Group.Links[J]) do
          begin
            ImageIndex := 2;
            SelectedIndex := 2;
          end;
        end;
      end;
    end;
    LinksTV.FullExpand;
  finally
    LinksTV.Items.EndUpdate;
  end;
end;

procedure TdxNavBarDsgnWindowLinksHandler.RefreshItemList;
var
  I: Integer;
  Item: TdxNavBarItem;
begin
  ItemsLV.Items.BeginUpdate;
  try
    ItemsLV.Items.Clear;
    if NavBar = nil then Exit;

    for I := 0 to NavBar.Items.Count - 1 do
    begin
      Item := NavBar.Items[I];
      if Item.Owner = NavBar.Owner then
      with ItemsLV.Items.Add do
      begin
        Caption := GetItemNodeCaption(Item);
        Data := Item;
        if Item is TdxNavBarSeparator then
          ImageIndex := 5
        else
          ImageIndex := 0;
      end;
    end;
  finally
    ItemsLV.Items.EndUpdate;
  end;
end;

function TdxNavBarDsgnWindowLinksHandler.GetSelectedGroup: TdxNavBarGroup;
var
  ALink: TdxNavBarItemLink;
begin
  if LinksTV.Selected <> nil then
  begin
    Result := GetGroupByNode(LinksTV.Selected);
    if Result = nil then
    begin
      ALink := GetLinkByNode(LinksTV.Selected);
      if ALink <> nil then Result := ALink.Group;
    end;
  end
  else Result := nil;
end;

function TdxNavBarDsgnWindowLinksHandler.GetSelectedItem: TdxNavBarItem;
begin
  if ItemsLV.Selected <> nil then
    Result := GetItemByNode(ItemsLV.Selected)
  else Result := nil;
end;

function TdxNavBarDsgnWindowLinksHandler.GetSelectedLink: TdxNavBarItemLink;
begin
  if LinksTV.Selected <> nil then
    Result := GetLinkByNode(LinksTV.Selected)
  else Result := nil;
end;

type
  TdxNavBarDsgnWindowViewsHandler = class(TdxNavBarDsgnWindowPageHandler)
  protected
    function DesignerCaptionPostfix: string; override;
    procedure UpdateColorSchemes;
    procedure UpdatePreview;
  public
    procedure UpdateContent; override;
  end;

{ TdxNavBarDsgnWindowViewsHandler }

function TdxNavBarDsgnWindowViewsHandler.DesignerCaptionPostfix: string;
begin
  Result := sdxViewsDesigner;
end;

procedure TdxNavBarDsgnWindowViewsHandler.UpdateColorSchemes;
var
  AColorSchemes: IdxNavBarColorSchemes;
  AColorSchemesEnable: Boolean;
  AColorSchemesList: TStringList;
  AIndex: Integer;
begin
  DsgnWindow.cbColorScheme.Clear;
  AColorSchemesList := TStringList.Create;
  try
    AColorSchemesEnable := False;
    if Supports(NavBar.ViewStyle, IdxNavBarColorSchemes, AColorSchemes) then
    begin
      AColorSchemes.PopulateNames(AColorSchemesList);
      AColorSchemesEnable := AColorSchemesList.Count > 0;
    end;
    DsgnWindow.cbColorScheme.Enabled := AColorSchemesEnable;
    DsgnWindow.lblColorScheme.Enabled := AColorSchemesEnable;
    if AColorSchemesEnable then
    begin
      DsgnWindow.cbColorScheme.Items.Assign(AColorSchemesList);
      AIndex := DsgnWindow.cbColorScheme.Items.IndexOf(AColorSchemes.GetName);
    end
    else
    begin
      DsgnWindow.cbColorScheme.Items.Add('None');
      AIndex := 0;
    end;
    DsgnWindow.cbColorScheme.ItemIndex := AIndex;
  finally
    AColorSchemesList.Free;
  end;
end;

procedure TdxNavBarDsgnWindowViewsHandler.UpdatePreview;
begin
  DsgnWindow.nbPreview.View := NavBar.View;
  DsgnWindow.nbPreview.LookAndFeelSchemes := NavBar.LookAndFeelSchemes;
  DsgnWindow.nbPreview.LookAndFeel.MasterLookAndFeel := (NavBar as TdxNavBar).LookAndFeel;
  DsgnWindow.nbPreview.ViewStyle.Assign(NavBar.ViewStyle);
end;

procedure TdxNavBarDsgnWindowViewsHandler.UpdateContent;
begin
  if not IsLocked then
  begin
    DsgnWindow.CheckViewCategories;
    DsgnWindow.SynchronizeViewStyleSelection;
    UpdatePreview;
    UpdateColorSchemes;
  end;
end;

type
  TdxNavBarDsgnWindowLookAndFeelSchemeHandler = class(TdxNavBarDsgnWindowPageHandler)
  private
    FViews: TStringList;
  protected
    function DesignerCaptionPostfix: string; override;
    procedure FillScheme;
    procedure SynchronizeScheme;
  public
    constructor Create(ADsgnWindow: TdxfmNavBarDesignWindow);
    destructor Destroy; override;
    procedure UpdateContent; override;
  end;

{ TdxNavBarDsgnWindowLookAndFeelSchemeHandler }

constructor TdxNavBarDsgnWindowLookAndFeelSchemeHandler.Create(ADsgnWindow: TdxfmNavBarDesignWindow);
begin
  inherited Create(ADsgnWindow);
  FViews := TStringList.Create;
end;

destructor TdxNavBarDsgnWindowLookAndFeelSchemeHandler.Destroy;
begin
  FreeAndNil(FViews);
  inherited;
end;

procedure TdxNavBarDsgnWindowLookAndFeelSchemeHandler.UpdateContent;

  function CheckViews: Boolean;
  var
    I: Integer;
  begin
    Result := FViews.Count = dxNavBarViewsFactory.Count;
    for I := 0 to FViews.Count - 1 do
      if FViews.Objects[I] <> TObject(dxNavBarViewsFactory.IDs[I]) then
      begin
        Result := False;
        Break;
      end;
  end;

  procedure CheckSkins;
  var
    ASkinsAvailable: Boolean;
  begin
    ASkinsAvailable := dxNavBarViewsFactory.IsViewRegistered(dxNavBarSkinExplorerBarView);
    DsgnWindow.cbSkin.Visible := ASkinsAvailable;
    DsgnWindow.Label11.Visible := ASkinsAvailable;
  end;

begin
  CheckSkins;
  if not CheckViews then
    FillScheme;
  SynchronizeScheme;
end;

function TdxNavBarDsgnWindowLookAndFeelSchemeHandler.DesignerCaptionPostfix: string;
begin
  Result := sdxLookAndFeelSchemeDesigner;
end;

procedure TdxNavBarDsgnWindowLookAndFeelSchemeHandler.FillScheme;

  procedure FillSchemeCombo(ACombo: TComboBox);
  begin
    ACombo.Clear;
    ACombo.Items.AddStrings(FViews);
  end;

var
  AStyle: TcxLookAndFeelStyle;
  I: Integer;
begin
  FViews.Clear;
  for I := 0 to dxNavBarViewsFactory.Count - 1 do
    FViews.AddObject(dxNavBarViewsFactory.Names[I], TObject(dxNavBarViewsFactory.IDs[I]));
  for AStyle := Low(TcxLookAndFeelStyle) to High(TcxLookAndFeelStyle) do
    FillSchemeCombo(DsgnWindow.GetSchemeComboByLookAndFeelStyle(AStyle));
end;

procedure TdxNavBarDsgnWindowLookAndFeelSchemeHandler.SynchronizeScheme;
var
  I: TcxLookAndFeelStyle;
  ACombo: TComboBox;
begin
  for I := Low(TcxLookAndFeelStyle) to High(TcxLookAndFeelStyle) do
  begin
    ACombo := DsgnWindow.GetSchemeComboByLookAndFeelStyle(I);
    ACombo.ItemIndex := ACombo.Items.IndexOfObject(TObject(NavBar.LookAndFeelSchemes.Views[I]));
  end;
end;

type
  TdxNavBarDsgnWindowDefaultStylesHandler = class(TdxNavBarDsgnWindowPageHandler)
  private
    function GetItem(Index: Integer): TdxNavBarDefaultStyle;
    function GetItemCount: Integer;
    function GetSelected(Index: Integer): Boolean;
    procedure SetSelected(Index: Integer; const Value: Boolean);
  protected
    function DesignerCaptionPostfix: string; override;
    function MainList: TListBox;
  public
    procedure GetSelections(const ASelections: IDesignerSelections); override;
    procedure UpdateContent; override;
    procedure UpdateSelections(const ASelections: IDesignerSelections); override;

    property Selected[Index: Integer]: Boolean read GetSelected write SetSelected;
    property Items[Index: Integer]: TdxNavBarDefaultStyle read GetItem;
    property ItemCount: Integer read GetItemCount;
  end;

{ TdxNavBarDsgnWindowDefaultStylesHandler }

function TdxNavBarDsgnWindowDefaultStylesHandler.DesignerCaptionPostfix: string;
begin
  Result := sdxDefaultStylesDesigner;
end;

function TdxNavBarDsgnWindowDefaultStylesHandler.GetItem(
  Index: Integer): TdxNavBarDefaultStyle;
begin
  if MainList <> nil then
    Result := TdxNavBarDefaultStyle(MainList.Items.Objects[Index])
  else Result := nil;
end;

function TdxNavBarDsgnWindowDefaultStylesHandler.GetItemCount: Integer;
begin
  if MainList <> nil then
    Result := MainList.Items.Count
  else Result := 0;
end;

function TdxNavBarDsgnWindowDefaultStylesHandler.GetSelected(
  Index: Integer): Boolean;
begin
  if MainList <> nil then
    Result := MainList.Selected[Index]
  else Result := False;
end;

procedure TdxNavBarDsgnWindowDefaultStylesHandler.GetSelections(
  const ASelections: IDesignerSelections);
var
  I: Integer;
begin
  for I := 0 to ItemCount - 1 do
    if Selected[I] then
      ASelections.Add(dxNavBarDsgnUtils.MakeIPersistent(Items[I]));
  if ASelections.Count = 0 then
    ASelections.Add(dxNavBarDsgnUtils.MakeIComponent(NavBar));
end;

function TdxNavBarDsgnWindowDefaultStylesHandler.MainList: TListBox;
begin
  Result := DsgnWindow.lbxDefaultStyles;
end;

procedure TdxNavBarDsgnWindowDefaultStylesHandler.UpdateContent;
var
  PropList: TPropList;
  V: Variant;
  I: Integer;
  AStyle: TdxNavBarDefaultStyle;
  ACount: Integer;
begin
  if MainList.Items.Count > 0 then exit;
  ACount := GetPropList(TypeInfo(TdxNavBarDefaultStyles), [tkClass], @PropList);
  for I := 0 to ACount - 1 do
  begin
    if TdxNavBarDefaultStyle.ClassName = dxShortStringToString(PropList[I].PropType^.Name) then
    begin
      V := GetPropValue(NavBar.DefaultStyles, dxShortStringToString(PropList[I].Name));
       //TODO !!!!
      AStyle := TdxNavBarDefaultStyle(TVarData(V).VPointer);
      MainList.Items.AddObject(dxShortStringToString(PropList[I].Name), AStyle);
    end;
  end;
end;

procedure TdxNavBarDsgnWindowDefaultStylesHandler.SetSelected(
  Index: Integer; const Value: Boolean);
begin
  if MainList <> nil then
    MainList.Selected[Index] := Value;
end;

procedure TdxNavBarDsgnWindowDefaultStylesHandler.UpdateSelections(
  const ASelections: IDesignerSelections);

  function InSelection(AItem: TPersistent): Boolean;
  var
    I: Integer;
  begin
    Result := False;
    for I := 0 to ASelections.Count - 1 do
      if AItem = dxNavBarDsgnUtils.TryExtractPersistent(ASelections[I]) then
      begin
        Result := True;
        break;
      end;
  end;

var
  I: Integer;
begin
  for I := 0 to ItemCount - 1 do
    if Selected[I] xor InSelection(Items[I]) then
      Selected[I] := not Selected[I];
end;

{ TdxNavBarDsgnWindowPageHandler }

constructor TdxNavBarDsgnWindowPageHandler.Create(ADsgnWindow: TdxfmNavBarDesignWindow);
begin
  inherited Create;
  FDsgnWindow := ADsgnWindow;
end;

destructor TdxNavBarDsgnWindowPageHandler.Destroy;
begin
  inherited;
end;

procedure TdxNavBarDsgnWindowPageHandler.Activate;
begin
  UpdateContent;
end;

procedure TdxNavBarDsgnWindowPageHandler.Add(AItemClass: TClass);
begin
end;

procedure TdxNavBarDsgnWindowPageHandler.Copy;
begin
end;

procedure TdxNavBarDsgnWindowPageHandler.Cut;
begin
end;

procedure TdxNavBarDsgnWindowPageHandler.Delete;
begin
end;

procedure TdxNavBarDsgnWindowPageHandler.ItemDeleted(AItem: TPersistent);
begin
end;

procedure TdxNavBarDsgnWindowPageHandler.GetSelections(const ASelections: IDesignerSelections);
begin
end;

procedure TdxNavBarDsgnWindowPageHandler.MoveSelection(ADelta: Integer);
begin
end;

procedure TdxNavBarDsgnWindowPageHandler.Paste;
begin
end;

procedure TdxNavBarDsgnWindowPageHandler.UpdateContent;
begin
end;

procedure TdxNavBarDsgnWindowPageHandler.SelectAll;
begin
end;

function TdxNavBarDsgnWindowPageHandler.DesignerCaptionPostfix: string;
begin
  Result := sdxNavBarDesigner;
end;

function TdxNavBarDsgnWindowPageHandler.ItemNamePrefix: string;
begin
  Result := '';
end;

function TdxNavBarDsgnWindowPageHandler.CanAdd: Boolean;
begin
  Result := False;
end;

function TdxNavBarDsgnWindowPageHandler.CanCopy: Boolean;
begin
  Result := False;
end;

function TdxNavBarDsgnWindowPageHandler.CanCut: Boolean;
begin
  Result := False;
end;

function TdxNavBarDsgnWindowPageHandler.CanDelete: Boolean;
begin
  Result := False;
end;

function TdxNavBarDsgnWindowPageHandler.CanSelectAll: Boolean;
begin
  Result := False;
end;

function TdxNavBarDsgnWindowPageHandler.CanMoveUp: Boolean;
begin
  Result := False;
end;

function TdxNavBarDsgnWindowPageHandler.CanMoveDown: Boolean;
begin
  Result := False;
end;

function TdxNavBarDsgnWindowPageHandler.CanPaste: Boolean;
begin
  Result := False;
end;

procedure TdxNavBarDsgnWindowPageHandler.UpdateScrollBar;
begin
end;

procedure TdxNavBarDsgnWindowPageHandler.UpdateSelections(const ASelections: IDesignerSelections);
begin
end;

function TdxNavBarDsgnWindowPageHandler.IsLocked: Boolean;
begin
  Result := FLockCount > 0;
end;

procedure TdxNavBarDsgnWindowPageHandler.Lock;
begin
  Inc(FLockCount);
end;

procedure TdxNavBarDsgnWindowPageHandler.UnLock;
begin
  Dec(FLockCount);
end;

function TdxNavBarDsgnWindowPageHandler.GetNavBar: TdxCustomNavBar;
begin
  if DsgnWindow <> nil then
    Result := DsgnWindow.NavBar
  else Result := nil;
end;

{ TdxfmNavBarDesignWindow }

constructor TdxfmNavBarDesignWindow.Create(AOwner: TComponent);

  procedure PopulateGroupItemMenu;

    function CreateAddMenuItem(AOwner: TComponent; const ACaption: string; AImageIndex: Integer; AClass: TClass): TMenuItem;
    begin
      Result := TMenuItem.Create(AOwner);
      Result.Caption := ACaption;
      Result.ImageIndex := AImageIndex;
      Result.OnClick := miAdd.OnClick;
      Result.Tag := TdxNativeInt(AClass);
    end;

  begin
    pmGroupItemClasses.Items.Add(CreateAddMenuItem(pmGroupItemClasses, 'Add Item', 9, TdxNavBarItem));
    pmGroupItemClasses.Items.Add(CreateAddMenuItem(pmGroupItemClasses, 'Add Separator', 10, TdxNavBarSeparator));

    msiAdd.Add(CreateAddMenuItem(msiAdd, 'Add Item', 9, TdxNavBarItem));
    msiAdd.Add(CreateAddMenuItem(msiAdd, 'Add Separator', 10, TdxNavBarSeparator));
  end;

var
  I: Integer;
begin
  inherited;
  FHandlers := TList.Create;
  InitializeHandlers;
  InitializeViewStyles;

  actDelete.Tag := TdxNativeInt(eaDelete);
  actSelectAll.Tag := TdxNativeInt(eaSelectAll);
  actCut.Tag := TdxNativeInt(eaCut);
  actCopy.Tag := TdxNativeInt(eaCopy);
  actPaste.Tag := TdxNativeInt(eaPaste);
  
  for I := 0 to pcMain.PageCount - 1 do
    pcMain.Pages[I].TabVisible := False;

  PopulateGroupItemMenu;

  nbMain.ActiveGroupIndex := 0;
  bgMain.SelectedLinkIndex := 0;
  ActivatePage(0);
  RestoreLayout;
  if not IsXPManifestEnabled then
  begin
    tlbGroups.Images := ilToolBar;
    tlbGroups.DisabledImages := ilToolBarDisabled;
    tlbItems.Images := ilToolBar;
    tlbItems.DisabledImages := ilToolBarDisabled;
    tlbLinkDesigner.Images := ilToolBar;
    tlbLinkDesigner.DisabledImages := ilToolBarDisabled;
    tlbDefaultStyles.Images := ilToolBar;
    tlbDefaultStyles.DisabledImages := ilToolBarDisabled;
    tlbCustomStyles.Images := ilToolBar;
    tlbCustomStyles.DisabledImages := ilToolBarDisabled;
    tvLinkDesignerGroups.Images := ilTreeView;
    lbxLinkDesignerItems.SmallImages := ilTreeView;
    cxTransformImages(ilActions, ilToolBar, clBtnFace);
    cxTransformImages(ilActions, ilToolBarDisabled, clBtnFace, False);
    cxTransformImages(ilLinkDesigner, ilTreeView, clWindow);
  end;
end;

destructor TdxfmNavBarDesignWindow.Destroy;
begin
  FinalizeHandlers;
  FHandlers.Free;
  StoreLayout;
  if NavBarDesigner <> nil then
    TdxNavBarDesigner(NavBarDesigner).FDesignWindow := nil;
  inherited;
end;

function TdxfmNavBarDesignWindow.ClipboardComponents: Boolean;
begin
  Result := inherited ClipboardComponents;
end;

function TdxfmNavBarDesignWindow.EditAction(Action: TEditAction): Boolean;
begin
  Result := True;
  case Action of
    eaCut: Cut;
    eaCopy: Copy;
    eaPaste: Paste;
    eaDelete: Delete;
    eaSelectAll: SelectAll;
  end;
end;

function TdxfmNavBarDesignWindow.GetEditState: TEditState;
begin
  Result := [];
  if CanDelete then
    Result := Result + [esCanDelete];
  if CanSelectAll then
    Result := Result + [esCanSelectAll];
  if CanCut then
    Result := Result + [esCanCut];
  if CanCopy then
    Result := Result + [esCanCopy];
  if CanPaste then
    Result := Result + [esCanPaste];
end;

procedure TdxfmNavBarDesignWindow.ItemDeleted(const ADesigner: IDesigner;
  Item: TPersistent);
var
  AItem: TPersistent;
begin
  inherited;
  AItem := dxNavBarDsgnUtils.TryExtractPersistent(Item);
  if (NavBar <> nil) and not (csDestroying in NavBar.ComponentState) and
    (CurrentHandler <> nil) then
    CurrentHandler.ItemDeleted(AItem);
end;

procedure TdxfmNavBarDesignWindow.ItemsModified(const Designer: IDesigner);
begin
  inherited;
  if CurrentHandler <> nil then
    CurrentHandler.UpdateContent;
  UpdateCaption;
end;

procedure TdxfmNavBarDesignWindow.SelectionChanged(const ADesigner: IDesigner;
  const ASelection: IDesignerSelections);
begin
  inherited;
  if ADesigner = Designer then
    UpdateSelections(ASelection);
end;

procedure TdxfmNavBarDesignWindow.Activated;
var
  Selections: IDesignerSelections;
begin
  inherited Activated;
  if CurrentHandler <> nil then
    CurrentHandler.Activate;
  Selections := CreateSelectionList;
  Designer.GetSelections(Selections);
  UpdateSelections(Selections);
end;

{$IFDEF DELPHI9}
procedure TdxfmNavBarDesignWindow.CreateParams(var Params: TCreateParams);
begin
  inherited;
  Params.WndParent := Application.MainForm.Handle;
end;
{$ENDIF}

function TdxfmNavBarDesignWindow.UniqueName(Component: TComponent): string;
var
  AItemNamePrefix: string;
  AIndex: Integer;
begin
  AIndex := Pos(sdxNavBarClassesPrefix, Component.ClassName);
  if AIndex > 0 then
    AItemNamePrefix := System.Copy(Component.ClassName, AIndex + Length(sdxNavBarClassesPrefix), MaxInt)
  else
    AItemNamePrefix := CurrentHandler.ItemNamePrefix;
  Result := Designer.UniqueName(NavBar.Name + AItemNamePrefix);
end;

procedure TdxfmNavBarDesignWindow.ActiveDesignerPageChanged;
begin
  SelectNavBar;
  if pcMain.ActivePage.PageIndex < HandlerCount then
  begin
    CurrentHandler := Handlers[pcMain.ActivePage.PageIndex];
    if CurrentHandler <> nil then
      CurrentHandler.Activate;
    UpdateCaption;
  end;
end;

procedure TdxfmNavBarDesignWindow.actlCommandsUpdate(Action: TBasicAction;
  var Handled: Boolean);
begin
  actAdd.Enabled := CanAdd;
  actDelete.Enabled := CanDelete;
  actMoveUp.Enabled := CanMoveUp;
  actMoveDown.Enabled := CanMoveDown;
  actSelectAll.Enabled := CanSelectAll;
  actCut.Enabled := CanCut;
  actCopy.Enabled := CanCopy;
  actPaste.Enabled := CanPaste;
end;

procedure TdxfmNavBarDesignWindow.CheckViewCategories;
begin
  if (NavBar.View <> dxNavBarLookAndFeelView) and
    not IsCategoriesSuitable(NavBar.Painter.GetCategories) then
  begin
    cbCategories.ItemIndex := 0;
    InitializeViewStyles;
  end;
end;

procedure TdxfmNavBarDesignWindow.chSortViewsClick(Sender: TObject);
begin
  InitializeViewStyles;
  SynchronizeViewStyleSelection;
end;

function TdxfmNavBarDesignWindow.GetNavBarDesigner: IcxDesignHelper;
begin
  if NavBar <> nil then
    Result := TdxCustomNavBarAccess(NavBar).FDesignHelper
  else
    Result := nil;
end;

procedure TdxfmNavBarDesignWindow.SetNavBar(Value: TdxCustomNavBar);
begin
  if FNavBar <> Value then
  begin
    FNavBar := Value;
    if CurrentHandler <> nil then
      CurrentHandler.UpdateContent;
    UpdateCaption;
  end;
end;

procedure TdxfmNavBarDesignWindow.ActivatePage(APageIndex: Integer);
begin
  pcMain.ActivePage := pcMain.Pages[APageIndex];
  ActiveDesignerPageChanged;
end;

function TdxfmNavBarDesignWindow.CanAdd: Boolean;
begin
  if CurrentHandler <> nil then
    Result := CurrentHandler.CanAdd
  else Result := False;
end;

function TdxfmNavBarDesignWindow.CanCopy: Boolean;
begin
  if CurrentHandler <> nil then
    Result := CurrentHandler.CanCopy
  else Result := False;
end;

function TdxfmNavBarDesignWindow.CanCut: Boolean;
begin
  if CurrentHandler <> nil then
    Result := CurrentHandler.CanCut
  else Result := False;
end;

function TdxfmNavBarDesignWindow.CanDelete: Boolean;
begin
  if CurrentHandler <> nil then
    Result := CurrentHandler.CanDelete
  else Result := False;
end;

function TdxfmNavBarDesignWindow.CanMoveDown: Boolean;
begin
  if CurrentHandler <> nil then
    Result := CurrentHandler.CanMoveDown
  else Result := False;
end;

function TdxfmNavBarDesignWindow.CanMoveUp: Boolean;
begin
  if CurrentHandler <> nil then
    Result := CurrentHandler.CanMoveUp
  else Result := False;
end;

function TdxfmNavBarDesignWindow.CanPaste: Boolean;
begin
  if CurrentHandler <> nil then
    Result := CurrentHandler.CanPaste
  else
    Result := False;
end;

function TdxfmNavBarDesignWindow.CanSelectAll: Boolean;
begin
  if CurrentHandler <> nil then
    Result := CurrentHandler.CanSelectAll
  else
    Result := False;
end;

procedure TdxfmNavBarDesignWindow.cbCategoriesChange(Sender: TObject);
begin
  InitializeViewStyles;
  SynchronizeViewStyleSelection;
  lbxViewStylesChange(lbxViewStyles);
end;

procedure TdxfmNavBarDesignWindow.Copy;
begin
  if CurrentHandler <> nil then
    CurrentHandler.Copy;
end;

procedure TdxfmNavBarDesignWindow.Cut;
begin
  if CurrentHandler <> nil then
    CurrentHandler.Cut;
end;

procedure TdxfmNavBarDesignWindow.Delete;
begin
  if CurrentHandler <> nil then
    CurrentHandler.Delete;
end;

procedure TdxfmNavBarDesignWindow.HandleException;
begin
  Abort;
end;

function TdxfmNavBarDesignWindow.GetRegistryPath: string;
begin
  Result := (BorlandIDEServices as IOTAServices).GetBaseRegistryKey + '\' +
      sdxExpressNavBarDesignerLayoutRegPath;
end;

procedure TdxfmNavBarDesignWindow.Paste;
begin
  if CurrentHandler <> nil then
    CurrentHandler.Paste;
end;

procedure TdxfmNavBarDesignWindow.RestoreLayout;
begin
  with TRegistry.Create do
  try
    try
      if OpenKey(GetRegistryPath, False) then
      begin
        if ValueExists(sdxWidth) then
          Width := ReadInteger(sdxWidth);
        if ValueExists(sdxHeight) then
          Height := ReadInteger(sdxHeight);
      end;
    except
      HandleException;
    end;
  finally
    Free;
  end;
  if CurrentHandler <> nil then
    CurrentHandler.UpdateScrollBar;
end;

procedure TdxfmNavBarDesignWindow.SafeChangeLookAndFeelScheme(
  ALookAndFeelStyle: TcxLookAndFeelStyle; ANavBarID: Integer);
var
  AComponents: IDesignerSelections;
  ANeedChangeSelection: Boolean;
begin
  ANeedChangeSelection := (NavBar.View = dxNavBarLookAndFeelView) and
    (TdxCustomNavBarAccess(NavBar).LookAndFeel.ActiveStyle = ALookAndFeelStyle) and
    (NavBar.ViewReal <> ANavBarID);
  if ANeedChangeSelection then
  begin
    AComponents := CreateSelectionList;
    Designer.GetSelections(AComponents);
    CurrentHandler.Lock;
    try
      Select(nil, False);
    finally
      CurrentHandler.UnLock;
    end;
  end;
  NavBar.LookAndFeelSchemes.Views[ALookAndFeelStyle] := ANavBarID;
  if ANeedChangeSelection then
    Designer.SetSelections(AComponents);
end;

procedure TdxfmNavBarDesignWindow.Select(AComponent: TComponent; AddToSelection: Boolean);
var
  Selections: IDesignerSelections;
begin
  Selections := CreateSelectionList;
  if AddToSelection then
    Designer.GetSelections(Selections);
  Selections.Add(dxNavBarDsgnUtils.MakeIComponent(AComponent));
  Designer.SetSelections(Selections);
end;

procedure TdxfmNavBarDesignWindow.SelectAll;
begin
  if CurrentHandler <> nil then
    CurrentHandler.SelectAll;
end;

procedure TdxfmNavBarDesignWindow.SelectNavBar;
begin
  if NavBar <> nil then
    Select(NavBar, False);
end;

procedure TdxfmNavBarDesignWindow.StartWait;
begin
  FSaveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
end;

procedure TdxfmNavBarDesignWindow.StopWait;
begin
  Screen.Cursor := FSaveCursor;
end;

procedure TdxfmNavBarDesignWindow.StoreLayout;
begin
  with TRegistry.Create do
  try
    try
      if OpenKey(GetRegistryPath, True) then
      begin
        WriteInteger(sdxWidth, Width);
        WriteInteger(sdxHeight, Height);
      end;
    except
      HandleException;
    end;
  finally
    Free;
  end;
end;

procedure TdxfmNavBarDesignWindow.UpdateCaption;
var
  APostfix: string;
begin
  if (NavBar <> nil) and (NavBar.Owner <> nil) then
  begin
    if CurrentHandler <> nil then
      APostfix := CurrentHandler.DesignerCaptionPostfix
    else APostfix := sdxNavBarDesigner;
    Caption := Format(sdxDesignerCaption, [NavBar.Owner.Name, NavBar.Name, APostfix]);
  end;
end;

procedure TdxfmNavBarDesignWindow.UpdateSelections(const ASelections: IDesignerSelections);
begin
  if (NavBar = nil) or (csDestroying in NavBar.ComponentState) or (ASelections = nil) then exit;
  if CurrentHandler <> nil then
    CurrentHandler.UpdateSelections(ASelections);
end;

procedure TdxfmNavBarDesignWindow.ListBoxClick(Sender: TObject);
var
  Selections: IDesignerSelections;
begin
  Selections := CreateSelectionList;
  if CurrentHandler <> nil then
    CurrentHandler.GetSelections(Selections);
  Designer.SetSelections(Selections);
end;

function TdxfmNavBarDesignWindow.GetCategories(AIndex: Integer): TdxNavBarViewCategories;
begin
  if AIndex = 1 then
    Result := [nbvcExplorerBar]
  else
    if AIndex = 2 then
      Result := [nbvcSideBar]
    else
      Result := dxNavBarAllCategories;
end;

function TdxfmNavBarDesignWindow.GetHandler(Index: Integer): TdxNavBarDsgnWindowPageHandler;
begin
  Result := TdxNavBarDsgnWindowPageHandler(FHandlers.Items[Index]);
end;

function TdxfmNavBarDesignWindow.GetHandlerCount: Integer;
begin
  Result := FHandlers.Count;
end;

procedure TdxfmNavBarDesignWindow.InitializeHandlers;
begin
  FHandlers.Add(TdxNavBarDsgnWindowGroupsHandler.Create(Self));
  FHandlers.Add(TdxNavBarDsgnWindowItemsHandler.Create(Self));
  FHandlers.Add(TdxNavBarDsgnWindowLinksHandler.Create(Self));
  FHandlers.Add(TdxNavBarDsgnWindowViewsHandler.Create(Self));
  FHandlers.Add(TdxNavBarDsgnWindowLookAndFeelSchemeHandler.Create(Self));
  FHandlers.Add(TdxNavBarDsgnWindowDefaultStylesHandler.Create(Self));
  FHandlers.Add(TdxNavBarDsgnWindowCustomStylesHandler.Create(Self));
end;

procedure TdxfmNavBarDesignWindow.InitializeViewStyles;
var
  I: Integer;
begin
  lbxViewStyles.Clear;
  lbxViewStyles.Sorted := False;
  for I := 0 to dxNavBarViewsFactory.Count - 1 do
    if IsCategoriesSuitable(dxNavBarViewsFactory.PainterClasses[I].GetCategories) then
      lbxViewStyles.Items.AddObject(dxNavBarViewsFactory.Names[I],
        TObject(dxNavBarViewsFactory.IDs[I] + 1));
  lbxViewStyles.Items.AddObject(SdxNavBarLookAndFeelView, nil);
  lbxViewStyles.Sorted := chSortViews.Checked;
end;

function TdxfmNavBarDesignWindow.IsCategoriesSuitable(ACategories: TdxNavBarViewCategories): Boolean;
begin
 Result := ACategories * GetCategories(cbCategories.ItemIndex) <> [];
end;

procedure TdxfmNavBarDesignWindow.FinalizeHandlers;
var
  I: Integer;
begin
  for I := 0 to FHandlers.Count - 1 do
    TdxNavBarDsgnWindowPageHandler(FHandlers.Items[I]).Free;
  FHandlers.Clear;
end;

procedure TdxfmNavBarDesignWindow.SynchronizeViewStyleSelection;
var
  AIndex: Integer;
begin
  AIndex := lbxViewStyles.Items.IndexOfObject(TObject(NavBar.View + 1));
  if AIndex = -1 then
    AIndex := lbxViewStyles.Items.IndexOfObject(nil);
  lbxViewStyles.ItemIndex := AIndex;
end;

function TdxfmNavBarDesignWindow.GetSchemeComboByLookAndFeelStyle(ALookAndFeelStyle: TcxLookAndFeelStyle): TComboBox;
begin
  case ALookAndFeelStyle of
    lfsFlat:
      Result := cbFlat;
    lfsStandard:
      Result := cbStandard;
    lfsUltraFlat:
      Result := cbUltraFlat;
    lfsNative:
      Result := cbNative;
    lfsOffice11:
      Result := cbOffice11;
  else // lfsSkin
    Result := cbSkin;
  end;
end;

function TdxfmNavBarDesignWindow.GetLookAndFeelBySchemeCombo(ACombo: TComboBox): TcxLookAndFeelStyle;
begin
  Result := TcxLookAndFeelStyle(ACombo.Tag);
end;

procedure TdxfmNavBarDesignWindow.UpdateNavBarLookAndFeelScheme;
var
  AIndex: Integer;
  I: TcxLookAndFeelStyle;
begin
  AIndex := cbLookAndFeelSchemes.ItemIndex;
  if AIndex > 0 then
  begin
    for I := Low(TcxLookAndFeelStyle) to High(TcxLookAndFeelStyle) do
      SafeChangeLookAndFeelScheme(I, dxNavBarPredefinedLookAndFeelScheme[AIndex - 1, I]);
    Designer.Modified;
  end;
end;

procedure TdxfmNavBarDesignWindow.AddClick(Sender: TObject);
begin
  if CurrentHandler <> nil then
    CurrentHandler.Add(TClass(TComponent(Sender).Tag));
end;

procedure TdxfmNavBarDesignWindow.ActionClick(Sender: TObject);
begin
  EditAction(TEditAction(TComponent(Sender).Tag));
end;

procedure TdxfmNavBarDesignWindow.MoveUpClick(Sender: TObject);
begin
  if CurrentHandler <> nil then
    CurrentHandler.MoveSelection(-1);
end;

procedure TdxfmNavBarDesignWindow.MoveDownClick(Sender: TObject);
begin
  if CurrentHandler <> nil then
    CurrentHandler.MoveSelection(1);
end;

procedure TdxfmNavBarDesignWindow.tvLinkDesignerGroupsDragDrop(Sender,
  Source: TObject; X, Y: Integer);
var
  AGroup: TdxNavBarGroup;
  AIndex: Integer;
begin
  if CurrentHandler is TdxNavBarDsgnWindowLinksHandler then
    with (CurrentHandler as TdxNavBarDsgnWindowLinksHandler) do
    begin
      SetTargetGroupNodeImage(1);
      SetTargetLinkNodeImage(2);
      if TargetLink <> nil then
      begin
        AIndex := TargetLink.Index;
        AGroup := TargetLink.Group;
      end
      else
      begin
        AIndex := -1;
        AGroup := TargetGroup;
      end;
      if AGroup <> nil then
      begin
        if SourceItem <> nil then
          CreateLink(SourceItem, AGroup, AIndex)
        else if SourceLink <> nil then
          MoveLink(SourceLink, AGroup, AIndex);
      end;
      SourceItem := nil;
      SourceLink := nil;
      ClearTargets;
    end;
end;

procedure TdxfmNavBarDesignWindow.tvLinkDesignerGroupsDragOver(Sender,
  Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
begin
  if CurrentHandler is TdxNavBarDsgnWindowLinksHandler then
    with (CurrentHandler as TdxNavBarDsgnWindowLinksHandler) do
    begin
      Accept := (SourceLink <> nil) or (SourceItem <> nil);
      if Accept then
        UpdateTargets(tvLinkDesignerGroups.GetNodeAt(X, Y));
      Accept := Accept and ((TargetGroup <> nil) or (TargetLink <> nil));
    end
  else Accept := False;
end;

procedure TdxfmNavBarDesignWindow.lbxLinkDesignerItemsDragOver(Sender,
  Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
begin
  if CurrentHandler is TdxNavBarDsgnWindowLinksHandler then
    with (CurrentHandler as TdxNavBarDsgnWindowLinksHandler) do
      Accept := (SourceLink <> nil)
  else Accept := False
end;

procedure TdxfmNavBarDesignWindow.lbxLinkDesignerItemsDragDrop(Sender,
  Source: TObject; X, Y: Integer);
begin
  if CurrentHandler is TdxNavBarDsgnWindowLinksHandler then
    with (CurrentHandler as TdxNavBarDsgnWindowLinksHandler) do
    begin
      RemoveLink(SourceLink);
      SourceLink := nil;
    end;
end;

procedure TdxfmNavBarDesignWindow.lbxLinkDesignerItemsStartDrag(
  Sender: TObject; var DragObject: TDragObject);
begin
  if CurrentHandler is TdxNavBarDsgnWindowLinksHandler then
    with (CurrentHandler as TdxNavBarDsgnWindowLinksHandler) do
    begin
      SourceItem := GetItemByNode(lbxLinkDesignerItems.Selected);
      if SourceItem = nil then CancelDrag;
    end;
end;

procedure TdxfmNavBarDesignWindow.tvLinkDesignerGroupsStartDrag(
  Sender: TObject; var DragObject: TDragObject);
begin
  if CurrentHandler is TdxNavBarDsgnWindowLinksHandler then
    with (CurrentHandler as TdxNavBarDsgnWindowLinksHandler) do
    begin
      SourceLink := GetLinkByNode(tvLinkDesignerGroups.Selected);
      if SourceLink = nil then CancelDrag;
    end;
end;

procedure TdxfmNavBarDesignWindow.tvLinkDesignerGroupsExit(
  Sender: TObject);
begin
  if CurrentHandler is TdxNavBarDsgnWindowLinksHandler then
    with (CurrentHandler as TdxNavBarDsgnWindowLinksHandler) do ClearTargets;
end;

procedure TdxfmNavBarDesignWindow.tvLinkDesignerGroupsEndDrag(Sender,
  Target: TObject; X, Y: Integer);
begin
  if CurrentHandler is TdxNavBarDsgnWindowLinksHandler then
    with (CurrentHandler as TdxNavBarDsgnWindowLinksHandler) do ClearTargets;
end;

procedure TdxfmNavBarDesignWindow.lbxLinkDesignerItemsEndDrag(Sender,
  Target: TObject; X, Y: Integer);
begin
  if CurrentHandler is TdxNavBarDsgnWindowLinksHandler then
    with (CurrentHandler as TdxNavBarDsgnWindowLinksHandler) do ClearTargets;
end;

procedure TdxfmNavBarDesignWindow.nbMainLinkClick(Sender: TObject;
  ALink: TdxNavBarItemLink);
begin
  if ALink.Item.Index < pcMain.PageCount then
    ActivatePage(ALink.Item.Index);
end;

procedure TdxfmNavBarDesignWindow.DefaultSettingsClick(Sender: TObject);
begin
  NavBar.AssignDefaultStyles;
  Designer.Modified;
end;

procedure TdxfmNavBarDesignWindow.lbxViewStylesChange(Sender: TObject);

  function GetNavBarViewByItemIndex: Integer;
  begin
    Result := Integer(lbxViewStyles.Items.Objects[lbxViewStyles.ItemIndex]) - 1;
  end;

var
  AComponents: IDesignerSelections;
  AView: Integer;
begin
  AView := GetNavBarViewByItemIndex;
  if NavBar.View <> AView then
  begin
    AComponents := CreateSelectionList;
    Designer.GetSelections(AComponents);
    CurrentHandler.Lock;
    try
      Select(nil, False);
    finally
      CurrentHandler.UnLock;
    end;
    NavBar.View := AView;
    Designer.SetSelections(AComponents);
    Designer.Modified;
  end;
end;

procedure TdxfmNavBarDesignWindow.btCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TdxfmNavBarDesignWindow.lbxItemsContextPopup(Sender: TObject;
  MousePos: TPoint; var Handled: Boolean);
begin
  miAdd.Visible := False;
  msiAdd.Visible := True;
end;

procedure TdxfmNavBarDesignWindow.lbxContextPopup(Sender: TObject;
  MousePos: TPoint; var Handled: Boolean);
begin
  miAdd.Visible := True;
  msiAdd.Visible := False;
end;

procedure TdxfmNavBarDesignWindow.cbColorSchemeChange(Sender: TObject);
var
  AColorSchemes: IdxNavBarColorSchemes;
begin
  if dxNavBarViewStyleHasColorSchemes(NavBar.ViewStyle) then
  begin
    if Supports(NavBar.ViewStyle, IdxNavBarColorSchemes, AColorSchemes) then
      if AColorSchemes.GetName <> cbColorScheme.Text then
      begin
        AColorSchemes.SetName(cbColorScheme.Text);
        nbPreview.ViewStyle.Assign(NavBar.ViewStyle);
        Designer.Modified;
      end;
  end;
end;

procedure TdxfmNavBarDesignWindow.cbFlatChange(Sender: TObject);
var
  ACombo: TComboBox;
begin
  ACombo := Sender as TComboBox;
  SafeChangeLookAndFeelScheme(GetLookAndFeelBySchemeCombo(ACombo),
    Integer(ACombo.Items.Objects[ACombo.ItemIndex]));
  cbLookAndFeelSchemes.ItemIndex := 0;
  Designer.Modified;
end;

procedure TdxfmNavBarDesignWindow.cbLookAndFeelSchemesChange(Sender: TObject);
begin
  UpdateNavBarLookAndFeelScheme;
end;

{$IFDEF DELPHI17}
{ TToolButton }

procedure TToolButton.CMEnabledChanged(var Message: TMessage);
const
  TB_ENABLEBUTTON = WM_USER + 1;
begin
  if (FToolBar <> nil) and not EnableDropdown then
    FToolBar.Perform(TB_ENABLEBUTTON, Index, LPARAM(Ord(Enabled)));
end;
{$ENDIF}

end.


