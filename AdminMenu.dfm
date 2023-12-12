object FAdminMenu: TFAdminMenu
  Left = 599
  Top = 346
  Width = 337
  Height = 398
  Caption = 'Admin Menu'
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
    Left = 136
    Top = 24
    Width = 54
    Height = 23
    Caption = 'Menu'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = 24
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object ButtonAdminReservation: TButton
    Left = 96
    Top = 72
    Width = 137
    Height = 25
    Caption = 'Hotel Reservation'
    TabOrder = 0
    OnClick = ButtonAdminReservationClick
  end
  object ButtonMasterData: TButton
    Left = 96
    Top = 112
    Width = 137
    Height = 25
    Caption = 'Master Data'
    TabOrder = 1
    OnClick = ButtonMasterDataClick
  end
end
