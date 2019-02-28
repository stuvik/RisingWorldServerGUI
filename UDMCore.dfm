object DMCore: TDMCore
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 158
  Width = 317
  object nxDatabase1: TnxDatabase
    Session = nxSession1
    AliasPath = 
      'E:\Documents\Embarcadero\Studio\Projects\WindowsGameServerManage' +
      'r\DB'
    Default = True
    Left = 136
    Top = 104
  end
  object nxServerEngine1: TnxServerEngine
    SqlEngine = nxSqlEngine1
    ServerName = ''
    Options = [seoCloseInactiveTables]
    TableExtension = 'nx1'
    Left = 136
    Top = 8
  end
  object nx1xAllEngines1: Tnx1xAllEngines
    Left = 32
    Top = 56
  end
  object nxseAllEngines1: TnxseAllEngines
    Left = 32
    Top = 8
  end
  object nxSession1: TnxSession
    Default = True
    ServerEngine = nxServerEngine1
    Left = 136
    Top = 56
  end
  object nxSimpleMonitor1: TnxSimpleMonitor
    ServerEngine = nxServerEngine1
    AttachTo = [natDatabase]
    Left = 32
    Top = 104
  end
  object nxSqlTriggerMonitor1: TnxSqlTriggerMonitor
    DisplayName = 'SQL Triggers'
    DisplayCategory = 'SQL Engine'
    ServerEngine = nxServerEngine1
    SqlEngine = nxSqlEngine1
    Left = 240
    Top = 8
  end
  object nxSqlEngine1: TnxSqlEngine
    StmtLogging = False
    StmtLogTableName = 'QueryLog'
    UseFieldCache = False
    Left = 240
    Top = 56
  end
end
