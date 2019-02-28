unit USetupGameOverrides;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UDMCore,
  Data.DB, nxdb, Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids;

type
  TfmSetupGameOverrides = class(TForm)
    tblGame: TnxTable;
    tblGameOverrides: TnxTable;
    dstblGame: TDataSource;
    dstblGameOverrides: TDataSource;
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    DBGrid2: TDBGrid;
    DBNavigator2: TDBNavigator;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmSetupGameOverrides: TfmSetupGameOverrides;

implementation

{$R *.dfm}

procedure TfmSetupGameOverrides.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
