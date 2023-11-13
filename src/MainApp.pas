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
    procedure VSTPanelClick(Sender: TObject);
    procedure FormDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure FormDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure VSTPanel1Click(Sender: TObject);
  private
    { Private declarations }
procedure LoadVSTPlugin(DLLName: TFileName);
procedure LoadVSTPlugin1(DLLName: TFileName); 
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
var i        : integer;
    s        : String;
    temp     : pchar;
    MenuItem : TMenuItem;
begin
  with DataModule.DataModuleVST.VSTHOST.VstPlugIns[0] do
   begin
    Active:=False;
    DLLFileName:=DLLName;
    Active:=True;
    Idle;
    ShowEdit(TForm(VSTPanel));
    Idle;
    EditIdle;
    Caption :=  GetVendorString + ' ' + GetEffectName;
   // SetLength(VSTInBuffer,numInputs);
   // SetLength(VSTOutBuffer,numOutputs);
  //  for i:=0 to numInputs-1 do SetLength(VSTInBuffer[i],VSTHost.BlockSize);
   // for i:=0 to numOutputs-1 do SetLength(VSTOutBuffer[i],VSTHost.BlockSize);
   end;
{
 while MIPrograms.Count>3 do MIPrograms.Delete(3);
 getmem(temp, 25);
 for i:=0 to VstHost[0].numPrograms-1 do
  begin
   VstHost[0].GetProgramNameIndexed(-1, i, temp);
   s := inttostr(i);
   if i < 10 then s := '00' + s else
   if i < 100 then s := '0' + s;
   s := s+' - '+StrPas(temp);
   MenuItem:=TMenuItem.Create(MIPrograms);
   with MenuItem do
    begin
     Caption:=s;
     Tag:=i;
     OnClick:=MIPresetClick;
    end;
   MIPrograms.Add(MenuItem);
  end;
 Freemem(temp);
 }
 with DataModule.DataModuleVST.VSTHOST.VstPlugIns[0].GetRect do
  begin
   VSTPanel.ClientWidth:=Right-Left;
  VSTPanel.ClientHeight:=Bottom-Top;
end;
 end;
procedure TMain.VSTPanelClick(Sender: TObject);
begin
if DataModuleVST.OD.Execute then LoadVSTPlugin(DataModuleVST.OD.FileName);
end;

procedure TMain.FormDragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
//Accept := Sender is TPanel;
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
var i        : integer;
    s        : String;
    temp     : pchar;
    MenuItem : TMenuItem;
begin
 with DataModule.DataModuleVST.VSTHOST.VstPlugIns[1] do
   begin
    Active:=False;
    DLLFileName:=DLLName;
    Active:=True;
    Idle;
    ShowEdit(TForm(VSTPanel1));
    Idle;
    EditIdle;
    Caption :=  GetVendorString + ' ' + GetEffectName;
   // SetLength(VSTInBuffer,numInputs);
   // SetLength(VSTOutBuffer,numOutputs);
  //  for i:=0 to numInputs-1 do SetLength(VSTInBuffer[i],VSTHost.BlockSize);
   // for i:=0 to numOutputs-1 do SetLength(VSTOutBuffer[i],VSTHost.BlockSize);
   end;
{
 while MIPrograms.Count>3 do MIPrograms.Delete(3);
 getmem(temp, 25);
 for i:=0 to VstHost[0].numPrograms-1 do
  begin
   VstHost[0].GetProgramNameIndexed(-1, i, temp);
   s := inttostr(i);
   if i < 10 then s := '00' + s else
   if i < 100 then s := '0' + s;
   s := s+' - '+StrPas(temp);
   MenuItem:=TMenuItem.Create(MIPrograms);
   with MenuItem do
    begin
     Caption:=s;
     Tag:=i;
     OnClick:=MIPresetClick;
    end;
   MIPrograms.Add(MenuItem);
  end;
 Freemem(temp);
 }
 with DataModule.DataModuleVST.VSTHOST.VstPlugIns[1].GetRect do
  begin
  // VSTPanel1.ClientWidth:=Right-Left;
  //VSTPanel1.ClientHeight:=Bottom-Top;

  end;

end;



end.