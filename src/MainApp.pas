unit MainApp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Menus, ComCtrls;

type
  TMain = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    MainMenu1: TMainMenu;
    Preferensi1: TMenuItem;
    PengaturanSuara1: TMenuItem;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    Panel10: TPanel;
    Panel11: TPanel;
    Panel12: TPanel;
    VSTPanel: TPanel;
    VSTPanel1: TPanel;
    VSTPanel3: TPanel;
    VSTPanel2: TPanel;
    procedure PengaturanSuara1Click(Sender: TObject);
    procedure FormDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure FormDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure VSTPanel1Click(Sender: TObject);
    procedure VSTPanel2Click(Sender: TObject);
    procedure VSTPanelClick(Sender: TObject);
    procedure VSTPanel3Click(Sender: TObject);
  private
    { Private declarations }
procedure LoadVSTPlugin(DLLName: TFileName);
procedure LoadVSTPlugin1(DLLName: TFileName);
procedure LoadVSTPlugin2(DLLName: TFileName);
procedure LoadVSTPlugin3(DLLName: TFileName);
  public
    { Public declarations }
  end;

var
  Main: TMain;

implementation

uses AudioSeting, DataModule;

{$R *.dfm}

procedure TMain.PengaturanSuara1Click(Sender: TObject);
begin
FormSetting.ShowModal;
end;

procedure TMain.LoadVSTPlugin(DLLName: TFileName);
var
  i        : integer;
  s        : String;
  temp     : pchar;
  MenuItem : TMenuItem;
begin
  // Menggunakan objek VSTHost untuk memanipulasi plugin VST pada Panel utama
  with DataModule.DataModuleVST.VSTHOST.VstPlugIns[0] do
  begin
    // Menonaktifkan plugin VST, mengatur nama file DLL, dan mengaktifkannya kembali
    Active := False;
    DLLFileName := DLLName;
    Active := True;
    // Melakukan proses idle untuk memastikan plugin siap digunakan
    Idle;
    // Menampilkan antarmuka pengaturan plugin VST pada VSTPanel
    ShowEdit(TForm(VSTPanel));
    Idle;
    EditIdle;
    // Mengatur teks caption dengan informasi vendor dan nama efek plugin
    Caption := GetVendorString + ' ' + GetEffectName;
  end;

  // Mendapatkan dan mengatur dimensi VSTPanel sesuai dengan antarmuka plugin VST
  with DataModule.DataModuleVST.VSTHOST.VstPlugIns[0].GetRect do
  begin
    VSTPanel.ClientWidth := Right - Left;
    VSTPanel.ClientHeight := Bottom - Top;
  end;
end;

procedure TMain.FormDragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
  // Metode ini sekarang tidak diimplementasikan, namun dapat ditambahkan fungsionalitasnya
  // Sesuaikan dengan kebutuhan aplikasi, contohnya: Accept := Sender is TPanel;
end;


procedure TMain.FormDragDrop(Sender, Source: TObject; X, Y: Integer);
begin
//(Sender as TPanel).PopupMenu((Source as TPanel).PopupMenu);
end;

procedure TMain.VSTPanel1Click(Sender: TObject);
begin
if DataModuleVST.OD1.Execute then LoadVSTPlugin1(DataModuleVST.OD1.FileName);
end;

procedure TMain.LoadVSTPlugin1(DLLName: TFileName);
var
  i        : integer;
  s        : String;
  temp     : pchar;
  MenuItem : TMenuItem;
begin
  // Menggunakan objek VSTHost untuk memanipulasi plugin VST pada Panel VSTPanel1
  with DataModule.DataModuleVST.VSTHOST.VstPlugIns[1] do
  begin
    // Menonaktifkan plugin VST, mengatur nama file DLL, dan mengaktifkannya kembali
    Active := False;
    DLLFileName := DLLName;
    Active := True;
    // Melakukan proses idle untuk memastikan plugin siap digunakan
    Idle;
    // Menampilkan antarmuka pengaturan plugin VST pada VSTPanel1
    ShowEdit(TForm(VSTPanel1));
    Idle;
    EditIdle;
    // Mengatur teks caption dengan informasi vendor dan nama efek plugin
    Caption := GetVendorString + ' ' + GetEffectName;
  end;

  // Mendapatkan dan mengatur dimensi VSTPanel1 sesuai dengan antarmuka plugin VST
  with DataModule.DataModuleVST.VSTHOST.VstPlugIns[1].GetRect do
  begin
    // Dimensi dapat diatur sesuai kebutuhan, misalnya:
    // VSTPanel1.ClientWidth := Right - Left;
    // VSTPanel1.ClientHeight := Bottom - Top;
  end;

  { Contoh kode untuk menambahkan menu preset jika diperlukan }
  {while MIPrograms.Count > 3 do MIPrograms.Delete(3);
  getmem(temp, 25);
  for i := 0 to VstHost[0].numPrograms - 1 do
  begin
    VstHost[0].GetProgramNameIndexed(-1, i, temp);
    s := inttostr(i);
    if i < 10 then s := '00' + s else
      if i < 100 then s := '0' + s;
    s := s + ' - ' + StrPas(temp);
    MenuItem := TMenuItem.Create(MIPrograms);
    with MenuItem do
    begin
      Caption := s;
      Tag := i;
      OnClick := MIPresetClick;
    end;
    MIPrograms.Add(MenuItem);
  end;
  Freemem(temp);}
end;
procedure TMain.LoadVSTPlugin2(DLLName: TFileName);
var
  i        : integer;
  s        : String;
  temp     : pchar;
  MenuItem : TMenuItem;
begin
  // Menggunakan objek VSTHost untuk memanipulasi plugin VST pada Panel VSTPanel2
  with DataModule.DataModuleVST.VSTHOST.VstPlugIns[2] do
  begin
    // Menonaktifkan plugin VST, mengatur nama file DLL, dan mengaktifkannya kembali
    Active := False;
    DLLFileName := DLLName;
    Active := True;
    // Melakukan proses idle untuk memastikan plugin siap digunakan
    Idle;
    // Menampilkan antarmuka pengaturan plugin VST pada VSTPanel2
    ShowEdit(TForm(VSTPanel2));
    Idle;
    EditIdle;
    // Mengatur teks caption dengan informasi vendor dan nama efek plugin
    Caption := GetVendorString + ' ' + GetEffectName;
  end;

  // Mendapatkan dan mengatur dimensi VSTPanel2 sesuai dengan antarmuka plugin VST
  with DataModule.DataModuleVST.VSTHOST.VstPlugIns[2].GetRect do
  begin
    // Dimensi dapat diatur sesuai kebutuhan, misalnya:
    VSTPanel2.ClientWidth := Right - Left;
    VSTPanel2.ClientHeight := Bottom - Top;
  end;

  { Contoh kode untuk menambahkan menu preset jika diperlukan }
  {while MIPrograms.Count > 3 do MIPrograms.Delete(3);
  getmem(temp, 25);
  for i := 0 to VstHost[0].numPrograms - 1 do
  begin
    VstHost[0].GetProgramNameIndexed(-1, i, temp);
    s := inttostr(i);
    if i < 10 then s := '00' + s else
      if i < 100 then s := '0' + s;
    s := s + ' - ' + StrPas(temp);
    MenuItem := TMenuItem.Create(MIPrograms);
    with MenuItem do
    begin
      Caption := s;
      Tag := i;
      OnClick := MIPresetClick;
    end;
    MIPrograms.Add(MenuItem);
  end;
  Freemem(temp);}
end;
procedure TMain.VSTPanel2Click(Sender: TObject);
begin
if DataModuleVST.OD.Execute then LoadVSTPlugin2(DataModuleVST.OD.FileName);
end;

procedure TMain.VSTPanelClick(Sender: TObject);
begin
if DataModuleVST.OD.Execute then LoadVSTPlugin(DataModuleVST.OD.FileName);
end;

procedure TMain.VSTPanel3Click(Sender: TObject);
begin
if DataModuleVST.OD.Execute then LoadVSTPlugin3(DataModuleVST.OD.FileName);
end;

procedure TMain.LoadVSTPlugin3(DLLName: TFileName);
var
  i        : integer;
  s        : String;
  temp     : pchar;
  MenuItem : TMenuItem;
begin
  // Menggunakan objek VSTHost untuk memanipulasi plugin VST pada Panel VSTPanel3
  with DataModule.DataModuleVST.VSTHOST.VstPlugIns[3] do
  begin
    // Menonaktifkan plugin VST, mengatur nama file DLL, dan mengaktifkannya kembali
    Active := False;
    DLLFileName := DLLName;
    Active := True;
    // Melakukan proses idle untuk memastikan plugin siap digunakan
    Idle;
    // Menampilkan antarmuka pengaturan plugin VST pada VSTPanel3
    ShowEdit(TForm(VSTPanel3));
    Idle;
    EditIdle;
    // Mengatur teks caption dengan informasi vendor dan nama efek plugin
    Caption := GetVendorString + ' ' + GetEffectName;
  end;

  // Mendapatkan dan mengatur dimensi VSTPanel3 sesuai dengan antarmuka plugin VST
  with DataModule.DataModuleVST.VSTHOST.VstPlugIns[3].GetRect do
  begin
    // Dimensi dapat diatur sesuai kebutuhan, misalnya:
    VSTPanel3.ClientWidth := Right - Left;
    VSTPanel3.ClientHeight := Bottom - Top;
  end;

  { Contoh kode untuk menambahkan menu preset jika diperlukan }
  {while MIPrograms.Count > 3 do MIPrograms.Delete(3);
  getmem(temp, 25);
  for i := 0 to VstHost[0].numPrograms - 1 do
  begin
    VstHost[0].GetProgramNameIndexed(-1, i, temp);
    s := inttostr(i);
    if i < 10 then s := '00' + s else
      if i < 100 then s := '0' + s;
    s := s + ' - ' + StrPas(temp);
    MenuItem := TMenuItem.Create(MIPrograms);
    with MenuItem do
    begin
      Caption := s;
      Tag := i;
      OnClick := MIPresetClick;
    end;
    MIPrograms.Add(MenuItem);
  end;
  Freemem(temp);}
end;

end.
