object MDIChild: TMDIChild
  Left = 197
  Top = 117
  Caption = 'Game Server'
  ClientHeight = 382
  ClientWidth = 984
  Color = clBtnFace
  Constraints.MinHeight = 421
  Constraints.MinWidth = 1000
  ParentFont = True
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pgctrlSvr: TPageControl
    Left = 0
    Top = 0
    Width = 984
    Height = 382
    ActivePage = tsHistory
    Align = alClient
    MultiLine = True
    TabOrder = 0
    object tsServerSettings: TTabSheet
      Caption = 'Server Settings'
      ExplicitLeft = 8
      ExplicitTop = 28
      ExplicitHeight = 433
      DesignSize = (
        976
        354)
      object Label1: TLabel
        Left = 7
        Top = 27
        Width = 68
        Height = 13
        Caption = 'Server Name*'
      end
      object Label2: TLabel
        Left = 7
        Top = 148
        Width = 57
        Height = 13
        Caption = 'Server File*'
      end
      object Label3: TLabel
        Left = 7
        Top = 175
        Width = 95
        Height = 13
        Caption = 'Server Config. File*'
      end
      object Label4: TLabel
        Left = 7
        Top = 250
        Width = 85
        Height = 13
        Caption = 'Java Executable*'
      end
      object Label5: TLabel
        Left = 7
        Top = 277
        Width = 108
        Height = 13
        Caption = 'Java RAM Alloc. (MB)*'
      end
      object Label6: TLabel
        Left = 121
        Top = 295
        Width = 16
        Height = 13
        Caption = 'Min'
      end
      object Label7: TLabel
        Left = 189
        Top = 295
        Width = 20
        Height = 13
        Caption = 'Max'
      end
      object Label8: TLabel
        Left = 429
        Top = 277
        Width = 106
        Height = 13
        Caption = 'Server Thread Priority'
      end
      object Label9: TLabel
        Left = 677
        Top = 5
        Width = 281
        Height = 13
        Caption = 'Server Commands (can be entered while server is running)'
      end
      object Label10: TLabel
        Left = 7
        Top = 54
        Width = 88
        Height = 13
        Caption = 'Server Description'
      end
      object lblGenerate: TLabel
        Left = 84
        Top = 314
        Width = 660
        Height = 37
        Anchors = [akLeft, akBottom]
        AutoSize = False
        Caption = 'Click Generate to see the current command line statement'
        WordWrap = True
      end
      object dbedSvrName: TDBEdit
        Left = 121
        Top = 24
        Width = 550
        Height = 21
        DataField = 'SvrName'
        DataSource = dstblServer
        TabOrder = 0
      end
      object dbedSvrGameLocation: TDBEdit
        Left = 121
        Top = 145
        Width = 523
        Height = 21
        DataField = 'SvrGameLocation'
        DataSource = dstblServer
        ReadOnly = True
        TabOrder = 2
      end
      object dbedJavaMemMinMB: TDBEdit
        Left = 121
        Top = 274
        Width = 62
        Height = 21
        DataField = 'JavaMemMinMB'
        DataSource = dstblServer
        TabOrder = 9
      end
      object dbedJavaMemMaxMB: TDBEdit
        Left = 189
        Top = 274
        Width = 62
        Height = 21
        DataField = 'JavaMemMaxMB'
        DataSource = dstblServer
        TabOrder = 10
      end
      object dbedJavaExeLocation: TDBEdit
        Left = 121
        Top = 247
        Width = 523
        Height = 21
        DataField = 'JavaExeLocation'
        DataSource = dstblServer
        ReadOnly = True
        TabOrder = 7
      end
      object dbedSvrPropertiesLocation: TDBEdit
        Left = 121
        Top = 172
        Width = 523
        Height = 21
        DataField = 'SvrPropertiesLocation'
        DataSource = dstblServer
        ReadOnly = True
        TabOrder = 4
      end
      object btnOpenSvrGameLocation: TButton
        Left = 650
        Top = 145
        Width = 21
        Height = 21
        Caption = '...'
        TabOrder = 3
        OnClick = btnOpenSvrGameLocationClick
      end
      object btnOpenSvrPropertiesLocation: TButton
        Left = 650
        Top = 172
        Width = 21
        Height = 21
        Caption = '...'
        TabOrder = 5
        OnClick = btnOpenSvrPropertiesLocationClick
      end
      object btnOpenJavaExeLocation: TButton
        Left = 650
        Top = 247
        Width = 21
        Height = 21
        Caption = '...'
        TabOrder = 8
        OnClick = btnOpenJavaExeLocationClick
      end
      object btnEditSvrPropertiesFile: TButton
        Left = 121
        Top = 199
        Width = 37
        Height = 25
        Caption = 'Edit'
        TabOrder = 6
        OnClick = btnEditSvrPropertiesFileClick
      end
      object dblcbThreadPriority: TDBLookupComboBox
        Left = 541
        Top = 274
        Width = 130
        Height = 21
        DataField = 'ThreadPriority'
        DataSource = dstblServer
        KeyField = 'PriorityValue'
        ListField = 'ThreadPriority'
        ListSource = dsltThreadPriorities
        TabOrder = 12
      end
      object dbmSvrDesc: TDBMemo
        Left = 121
        Top = 51
        Width = 550
        Height = 88
        DataField = 'SvrDescription'
        DataSource = dstblServer
        ScrollBars = ssVertical
        TabOrder = 1
      end
      object dbmSvrCommands: TDBMemo
        Left = 677
        Top = 24
        Width = 293
        Height = 271
        Anchors = [akLeft, akTop, akRight, akBottom]
        DataField = 'GameSvrCommands'
        DataSource = dstblServer
        ScrollBars = ssVertical
        TabOrder = 13
      end
      object DBNavigator1: TDBNavigator
        Left = 750
        Top = 301
        Width = 220
        Height = 50
        DataSource = dstblServer
        VisibleButtons = [nbEdit, nbPost, nbCancel, nbRefresh]
        Anchors = [akRight, akBottom]
        TabOrder = 14
        ExplicitTop = 380
      end
      object dbcbUseOverrides: TDBCheckBox
        Left = 320
        Top = 276
        Width = 86
        Height = 17
        Alignment = taLeftJustify
        Caption = 'Use Overrides'
        DataField = 'UseOverrides'
        DataSource = dstblServer
        TabOrder = 11
        OnClick = dbcbUseOverridesClick
      end
      object btnGenerateCmd: TButton
        Left = 3
        Top = 328
        Width = 75
        Height = 25
        Anchors = [akLeft, akBottom]
        Caption = 'Preview'
        TabOrder = 15
        OnClick = btnGenerateCmdClick
      end
    end
    object tsOverrides: TTabSheet
      Caption = 'Overrides'
      ImageIndex = 6
      DesignSize = (
        976
        354)
      object Label11: TLabel
        Left = 3
        Top = 19
        Width = 54
        Height = 13
        Caption = 'Game Type'
      end
      object Label12: TLabel
        Left = 548
        Top = 19
        Width = 155
        Height = 13
        Caption = 'These will be included at runtime'
      end
      object dblcbGames: TDBLookupComboBox
        Left = 63
        Top = 16
        Width = 365
        Height = 21
        KeyField = 'GameID'
        ListField = 'GameName'
        ListSource = dsltGame
        TabOrder = 0
      end
      object dbgGameOverrides: TDBGrid
        Left = 3
        Top = 43
        Width = 425
        Height = 308
        Anchors = [akLeft, akTop, akBottom]
        DataSource = dsltGameOverrides
        Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'OverrideName'
            Title.Caption = 'Override Name'
            Width = 150
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CommandLineSwitch'
            Title.Caption = 'Command Line Switch'
            Width = 150
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DefaultValue'
            Title.Caption = 'Default Value'
            Width = 100
            Visible = True
          end>
      end
      object btnAddOverride: TButton
        Left = 434
        Top = 43
        Width = 108
        Height = 25
        Caption = 'Add Override'
        TabOrder = 2
        OnClick = btnAddOverrideClick
      end
      object dbgSvrOverrides: TDBGrid
        Left = 548
        Top = 43
        Width = 425
        Height = 250
        Anchors = [akLeft, akTop, akRight, akBottom]
        DataSource = dstblServerOverrides
        Options = [dgTitles, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        TabOrder = 3
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'Order'
            Width = 32
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'OverrideName'
            Title.Caption = 'Override Name'
            Width = 150
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CommandLineSwitch'
            Title.Caption = 'Command Line Switch'
            Width = 120
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DefaultValue'
            Title.Caption = 'Default Value'
            Width = 95
            Visible = True
          end>
      end
      object DBNavigator3: TDBNavigator
        Left = 784
        Top = 326
        Width = 108
        Height = 25
        DataSource = dstblServerOverrides
        VisibleButtons = [nbPost, nbCancel, nbRefresh]
        Anchors = [akRight, akBottom]
        TabOrder = 4
      end
      object dbedSvrOvrName: TDBEdit
        Left = 548
        Top = 299
        Width = 150
        Height = 21
        Anchors = [akLeft, akBottom]
        DataField = 'OverrideName'
        DataSource = dstblServerOverrides
        TabOrder = 5
      end
      object dbedSvrOvrCmd: TDBEdit
        Left = 704
        Top = 299
        Width = 142
        Height = 21
        Anchors = [akLeft, akBottom]
        DataField = 'CommandLineSwitch'
        DataSource = dstblServerOverrides
        TabOrder = 6
      end
      object dbedSvrOvrVal: TDBEdit
        Left = 852
        Top = 299
        Width = 101
        Height = 21
        Anchors = [akLeft, akBottom]
        DataField = 'DefaultValue'
        DataSource = dstblServerOverrides
        TabOrder = 7
      end
      object btnSvrOvrUP: TButton
        Left = 504
        Top = 161
        Width = 38
        Height = 25
        Caption = 'Up'
        TabOrder = 8
        OnClick = btnSvrOvrUPClick
      end
      object btnSvrOvrDOWN: TButton
        Left = 504
        Top = 192
        Width = 38
        Height = 25
        Caption = 'Down'
        TabOrder = 9
        OnClick = btnSvrOvrDOWNClick
      end
      object btnBackToSettings: TButton
        Left = 898
        Top = 326
        Width = 75
        Height = 25
        Anchors = [akRight, akBottom]
        Caption = 'Back'
        TabOrder = 10
        OnClick = btnBackToSettingsClick
      end
      object btnNewSvrOverride: TButton
        Left = 548
        Top = 326
        Width = 38
        Height = 25
        Anchors = [akLeft, akBottom]
        Caption = 'New'
        TabOrder = 11
        OnClick = btnNewSvrOverrideClick
      end
      object btnDelSvrOverride: TButton
        Left = 592
        Top = 326
        Width = 38
        Height = 25
        Anchors = [akLeft, akBottom]
        Caption = 'Del'
        TabOrder = 12
        OnClick = btnDelSvrOverrideClick
      end
    end
    object tsPropertiesFile: TTabSheet
      Caption = 'Properties File'
      ImageIndex = 2
      ExplicitHeight = 433
      DesignSize = (
        976
        354)
      object memGameProperties: TMemo
        Left = 3
        Top = 3
        Width = 970
        Height = 317
        Anchors = [akLeft, akTop, akRight, akBottom]
        ScrollBars = ssBoth
        TabOrder = 0
        WordWrap = False
        ExplicitHeight = 396
      end
      object btnSaveGameProperties: TButton
        Left = 672
        Top = 326
        Width = 146
        Height = 25
        Anchors = [akRight, akBottom]
        Caption = 'Save Changes'
        TabOrder = 1
        OnClick = btnSaveGamePropertiesClick
      end
      object btnCancelGameProperties: TButton
        Left = 824
        Top = 326
        Width = 149
        Height = 25
        Anchors = [akRight, akBottom]
        Caption = 'Cancel Changes'
        TabOrder = 2
        OnClick = btnCancelGamePropertiesClick
        ExplicitTop = 405
      end
    end
    object tsCommandLine: TTabSheet
      Caption = 'Command Line'
      ImageIndex = 1
      ExplicitHeight = 433
      object Splitter1: TSplitter
        Left = 185
        Top = 0
        Width = 6
        Height = 354
        ExplicitLeft = 216
        ExplicitHeight = 433
      end
      object Panel1: TPanel
        Left = 191
        Top = 0
        Width = 785
        Height = 354
        Align = alClient
        Caption = 'Panel1'
        TabOrder = 0
        ExplicitLeft = 240
        ExplicitWidth = 736
        ExplicitHeight = 433
        object memCommandOutput: TMemo
          Left = 1
          Top = 1
          Width = 783
          Height = 331
          Margins.Left = 2
          Margins.Top = 2
          Margins.Right = 2
          Margins.Bottom = 2
          Align = alClient
          Color = clBlack
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clLime
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          ParentFont = False
          ScrollBars = ssBoth
          TabOrder = 0
          WordWrap = False
          ExplicitWidth = 734
          ExplicitHeight = 376
        end
        object edCommand: TEdit
          Left = 1
          Top = 332
          Width = 783
          Height = 21
          Align = alBottom
          TabOrder = 1
          OnKeyPress = edCommandKeyPress
          ExplicitLeft = 256
          ExplicitTop = 400
          ExplicitWidth = 121
        end
      end
      object pnlCmdLnSide: TPanel
        Left = 0
        Top = 0
        Width = 185
        Height = 354
        Align = alLeft
        Caption = 'pnlCmdLnSide'
        TabOrder = 1
        ExplicitLeft = 96
        ExplicitTop = 104
        ExplicitHeight = 41
        object dbmGameSvrCommands: TDBMemo
          Left = 1
          Top = 1
          Width = 183
          Height = 326
          Align = alClient
          DataField = 'GameSvrCommands'
          DataSource = dstblServer
          ReadOnly = True
          ScrollBars = ssVertical
          TabOrder = 0
          ExplicitLeft = -31
          ExplicitWidth = 216
          ExplicitHeight = 352
        end
        object pnlCmdStartStop: TPanel
          Left = 1
          Top = 327
          Width = 183
          Height = 26
          Align = alBottom
          TabOrder = 1
          ExplicitTop = 326
          object btnStartSvr: TButton
            Left = 12
            Top = 0
            Width = 75
            Height = 25
            Caption = 'Start'
            TabOrder = 0
            OnClick = btnStartSvrClick
          end
          object btnStopSvr: TButton
            Left = 93
            Top = 0
            Width = 75
            Height = 25
            Caption = 'Stop'
            TabOrder = 1
            OnClick = btnStopSvrClick
          end
        end
      end
    end
    object tsHistory: TTabSheet
      Caption = 'History'
      ImageIndex = 3
      ExplicitHeight = 467
      DesignSize = (
        976
        354)
      object dbgServerLogs: TDBGrid
        Left = 0
        Top = 3
        Width = 233
        Height = 318
        Anchors = [akLeft, akTop, akBottom]
        DataSource = dstblServerLogs
        Options = [dgTitles, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleHotTrack]
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'SvrDTStarted'
            Title.Caption = 'Started'
            Width = 105
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SvrDTStopped'
            Title.Caption = 'Stopped'
            Width = 105
            Visible = True
          end>
      end
      object dbmSvrLog: TDBMemo
        Left = 234
        Top = 3
        Width = 739
        Height = 348
        Anchors = [akLeft, akTop, akRight, akBottom]
        DataField = 'SvrConsoleLog'
        DataSource = dstblServerLogs
        ScrollBars = ssBoth
        TabOrder = 1
        WordWrap = False
      end
      object DBNavigator2: TDBNavigator
        Left = 0
        Top = 321
        Width = 234
        Height = 30
        DataSource = dstblServerLogs
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbDelete, nbEdit, nbPost, nbCancel, nbRefresh]
        Anchors = [akLeft, akBottom]
        TabOrder = 2
      end
    end
    object tsScheduling: TTabSheet
      Caption = 'Scheduling'
      ImageIndex = 4
    end
    object tsBackup: TTabSheet
      Caption = 'Backup'
      ImageIndex = 5
    end
  end
  object DosCommand1: TDosCommand
    InputToOutput = False
    MaxTimeAfterBeginning = 0
    MaxTimeAfterLastOutput = 0
    Left = 360
    Top = 152
  end
  object tblServer: TnxTable
    Database = DMCore.nxDatabase1
    Options = [dsoRecNoSupport]
    BeforeCancel = tblServerBeforeCancel
    AfterCancel = tblServerAfterCancel
    TableName = 'Server'
    IndexFieldNames = 'SvrID'
    Left = 704
    Top = 72
  end
  object tblServerLogs: TnxTable
    Database = DMCore.nxDatabase1
    Options = [dsoRecNoSupport]
    TableName = 'ServerLogs'
    IndexFieldNames = 'SvrID'
    MasterFields = 'SvrID'
    MasterSource = dstblServer
    Left = 888
    Top = 72
    object tblServerLogsID: TUnsignedAutoIncField
      FieldName = 'ID'
    end
    object tblServerLogsSvrID: TGuidField
      FieldName = 'SvrID'
      Required = True
      Size = 38
    end
    object tblServerLogsSvrDTStarted: TDateTimeField
      FieldName = 'SvrDTStarted'
      DisplayFormat = 'd/m/yyyy h:nn am/pm'
    end
    object tblServerLogsSvrDTStopped: TDateTimeField
      FieldName = 'SvrDTStopped'
      DisplayFormat = 'd/m/yyyy h:nn am/pm'
    end
    object tblServerLogsSvrConsoleLog: TWideMemoField
      FieldName = 'SvrConsoleLog'
      BlobType = ftWideMemo
    end
  end
  object tblServerOverrides: TnxTable
    Database = DMCore.nxDatabase1
    Options = [dsoRecNoSupport]
    TableName = 'ServerOverrides'
    IndexFieldNames = 'SvrID;Order'
    MasterFields = 'SvrID'
    MasterSource = dstblServer
    Left = 784
    Top = 72
  end
  object dstblServer: TDataSource
    DataSet = tblServer
    Left = 704
    Top = 120
  end
  object dstblServerLogs: TDataSource
    DataSet = tblServerLogs
    Left = 888
    Top = 120
  end
  object dstblServerOverrides: TDataSource
    DataSet = tblServerOverrides
    Left = 784
    Top = 120
  end
  object FileOpenDialog1: TFileOpenDialog
    FavoriteLinks = <>
    FileTypes = <
      item
        DisplayName = 'Executables (*.exe)'
        FileMask = '*.exe'
      end
      item
        DisplayName = 'JAR Files (*.jar)'
        FileMask = '*.jar'
      end
      item
        DisplayName = 'All Files (*.*)'
        FileMask = '*.*'
      end>
    Options = []
    Left = 828
    Top = 216
  end
  object ltThreadPriorities: TnxTable
    Database = DMCore.nxDatabase1
    Options = [dsoRecNoSupport]
    TableName = 'ThreadPriorities'
    ReadOnly = True
    IndexFieldNames = 'Order'
    Left = 308
    Top = 264
  end
  object dsltThreadPriorities: TDataSource
    DataSet = ltThreadPriorities
    Left = 372
    Top = 280
  end
  object ltGame: TnxTable
    Database = DMCore.nxDatabase1
    Options = [dsoRecNoSupport]
    TableName = 'Game'
    ReadOnly = True
    IndexFieldNames = 'GameName'
    Left = 684
    Top = 168
  end
  object ltGameOverrides: TnxTable
    Database = DMCore.nxDatabase1
    Options = [dsoRecNoSupport]
    TableName = 'GameOverrides'
    ReadOnly = True
    IndexFieldNames = 'GameID'
    MasterFields = 'GameID'
    MasterSource = dsltGame
    Left = 724
    Top = 184
  end
  object dsltGame: TDataSource
    DataSet = ltGame
    Left = 684
    Top = 232
  end
  object dsltGameOverrides: TDataSource
    DataSet = ltGameOverrides
    Left = 724
    Top = 248
  end
end
