unit Reservation;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, SMDBGrid, DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset;

type
  TFReservation = class(TForm)
    Label1: TLabel;
    EditUserEmail: TEdit;
    EditRoomPublicID: TEdit;
    EditDayCount: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    ButtonSubmit: TButton;
    SMDBGridAvailableRoom: TSMDBGrid;
    Label5: TLabel;
    ZQueryAvailableRoom: TZQuery;
    DataSourceAvailableRoom: TDataSource;
    ZQueryReserve: TZQuery;
    ButtonRefresh: TButton;

    function IsEmailValid(): boolean;

    procedure GetUserID_Impl();
    function GetUserID(): Integer;

    function GetRoomID(): Integer;
    function IsRoomAvailable(RoomID: Integer): boolean;

    procedure CreateReservation(UserID, RoomID, DayCount: Integer);

    procedure ButtonSubmitClick(Sender: TObject);
    procedure ButtonRefreshClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FReservation: TFReservation;

implementation

uses DataModule;

{$R *.dfm}

function TFReservation.IsEmailValid(): boolean;
const
  charslist = ['_', '-', '.', '0'..'9', 'A'..'Z', 'a'..'z'];
var
  Arobasc, lastpoint : boolean;
  i, n : integer;
  c : char;
begin
  n := Length(EditUserEmail.Text);
  i := 1;
  Arobasc := false;
  lastpoint := false;
  result := true;
  while (i <= n) do begin
    c := EditUserEmail.Text[i];
    if c = '@' then
    begin
      if Arobasc then  // Only 1 Arobasc
      begin
        result := false;
        exit;
      end;
      Arobasc := true;
    end
    else if (c = '.') and Arobasc then  // at least 1 . after arobasc
    begin
      lastpoint := true;
    end
    else if not(c in charslist) then  // valid chars
    begin
      result := false;
      exit;
    end;
    inc(i);
  end;
  if not(lastpoint) or (EditUserEmail.Text[n] = '.')then  // not finish by . and have a . after arobasc
    result := false;
end;

procedure TFReservation.GetUserID_Impl();
begin
  ZQueryReserve.Close;

  ZQueryReserve.Sql.Clear;
  ZQueryReserve.Sql.Add('SELECT * FROM users WHERE email = :Email;');
  ZQueryReserve.Params.ParamByName('Email').AsString := EditUserEmail.Text;

  ZQueryReserve.Open;
end;

function TFReservation.GetUserID(): Integer;
begin
   GetUserID_Impl();

  if ZQueryReserve.RecordCount < 1 then
    if MessageDlg('Email is not found, create now?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
      ZQueryReserve.Sql.Clear;
      ZQueryReserve.Sql.Add('INSERT INTO users(email, password) VALUES (:Email, "12345678")');
      ZQueryReserve.Params.ParamByName('Email').AsString := EditUserEmail.Text;
      ZQueryReserve.ExecSQL;

      GetUserID_Impl();
      
      Result := ZQueryReserve.FieldByName('id').AsInteger;
    end else
      Result := -1
  else
    Result := ZQueryReserve.FieldByName('id').AsInteger;
end;

function TFReservation.GetRoomID(): Integer;
begin
  ZQueryReserve.Close;

  ZQueryReserve.Sql.Clear;
  ZQueryReserve.Sql.Add('SELECT * FROM rooms WHERE public_id = :PublicID;');
  ZQueryReserve.Params.ParamByName('PublicID').AsString := EditRoomPublicID.Text;

  ZQueryReserve.Open;

  if ZQueryReserve.RecordCount < 1 then
    Result := -1
  else
    Result := ZQueryReserve.FieldByName('id').AsInteger;
end;

function TFReservation.IsRoomAvailable(RoomID: Integer): boolean;
begin
  ZQueryReserve.Close;

  ZQueryReserve.Sql.Clear;
  ZQueryReserve.Sql.Add('SELECT * FROM reservations WHERE room_id = :RoomID;');
  ZQueryReserve.Params.ParamByName('RoomID').AsInteger := RoomID;

  ZQueryReserve.Open;

  if ZQueryReserve.RecordCount > 0 then
    Result := False
  else
    Result := True;
end;

procedure TFReservation.CreateReservation(UserID, RoomID, DayCount: Integer);
begin
  ZQueryReserve.Sql.Clear;
  ZQueryReserve.Sql.Add('INSERT INTO reservations(user_id, room_id, day_count, created_at) VALUES (:UserID, :RoomID, :DayCount, now());');
  ZQueryReserve.Params.ParamByName('UserID').AsInteger := UserID;
  ZQueryReserve.Params.ParamByName('RoomID').AsInteger := RoomID;
  ZQueryReserve.Params.ParamByName('DayCount').AsInteger := DayCount;
  ZQueryReserve.ExecSQL;
end;

procedure TFReservation.ButtonSubmitClick(Sender: TObject);
var
  UserID: Integer;
  RoomID: Integer;
label Return;
begin
  if not (IsEmailValid()) then begin
    ShowMessage('Email is not valid');
    goto Return;
  end;

  UserID := GetUserID();

  if UserID < 0 then
    goto Return;

  RoomID := GetRoomID();

  if RoomID < 0 then begin
    ShowMessage('Public ID not found');
    goto Return;
  end;

  if not (IsRoomAvailable(RoomID)) then begin
    ShowMessage('Room is not avaiable');
    goto Return;
  end;

  CreateReservation(UserID, RoomID, StrToInt(EditDayCount.Text));

  ZQueryReserve.Close;

  ZQueryReserve.Sql.Clear;
  ZQueryReserve.Sql.Add('SELECT * FROM reservations ORDER BY created_at DESC');

  ZQueryReserve.Open;

  ShowMessage('Reservation ID: ' + ZQueryReserve.FieldByName('id').AsString);

Return:
end;

procedure TFReservation.ButtonRefreshClick(Sender: TObject);
begin
  ZQueryAvailableRoom.Refresh;
end;

end.
