program RisingWorldGUI;

uses
  Vcl.Forms,
  UMain in 'UMain.pas' {fmRisingWorldServerGUI};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfmRisingWorldServerGUI, fmRisingWorldServerGUI);
  Application.Run;
end.
