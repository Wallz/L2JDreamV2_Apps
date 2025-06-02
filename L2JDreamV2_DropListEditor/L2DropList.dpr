program L2DropList;

uses
  Vcl.Forms,
  Unit1 in 'Unit1.pas' {L2DropEditor},
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Carbon');
  Application.CreateForm(TL2DropEditor, L2DropEditor);
  Application.Run;
end.
