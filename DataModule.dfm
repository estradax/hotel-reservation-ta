object FDataModule: TFDataModule
  OldCreateOrder = False
  Left = 578
  Top = 444
  Height = 150
  Width = 215
  object ZConnection: TZConnection
    ControlsCodePage = cGET_ACP
    AutoEncodeStrings = True
    Properties.Strings = (
      'AutoEncodeStrings=True'
      'controls_cp=GET_ACP')
    Connected = True
    HostName = 'localhost'
    Port = 3306
    Database = 'hotel_reservation_ta'
    User = 'root'
    Password = '12345678'
    Protocol = 'mysql'
    LibraryLocation = 'Z:\home\hansel\sub\sch\tools\libmysql2\libmySQL.dll'
    Left = 32
    Top = 16
  end
end
