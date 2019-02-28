program WinJavaServerManager;

uses
  Forms,
  Main in 'Main.pas' {MainForm},
  ChildWin in 'ChildWin.pas' {MDIChild},
  about in 'about.pas' {AboutBox},
  UDMCore in 'UDMCore.pas' {DMCore: TDataModule},
  Vcl.Themes,
  Vcl.Styles,
  USetupGameOverrides in 'USetupGameOverrides.pas' {fmSetupGameOverrides};

{$R *.RES}

begin
  Application.Initialize;
  TStyleManager.TrySetStyle('Glossy');
  Application.CreateForm(TDMCore, DMCore);
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TAboutBox, AboutBox);
  Application.Run;
end.
