unit MasterData;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, SMDBGrid, DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, ExtCtrls, SMDBCtrl, SMDBFltr, SMDBFind,
  mxExport, frxClass, frxDBSet;

type
  TFMasterData = class(TForm)
    SMDBGridUser: TSMDBGrid;
    Label1: TLabel;
    Label2: TLabel;
    SMDBGridRoom: TSMDBGrid;
    Label3: TLabel;
    SMDBGridReservation: TSMDBGrid;
    DataSourceUser: TDataSource;
    ZQueryUser: TZQuery;
    ZQueryRoom: TZQuery;
    DataSourceRoom: TDataSource;
    ZQueryReservation: TZQuery;
    DataSourceReservation: TDataSource;
    
    ZQueryReservationid: TLargeintField;
    ZQueryReservationuser_id: TLargeintField;
    ZQueryReservationroom_id: TLargeintField;
    ZQueryReservationday_count: TLargeintField;
    ZQueryReservationcreated_at: TDateTimeField;
    ZQueryReservationtotal_price: TFloatField;
    ZQueryReservationroom_price: TFloatField;
    ZQueryReservationroom_public_id: TStringField;
    ZQueryReservationuser_email: TStringField;
    
    SMDBNavigatorUser: TSMDBNavigator;
    SMDBFilterDialogUser: TSMDBFilterDialog;
    SMDBFindDialogUser: TSMDBFindDialog;
    mxDBGridExportUser: TmxDBGridExport;
    frxDBDatasetUser: TfrxDBDataset;
    frxReportUser: TfrxReport;
    
    SMDBNavigatorRoom: TSMDBNavigator;
    SMDBFindDialogRoom: TSMDBFindDialog;
    SMDBFilterDialogRoom: TSMDBFilterDialog;
    mxDBGridExportRoom: TmxDBGridExport;
    frxReportRoom: TfrxReport;
    frxDBDatasetRoom: TfrxDBDataset;
    
    SMDBNavigatorReservation: TSMDBNavigator;
    SMDBFilterDialogReservation: TSMDBFilterDialog;
    SMDBFindDialogReservation: TSMDBFindDialog;
    mxDBGridExportReservation: TmxDBGridExport;
    frxReportReservation: TfrxReport;
    frxDBDatasetReservation: TfrxDBDataset;
    procedure ZQueryReservationCalcFields(DataSet: TDataSet);
    procedure SMDBNavigatorUserClick(Sender: TObject;
      Button: TSMNavigateBtn);
    procedure SMDBNavigatorRoomClick(Sender: TObject;
      Button: TSMNavigateBtn);
    procedure SMDBNavigatorReservationClick(Sender: TObject;
      Button: TSMNavigateBtn);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMasterData: TFMasterData;

implementation

{$R *.dfm}

procedure TFMasterData.ZQueryReservationCalcFields(DataSet: TDataSet);
begin
  ZQueryReservationtotal_price.Value := ZQueryReservationroom_price.Value * ZQueryReservationday_count.Value;
end;

procedure TFMasterData.SMDBNavigatorUserClick(Sender: TObject;
  Button: TSMNavigateBtn);
begin
  case Button of
    sbFilter: SMDBFilterDialogUser.Execute;
    sbFind: SMDBFindDialogUser.Execute;
    sbExport: mxDBGridExportUser.Select;
    sbPrint: begin
      frxReportUser.LoadFromFile('UserReport.fr3');
      frxReportUser.ShowReport();
    end;
  end;
end;

procedure TFMasterData.SMDBNavigatorRoomClick(Sender: TObject;
  Button: TSMNavigateBtn);
begin
  case Button of
    sbFilter: SMDBFilterDialogRoom.Execute;
    sbFind: SMDBFindDialogRoom.Execute;
    sbExport: mxDBGridExportRoom.Select;
    sbPrint: begin
      frxReportRoom.LoadFromFile('RoomReport.fr3');
      frxReportRoom.ShowReport();
    end;
  end;
end;

procedure TFMasterData.SMDBNavigatorReservationClick(Sender: TObject;
  Button: TSMNavigateBtn);
begin
  case Button of
    sbFilter: SMDBFilterDialogReservation.Execute;
    sbFind: SMDBFindDialogReservation.Execute;
    sbExport: mxDBGridExportReservation.Select;
    sbPrint: begin
      frxReportReservation.LoadFromFile('ReservationReport.fr3');
      frxReportReservation.ShowReport();
    end;
  end;
end;

end.
