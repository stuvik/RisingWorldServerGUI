unit MAIN;

interface

uses Winapi.Windows, System.SysUtils, System.Classes, Vcl.Graphics, Vcl.Forms,
  Vcl.Controls, Vcl.Menus, Vcl.StdCtrls, Vcl.Dialogs, Vcl.Buttons, Winapi.Messages,
  Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.StdActns, Vcl.ActnList, Vcl.ToolWin,
  Vcl.ImgList, System.ImageList, System.Actions, UDMCore, Data.DB, Vcl.Grids,
  Vcl.DBGrids, nxdb, Vcl.DBCtrls;

type
  TMainForm = class(TForm)
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    FileNewItem: TMenuItem;
    FileOpenItem: TMenuItem;
    FileCloseItem: TMenuItem;
    Window1: TMenuItem;
    Help1: TMenuItem;
    N1: TMenuItem;
    FileExitItem: TMenuItem;
    WindowCascadeItem: TMenuItem;
    WindowTileItem: TMenuItem;
    WindowArrangeItem: TMenuItem;
    HelpAboutItem: TMenuItem;
    OpenDialog: TOpenDialog;
    FileSaveItem: TMenuItem;
    FileSaveAsItem: TMenuItem;
    Edit1: TMenuItem;
    CutItem: TMenuItem;
    CopyItem: TMenuItem;
    PasteItem: TMenuItem;
    WindowMinimizeItem: TMenuItem;
    StatusBar: TStatusBar;
    ActionList1: TActionList;
    EditCut1: TEditCut;
    EditCopy1: TEditCopy;
    EditPaste1: TEditPaste;
    FileNew1: TAction;
    FileSave1: TAction;
    FileExit1: TAction;
    FileOpen1: TAction;
    FileSaveAs1: TAction;
    WindowCascade1: TWindowCascade;
    WindowTileHorizontal1: TWindowTileHorizontal;
    WindowArrangeAll1: TWindowArrange;
    WindowMinimizeAll1: TWindowMinimizeAll;
    HelpAbout1: TAction;
    FileClose1: TWindowClose;
    WindowTileVertical1: TWindowTileVertical;
    WindowTileItem2: TMenuItem;
    ToolBar2: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton9: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton10: TToolButton;
    ToolButton11: TToolButton;
    ImageList1: TImageList;
    Setup1: TMenuItem;
    GameOverrideSwitches1: TMenuItem;
    actSetupGameSwitches: TAction;
    dsltServer: TDataSource;
    ltServer: TnxTable;
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    procedure FileNew1Execute(Sender: TObject);
    procedure FileOpen1Execute(Sender: TObject);
    procedure HelpAbout1Execute(Sender: TObject);
    procedure FileExit1Execute(Sender: TObject);
    procedure actSetupGameSwitchesExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    procedure CreateMDIChild(const Name: string);
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

uses CHILDWIN, About, USetupGameSwitches;

procedure TMainForm.actSetupGameSwitchesExecute(Sender: TObject);
var
  I: Integer;
  FoundInstance: Boolean;
begin // Allow only 1 instance of the setup form to be opened at a time
  FoundInstance := False;
  for I := 0 to Pred(MDIChildCount) do
    if (MDIChildren[I] is TfmSetupGameSwitches) then
    begin
      FoundInstance := True;
      Break;
    end;
  if not FoundInstance then
    TfmSetupGameSwitches.Create(Application)
  else
  begin
//    MDIChildren[I].Show;
    MDIChildren[I].BringToFront;
  end;
end;

procedure TMainForm.CreateMDIChild(const Name: string);
var
  Child: TMDIChild;
begin
  { create a new MDI child window }
  Child := TMDIChild.Create(Application);
  if Child.NewServer then // inserts a new record
  begin

  end;
end;

procedure TMainForm.DBGrid1DblClick(Sender: TObject);
var
  Child: TMDIChild;
  I: Integer;
begin
  { create a new MDI child window }
  if not ltServer.IsEmpty then
  begin
    // TODO: Prevent opening of multiple of the same server
    for I := 0 to Pred(MDIChildCount) do
    begin
      if (MDIChildren[I] is TMDIChild) then
        //if (CompareText((MDIChildren[I] as TMDIChild).Caption, ltServer.FieldByName('SvrName').AsString) = 0) then
        // Issue: GUID is NOT an Integer
        //if ((MDIChildren[I] as TMDIChild).tblServer.FieldByName('SvrID').AsInteger = ltServer.FieldByName('SvrID').AsInteger) then
        if CompareStr(GUIDToString((MDIChildren[I] as TMDIChild).tblServer.FieldByName('SvrID').AsGuid),
                      GUIDToString(ltServer.FieldByName('SvrID').AsGuid)) = 0 then
        begin
//          (MDIChildren[I] as TMDIChild).Show;
          (MDIChildren[I] as TMDIChild).BringToFront;
          Exit;
        end;
    end;

    Child := TMDIChild.Create(Application);
    if Child.ExistingGameServer(ltServer.FieldByName('SvrID').AsGuid) then
    begin
      Child.Caption := Child.tblServer.FieldByName('SvrName').AsString;
//      Child.Show;
      Child.BringToFront;
    end;
  end
  else
    CreateMDIChild('blah');
end;

procedure TMainForm.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    DBGrid1DblClick(Sender);
end;

procedure TMainForm.FileNew1Execute(Sender: TObject);
begin
  CreateMDIChild('NONAME' + IntToStr(MDIChildCount + 1));
end;

procedure TMainForm.FileOpen1Execute(Sender: TObject);
begin
  if OpenDialog.Execute then
    CreateMDIChild(OpenDialog.FileName);
end;

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ltServer.Active := False; // Needs to be closed before the application closes
end;

procedure TMainForm.HelpAbout1Execute(Sender: TObject);
begin
  AboutBox.ShowModal;
end;

procedure TMainForm.FileExit1Execute(Sender: TObject);
begin
  Close;
end;

end.
