program UnHideDrives;

{$R *.dres}

uses
  Vcl.Forms,
  UnHideDrives_src in 'UnHideDrives_src.pas' {Form1};

{$R UnHideDrives.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Un/Hide Drives';
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
