unit UDMCore;

interface

uses
  System.SysUtils, System.Classes, Data.DB, nxdb, nxseAutoComponent,
  nxsdServerEngine, nxsrServerEngine, nxllComponent, nxpvPlatformImplementation,
  nxsdSimpleMonitor, nxSqlTriggerExtender, nxsrSqlEngineBase, nxsqlEngine;

type
  TDMCore = class(TDataModule)
    nxDatabase1: TnxDatabase;
    nxServerEngine1: TnxServerEngine;
    nx1xAllEngines1: Tnx1xAllEngines;
    nxseAllEngines1: TnxseAllEngines;
    nxSession1: TnxSession;
    nxSimpleMonitor1: TnxSimpleMonitor;
    nxSqlTriggerMonitor1: TnxSqlTriggerMonitor;
    nxSqlEngine1: TnxSqlEngine;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function RunQuery(qry: String): Boolean;
  end;

var
  DMCore: TDMCore;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDMCore.DataModuleCreate(Sender: TObject);
var
  I: Integer;
begin
  nxServerEngine1.Active := True;
  nxServerEngine1.AliasHandler.Add('GameServerManager',
                                   IncludeTrailingPathDelimiter(ExtractFilePath(ParamStr(0))) + 'DB',
                                   False);
  nxSqlEngine1.Active := True;
  nxSqlTriggerMonitor1.Active := True;
  nxDatabase1.AliasName := 'GameServerManager';
  nxDatabase1.Active := True;
//  for I := 0 to pred(ComponentCount) do
//    if (Components[I] is TnxTable) then
//      with (Components[I] as TnxTable) do
//        Active := True;
end;

function TDMCore.RunQuery(qry: String): Boolean;
var
  q: TnxQuery;
begin
  q := TnxQuery.Create(nil);
  try
    try
      q.Database := nxDatabase1;
      q.SQL.Text := qry;
      q.ExecSQL;
      Result := True;
    except
      Result := False;
    end;
  finally
    q.Close;
    q.Free;
  end;
end;

end.
