unit fmMainJFAppUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, ExtCtrls, StdCtrls;

type
  TfmMainJFApp = class(TForm)
    pnlSources: TPanel;
    sgrResults: TStringGrid;
    grbFlight: TGroupBox;
    grbSource: TGroupBox;
    pnlButtons: TPanel;
    btnRun: TButton;
    lbWeightInfo: TLabel;
    lbSquareInfo: TLabel;
    lbC1Info: TLabel;
    lbC2Info: TLabel;
    edtWeight: TEdit;
    edtSquare: TEdit;
    edtC1: TEdit;
    edtC2: TEdit;
    lblVelocityStartInfo: TLabel;
    edtVelocityStart: TEdit;
    lblHiegthStartInfo: TLabel;
    edtHeightStart: TEdit;
    edtHeightMax: TEdit;
    lblHeightMaxInfo: TLabel;
    lblStepInfo: TLabel;
    edtStep: TEdit;
    lblAngleStartInfo: TLabel;
    edtAngleStart: TEdit;
    edtTolerance: TEdit;
    lblToleranceInfo: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure btnRunClick(Sender: TObject);

  private
    { Private declarations }
    procedure makePlaneParam;
  public
    { Public declarations }
  end;

var
  fmMainJFApp: TfmMainJFApp;

implementation

{$R *.dfm}
uses calculationU;
var
  plane: TPlaneParam;

//процедура обработки результатов расчёта
procedure HandleResults(const altitude, velocity, angle, diffV, diffA: Double;
const itn: integer);
begin
  //к нам приезжают параметры - записывем их в TStringgrid
  with fmMainJFApp.sgrResults do begin

    Cells[0, RowCount -1]:= FloatToStr(altitude);
    Cells[1, RowCount -1]:= FloatToStr(velocity);
    Cells[2, RowCount -1]:= FloatToStr(angle);
    Cells[3, RowCount -1]:= FloatToStr(diffV);
    Cells[4, RowCount -1]:= FloatToStr(diffA);
    Cells[5, RowCount -1]:= IntToStr(itn);
    RowCount:= RowCount +1; // последняя строка всегда будет пустой
  end;

end;

procedure TfmMainJFApp.btnRunClick(Sender: TObject);
begin
  //считываем параметры самолёта
  makePlaneParam;
  //сбрасываем параметры TStringGrid
  self.sgrResults.ColCount:= 6;
  self.sgrResults.RowCount:= 2;
  //стартуем расчёт
  calculation(plane, StrToFloat(edtAngleStart.text),StrToFloat(edtVelocityStart.text),
  StrToFloat(edtHeightStart.Text), StrToFloat(edtHeightMax.Text), StrToFloat(edtStep.Text),
  StrToFloat(edtTolerance.Text),@HandleResults);

  //удаляем лишнюю строку в конце TStringGrid
  self.sgrResults.RowCount:= self.sgrResults.RowCount - 1;
end;
//настройка визульных элементов формы
procedure TfmMainJFApp.FormCreate(Sender: TObject);
begin
  //заголовки для StringGrid
  with self.sgrResults do begin
    Cells[0,0]:= 'Высота';
    Cells[1,0]:= 'Скорость';
    Cells[2,0]:= 'Угол';
    Cells[3,0]:= 'Ошибка ограничения DiffV';
    Cells[4,0]:= 'Ошибка ограничения DiffA';
    Cells[5,0]:= 'Счётчик итераций';
  end;

end;

procedure TfmMainJFApp.makePlaneParam;
begin
    with plane do begin
    Square:= StrToFloat(edtSquare.Text);
    Weight:= StrToFloat(edtWeight.Text);
    Cl:= StrToFloat(edtC1.Text);
    CD:= StrToFloat(edtC2.Text);
  end;
end;

end.
