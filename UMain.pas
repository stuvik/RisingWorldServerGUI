unit UMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, Vcl.ExtCtrls, DosCommand, System.Actions, Vcl.ActnList,
  Vcl.PlatformDefaultStyleActnCtrls, Vcl.ActnMan, Vcl.Mask;

type
  TfmRisingWorldServerGUI = class(TForm)
    DosCommand1: TDosCommand;
    memPrompt: TMemo;
    Splitter1: TSplitter;
    edJavaExe: TEdit;
    Label1: TLabel;
    sty: TPanel;
    btnOpenJavaExe: TButton;
    openDlgJavaExe: TOpenDialog;
    Label2: TLabel;
    Label3: TLabel;
    edRWSvr: TEdit;
    edSvrProp: TEdit;
    btnOpenRWSvr: TButton;
    openDlgRWSvr: TOpenDialog;
    edCmd: TEdit;
    pnlCmd: TPanel;
    ActionManager1: TActionManager;
    actOpenJavaExe: TAction;
    actOpenRWSvr: TAction;
    actExecuteCmd: TAction;
    edJavaRAM: TEdit;
    edMaxPlayers: TEdit;
    edServerIP: TMaskEdit;
    edServerPort: TEdit;
    edServerName: TEdit;
    edRCONPort: TEdit;
    cbMaxPlayers: TCheckBox;
    cbServerIP: TCheckBox;
    Label4: TLabel;
    cbServerPort: TCheckBox;
    cbServerName: TCheckBox;
    cbRCONPort: TCheckBox;
    btnEditSvrProp: TButton;
    btnGenerateStr: TButton;
    actGenerateServerStart: TAction;
    Memo1: TMemo;
    actEditSvrProp: TAction;
    procedure actOpenJavaExeExecute(Sender: TObject);
    procedure actOpenRWSvrExecute(Sender: TObject);
    procedure actExecuteCmdExecute(Sender: TObject);
    procedure edCmdKeyPress(Sender: TObject; var Key: Char);
    procedure actGenerateServerStartExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmRisingWorldServerGUI: TfmRisingWorldServerGUI;

implementation

{$R *.dfm}

procedure TfmRisingWorldServerGUI.actExecuteCmdExecute(Sender: TObject);
begin
  if Trim(edCmd.Text) <> EmptyStr then
  begin
    if not DosCommand1.IsRunning then // No process running in DosCommand1
    begin
      DosCommand1.OutputLines := memPrompt.Lines;
      DosCommand1.CommandLine := Trim(edCmd.Text);
      DosCommand1.Execute;
    end
    else  // Send command to the process directly
      DosCommand1.SendLine(Trim(edCmd.Text),True);
  end;
end;

procedure TfmRisingWorldServerGUI.actGenerateServerStartExecute(
  Sender: TObject);
begin
  DosCommand1.CurrentDir := ExtractFilePath(Trim(edRWSvr.Text));
  edCmd.Text := '"' + Trim(edJavaExe.Text) + '"' +        // Java Executable
                ' -Xmx' + Trim(edJavaRAM.Text) + 'm' +    // Java RAM to use
                ' -jar ' + ExtractFileName(edRWSvr.Text); // Server JAR filename
  if cbMaxPlayers.Checked then
    edCmd.Text := edCmd.Text + ' +maxplayers=' + Trim(edMaxPlayers.Text);
  if cbServerIP.Checked then
    edCmd.Text := edCmd.Text + ' +serverip=' + edServerIP.Text;
  if cbServerPort.Checked then
    edCmd.Text := edCmd.Text + ' +serverport=' + Trim(edServerPort.Text);
  if cbServerName.Checked then
    edCmd.Text := edCmd.Text + ' +servername="' + edServerName.Text + '"';
  if cbRCONPort.Checked then
    edCmd.Text := edCmd.Text + ' +rconport=' + Trim(edRCONPort.Text);
end;

procedure TfmRisingWorldServerGUI.actOpenJavaExeExecute(Sender: TObject);
begin
  if openDlgJavaExe.Execute then
    edJavaExe.Text := openDlgJavaExe.FileName;
end;

procedure TfmRisingWorldServerGUI.actOpenRWSvrExecute(Sender: TObject);
begin
  if openDlgRWSvr.Execute then
  begin
    edRWSvr.Text := openDlgRWSvr.FileName;
    DosCommand1.CurrentDir := ExtractFilePath(Trim(edRWSvr.Text));
    edSvrProp.Text := IncludeTrailingPathDelimiter(
                        ExtractFilePath(
                          Trim(edRWSvr.Text))) + 'server.properties';
  end;
end;

procedure TfmRisingWorldServerGUI.edCmdKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then // ENTER key pressed
    actExecuteCmdExecute(Sender);
end;

end.
