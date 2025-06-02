program SQLCreator;

uses
  Vcl.Forms,
  Unit1 in 'Unit1.pas' {Main},
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}
{$WEAKLINKRTTI ON}
{$RTTI EXPLICIT METHODS([]) PROPERTIES([]) FIELDS([])}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Carbon');
  Application.CreateForm(TMain, Main);
  Application.Run;
end.
