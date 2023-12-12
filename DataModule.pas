unit DataModule;

interface

uses
  SysUtils, Classes, ZAbstractConnection, ZConnection;

type
  TFDataModule = class(TDataModule)
    ZConnection: TZConnection;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FDataModule: TFDataModule;

implementation

{$R *.dfm}

end.
