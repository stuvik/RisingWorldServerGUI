object fmRisingWorldServerGUI: TfmRisingWorldServerGUI
  Left = 0
  Top = 0
  Caption = 'Rising World Server GUI'
  ClientHeight = 723
  ClientWidth = 1399
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 752
    Top = 0
    Width = 8
    Height = 723
    ExplicitLeft = 256
    ExplicitHeight = 607
  end
  object sty: TPanel
    Left = 0
    Top = 0
    Width = 752
    Height = 723
    Align = alLeft
    TabOrder = 0
    ExplicitLeft = 56
    ExplicitTop = 240
    ExplicitWidth = 185
    ExplicitHeight = 41
    DesignSize = (
      752
      723)
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 119
      Height = 13
      Caption = 'Java executable location'
    end
    object Label2: TLabel
      Left = 8
      Top = 54
      Width = 121
      Height = 13
      Caption = 'Rising World server (.jar)'
    end
    object Label3: TLabel
      Left = 8
      Top = 100
      Width = 101
      Height = 13
      Caption = 'Server Properties file'
    end
    object Label4: TLabel
      Left = 8
      Top = 146
      Width = 105
      Height = 13
      Caption = 'Java RAM usage (MB)'
    end
    object edJavaExe: TEdit
      Left = 8
      Top = 27
      Width = 717
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      Text = 'C:\Program Files\Java\jdk1.8.0_60\bin\java.exe'
      ExplicitWidth = 269
    end
    object btnOpenJavaExe: TButton
      Left = 725
      Top = 27
      Width = 21
      Height = 21
      Action = actOpenJavaExe
      Anchors = [akTop, akRight]
      Caption = '...'
      TabOrder = 1
      ExplicitLeft = 277
    end
    object edRWSvr: TEdit
      Left = 8
      Top = 73
      Width = 717
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
      ExplicitWidth = 269
    end
    object edSvrProp: TEdit
      Left = 8
      Top = 119
      Width = 717
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 3
      ExplicitWidth = 269
    end
    object btnOpenRWSvr: TButton
      Left = 725
      Top = 73
      Width = 21
      Height = 21
      Action = actOpenRWSvr
      Anchors = [akTop, akRight]
      Caption = '...'
      TabOrder = 4
      ExplicitLeft = 277
    end
    object edJavaRAM: TEdit
      Left = 8
      Top = 165
      Width = 57
      Height = 21
      TabOrder = 5
      Text = '1024'
    end
    object edMaxPlayers: TEdit
      Left = 8
      Top = 215
      Width = 33
      Height = 21
      TabOrder = 6
      Text = '4'
    end
    object edServerIP: TMaskEdit
      Left = 8
      Top = 265
      Width = 89
      Height = 21
      EditMask = '999.999.999.999;0;_'
      MaxLength = 15
      TabOrder = 7
      Text = ''
    end
    object edServerPort: TEdit
      Left = 8
      Top = 315
      Width = 57
      Height = 21
      TabOrder = 8
      Text = '4255'
    end
    object edServerName: TEdit
      Left = 8
      Top = 365
      Width = 717
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 9
      Text = 'Rising World Server'
      ExplicitWidth = 269
    end
    object edRCONPort: TEdit
      Left = 8
      Top = 415
      Width = 57
      Height = 21
      TabOrder = 10
      Text = '4253'
    end
    object cbMaxPlayers: TCheckBox
      Left = 8
      Top = 192
      Width = 137
      Height = 17
      Caption = 'Max. players (up to 32)'
      TabOrder = 11
    end
    object cbServerIP: TCheckBox
      Left = 8
      Top = 242
      Width = 169
      Height = 17
      Caption = 'Server IPv4 address (optional)'
      TabOrder = 12
    end
    object cbServerPort: TCheckBox
      Left = 8
      Top = 292
      Width = 145
      Height = 17
      Caption = 'Server port (default 4255)'
      TabOrder = 13
    end
    object cbServerName: TCheckBox
      Left = 8
      Top = 342
      Width = 89
      Height = 17
      Caption = 'Server name'
      TabOrder = 14
    end
    object cbRCONPort: TCheckBox
      Left = 8
      Top = 392
      Width = 225
      Height = 17
      Caption = 'RCON port (if enabled in Server.Properties)'
      TabOrder = 15
    end
    object btnEditSvrProp: TButton
      Left = 673
      Top = 146
      Width = 75
      Height = 40
      Action = actEditSvrProp
      Anchors = [akTop, akRight]
      TabOrder = 16
      WordWrap = True
      ExplicitLeft = 223
    end
    object btnGenerateStr: TButton
      Left = 8
      Top = 442
      Width = 740
      Height = 25
      Action = actGenerateServerStart
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 17
      ExplicitWidth = 290
    end
    object Memo1: TMemo
      Left = 8
      Top = 473
      Width = 738
      Height = 249
      Anchors = [akLeft, akTop, akRight, akBottom]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Courier New'
      Font.Style = []
      Lines.Strings = (
        'Command'#9'                        Description'
        
          '----------------------------------------------------------------' +
          '-------------------------------------'
        
          'say <msg>                       Sends a chat message to all play' +
          'ers'
        
          'yell <msg>                      Sends a yell message (big messag' +
          'e centered on the screen)'
        
          'tod <h> <m>                     Changes the time of day (hours +' +
          ' minutes)'
        
          'weather <type>                  Changes the current weather (e.g' +
          '. clear, default, overcast, rain etc)'
        
          'makeadmin <Steam ID>            Grants admin permission to a cer' +
          'tain player (use UID/SteamID)'
        
          'setplayergroup <Player> <type>  Changes the player permission gr' +
          'oup '
        
          '                                (see https://forum.rising-world.' +
          'net/thread/3179-permission-system/)'
        
          'deleteplayerdata <Steam ID>     Delete player from database (use' +
          'ful when player data is corrupted)'
        
          'reloadplugins                   Reload all plugins (for debug pu' +
          'rposes only!)'
        
          'unloadplugins                   Unloads all plugins (for debug p' +
          'urposes only!)'
        
          'saveall                         Request the server to save the w' +
          'orld (no need to call this manually)'
        
          'shutdown                        Shuts down the server gracefully' +
          ' (takes a few seconds)'
        
          'shutdown now                    Forces the server to shut down n' +
          'ow')
      ParentFont = False
      ReadOnly = True
      TabOrder = 18
    end
  end
  object pnlCmd: TPanel
    Left = 760
    Top = 0
    Width = 639
    Height = 723
    Align = alClient
    Caption = 'pnlCmd'
    TabOrder = 1
    object memPrompt: TMemo
      Left = 1
      Top = 1
      Width = 637
      Height = 700
      Align = alClient
      Color = clBackground
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clLime
      Font.Height = -11
      Font.Name = 'System'
      Font.Style = []
      ParentFont = False
      ScrollBars = ssVertical
      TabOrder = 0
      ExplicitLeft = 312
      ExplicitTop = 0
      ExplicitWidth = 593
      ExplicitHeight = 607
    end
    object edCmd: TEdit
      Left = 1
      Top = 701
      Width = 637
      Height = 21
      Align = alBottom
      TabOrder = 1
      OnKeyPress = edCmdKeyPress
      ExplicitLeft = 88
      ExplicitTop = 536
      ExplicitWidth = 121
    end
  end
  object DosCommand1: TDosCommand
    InputToOutput = True
    MaxTimeAfterBeginning = 0
    MaxTimeAfterLastOutput = 0
    Left = 808
    Top = 56
  end
  object openDlgJavaExe: TOpenDialog
    DefaultExt = '.exe'
    FileName = 'java.exe'
    Filter = 'Executable (*.exe)|*.exe'
    Left = 688
    Top = 16
  end
  object openDlgRWSvr: TOpenDialog
    DefaultExt = '*.jar'
    FileName = 'Server.jar'
    Filter = '*.jar'
    Left = 688
    Top = 64
  end
  object ActionManager1: TActionManager
    Left = 808
    Top = 8
    StyleName = 'Platform Default'
    object actOpenJavaExe: TAction
      Caption = 'actOpenJavaExe'
      OnExecute = actOpenJavaExeExecute
    end
    object actOpenRWSvr: TAction
      Caption = 'actOpenRWSvr'
      OnExecute = actOpenRWSvrExecute
    end
    object actExecuteCmd: TAction
      Caption = 'actExecuteCmd'
      OnExecute = actExecuteCmdExecute
    end
    object actGenerateServerStart: TAction
      Caption = 'Generate Server Start String'
      OnExecute = actGenerateServerStartExecute
    end
    object actEditSvrProp: TAction
      Caption = 'Edit Server Properties'
    end
  end
end
