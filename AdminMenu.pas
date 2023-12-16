unit AdminMenu;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TFAdminMenu = class(TForm)
    Label1: TLabel;
    ButtonAdminReservation: TButton;
    ButtonMasterData: TButton;
    ButtonCheckout: TButton;
    procedure ButtonAdminReservationClick(Sender: TObject);
    procedure ButtonMasterDataClick(Sender: TObject);
    procedure ButtonCheckoutClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FAdminMenu: TFAdminMenu;

implementation

uses Reservation, MasterData, Checkout;

{$R *.dfm}

procedure TFAdminMenu.ButtonAdminReservationClick(Sender: TObject);
begin
  FReservation.Show;
end;

procedure TFAdminMenu.ButtonMasterDataClick(Sender: TObject);
begin
  FMasterData.Show;
end;

procedure TFAdminMenu.ButtonCheckoutClick(Sender: TObject);
begin
  FCheckout.Show;
end;

end.
