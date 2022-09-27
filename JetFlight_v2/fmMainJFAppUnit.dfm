object fmMainJFApp: TfmMainJFApp
  Left = 0
  Top = 0
  Caption = #1044#1074#1080#1078#1077#1085#1080#1077' '#1089#1074#1077#1088#1093#1079#1074#1091#1082#1086#1074#1086#1075#1086' '#1088#1077#1072#1082#1090#1080#1074#1085#1086#1075#1086' '#1089#1072#1084#1086#1083#1105#1090#1072'.'
  ClientHeight = 559
  ClientWidth = 676
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnlSources: TPanel
    Left = 0
    Top = 0
    Width = 225
    Height = 559
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 0
    object grbFlight: TGroupBox
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 219
      Height = 209
      Align = alTop
      Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099' '#1089#1072#1084#1086#1083#1105#1090#1072
      TabOrder = 0
      object lbWeightInfo: TLabel
        AlignWithMargins = True
        Left = 12
        Top = 18
        Width = 202
        Height = 13
        Margins.Left = 10
        Align = alTop
        Caption = #1042#1077#1089': '
        ExplicitWidth = 24
      end
      object lbSquareInfo: TLabel
        AlignWithMargins = True
        Left = 12
        Top = 64
        Width = 202
        Height = 13
        Margins.Left = 10
        Align = alTop
        Caption = #1055#1083#1086#1097#1072#1076#1100' '#1082#1088#1099#1083#1100#1077#1074':'
        ExplicitWidth = 98
      end
      object lbC1Info: TLabel
        AlignWithMargins = True
        Left = 12
        Top = 110
        Width = 202
        Height = 13
        Margins.Left = 10
        Align = alTop
        Caption = #1050#1086#1101#1092'. '#1087#1086#1076#1098#1105#1084#1085#1086#1081' '#1089#1080#1083#1099':'
        ExplicitWidth = 121
      end
      object lbC2Info: TLabel
        AlignWithMargins = True
        Left = 12
        Top = 156
        Width = 202
        Height = 13
        Margins.Left = 10
        Align = alTop
        Caption = #1050#1086#1101#1092'. '#1089#1086#1087#1088#1086#1090#1080#1074#1083#1077#1085#1080#1103':'
        ExplicitWidth = 114
      end
      object edtWeight: TEdit
        AlignWithMargins = True
        Left = 12
        Top = 37
        Width = 195
        Height = 21
        Margins.Left = 10
        Margins.Right = 10
        Align = alTop
        TabOrder = 0
        Text = '20000'
      end
      object edtSquare: TEdit
        AlignWithMargins = True
        Left = 12
        Top = 83
        Width = 195
        Height = 21
        Margins.Left = 10
        Margins.Right = 10
        Align = alTop
        TabOrder = 1
        Text = '160'
      end
      object edtC1: TEdit
        AlignWithMargins = True
        Left = 12
        Top = 129
        Width = 195
        Height = 21
        Margins.Left = 10
        Margins.Right = 10
        Align = alTop
        TabOrder = 2
        Text = '0,1'
      end
      object edtC2: TEdit
        AlignWithMargins = True
        Left = 12
        Top = 175
        Width = 195
        Height = 21
        Margins.Left = 10
        Margins.Right = 10
        Align = alTop
        TabOrder = 3
        Text = '0,02'
      end
    end
    object grbSource: TGroupBox
      AlignWithMargins = True
      Left = 3
      Top = 218
      Width = 219
      Height = 297
      Align = alClient
      Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099' '#1079#1072#1076#1072#1095#1080
      TabOrder = 1
      object lblVelocityStartInfo: TLabel
        AlignWithMargins = True
        Left = 12
        Top = 18
        Width = 195
        Height = 13
        Margins.Left = 10
        Margins.Right = 10
        Align = alTop
        Caption = #1053#1072#1095#1072#1083#1100#1085#1072#1103' '#1089#1082#1086#1088#1086#1089#1090#1100':'
        ExplicitWidth = 108
      end
      object lblHiegthStartInfo: TLabel
        AlignWithMargins = True
        Left = 12
        Top = 64
        Width = 195
        Height = 13
        Margins.Left = 10
        Margins.Right = 10
        Align = alTop
        Caption = #1053#1072#1095#1072#1083#1100#1085#1072#1103' '#1074#1099#1089#1086#1090#1072':'
        ExplicitWidth = 99
      end
      object lblHeightMaxInfo: TLabel
        AlignWithMargins = True
        Left = 12
        Top = 110
        Width = 195
        Height = 13
        Margins.Left = 10
        Margins.Right = 10
        Align = alTop
        Caption = #1050#1086#1085#1077#1095#1085#1072#1103' '#1074#1099#1089#1086#1090#1072':'
        ExplicitWidth = 93
      end
      object lblStepInfo: TLabel
        AlignWithMargins = True
        Left = 12
        Top = 156
        Width = 195
        Height = 13
        Margins.Left = 10
        Margins.Right = 10
        Align = alTop
        Caption = #1042#1077#1083#1080#1095#1077#1085#1072' '#1096#1072#1075#1072' '#1074#1099#1089#1090#1099':'
        ExplicitWidth = 116
      end
      object lblAngleStartInfo: TLabel
        AlignWithMargins = True
        Left = 12
        Top = 202
        Width = 195
        Height = 13
        Margins.Left = 10
        Margins.Right = 10
        Align = alTop
        Caption = #1053#1072#1095#1072#1083#1100#1085#1099#1081' '#1091#1075#1086#1083':'
        ExplicitWidth = 87
      end
      object lblToleranceInfo: TLabel
        AlignWithMargins = True
        Left = 12
        Top = 248
        Width = 195
        Height = 13
        Margins.Left = 10
        Margins.Right = 10
        Align = alTop
        Caption = #1058#1086#1095#1085#1086#1089#1090#1100' '#1088#1072#1089#1095#1105#1090#1072':'
        ExplicitWidth = 95
      end
      object edtVelocityStart: TEdit
        AlignWithMargins = True
        Left = 12
        Top = 37
        Width = 195
        Height = 21
        Margins.Left = 10
        Margins.Right = 10
        Align = alTop
        TabOrder = 0
        Text = '1500'
      end
      object edtHeightStart: TEdit
        AlignWithMargins = True
        Left = 12
        Top = 83
        Width = 195
        Height = 21
        Margins.Left = 10
        Margins.Right = 10
        Align = alTop
        TabOrder = 1
        Text = '5000'
      end
      object edtHeightMax: TEdit
        AlignWithMargins = True
        Left = 12
        Top = 129
        Width = 195
        Height = 21
        Margins.Left = 10
        Margins.Right = 10
        Align = alTop
        TabOrder = 2
        Text = '25000'
      end
      object edtStep: TEdit
        AlignWithMargins = True
        Left = 12
        Top = 175
        Width = 195
        Height = 21
        Margins.Left = 10
        Margins.Right = 10
        Align = alTop
        TabOrder = 3
        Text = '500'
      end
      object edtAngleStart: TEdit
        AlignWithMargins = True
        Left = 12
        Top = 221
        Width = 195
        Height = 21
        Margins.Left = 10
        Margins.Right = 10
        Align = alTop
        TabOrder = 4
        Text = '15'
      end
      object edtTolerance: TEdit
        AlignWithMargins = True
        Left = 12
        Top = 267
        Width = 195
        Height = 21
        Margins.Left = 10
        Margins.Right = 10
        Align = alTop
        TabOrder = 5
        Text = '0,0001'
      end
    end
    object pnlButtons: TPanel
      Left = 0
      Top = 518
      Width = 225
      Height = 41
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 2
      object btnRun: TButton
        Left = 8
        Top = 8
        Width = 75
        Height = 25
        Caption = '&'#1042#1099#1095#1080#1089#1083#1080#1090#1100
        TabOrder = 0
        OnClick = btnRunClick
      end
    end
  end
  object sgrResults: TStringGrid
    AlignWithMargins = True
    Left = 228
    Top = 3
    Width = 445
    Height = 553
    Align = alClient
    ColCount = 6
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing]
    TabOrder = 1
    ColWidths = (
      52
      55
      57
      159
      153
      105)
  end
end
