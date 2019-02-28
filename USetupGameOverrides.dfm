object fmSetupGameOverrides: TfmSetupGameOverrides
  Left = 0
  Top = 0
  Caption = 'Setup Game Overrides'
  ClientHeight = 261
  ClientWidth = 554
  Color = clBtnFace
  Constraints.MinHeight = 300
  Constraints.MinWidth = 570
  DefaultMonitor = dmMainForm
  ParentFont = True
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poOwnerFormCenter
  Visible = True
  OnClose = FormClose
  DesignSize = (
    554
    261)
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 8
    Top = 8
    Width = 538
    Height = 105
    Anchors = [akLeft, akTop, akRight]
    DataSource = dstblGame
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'GameName'
        Title.Caption = 'Game Name'
        Width = 300
        Visible = True
      end>
  end
  object DBNavigator1: TDBNavigator
    Left = 8
    Top = 119
    Width = 530
    Height = 25
    DataSource = dstblGame
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 1
  end
  object DBGrid2: TDBGrid
    Left = 8
    Top = 150
    Width = 538
    Height = 72
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = dstblGameOverrides
    TabOrder = 2
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
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DefaultValue'
        Title.Caption = 'Default Value'
        Width = 150
        Visible = True
      end>
  end
  object DBNavigator2: TDBNavigator
    Left = 8
    Top = 228
    Width = 530
    Height = 25
    DataSource = dstblGameOverrides
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 3
    ExplicitTop = 350
    ExplicitWidth = 660
  end
  object tblGame: TnxTable
    ActiveRuntime = True
    Database = DMCore.nxDatabase1
    Options = [dsoRecNoSupport]
    TableName = 'Game'
    IndexFieldNames = 'GameName'
    Left = 336
    Top = 8
  end
  object tblGameOverrides: TnxTable
    ActiveRuntime = True
    Database = DMCore.nxDatabase1
    Options = [dsoRecNoSupport]
    TableName = 'GameOverrides'
    IndexFieldNames = 'GameID'
    MasterFields = 'GameID'
    MasterSource = dstblGame
    Left = 424
    Top = 8
  end
  object dstblGame: TDataSource
    DataSet = tblGame
    Left = 336
    Top = 56
  end
  object dstblGameOverrides: TDataSource
    DataSet = tblGameOverrides
    Left = 424
    Top = 56
  end
end
