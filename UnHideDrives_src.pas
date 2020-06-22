unit UnHideDrives_src;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, registry, Vcl.ExtCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    GroupBox1: TGroupBox;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    CheckBox6: TCheckBox;
    CheckBox7: TCheckBox;
    CheckBox8: TCheckBox;
    CheckBox9: TCheckBox;
    CheckBox10: TCheckBox;
    CheckBox11: TCheckBox;
    CheckBox12: TCheckBox;
    CheckBox13: TCheckBox;
    CheckBox14: TCheckBox;
    CheckBox15: TCheckBox;
    CheckBox16: TCheckBox;
    CheckBox17: TCheckBox;
    CheckBox18: TCheckBox;
    CheckBox19: TCheckBox;
    CheckBox20: TCheckBox;
    CheckBox21: TCheckBox;
    CheckBox22: TCheckBox;
    CheckBox23: TCheckBox;
    CheckBox24: TCheckBox;
    CheckBox25: TCheckBox;
    CheckBox26: TCheckBox;
    Button2: TButton;
    Label1: TLabel;
    Timer1: TTimer;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
    procedure DetectDrives;
    procedure CheckDrives; //check current disabled drives
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}
procedure TForm1.DetectDrives;
var
drives:dword;
begin
drives:=GetLogicalDrives;
CheckBox1.Enabled:= (drives and 1)=1;
CheckBox2.Enabled:= (drives and 2)=2;
CheckBox3.Enabled:= (drives and 4)=4;
CheckBox4.Enabled:= (drives and 8)=8;
CheckBox5.Enabled:= (drives and 16)=16;
CheckBox6.Enabled:= (drives and 32)=32;
CheckBox7.Enabled:= (drives and 64)=64;
CheckBox8.Enabled:= (drives and 128)=128;
CheckBox9.Enabled:= (drives and 256)=256;
CheckBox10.Enabled:= (drives and 512)=512;
CheckBox11.Enabled:= (drives and 1024)=1024;
CheckBox12.Enabled:= (drives and 2048)=2048;
CheckBox13.Enabled:= (drives and 4096)=4096;
CheckBox14.Enabled:= (drives and 8192)=8192;
CheckBox15.Enabled:= (drives and 16384)=16384;
CheckBox16.Enabled:= (drives and 32768)=32768;
CheckBox17.Enabled:= (drives and 65536)=65536;
CheckBox18.Enabled:= (drives and 131072)=131072;
CheckBox19.Enabled:= (drives and 262144)=262144;
CheckBox20.Enabled:= (drives and 524288)=524288;
CheckBox21.Enabled:= (drives and 1048576)=1048576;
CheckBox22.Enabled:= (drives and 2097152)=2097152;
CheckBox23.Enabled:= (drives and 4194304)=4194304;
CheckBox24.Enabled:= (drives and 8388608)=8388608;
CheckBox25.Enabled:= (drives and 16777216)=16777216;
CheckBox26.Enabled:= (drives and 33554432)=33554432;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  PostMessage(FindWindow('Shell_TrayWnd',nil),WM_USER+436,0,0);
  Sleep(1000);
  Timer1.Enabled:=true;
end;

procedure TForm1.CheckDrives;
var
drives:dword;
reg: TRegistry;
begin
  reg := TRegistry.Create;
  try
    reg.RootKey:= HKEY_CURRENT_USER;
    if not reg.OpenKey('Software\Microsoft\Windows\CurrentVersion\Policies\Explorer',true) then
       begin

       end;
    try
      drives:=reg.ReadInteger('NoDrives');
    finally

    end;

    CheckBox1.Checked:= (drives and 1)=1;
    CheckBox2.Checked:= (drives and 2)=2;
    CheckBox3.Checked:= (drives and 4)=4;
    CheckBox4.Checked:= (drives and 8)=8;
    CheckBox5.Checked:= (drives and 16)=16;
    CheckBox6.Checked:= (drives and 32)=32;
    CheckBox7.Checked:= (drives and 64)=64;
    CheckBox8.Checked:= (drives and 128)=128;
    CheckBox9.Checked:= (drives and 256)=256;
    CheckBox10.Checked:= (drives and 512)=512;
    CheckBox11.Checked:= (drives and 1024)=1024;
    CheckBox12.Checked:= (drives and 2048)=2048;
    CheckBox13.Checked:= (drives and 4096)=4096;
    CheckBox14.Checked:= (drives and 8192)=8192;
    CheckBox15.Checked:= (drives and 16384)=16384;
    CheckBox16.Checked:= (drives and 32768)=32768;
    CheckBox17.Checked:= (drives and 65536)=65536;
    CheckBox18.Checked:= (drives and 131072)=131072;
    CheckBox19.Checked:= (drives and 262144)=262144;
    CheckBox20.Checked:= (drives and 524288)=524288;
    CheckBox21.Checked:= (drives and 1048576)=1048576;
    CheckBox22.Checked:= (drives and 2097152)=2097152;
    CheckBox23.Checked:= (drives and 4194304)=4194304;
    CheckBox24.Checked:= (drives and 8388608)=8388608;
    CheckBox25.Checked:= (drives and 16777216)=16777216;
    CheckBox26.Checked:= (drives and 33554432)=33554432;
  finally
    reg.CloseKey;
    reg.Free;
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
DetectDrives;
CheckDrives;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  if FindWindow('Shell_TrayWnd',nil)=0 then
  begin
    WinExec('explorer.exe', SW_NORMAL);
    Timer1.Enabled:=false;
  end;

end;

procedure TForm1.Button1Click(Sender: TObject);
var
drives: dword;
reg: tregistry;
begin
  drives:=0;
  if CheckBox1.Checked then drives:=drives+1;
  if CheckBox2.Checked then drives:=drives+2;
  if CheckBox3.Checked then drives:=drives+4;
  if CheckBox4.Checked then drives:=drives+8;
  if CheckBox5.Checked then drives:=drives+16;
  if CheckBox6.Checked then drives:=drives+32;
  if CheckBox7.Checked then drives:=drives+64;
  if CheckBox8.Checked then drives:=drives+128;
  if CheckBox9.Checked then drives:=drives+256;
  if CheckBox10.Checked then drives:=drives+512;
  if CheckBox11.Checked then drives:=drives+1024;
  if CheckBox12.Checked then drives:=drives+2048;
  if CheckBox13.Checked then drives:=drives+4096;
  if CheckBox14.Checked then drives:=drives+8192;
  if CheckBox15.Checked then drives:=drives+16384;
  if CheckBox16.Checked then drives:=drives+32768;
  if CheckBox17.Checked then drives:=drives+65536;
  if CheckBox18.Checked then drives:=drives+131072;
  if CheckBox19.Checked then drives:=drives+262144;
  if CheckBox20.Checked then drives:=drives+524288;
  if CheckBox21.Checked then drives:=drives+1048576;
  if CheckBox22.Checked then drives:=drives+2097152;
  if CheckBox23.Checked then drives:=drives+4194304;
  if CheckBox24.Checked then drives:=drives+8388608;
  if CheckBox25.Checked then drives:=drives+16777216;
  if CheckBox26.Checked then drives:=drives+33554432;


  reg := TRegistry.Create;
  try
    reg.RootKey:= HKEY_CURRENT_USER;
    if not reg.OpenKey('Software\Microsoft\Windows\CurrentVersion\Policies\Explorer',true) then
       begin

       end;
    try
      reg.WriteInteger('NoDrives',drives);
    finally

    end;

  finally
    reg.CloseKey;
    reg.Free;
  end;
end;

end.
