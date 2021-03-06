object fmManutencaoFuncionario: TfmManutencaoFuncionario
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Manuten'#231#227'o de Funcion'#225'rio'
  ClientHeight = 594
  ClientWidth = 938
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  DesignSize = (
    938
    594)
  PixelsPerInch = 96
  TextHeight = 17
  object Panel1: TPanel
    Left = 8
    Top = 8
    Width = 922
    Height = 531
    Anchors = [akLeft, akTop, akRight, akBottom]
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitWidth = 912
    ExplicitHeight = 521
    object Label1: TLabel
      Left = 16
      Top = 16
      Width = 128
      Height = 17
      Caption = 'Nome do funcion'#225'rio:'
    end
    object Label2: TLabel
      Left = 16
      Top = 80
      Width = 24
      Height = 17
      Caption = 'CPF:'
    end
    object Label3: TLabel
      Left = 166
      Top = 80
      Width = 20
      Height = 17
      Caption = 'RG:'
    end
    object Label4: TLabel
      Left = 316
      Top = 80
      Width = 100
      Height = 17
      Caption = 'Data nascimento:'
    end
    object Label5: TLabel
      Left = 16
      Top = 144
      Width = 39
      Height = 17
      Caption = 'E-mail:'
    end
    object Label6: TLabel
      Left = 16
      Top = 208
      Width = 91
      Height = 17
      Caption = 'Tel. Residencial:'
    end
    object Label7: TLabel
      Left = 166
      Top = 208
      Width = 66
      Height = 17
      Caption = 'Tel. Celular:'
    end
    object Label8: TLabel
      Left = 316
      Top = 208
      Width = 72
      Height = 17
      Caption = 'Tel. Contato:'
    end
    object Label9: TLabel
      Left = 16
      Top = 272
      Width = 107
      Height = 17
      Caption = 'Nome do contato:'
    end
    object Label10: TLabel
      Left = 16
      Top = 336
      Width = 125
      Height = 17
      Caption = 'Nro. T'#237'tulo de eleitor:'
    end
    object Label11: TLabel
      Left = 236
      Top = 336
      Width = 151
      Height = 17
      Caption = 'Nro. Carteira de trabalho:'
    end
    object Label12: TLabel
      Left = 16
      Top = 400
      Width = 60
      Height = 17
      Caption = 'Nro. CNH:'
    end
    object Label13: TLabel
      Left = 236
      Top = 400
      Width = 81
      Height = 17
      Caption = 'Validade CNH'
    end
    object Label14: TLabel
      Left = 366
      Top = 400
      Width = 60
      Height = 17
      Caption = 'Categoria:'
    end
    object Label15: TLabel
      Left = 16
      Top = 464
      Width = 103
      Height = 17
      Caption = 'Data contrata'#231#227'o:'
    end
    object Bevel1: TBevel
      Left = 456
      Top = 16
      Width = 5
      Height = 496
      Shape = bsLeftLine
    end
    object Label17: TLabel
      Left = 466
      Top = 16
      Width = 58
      Height = 17
      Caption = 'Endere'#231'o:'
    end
    object Label18: TLabel
      Left = 466
      Top = 80
      Width = 38
      Height = 17
      Caption = 'Bairro:'
    end
    object Label19: TLabel
      Left = 806
      Top = 80
      Width = 29
      Height = 17
      Caption = 'Nro.:'
    end
    object Label20: TLabel
      Left = 466
      Top = 144
      Width = 44
      Height = 17
      Caption = 'Cidade:'
    end
    object Label21: TLabel
      Left = 806
      Top = 144
      Width = 18
      Height = 17
      Caption = 'UF:'
    end
    object btnDemitirFuncionario: TSpeedButton
      Left = 530
      Top = 295
      Width = 337
      Height = 56
      Caption = 'Demitir funcion'#225'rio'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      OnClick = btnDemitirFuncionarioClick
    end
    object Label22: TLabel
      Left = 467
      Top = 208
      Width = 25
      Height = 17
      Caption = 'CEP:'
    end
    object edtNomeFuncionario: TEdit
      Left = 16
      Top = 39
      Width = 430
      Height = 25
      MaxLength = 100
      TabOrder = 0
    end
    object edtCPF: TMaskEdit
      Left = 16
      Top = 103
      Width = 130
      Height = 25
      EditMask = '!999.999.999-99;0; '
      MaxLength = 14
      TabOrder = 1
      Text = ''
    end
    object edtRG: TEdit
      Left = 166
      Top = 103
      Width = 130
      Height = 25
      MaxLength = 15
      NumbersOnly = True
      TabOrder = 2
    end
    object edtEmail: TEdit
      Left = 16
      Top = 167
      Width = 430
      Height = 25
      MaxLength = 100
      TabOrder = 4
    end
    object edtTelResidencial: TMaskEdit
      Left = 16
      Top = 231
      Width = 130
      Height = 25
      EditMask = '!(99) 9999-9999;0;'
      MaxLength = 14
      TabOrder = 5
      Text = ''
    end
    object edtTelCelular: TMaskEdit
      Left = 166
      Top = 231
      Width = 130
      Height = 25
      EditMask = '!(99) 9 9999-9999;0;'
      MaxLength = 16
      TabOrder = 6
      Text = ''
    end
    object edtTelContato: TMaskEdit
      Left = 316
      Top = 231
      Width = 130
      Height = 25
      EditMask = '!(99) 9 9999-9999;0;'
      MaxLength = 16
      TabOrder = 7
      Text = ''
    end
    object edtNomeContato: TEdit
      Left = 16
      Top = 295
      Width = 430
      Height = 25
      MaxLength = 50
      TabOrder = 8
    end
    object edtNroTituloEleitor: TEdit
      Left = 16
      Top = 359
      Width = 210
      Height = 25
      MaxLength = 12
      NumbersOnly = True
      TabOrder = 9
    end
    object edtNroCarteiraTrabalho: TEdit
      Left = 236
      Top = 359
      Width = 210
      Height = 25
      MaxLength = 20
      NumbersOnly = True
      TabOrder = 10
    end
    object edtNroCNH: TEdit
      Left = 16
      Top = 423
      Width = 210
      Height = 25
      MaxLength = 15
      NumbersOnly = True
      TabOrder = 11
    end
    object edtCategoriaCNH: TEdit
      Left = 366
      Top = 423
      Width = 80
      Height = 25
      MaxLength = 4
      TabOrder = 13
    end
    object paDataDemissao: TPanel
      Left = 236
      Top = 454
      Width = 210
      Height = 67
      BevelOuter = bvNone
      TabOrder = 15
      Visible = False
      object Label16: TLabel
        Left = 0
        Top = 10
        Width = 109
        Height = 17
        Caption = 'Data da demiss'#227'o:'
      end
      object edtDataDemissao: TDateTimePicker
        Left = 0
        Top = 33
        Width = 120
        Height = 25
        Date = 44536.000000000000000000
        Time = 0.122274085646495200
        TabOrder = 0
      end
    end
    object edtEndereco: TEdit
      Left = 466
      Top = 39
      Width = 430
      Height = 25
      MaxLength = 100
      TabOrder = 16
    end
    object edtBairro: TEdit
      Left = 466
      Top = 103
      Width = 327
      Height = 25
      MaxLength = 100
      TabOrder = 17
    end
    object edtNro: TEdit
      Left = 806
      Top = 103
      Width = 90
      Height = 25
      MaxLength = 10
      NumbersOnly = True
      TabOrder = 18
    end
    object cbCidade: TDBLookupComboBox
      Left = 467
      Top = 167
      Width = 326
      Height = 25
      KeyField = 'IDCIDADE'
      ListField = 'NMCIDADE'
      ListSource = dsCidade
      TabOrder = 19
    end
    object cbEstado: TDBLookupComboBox
      Left = 806
      Top = 167
      Width = 90
      Height = 25
      KeyField = 'IDUF'
      ListField = 'SGESTADO'
      ListSource = dsEstado
      TabOrder = 20
    end
    object edtDataNascimento: TDateTimePicker
      Left = 316
      Top = 103
      Width = 130
      Height = 25
      Date = 44536.000000000000000000
      Time = 0.119272164352878500
      TabOrder = 3
    end
    object edtDataValidadeCNH: TDateTimePicker
      Left = 236
      Top = 423
      Width = 120
      Height = 25
      Date = 44536.000000000000000000
      Time = 0.120209641201654400
      TabOrder = 12
    end
    object edtDataContratacao: TDateTimePicker
      Left = 16
      Top = 487
      Width = 120
      Height = 25
      Date = 44536.000000000000000000
      Time = 0.121693622684688300
      TabOrder = 14
    end
    object chkUsuarioAtivo: TCheckBox
      Left = 799
      Top = 235
      Width = 97
      Height = 17
      Caption = 'Usu'#225'rio ativo'
      TabOrder = 21
    end
    object edtCEP: TEdit
      Left = 467
      Top = 231
      Width = 126
      Height = 25
      NumbersOnly = True
      TabOrder = 22
    end
  end
  object btnConfirmar: TButton
    Left = 830
    Top = 553
    Width = 100
    Height = 30
    Anchors = [akRight, akBottom]
    Caption = 'Confirmar'
    TabOrder = 1
    OnClick = btnConfirmarClick
  end
  object dsCidade: TDataSource
    DataSet = qrCidade
    Left = 496
    Top = 344
  end
  object dsEstado: TDataSource
    DataSet = qrEstado
    Left = 880
    Top = 352
  end
  object qrCidade: TFDQuery
    SQL.Strings = (
      'select * from cadcidade')
    Left = 496
    Top = 400
    object qrCidadeIDCIDADE: TIntegerField
      FieldName = 'IDCIDADE'
      Origin = 'IDCIDADE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qrCidadeNMCIDADE: TStringField
      FieldName = 'NMCIDADE'
      Origin = 'NMCIDADE'
      Size = 100
    end
    object qrCidadeIDUF: TIntegerField
      FieldName = 'IDUF'
      Origin = 'IDUF'
      Required = True
    end
    object qrCidadeNOIBGE: TStringField
      FieldName = 'NOIBGE'
      Origin = 'NOIBGE'
      Size = 7
    end
  end
  object qrEstado: TFDQuery
    SQL.Strings = (
      'select * from caduf')
    Left = 880
    Top = 408
    object qrEstadoIDUF: TIntegerField
      FieldName = 'IDUF'
      Origin = 'IDUF'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qrEstadoNMESTADO: TStringField
      FieldName = 'NMESTADO'
      Origin = 'NMESTADO'
      Size = 50
    end
    object qrEstadoSGESTADO: TStringField
      FieldName = 'SGESTADO'
      Origin = 'SGESTADO'
      FixedChar = True
      Size = 3
    end
  end
end
