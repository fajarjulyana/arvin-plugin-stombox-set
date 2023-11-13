program arvinplugin;

uses
  Forms,
  MainApp in 'src\MainApp.pas' {Main},
  AudioSeting in 'src\AudioSeting.pas' {FormSetting},
  DataModule in 'src\DataModule.pas' {DataModuleVST: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TMain, Main);
  Application.CreateForm(TFormSetting, FormSetting);
  Application.CreateForm(TDataModuleVST, DataModuleVST);
  Application.Run;
end.
