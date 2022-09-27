//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Unit1.h"
#include <math.h>
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TForm1 *Form1;
float g,w,cd,cl,s,v0,z0,r0,shug,hmax,eps,V1,R1,V2,R2,V2new,R2new;
int n,ro;
//---------------------------------------------------------------------------

//---------------------------------------------------------------------------
__fastcall TForm1::TForm1(TComponent* Owner)
        : TForm(Owner)
{
}
//---------------------------------------------------------------------------



void __fastcall TForm1::Button1Click(TObject *Sender)
{
g = StrToFloat(Edit1->Text);
w = StrToFloat(Edit2->Text);
cd = StrToFloat(Edit3->Text);
cl = StrToFloat(Edit4->Text);
s = StrToFloat(Edit5->Text);
}
//---------------------------------------------------------------------------

void __fastcall TForm1::Button2Click(TObject *Sender)
{
v0 = StrToFloat(Edit6->Text);
z0 = StrToFloat(Edit7->Text);
r0 = StrToFloat(Edit8->Text);
r0 = r0*M_PI/180;
shug = StrToFloat(Edit9->Text);
hmax = StrToFloat(Edit10->Text);
eps = StrToFloat(Edit11->Text);
n = StrToInt(Edit12->Text);
}
//---------------------------------------------------------------------------

void __fastcall TForm1::Button3Click(TObject *Sender)
{
 StringGrid1->Cells[0][0]="������";
 StringGrid1->Cells[0][1]=FloatToStr(z0);
 StringGrid1->Cells[1][0]="��������";
 StringGrid1->Cells[1][1]=FloatToStr(v0);
 StringGrid1->Cells[2][0]="����";
 StringGrid1->Cells[2][1]=FloatToStr(r0/M_PI*180);
 StringGrid1->Cells[3][0]="����";
 StringGrid1->Cells[4][0]="��������� �������";
 StringGrid1->Cells[5][0]="���������� ���������� �� x";

//--------------------������������ ����� ������-------------------------------
float F,F1,G,G1,t,ro;
  float x=0;

for (int i=2;z0<hmax;i++)
{
  //���������� ��������� �������
  float ro0=2.3769*0.001;
  ro=ro0*exp(((-1)*z0)/(2.36*10000));
  //���������� ���� ����
  t=(1+0.5*(1/exp((v0*0.001-1.5)*(v0*0.001-1.5))))*(10000-0.27*z0);
  //���������� F(V0,R0)
float D;
  D=0.5*cd*ro*s*v0*v0;
  F=g*(t-(w*(sin(r0)))-D)/(w*v0*sin(r0));
  //���������� G(V0,R0)
float L;
  L=0.5*cl*ro*s*v0*v0;
  G=(g*(L-w*cos(r0)))/(w*v0*v0*sin(r0));
float Vtemp, Rtemp;
  Vtemp=v0+shug*F;
  Rtemp=r0+shug*G;
  //���������� ���� ���� ��� ����� �������� ��������
  t=(1+0.5*(1/exp((Vtemp*0.001-1.5)*(Vtemp*0.001-1.5))))*(10000-0.27*z0);
  //���������� F(V0+hF(V0,R0),R0+hG(V0,R0))
  D=0.5*cd*ro*s*Vtemp*Vtemp;
  F1=g*(t-(w*(sin(Rtemp)))-D)/(w*Vtemp*sin(Rtemp));
  //���������� G(V0+hF(V0,R0),R0+hG(V0,R0))
  L=0.5*cl*ro*s*Vtemp*Vtemp;
  G1=(g*(L-w*cos(Rtemp)))/(w*Vtemp*Vtemp*sin(Rtemp));
  //������ �������� � ���� � ������� ������ ������
  V1=v0+((shug/2)*(F1+F));
  R1=r0+((shug/2)*(G1+G));
  //����� ���������� �������� �� �����
    x=x+(shug/(sin(R1)/cos(R1)));
  StringGrid1->Cells[0][i]=FloatToStr(z0+shug);
  StringGrid1->Cells[1][i]=FloatToStr(V1);
  StringGrid1->Cells[2][i]=FloatToStr(R1/M_PI*180);
  StringGrid1->Cells[3][i]=FloatToStr(t);
  StringGrid1->Cells[4][i]=FloatToStr(ro);
  StringGrid1->Cells[5][i]=FloatToStr(x);
  Series1->AddXY(x,z0+shug);

  StringGrid1->RowCount = i+1;
  v0=V1;r0=R1;z0=z0+shug;
}}
//---------------------------------------------------------------------------

