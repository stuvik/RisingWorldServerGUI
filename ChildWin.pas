unit CHILDWIN;

interface

uses Winapi.Windows, System.Classes, Vcl.Graphics, Vcl.Forms, Vcl.Controls,
  Vcl.StdCtrls, DosCommand, UDMCore, Data.DB, nxdb, Vcl.ExtCtrls, Vcl.DBCtrls,
  Vcl.Mask, Vcl.ComCtrls, Vcl.Dialogs, System.SysUtils, Vcl.Grids, Vcl.DBGrids;

type
  TMDIChild = class(TForm)
    DosCommand1: TDosCommand;
    tblServer: TnxTable;
    tblServerLogs: TnxTable;
    tblServerOverrides: TnxTable;
    dstblServer: TDataSource;
    dstblServerLogs: TDataSource;
    dstblServerOverrides: TDataSource;
    pgctrlSvr: TPageControl;
    tsServerSettings: TTabSheet;
    tsCommandLine: TTabSheet;
    dbedSvrName: TDBEdit;
    Panel1: TPanel;
    memCommandOutput: TMemo;
    edCommand: TEdit;
    Splitter1: TSplitter;
    dbedSvrGameLocation: TDBEdit;
    dbedJavaMemMinMB: TDBEdit;
    dbedJavaMemMaxMB: TDBEdit;
    dbedJavaExeLocation: TDBEdit;
    dbedSvrPropertiesLocation: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    btnOpenSvrGameLocation: TButton;
    btnOpenSvrPropertiesLocation: TButton;
    btnOpenJavaExeLocation: TButton;
    btnEditSvrPropertiesFile: TButton;
    tsPropertiesFile: TTabSheet;
    memGameProperties: TMemo;
    btnSaveGameProperties: TButton;
    btnCancelGameProperties: TButton;
    FileOpenDialog1: TFileOpenDialog;
    dblcbThreadPriority: TDBLookupComboBox;
    ltThreadPriorities: TnxTable;
    dsltThreadPriorities: TDataSource;
    Label8: TLabel;
    ltGame: TnxTable;
    ltGameOverrides: TnxTable;
    dsltGame: TDataSource;
    dsltGameOverrides: TDataSource;
    dbmSvrDesc: TDBMemo;
    dbmSvrCommands: TDBMemo;
    Label9: TLabel;
    DBNavigator1: TDBNavigator;
    tsHistory: TTabSheet;
    dbgServerLogs: TDBGrid;
    dbmSvrLog: TDBMemo;
    DBNavigator2: TDBNavigator;
    tsScheduling: TTabSheet;
    tsBackup: TTabSheet;
    tsOverrides: TTabSheet;
    dbcbUseOverrides: TDBCheckBox;
    Label10: TLabel;
    dblcbGames: TDBLookupComboBox;
    dbgGameOverrides: TDBGrid;
    Label11: TLabel;
    btnAddOverride: TButton;
    dbgSvrOverrides: TDBGrid;
    DBNavigator3: TDBNavigator;
    dbedSvrOvrName: TDBEdit;
    dbedSvrOvrCmd: TDBEdit;
    dbedSvrOvrVal: TDBEdit;
    btnSvrOvrUP: TButton;
    btnSvrOvrDOWN: TButton;
    Label12: TLabel;
    btnGenerateCmd: TButton;
    lblGenerate: TLabel;
    btnBackToSettings: TButton;
    btnNewSvrOverride: TButton;
    btnDelSvrOverride: TButton;
    pnlCmdLnSide: TPanel;
    dbmGameSvrCommands: TDBMemo;
    pnlCmdStartStop: TPanel;
    btnStartSvr: TButton;
    btnStopSvr: TButton;
    tblServerLogsID: TUnsignedAutoIncField;
    tblServerLogsSvrID: TGuidField;
    tblServerLogsSvrDTStarted: TDateTimeField;
    tblServerLogsSvrDTStopped: TDateTimeField;
    tblServerLogsSvrConsoleLog: TWideMemoField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btnOpenSvrGameLocationClick(Sender: TObject);
    procedure btnOpenSvrPropertiesLocationClick(Sender: TObject);
    procedure btnOpenJavaExeLocationClick(Sender: TObject);
    procedure tblServerAfterCancel(DataSet: TDataSet);
    procedure tblServerBeforeCancel(DataSet: TDataSet);
    procedure btnEditSvrPropertiesFileClick(Sender: TObject);
    procedure btnCancelGamePropertiesClick(Sender: TObject);
    procedure btnSaveGamePropertiesClick(Sender: TObject);
    procedure dbcbUseOverridesClick(Sender: TObject);
    procedure btnGenerateCmdClick(Sender: TObject);
    procedure btnBackToSettingsClick(Sender: TObject);
    procedure btnAddOverrideClick(Sender: TObject);
    procedure btnSvrOvrDOWNClick(Sender: TObject);
    procedure btnSvrOvrUPClick(Sender: TObject);
    procedure btnNewSvrOverrideClick(Sender: TObject);
    procedure btnDelSvrOverrideClick(Sender: TObject);
    procedure edCommandKeyPress(Sender: TObject; var Key: Char);
    procedure btnStartSvrClick(Sender: TObject);
    procedure btnStopSvrClick(Sender: TObject);
  private
    { Private declarations }
    CancelNew: Boolean;
    SvrStartDT: TDateTime;
    procedure ReorderServerOverrides;
    function GenerateServerString: String;
  public
    { Public declarations }
    function NewServer: Boolean;
    function ExistingGameServer(SvrID: TGUID): Boolean;
  end;

implementation

{$R *.dfm}

procedure TMDIChild.btnCancelGamePropertiesClick(Sender: TObject);
begin
  if FileExists(dbedSvrPropertiesLocation.Text) then
    memGameProperties.Lines.LoadFromFile(dbedSvrPropertiesLocation.Text);
end;

procedure TMDIChild.btnEditSvrPropertiesFileClick(Sender: TObject);
begin
  if FileExists(dbedSvrPropertiesLocation.Text) then
  begin
    memGameProperties.Lines.LoadFromFile(dbedSvrPropertiesLocation.Text);
    pgctrlSvr.ActivePage := tsPropertiesFile;
  end;
end;

procedure TMDIChild.btnGenerateCmdClick(Sender: TObject);
begin
  lblGenerate.Caption := '"' + dbedJavaExeLocation.Text + '" -jar -server ' +   // "-server" is for 32-bit Java; irrelevant for 64-bit Java
                         '-Xms' + dbedJavaMemMinMB.Text + 'm ' +
                         '-Xmx' + dbedJavaMemMaxMB.Text + 'm ' +
                         ExtractFileName(dbedSvrGameLocation.Text);

  if dbcbUseOverrides.Checked then
    with tblServerOverrides do
      if not IsEmpty then
      begin
        First;
        while not Eof do
        begin
          lblGenerate.Caption := lblGenerate.Caption + ' ' +
                                 Trim(FieldByName('CommandLineSwitch').AsString) +
                                 Trim(FieldByName('DefaultValue').AsString);
          Next;
        end;
      end;

end;

procedure TMDIChild.btnOpenJavaExeLocationClick(Sender: TObject);
begin
  if (tblServer.State in dsEditModes) then
  begin
    with FileOpenDialog1 do
    begin
      Title := 'Locate Java Executable';
      DefaultExtension := '*.exe';
      FileTypeIndex := 1; // 1=*.exe; 2=*.jar; 3=*.*
      Options := [fdoPathMustExist,fdoFileMustExist];
    end;
    if FileOpenDialog1.Execute then
      dbedJavaExeLocation.Text := FileOpenDialog1.FileName;
  end;
end;

procedure TMDIChild.btnOpenSvrGameLocationClick(Sender: TObject);
begin
  if (tblServer.State in dsEditModes) then
  begin
    with FileOpenDialog1 do
    begin
      Title := 'Locate Server File';
      DefaultExtension := '*.jar';
      FileTypeIndex := 2; // 1=*.exe; 2=*.jar; 3=*.*
      Options := [fdoPathMustExist,fdoFileMustExist];
    end;
    if FileOpenDialog1.Execute then
      dbedSvrGameLocation.Text := FileOpenDialog1.FileName;
  end;
end;

procedure TMDIChild.btnOpenSvrPropertiesLocationClick(Sender: TObject);
begin
  if (tblServer.State in dsEditModes) then
  begin
    with FileOpenDialog1 do
    begin
      Title := 'Locate Server Properties File';
      DefaultExtension := '*.*';
      FileTypeIndex := 3; // 1=*.exe; 2=*.jar; 3=*.*
      Options := [fdoPathMustExist,fdoFileMustExist];
    end;
    if FileOpenDialog1.Execute then
      dbedSvrPropertiesLocation.Text := FileOpenDialog1.FileName;
  end;
end;

procedure TMDIChild.btnSaveGamePropertiesClick(Sender: TObject);
begin
  if FileExists(dbedSvrPropertiesLocation.Text) then
  begin
    memGameProperties.Lines.SaveToFile(dbedSvrPropertiesLocation.Text);
    pgctrlSvr.ActivePage := tsServerSettings;
  end;
end;

procedure TMDIChild.btnStartSvrClick(Sender: TObject);
begin
  if not DosCommand1.IsRunning then
  begin

    // Get tables out of editable state before starting the server up
    if tblServer.State in dsEditModes then
      tblServer.Post;
    if tblServerOverrides.State in dsEditModes then
      tblServerOverrides.Cancel;

    SvrStartDT := Now;
    memCommandOutput.Clear;
    DosCommand1.CurrentDir := IncludeTrailingPathDelimiter(ExtractFilePath(dbedSvrGameLocation.Text));
    DosCommand1.Priority := dblcbThreadPriority.KeyValue;
    DosCommand1.CommandLine := GenerateServerString;
    DosCommand1.Execute;
  end;
end;

procedure TMDIChild.btnStopSvrClick(Sender: TObject);
begin
  try
    try
      if DosCommand1.IsRunning then
        DosCommand1.Stop;
    except
    end;
  finally // Write a log to ServerLogs table (visible in History tab)
    try
      tblServerLogs.Active := True;
      tblServerLogs.Insert;
      tblServerLogs.FieldByName('SvrDTStarted').AsDateTime := SvrStartDT;
      tblServerLogs.FieldByName('SvrDTStopped').AsDateTime := Now;
      (tblServerLogs.FieldByName('SvrConsoleLog') as TBlobField).AsString := memCommandOutput.Text;
      tblServerLogs.Post;
    except
    end;
  end;
end;

procedure TMDIChild.btnSvrOvrDOWNClick(Sender: TObject);
var
  currOrder, currID, nextID: Integer;
begin
  if tblServerOverrides.Active then
    if not tblServerOverrides.IsEmpty then
      if not tblServerOverrides.Eof then
      begin
        currOrder := tblServerOverrides.FieldByName('Order').AsInteger;
        currID := tblServerOverrides.FieldByName('ID').AsInteger;
        tblServerOverrides.Next;
        nextID := tblServerOverrides.FieldByName('ID').AsInteger;
        DMCore.RunQuery('update ServerOverrides set "order" = ' + IntToStr(currOrder) +
                       ' where ID = ' + IntToStr(nextID) + ';' + sLineBreak +
                       'update ServerOverrides set "order" = ' + IntToStr(currOrder + 1) +
                       ' where ID = ' + IntToStr(currID) + ';');
        tblServerOverrides.Refresh;
        tblServerOverrides.Locate('ID',currID,[]);
      end;
end;

procedure TMDIChild.btnSvrOvrUPClick(Sender: TObject);
var
  currOrder, currID, nextID: Integer;
begin
  if tblServerOverrides.Active then
    if not tblServerOverrides.IsEmpty then
      if not tblServerOverrides.Bof then
      begin
        currOrder := tblServerOverrides.FieldByName('Order').AsInteger;
        currID := tblServerOverrides.FieldByName('ID').AsInteger;
        tblServerOverrides.Prior;
        nextID := tblServerOverrides.FieldByName('ID').AsInteger;
        DMCore.RunQuery('update ServerOverrides set "order" = ' + IntToStr(currOrder) +
                       ' where ID = ' + IntToStr(nextID) + ';' + sLineBreak +
                       'update ServerOverrides set "order" = ' + IntToStr(currOrder - 1) +
                       ' where ID = ' + IntToStr(currID) + ';');
        tblServerOverrides.Refresh;
        tblServerOverrides.Locate('ID',currID,[]);
      end;
end;

procedure TMDIChild.btnDelSvrOverrideClick(Sender: TObject);
var
  currID: Integer;
begin
  if tblServerOverrides.Active then
  begin
    if not tblServerOverrides.IsEmpty then
      tblServerOverrides.Delete;
    if not tblServerOverrides.IsEmpty then
      currID := tblServerOverrides.FieldByName('ID').AsInteger;
    ReorderServerOverrides;
  end;
end;

procedure TMDIChild.btnNewSvrOverrideClick(Sender: TObject);
var
  cnt: Integer;
begin
  if tblServerOverrides.Active then
  begin
    if (tblServerOverrides.State in dsEditModes) then
      tblServerOverrides.Cancel;
    cnt := tblServerOverrides.RecordCount + 1;
    tblServerOverrides.Insert;
    tblServerOverrides.FieldByName('Order').AsInteger := cnt;
    if dbedSvrOvrName.CanFocus then
      dbedSvrOvrName.SetFocus;
  end;
end;

procedure TMDIChild.btnAddOverrideClick(Sender: TObject);
var
  nextCnt: Integer;
begin
  if tblServerOverrides.Active then
  begin
    nextCnt := tblServerOverrides.RecordCount + 1;
    tblServerOverrides.Insert;
    tblServerOverrides.FieldByName('Order').AsInteger := nextCnt;
    tblServerOverrides.FieldByName('OverrideName').AsString := ltGameOverrides.FieldByName('OverrideName').AsString;
    tblServerOverrides.FieldByName('CommandLineSwitch').AsString := ltGameOverrides.FieldByName('CommandLineSwitch').AsString;
    tblServerOverrides.FieldByName('DefaultValue').AsString := ltGameOverrides.FieldByName('DefaultValue').AsString;
    tblServerOverrides.Post;
  end;
end;

procedure TMDIChild.btnBackToSettingsClick(Sender: TObject);
begin
  if (tblServerOverrides.State in dsEditModes) then
    tblServerOverrides.Cancel;
  pgctrlSvr.ActivePage := tsServerSettings;
end;

procedure TMDIChild.dbcbUseOverridesClick(Sender: TObject);
begin
  tsOverrides.TabVisible := dbcbUseOverrides.Checked;
end;

procedure TMDIChild.edCommandKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then
  begin
    if (DosCommand1.IsRunning) then
    begin
      DosCommand1.SendLine(edCommand.Text, True);
      edCommand.Clear;
    end
    else
    begin
      DosCommand1.Priority := dblcbThreadPriority.KeyValue;
      DosCommand1.CurrentDir := IncludeTrailingPathDelimiter(ExtractFilePath(dbedSvrGameLocation.Text));
      DosCommand1.CommandLine := edCommand.Text;
      DosCommand1.Execute;
    end;
  end;
end;

function TMDIChild.ExistingGameServer(SvrID: TGUID): Boolean;
begin
  // OPEN AN EXISTING GAME SERVER'S DETAILS
  try
    ltThreadPriorities.Open;
    ltGame.Open;
    ltGameOverrides.Open;

    tblServer.Open;
    tblServerLogs.Open;
    tblServerOverrides.Open;

    tblServer.SetRange([GUIDToString(SvrID)],
                       [GUIDToString(SvrID)]);

    if not tblServer.IsEmpty then
      Result := True
    else
      Result := False;

  except
    on e: Exception do
      Result := False;
  end;

end;

procedure TMDIChild.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TMDIChild.FormCreate(Sender: TObject);
begin
  // INITIALISE THINGS
  memCommandOutput.Lines := DosCommand1.Lines;
  DosCommand1.OutputLines := memCommandOutput.Lines;
  tsPropertiesFile.TabVisible := False;
  tsOverrides.TabVisible := False;

  //TODO: Work on scheduling and backups
  tsScheduling.TabVisible := False;
  tsBackup.TabVisible := False;

  pgctrlSvr.ActivePage := tsServerSettings;
  CancelNew := False;
end;

function TMDIChild.GenerateServerString: String;
begin
  Result := '"' + dbedJavaExeLocation.Text + '" -jar -server ' +   // "-server" is for 32-bit Java; irrelevant for 64-bit Java
                         '-Xms' + dbedJavaMemMinMB.Text + 'm ' +
                         '-Xmx' + dbedJavaMemMaxMB.Text + 'm ' +
                         ExtractFileName(dbedSvrGameLocation.Text);

  if dbcbUseOverrides.Checked then
    with tblServerOverrides do
      if not IsEmpty then
      begin
        DisableControls;
        First;
        while not Eof do
        begin
          Result := Result + ' ' +
                    Trim(FieldByName('CommandLineSwitch').AsString) +
                    Trim(FieldByName('DefaultValue').AsString);
          Next;
        end;
        EnableControls;
      end;
end;

function TMDIChild.NewServer: Boolean;
begin
  // CREATE A BRAND NEW GAME SERVER
  try
    ltThreadPriorities.Open;
    ltGame.Open;
    ltGameOverrides.Open;

    tblServer.Open;
    tblServerLogs.Open;
    tblServerOverrides.Open;

    tblServer.Insert;

    Result := True
  except
    on e: Exception do
      Result := False;
  end;

end;

procedure TMDIChild.ReorderServerOverrides;
var
  currID, I: Integer;
begin
  if tblServerOverrides.Active then
    if not tblServerOverrides.IsEmpty then
    begin
      I := 1;
      currID := tblServerOverrides.FieldByName('ID').AsInteger;
      try
        tblServerOverrides.First;
        while not Eof do
        begin
          tblServerOverrides.Edit;
          tblServerOverrides.FieldByName('Order').AsInteger := I;
          tblServerOverrides.Post;
          Inc(I);
          tblServerOverrides.Next;
        end;
      finally
        tblServerOverrides.Locate('ID',currID,[]);
      end;
    end;
end;

procedure TMDIChild.tblServerAfterCancel(DataSet: TDataSet);
begin
  if CancelNew then
    Self.Close; // Close the form
end;

procedure TMDIChild.tblServerBeforeCancel(DataSet: TDataSet);
begin
  CancelNew := (tblServer.State = dsInsert);
end;

end.
