program JetFlightApp;

{%TogetherDiagram 'ModelSupport_JetFlightApp\default.txaPackage'}

uses
  Forms,
  fmMainJFAppUnit in 'fmMainJFAppUnit.pas' {fmMainJFApp},
  calculationu in 'calculationu.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfmMainJFApp, fmMainJFApp);
  Application.Run;
end.
