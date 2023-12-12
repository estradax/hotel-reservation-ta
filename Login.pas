unit Login;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset;

type
  TFLogin = class(TForm)
    Label1: TLabel;
    EditEmail: TEdit;
    EditPassword: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    ButtonLogin: TButton;
    ZQueryLogin: TZQuery;
    procedure ButtonLoginClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FLogin: TFLogin;

implementation

uses AdminMenu, Reservation;

{$R *.dfm}

procedure TFLogin.ButtonLoginClick(Sender: TObject);
begin
  ZQueryLogin.Close;

  ZQueryLogin.Sql.Clear;
  ZQueryLogin.Sql.Add('SELECT * FROM users WHERE email = :Email AND password = :Password;');
  ZQueryLogin.Params.ParamByName('Email').AsString := EditEmail.Text;
  ZQueryLogin.Params.ParamByName('Password').AsString := EditPassword.Text;

  ZQueryLogin.Open;

  if ZQueryLogin.RecordCount > 0 then begin
    if ZQueryLogin.FieldByName('role').AsString = 'admin' then begin
      FAdminMenu.Show;
      FLogin.Hide;
    end else if ZQueryLogin.FieldByName('role').AsString = 'user' then begin
      FReservation.Show;
      FLogin.Hide;
    end else
      ShowMessage('Invalid role');
  end else
    ShowMessage('Invalid email or password');
end;

end.
