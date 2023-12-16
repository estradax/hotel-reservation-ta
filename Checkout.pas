unit Checkout;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset;

type
  TFCheckout = class(TForm)
    Label1: TLabel;
    EditReservationID: TEdit;
    Label2: TLabel;
    ButtonCheckout: TButton;
    ZQueryCheckout: TZQuery;

    function HasReservationID(ID: String): Boolean;

    procedure ButtonCheckoutClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCheckout: TFCheckout;

implementation

{$R *.dfm}

function TFCheckout.HasReservationID(ID: String): Boolean;
begin
  ZQueryCheckout.Close;

  ZQueryCheckout.Sql.Clear;
  ZQueryCheckout.Sql.Add('SELECT * FROM reservations WHERE id = :ReservationID;');
  ZQueryCheckout.Params.ParamByName('ReservationID').AsString := ID;

  ZQueryCheckout.Open;

  if ZQueryCheckout.RecordCount < 1 then
    Result := False
  else
    Result := True;
end;

procedure TFCheckout.ButtonCheckoutClick(Sender: TObject);
begin
  if HasReservationID(EditReservationID.Text) then begin
    ZQueryCheckout.Sql.Clear;

    ZQueryCheckout.Sql.Add('DELETE FROM reservations WHERE id = :ReservationID');
    ZQueryCheckout.Params.ParamByName('ReservationID').AsString := EditReservationID.Text;
    ZQueryCheckout.ExecSQL;

    ShowMessage('Succesfully checkout');
  end else
    ShowMessage('No such reservation ID');
end;

end.

