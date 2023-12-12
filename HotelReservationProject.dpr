program HotelReservationProject;

uses
  Forms,
  Login in 'Login.pas' {FLogin},
  DataModule in 'DataModule.pas' {FDataModule: TDataModule},
  AdminMenu in 'AdminMenu.pas' {FAdminMenu},
  Reservation in 'Reservation.pas' {FReservation},
  MasterData in 'MasterData.pas' {FMasterData};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFLogin, FLogin);
  Application.CreateForm(TFDataModule, FDataModule);
  Application.CreateForm(TFAdminMenu, FAdminMenu);
  Application.CreateForm(TFReservation, FReservation);
  Application.CreateForm(TFMasterData, FMasterData);
  Application.Run;
end.
