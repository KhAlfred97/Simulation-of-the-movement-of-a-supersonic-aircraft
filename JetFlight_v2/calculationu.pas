unit calculationU;

{ $mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;
type
  //Параметры самолёта
  TPlaneParam = record
    Square,         //площадь крыла самолёта (футы в квадрате)
    Weight,         //вес самолёта (фунты)
    Cl,             //коэф. подъёмной силы
    CD : Double;    //кэф. сопротивления
  end;
  //Тип процедуры обработки результатов
  THandleResultsProc = Procedure(const altitude, velocity, angle,
    diffV, diffA: Double; const itn: integer);

//процедура для расчёта движения реактивного самолёта
procedure calculation(  var aPlaneParam: TPlaneParam;
                        const aAngle, aVel, aZStart, aZMax, aH, aTol: double;
                        aProc: THandleResultsProc);
implementation
uses math;
const
  GRAV  = 32.174;   //ускорение свободного падения
  ITN   = 10;       //максимальное количество итераций

//плотность воздуха,зависит от высоты
function DenstyF(const z: double): double; inline;
begin
  DenstyF := 0.0023769 * exp((-z) / 23600);
end;
//тяга двигателей
function ThrustF(const v,z: double): double; inline;
begin
  ThrustF := (1 + 0.5 * exp(-sqr(0.001 * V - 1.5))) * (10000 - 0.27 * z);
end;
// Первое уравнение движения самолета. rho-плотность
function FF(var aPP: TPlaneParam; const V, A, Z: double): double;
begin
  FF := (GRAV * (ThrustF(V, Z){=T} - (aPP.Weight * sin(A))
        - 0.5 * aPP.Cd * DenstyF(Z){=rho} * aPP.Square * sqr(V))) / (aPP.Weight * V * sin(A));
end;
// Второе уравнение движения самолета.
function GF(var aPP: TPlaneParam; const V, A, Z: double): double;
begin
 GF := (GRAV * (0.5 * aPP.Cl * DenstyF(Z){=rho} * aPP.Square * sqr(V)
        - (aPP.Weight * cos(A)))) / (aPP.Weight * sqr(V) * sin(A));
end;

//основная процедура вычисления
procedure calculation(var aPlaneParam: TPlaneParam; const aAngle, aVel, aZStart, aZMax,
  aH, aTol: double; aProc: THandleResultsProc);
var
  Z, Z1,
  V, V1, V0, VNew, VV, V20,
  ARad, ARad1, ARad0, ANew,  AA, ARad20,
  F, G,
  DiffV, DiffA : Double;
  iter: integer;
begin
 if (aH = 0) or not(Assigned(aProc)) then exit;
 //печатаем параметры на высоте Z0
 aProc(aZStart, aVel, aAngle, 0.0, 0.0, 0);
 //расчёт параметров на нв высоте Z0+h
 Z:= aZStart + aH;
 ARad:=degtorad(aAngle); //расчёты в радианах
 F:=FF(aPlaneParam, aVel, ARad, aZStart);
 G:=GF(aPlaneParam, aVel, ARad, aZStart);
 //предсказание
 VV:=aVel + aH * F;
 AA:=ARad + aH * G;
 //коррекия
 V:= aVel + 0.5 * aH *(F + FF(aPlaneParam, VV, AA, Z));
 ARad:= ARad + 0.5 * aH *(G + GF(aPlaneParam, VV, AA, Z)) ;
 //печатаем параметры на высоте Z0 + h
 aProc(Z, V, radtodeg(ARad), 0.0, 0.0, 0);

 //расчёт остальных высот
 //для сохраняем параметры при Z1 и Z0
 Z1:= Z;
 V0:= aVel; V1:= V;
 ARad0:= degtorad(aAngle); ARad1:= ARad;

 while Z < aZMax do begin
   Z:= Z + aH;
   F:=FF(aPlaneParam, V1, ARad1, Z1);
   G:=GF(aPlaneParam, V1, ARad1, Z1);
   //предсказание
   V:= V0 + 2.0 * aH * F; V20:= V;          {V2 = V20}
   ARad:= ARad0 + 2.0 * aH * G; Arad20 := ARad;    {A2 = A20}
   //коррекция
   iter:= ITN; //не больше 10 итераций
   while True do  begin
     dec(iter);
     if iter = 0 then begin    //не сошлось
       //break;
       exit; // выходим из подпрограммы
     end;
     VNew:= V1 + 0.5 * aH * (F + FF(aPlaneParam, V, ARad, Z));
     ANew:= ARad1 + 0.5 * aH * (G + GF(aPlaneParam, V, ARad, Z));
     //если попадаем в точность, то выходим из цикла
     if (abs((V - VNew)/ VNew) < aTol) and (abs((ARad - ANew)/ANew) < aTol) then begin
       break; //выходим из цикла
     end;
     V:= VNew;
     ARad:= ANew;
   end;
   //окончательная коррекция
   DiffV:= 0.2 * (V20 - VNew);
   DiffA:= 0.2 * (ARad20 - ANew);
   V:= VNew + DiffV;
   ARad:= ANew + DiffA;
   //вывод параметров на высоте Z
   aProc(z, V, radtodeg(ARad), DiffV, radtodeg(DiffA), ITN - iter);
   //готовимся  к расчёту след. высоты
   Z1:= Z;
   V0:= V1; V1:= V;
   ARad0:= Arad1; ARad1:=ARad;
 end;

end;

begin

end.

