object FLogin: TFLogin
  Left = 671
  Top = 341
  Width = 448
  Height = 464
  Caption = 'Login Form'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 12
  object Label1: TLabel
    Left = 104
    Top = 56
    Width = 254
    Height = 23
    Caption = 'Login to Hotel Reservation'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = 24
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 104
    Top = 96
    Width = 26
    Height = 12
    Caption = 'Email'
  end
  object Label3: TLabel
    Left = 104
    Top = 152
    Width = 49
    Height = 12
    Caption = 'Password'
  end
  object EditEmail: TEdit
    Left = 104
    Top = 112
    Width = 249
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = 16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object EditPassword: TEdit
    Left = 104
    Top = 168
    Width = 249
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = 16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
  end
  object ButtonLogin: TButton
    Left = 104
    Top = 208
    Width = 249
    Height = 25
    Caption = 'Login'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = ButtonLoginClick
  end
  object ZQueryLogin: TZQuery
    Connection = FDataModule.ZConnection
    Params = <>
    Left = 96
    Top = 272
  end
end
