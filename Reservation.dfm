object FReservation: TFReservation
  Left = 455
  Top = 409
  Width = 1305
  Height = 675
  Caption = 'Hotel Reservation'
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
    Left = 48
    Top = 32
    Width = 171
    Height = 23
    Caption = 'Hotel Reservation'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = 24
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 48
    Top = 72
    Width = 53
    Height = 12
    Caption = 'User Email'
  end
  object Label3: TLabel
    Left = 48
    Top = 120
    Width = 75
    Height = 12
    Caption = 'Room Public ID'
  end
  object Label4: TLabel
    Left = 48
    Top = 168
    Width = 52
    Height = 12
    Caption = 'Day Count'
  end
  object Label5: TLabel
    Left = 352
    Top = 40
    Width = 132
    Height = 17
    Caption = 'Available Room(s)'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = 18
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object EditUserEmail: TEdit
    Left = 48
    Top = 88
    Width = 265
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = 16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object EditRoomPublicID: TEdit
    Left = 48
    Top = 136
    Width = 265
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = 16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
  end
  object EditDayCount: TEdit
    Left = 48
    Top = 184
    Width = 265
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = 16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
  end
  object ButtonSubmit: TButton
    Left = 240
    Top = 232
    Width = 75
    Height = 25
    Caption = 'Submit'
    TabOrder = 3
    OnClick = ButtonSubmitClick
  end
  object SMDBGridAvailableRoom: TSMDBGrid
    Left = 352
    Top = 64
    Width = 401
    Height = 217
    DataSource = DataSourceAvailableRoom
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Flat = False
    BandsFont.Charset = DEFAULT_CHARSET
    BandsFont.Color = clWindowText
    BandsFont.Height = -11
    BandsFont.Name = 'MS Sans Serif'
    BandsFont.Style = []
    Groupings = <>
    GridStyle.Style = gsNormal
    GridStyle.OddColor = clWindow
    GridStyle.EvenColor = clWindow
    TitleHeight.PixelCount = 24
    FooterColor = clBtnFace
    ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoStandardPopup, eoBLOBEditor, eoTitleWordWrap, eoFilterAutoApply]
    RegistryKey = 'Software\Scalabium'
    RegistrySection = 'SMDBGrid'
    WidthOfIndicator = 11
    DefaultRowHeight = 16
    ScrollBars = ssHorizontal
  end
  object ZQueryAvailableRoom: TZQuery
    Connection = FDataModule.ZConnection
    Active = True
    ReadOnly = True
    SQL.Strings = (
      'select * from rooms where id not in ('
      '  select room_id from reservations'
      ');')
    Params = <>
    Left = 800
    Top = 64
  end
  object DataSourceAvailableRoom: TDataSource
    DataSet = ZQueryAvailableRoom
    Left = 800
    Top = 112
  end
  object ZQueryReserve: TZQuery
    Connection = FDataModule.ZConnection
    Params = <>
    Left = 56
    Top = 232
  end
end
