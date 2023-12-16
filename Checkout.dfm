object FCheckout: TFCheckout
  Left = 422
  Top = 373
  Width = 288
  Height = 277
  Caption = 'Checkout'
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
    Left = 96
    Top = 24
    Width = 91
    Height = 23
    Caption = 'Checkout'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = 24
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 80
    Top = 72
    Width = 73
    Height = 12
    Caption = 'Reservation ID'
  end
  object EditReservationID: TEdit
    Left = 80
    Top = 88
    Width = 121
    Height = 20
    TabOrder = 0
  end
  object ButtonCheckout: TButton
    Left = 104
    Top = 128
    Width = 75
    Height = 25
    Caption = 'Checkout'
    TabOrder = 1
    OnClick = ButtonCheckoutClick
  end
  object ZQueryCheckout: TZQuery
    Connection = FDataModule.ZConnection
    Params = <>
    Left = 32
    Top = 40
  end
end
