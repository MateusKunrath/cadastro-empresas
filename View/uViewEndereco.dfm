object fmEndereco: TfmEndereco
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Manuten'#231#227'o de Endere'#231'o'
  ClientHeight = 381
  ClientWidth = 487
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
    487
    381)
  PixelsPerInch = 96
  TextHeight = 17
  object Panel1: TPanel
    Left = 8
    Top = 8
    Width = 471
    Height = 330
    Anchors = [akLeft, akTop, akRight, akBottom]
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitHeight = 265
    object Label1: TLabel
      Left = 16
      Top = 16
      Width = 58
      Height = 17
      Caption = 'Endere'#231'o:'
    end
    object Label2: TLabel
      Left = 16
      Top = 80
      Width = 38
      Height = 17
      Caption = 'Bairro:'
    end
    object Label3: TLabel
      Left = 344
      Top = 80
      Width = 29
      Height = 17
      Caption = 'Nro.:'
    end
    object Label4: TLabel
      Left = 16
      Top = 144
      Width = 44
      Height = 17
      Caption = 'Cidade:'
    end
    object Label5: TLabel
      Left = 344
      Top = 144
      Width = 43
      Height = 17
      Caption = 'Estado:'
    end
    object Label6: TLabel
      Left = 16
      Top = 272
      Width = 25
      Height = 17
      Caption = 'CEP:'
    end
    object Label7: TLabel
      Left = 16
      Top = 208
      Width = 39
      Height = 17
      Caption = 'Titular:'
    end
    object edtEndereco: TEdit
      Left = 16
      Top = 39
      Width = 433
      Height = 25
      TabOrder = 0
    end
    object edtBairro: TEdit
      Left = 16
      Top = 103
      Width = 313
      Height = 25
      TabOrder = 1
    end
    object edtNro: TEdit
      Left = 344
      Top = 103
      Width = 105
      Height = 25
      NumbersOnly = True
      TabOrder = 2
    end
    object cbCidade: TDBLookupComboBox
      Left = 16
      Top = 167
      Width = 313
      Height = 25
      KeyField = 'IDCIDADE'
      ListField = 'NMCIDADE'
      ListSource = dsCidade
      TabOrder = 3
    end
    object cbEstado: TDBLookupComboBox
      Left = 344
      Top = 167
      Width = 105
      Height = 25
      KeyField = 'IDUF'
      ListField = 'SGESTADO'
      ListSource = dsEstado
      TabOrder = 4
    end
    object edtCEP: TEdit
      Left = 16
      Top = 295
      Width = 121
      Height = 25
      TabOrder = 5
    end
    object chkEnderecoPrincipal: TCheckBox
      Left = 208
      Top = 299
      Width = 241
      Height = 17
      Caption = 'Utilizar esse endere'#231'o como principal'
      TabOrder = 6
    end
    object cbTitular: TDBLookupComboBox
      Left = 16
      Top = 231
      Width = 433
      Height = 25
      KeyField = 'IDTITULAR'
      ListField = 'NMTITULAR'
      ListSource = dsTitular
      TabOrder = 7
    end
  end
  object btnCadastrar: TButton
    Left = 376
    Top = 347
    Width = 103
    Height = 30
    Anchors = [akRight, akBottom]
    Caption = 'Cadastrar'
    TabOrder = 1
    OnClick = btnCadastrarClick
    ExplicitTop = 282
  end
  object dsEstado: TDataSource
    DataSet = qrEstado
    Left = 320
    Top = 128
  end
  object dsCidade: TDataSource
    DataSet = qrCidade
    Left = 264
    Top = 56
  end
  object qrCidade: TFDQuery
    SQL.Strings = (
      'select * from cadcidade'
      'order by nmcidade')
    Left = 192
    Top = 80
    object qrCidadeNMCIDADE: TStringField
      FieldName = 'NMCIDADE'
      Origin = 'NMCIDADE'
      Size = 100
    end
    object qrCidadeIDCIDADE: TIntegerField
      FieldName = 'IDCIDADE'
      Origin = 'IDCIDADE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
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
      'select * from caduf'
      'order by nmestado')
    Left = 360
    Top = 72
    object qrEstadoSGESTADO: TStringField
      FieldName = 'SGESTADO'
      Origin = 'SGESTADO'
      FixedChar = True
      Size = 3
    end
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
  end
  object dsTitular: TDataSource
    DataSet = qrTitular
    Left = 112
    Top = 152
  end
  object qrTitular: TFDQuery
    SQL.Strings = (
      'select * from cadtitular')
    Left = 224
    Top = 152
    object qrTitularIDTITULAR: TIntegerField
      FieldName = 'IDTITULAR'
      Origin = 'IDTITULAR'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qrTitularIDEMPRESA: TIntegerField
      FieldName = 'IDEMPRESA'
      Origin = 'IDEMPRESA'
      Required = True
    end
    object qrTitularNMTITULAR: TStringField
      FieldName = 'NMTITULAR'
      Origin = 'NMTITULAR'
      Size = 100
    end
    object qrTitularNUCNPJCPF: TStringField
      FieldName = 'NUCNPJCPF'
      Origin = 'NUCNPJCPF'
      Size = 18
    end
    object qrTitularNUINCRICAORG: TStringField
      FieldName = 'NUINCRICAORG'
      Origin = 'NUINCRICAORG'
      Size = 15
    end
    object qrTitularDTNASCIMENTO: TDateField
      FieldName = 'DTNASCIMENTO'
      Origin = 'DTNASCIMENTO'
    end
    object qrTitularDTCADASTRO: TDateField
      FieldName = 'DTCADASTRO'
      Origin = 'DTCADASTRO'
    end
    object qrTitularTXEMAIL: TStringField
      FieldName = 'TXEMAIL'
      Origin = 'TXEMAIL'
      Size = 100
    end
    object qrTitularTXOBS: TStringField
      FieldName = 'TXOBS'
      Origin = 'TXOBS'
      Size = 1000
    end
    object qrTitularTLRESIDENCIAL: TStringField
      FieldName = 'TLRESIDENCIAL'
      Origin = 'TLRESIDENCIAL'
      Size = 15
    end
    object qrTitularTLCOMERCIAL: TStringField
      FieldName = 'TLCOMERCIAL'
      Origin = 'TLCOMERCIAL'
      Size = 15
    end
    object qrTitularTLCELULAR: TStringField
      FieldName = 'TLCELULAR'
      Origin = 'TLCELULAR'
      Size = 15
    end
    object qrTitularTLCONTATO: TStringField
      FieldName = 'TLCONTATO'
      Origin = 'TLCONTATO'
      Size = 15
    end
    object qrTitularNMCONTATO: TStringField
      FieldName = 'NMCONTATO'
      Origin = 'NMCONTATO'
      Size = 50
    end
    object qrTitularSTEXCLUIDO: TStringField
      FieldName = 'STEXCLUIDO'
      Origin = 'STEXCLUIDO'
      FixedChar = True
      Size = 1
    end
    object qrTitularDTEXCLUIDO: TDateField
      FieldName = 'DTEXCLUIDO'
      Origin = 'DTEXCLUIDO'
    end
    object qrTitularSTATIVO: TStringField
      FieldName = 'STATIVO'
      Origin = 'STATIVO'
      FixedChar = True
      Size = 1
    end
  end
end
