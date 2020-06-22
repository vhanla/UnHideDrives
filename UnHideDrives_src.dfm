object Form1: TForm1
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Un/Hide Your Drives'
  ClientHeight = 132
  ClientWidth = 445
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 376
    Top = 108
    Width = 61
    Height = 13
    Caption = '- by vhanla -'
  end
  object Button1: TButton
    Left = 8
    Top = 77
    Width = 209
    Height = 25
    Caption = 'Save Status'
    ElevationRequired = True
    TabOrder = 0
    OnClick = Button1Click
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 431
    Height = 63
    Caption = 'Drives : Check those drives you don'#39't want to be visible'
    TabOrder = 1
    object CheckBox1: TCheckBox
      Left = 16
      Top = 16
      Width = 25
      Height = 17
      Caption = 'A'
      Enabled = False
      TabOrder = 0
    end
    object CheckBox2: TCheckBox
      Left = 47
      Top = 16
      Width = 25
      Height = 17
      Caption = 'B'
      Enabled = False
      TabOrder = 1
    end
    object CheckBox3: TCheckBox
      Left = 78
      Top = 16
      Width = 25
      Height = 17
      Caption = 'C'
      Enabled = False
      TabOrder = 2
    end
    object CheckBox4: TCheckBox
      Left = 109
      Top = 16
      Width = 25
      Height = 17
      Caption = 'D'
      Enabled = False
      TabOrder = 3
    end
    object CheckBox5: TCheckBox
      Left = 140
      Top = 16
      Width = 25
      Height = 17
      Caption = 'E'
      Enabled = False
      TabOrder = 4
    end
    object CheckBox6: TCheckBox
      Left = 171
      Top = 16
      Width = 25
      Height = 17
      Caption = 'F'
      Enabled = False
      TabOrder = 5
    end
    object CheckBox7: TCheckBox
      Left = 202
      Top = 16
      Width = 25
      Height = 17
      Caption = 'G'
      Enabled = False
      TabOrder = 6
    end
    object CheckBox8: TCheckBox
      Left = 233
      Top = 16
      Width = 25
      Height = 17
      Caption = 'H'
      Enabled = False
      TabOrder = 7
    end
    object CheckBox9: TCheckBox
      Left = 264
      Top = 16
      Width = 25
      Height = 17
      Caption = 'I'
      Enabled = False
      TabOrder = 8
    end
    object CheckBox10: TCheckBox
      Left = 295
      Top = 16
      Width = 25
      Height = 17
      Caption = 'J'
      Enabled = False
      TabOrder = 9
    end
    object CheckBox11: TCheckBox
      Left = 326
      Top = 16
      Width = 25
      Height = 17
      Caption = 'K'
      Enabled = False
      TabOrder = 10
    end
    object CheckBox12: TCheckBox
      Left = 357
      Top = 16
      Width = 25
      Height = 17
      Caption = 'L'
      Enabled = False
      TabOrder = 11
    end
    object CheckBox13: TCheckBox
      Left = 388
      Top = 16
      Width = 25
      Height = 17
      Caption = 'M'
      Enabled = False
      TabOrder = 12
    end
    object CheckBox14: TCheckBox
      Left = 16
      Top = 39
      Width = 25
      Height = 17
      Caption = 'N'
      Enabled = False
      TabOrder = 13
    end
    object CheckBox15: TCheckBox
      Left = 47
      Top = 39
      Width = 25
      Height = 17
      Caption = 'O'
      Enabled = False
      TabOrder = 14
    end
    object CheckBox16: TCheckBox
      Left = 78
      Top = 39
      Width = 25
      Height = 17
      Caption = 'P'
      Enabled = False
      TabOrder = 15
    end
    object CheckBox17: TCheckBox
      Left = 109
      Top = 39
      Width = 25
      Height = 17
      Caption = 'Q'
      Enabled = False
      TabOrder = 16
    end
    object CheckBox18: TCheckBox
      Left = 140
      Top = 39
      Width = 25
      Height = 17
      Caption = 'R'
      Enabled = False
      TabOrder = 17
    end
    object CheckBox19: TCheckBox
      Left = 171
      Top = 39
      Width = 25
      Height = 17
      Caption = 'S'
      Enabled = False
      TabOrder = 18
    end
    object CheckBox20: TCheckBox
      Left = 202
      Top = 39
      Width = 25
      Height = 17
      Caption = 'T'
      Enabled = False
      TabOrder = 19
    end
    object CheckBox21: TCheckBox
      Left = 233
      Top = 39
      Width = 25
      Height = 17
      Caption = 'U'
      Enabled = False
      TabOrder = 20
    end
    object CheckBox22: TCheckBox
      Left = 264
      Top = 39
      Width = 25
      Height = 17
      Caption = 'V'
      Enabled = False
      TabOrder = 21
    end
    object CheckBox23: TCheckBox
      Left = 295
      Top = 39
      Width = 25
      Height = 17
      Caption = 'W'
      Enabled = False
      TabOrder = 22
    end
    object CheckBox24: TCheckBox
      Left = 326
      Top = 39
      Width = 25
      Height = 17
      Caption = 'X'
      Enabled = False
      TabOrder = 23
    end
    object CheckBox25: TCheckBox
      Left = 357
      Top = 39
      Width = 25
      Height = 17
      Caption = 'Y'
      Enabled = False
      TabOrder = 24
    end
    object CheckBox26: TCheckBox
      Left = 388
      Top = 39
      Width = 25
      Height = 17
      Caption = 'Z'
      Enabled = False
      TabOrder = 25
    end
  end
  object Button2: TButton
    Left = 223
    Top = 77
    Width = 216
    Height = 25
    Caption = 'Restart Windows Explorer'
    ElevationRequired = True
    TabOrder = 2
    OnClick = Button2Click
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 128
    Top = 104
  end
end
