unit DataModule;

interface

uses
  SysUtils, Classes, DVSTHost, DASIOHost, Dialogs;

type
  TDataModuleVST = class(TDataModule)
    VSTHOST: TVstHost;
    ASIOHost1: TASIOHost;
    OD: TOpenDialog;
    OD1: TOpenDialog;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModuleVST: TDataModuleVST;

implementation

uses AudioSeting, MainApp;

{$R *.dfm}

end.
