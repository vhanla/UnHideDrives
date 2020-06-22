unit UnHideDrives_src;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, registry, Vcl.ExtCtrls,
  ShDocVw, ShlObj, ActiveX {listexplorerinstances},
  TlHelp32 {isexplorerrunning},
  ShellApi {shellexecute};

type
  TForm1 = class(TForm)
    btnSaveChanges: TButton;
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
    btnRestartExplorer: TButton;
    tmrExplorerRestorer: TTimer;
    ListBox1: TListBox;
    chkRestoreExplorerInstances: TCheckBox;
    LinkLabel1: TLinkLabel;
    chkToggleDrives: TCheckBox;
    procedure btnSaveChangesClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tmrExplorerRestorerTimer(Sender: TObject);
    procedure btnRestartExplorerClick(Sender: TObject);
    procedure LinkLabel1LinkClick(Sender: TObject; const Link: string;
      LinkType: TSysLinkType);
    procedure chkToggleDrivesClick(Sender: TObject);
  private
    { Private declarations }
    procedure DetectDrives;
    procedure CheckDrives; //check current disabled drives
    procedure ListRunningExplorerInstances;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}
function IsExplorerRunning: Boolean;
var
  SnapProcHandle: THandle;
  ProcEntry: TProcessEntry32;
  NextProc: Boolean;
begin
  Result := False;

  SnapProcHandle := CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);

  if SnapProcHandle = INVALID_HANDLE_VALUE then
    Exit;

  ProcEntry.dwSize := SizeOf(TProcessEntry32);
  NextProc := Process32First(SnapProcHandle, ProcEntry);
  while NextProc do begin
    if UpperCase(StrPas(ProcEntry.szExeFile)) = 'EXPLORER.EXE' then
    begin
      Result := True;
      Break;
    end;
    NextProc := Process32Next(SnapProcHandle, ProcEntry);
  end;
  CloseHandle(SnapProcHandle);
end;

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

procedure TForm1.btnRestartExplorerClick(Sender: TObject);
begin
  ListRunningExplorerInstances;
//  PostMessage(FindWindow('Shell_TrayWnd',nil),WM_USER+436,0,0);
  Sleep(100);
  // make sure to kill all explorer instances, twice if necessary
  WinExec(PAnsiChar('taskkill /f /im explorer.exe'), SW_HIDE);
  WinExec(PAnsiChar('taskkill /f /im explorer.exe'), SW_HIDE);
  Sleep(100);
  tmrExplorerRestorer.Enabled:=true;
end;

procedure TForm1.CheckDrives;
var
drives:dword;
reg: TRegistry;
begin
  drives := 0;
  reg := TRegistry.Create;
  try
    reg.RootKey:= HKEY_CURRENT_USER;
    reg.OpenKeyReadOnly('Software\Microsoft\Windows\CurrentVersion\Policies\Explorer');
    if reg.ValueExists('NoDrives') then
    begin
      drives:=reg.ReadInteger('NoDrives');
    end;
    // there's no need to show info about NoDrives existence

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

procedure TForm1.chkToggleDrivesClick(Sender: TObject);
begin
  if CheckBox1.Enabled then CheckBox1.Checked:= chkToggleDrives.Checked;
  if CheckBox2.Enabled then CheckBox2.Checked:= chkToggleDrives.Checked;
  if CheckBox3.Enabled then CheckBox3.Checked:= chkToggleDrives.Checked;
  if CheckBox4.Enabled then CheckBox4.Checked:= chkToggleDrives.Checked;
  if CheckBox5.Enabled then CheckBox5.Checked:= chkToggleDrives.Checked;
  if CheckBox6.Enabled then CheckBox6.Checked:= chkToggleDrives.Checked;
  if CheckBox7.Enabled then CheckBox7.Checked:= chkToggleDrives.Checked;
  if CheckBox8.Enabled then CheckBox8.Checked:= chkToggleDrives.Checked;
  if CheckBox9.Enabled then CheckBox9.Checked:= chkToggleDrives.Checked;
  if CheckBox10.Enabled then CheckBox10.Checked:= chkToggleDrives.Checked;
  if CheckBox11.Enabled then CheckBox11.Checked:= chkToggleDrives.Checked;
  if CheckBox12.Enabled then CheckBox12.Checked:= chkToggleDrives.Checked;
  if CheckBox13.Enabled then CheckBox13.Checked:= chkToggleDrives.Checked;
  if CheckBox14.Enabled then CheckBox14.Checked:= chkToggleDrives.Checked;
  if CheckBox15.Enabled then CheckBox15.Checked:= chkToggleDrives.Checked;
  if CheckBox16.Enabled then CheckBox16.Checked:= chkToggleDrives.Checked;
  if CheckBox17.Enabled then CheckBox17.Checked:= chkToggleDrives.Checked;
  if CheckBox18.Enabled then CheckBox18.Checked:= chkToggleDrives.Checked;
  if CheckBox19.Enabled then CheckBox19.Checked:= chkToggleDrives.Checked;
  if CheckBox20.Enabled then CheckBox20.Checked:= chkToggleDrives.Checked;
  if CheckBox21.Enabled then CheckBox21.Checked:= chkToggleDrives.Checked;
  if CheckBox22.Enabled then CheckBox22.Checked:= chkToggleDrives.Checked;
  if CheckBox23.Enabled then CheckBox23.Checked:= chkToggleDrives.Checked;
  if CheckBox24.Enabled then CheckBox24.Checked:= chkToggleDrives.Checked;
  if CheckBox25.Enabled then CheckBox25.Checked:= chkToggleDrives.Checked;
  if CheckBox26.Enabled then CheckBox26.Checked:= chkToggleDrives.Checked;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  DetectDrives;
  CheckDrives;
  ListRunningExplorerInstances;
end;

procedure TForm1.LinkLabel1LinkClick(Sender: TObject; const Link: string;
  LinkType: TSysLinkType);
begin
  ShellExecute(0, PChar('OPEN'), PChar(Link), nil, nil, SW_SHOWNORMAL);
end;

procedure TForm1.ListRunningExplorerInstances;
const
  IID_IServiceProvider: TGUID = '{6D5140C1-7436-11CE-8034-00AA006009FA}';
  SID_STopLevelBrowser: TGUID = '{4C96BE40-915C-11CF-99D3-00AA004AE837}';
var
  ShellWindows: IShellWindows;
  I: Integer;
  ShellBrowser: IShellBrowser;
  WndIface: IDispatch;
  WebBrowserApp: IWebBrowserApp;
  ServiceProvider: IServiceProvider;
  ItemIDList: PItemIDList;
  bar: HWND;
  ShellView: IShellView;
  FolderView: IFolderView;
  PersistFolder2: IPersistFolder2;
  ShellFolder: IShellFolder;
  focus: Integer;
  ret: _STRRET;
  folderPath: PChar;
  AMalloc: IMalloc;
begin
  ListBox1.Items.BeginUpdate;
  ListBox1.Items.Clear;
  if Succeeded(CoCreateInstance(CLASS_ShellWindows, nil, CLSCTX_LOCAL_SERVER,
    IID_IShellWindows, ShellWindows)) then
  begin
    for I := 0 to ShellWindows.Count - 1 do
    begin
      if VarType(ShellWindows.Item(I)) = varDispatch then
      begin
      WndIface := ShellWindows.Item(VarAsType(I, VT_I4));

        try
        if Succeeded(WndIface.QueryInterface(IID_IWebBrowserApp, WebBrowserApp)) then
        begin
          begin
            if Succeeded(WebBrowserApp.QueryInterface(IID_IServiceProvider,
              ServiceProvider)) then
            begin
              if Succeeded(ServiceProvider.QueryService(SID_STopLevelBrowser,
                IID_IShellBrowser, ShellBrowser)) then
              begin
                if Succeeded(ShellBrowser.QueryActiveShellView(ShellView)) then
                begin
                  if Succeeded(ShellView.QueryInterface(IID_IFolderView, FolderView)) then
                  begin
                    FolderView.GetFocusedItem(focus);
                    FolderView.Item(focus,ItemIDList);
                    if Succeeded(FolderView.GetFolder(IID_IPersistFolder2, PersistFolder2)) then
                    begin
                      if succeeded(PersistFolder2.GetCurFolder(ItemIDList)) then
                      //if Succeeded(PersistFolder2.QueryInterface(IID_IShellFolder, ShellFolder)) then
                      begin
                        //ShellFolder.GetDisplayNameOf(ItemIDList, SHGDN_FORPARSING, ret);
                        //ListBox1.Items.Add(ret.pOleStr);
                        folderPath := StrAlloc(MAX_PATH);
                        if SHGetPathFromIDList(ItemIDList, folderPath) then
                          ListBox1.Items.Add(folderPath);
                        SHGetMalloc(AMalloc);
                        AMalloc.Free(ItemIDList);
                        StrDispose(folderPath);
                      end;
                    end;
                  end;
                end;

              end;

            end;
          end;
        end;
        except
        end;
      end;

    end;
  end;
  ListBox1.Items.EndUpdate;
end;

procedure TForm1.tmrExplorerRestorerTimer(Sender: TObject);
var
  I: Integer;
begin
  if IsExplorerRunning then
    tmrExplorerRestorer.Enabled := False
  else
  begin
    // since restarting Windows File Explorer from an elevated process might incur inheriting
    // its permissions, /NOUACCHECK is the only way (in Windows 10 at least) to allow it so
    // otherwise CreateExplorerShellUnelevatedTask will prevent explorer.exe to start with
    // elevated privileges (at least on Windows 10)

    ShellExecute(0, PCHAR('OPEN') ,PChar(GetEnvironmentVariable('WINDIR')+'\explorer.exe'), nil, nil, SW_NORMAL);
    if chkRestoreExplorerInstances.Checked then
    begin
      for I := 0 to ListBox1.Count - 1 do
      begin
        if DirectoryExists(ListBox1.Items[I]) then
          ShellExecute(0, 'OPEN', PChar(ListBox1.Items[I]), nil, nil, SW_SHOWNORMAL);
      end;
    end;
  end;
end;

procedure TForm1.btnSaveChangesClick(Sender: TObject);
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
    reg.OpenKey('Software\Microsoft\Windows\CurrentVersion\Policies\Explorer',true);
    try
      reg.WriteInteger('NoDrives',drives);
    except
      raise Exception.Create('Couldn''t create NoDrives value.');
    end;
    if reg.ValueExists('NoDrives') then
    begin
      MessageDlg('Changes successfully applied, please restart Windows File Explorer', mtInformation,[mbOK], 0);
    end;

  finally
    reg.CloseKey;
    reg.Free;
  end;
end;

end.
