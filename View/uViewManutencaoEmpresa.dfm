object fmManutencaoEmpresa: TfmManutencaoEmpresa
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Manuten'#231#227'o da empresa'
  ClientHeight = 615
  ClientWidth = 586
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
    586
    615)
  PixelsPerInch = 96
  TextHeight = 17
  object Panel1: TPanel
    Left = 8
    Top = 8
    Width = 570
    Height = 564
    Anchors = [akLeft, akTop, akRight, akBottom]
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      570
      564)
    object Label1: TLabel
      Left = 16
      Top = 16
      Width = 113
      Height = 17
      Caption = 'Nome da empresa:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 16
      Top = 80
      Width = 106
      Height = 17
      Caption = 'CNPJ da empresa:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 293
      Top = 80
      Width = 180
      Height = 17
      Caption = 'N'#250'mero inscri'#231#227'o da empresa:'
    end
    object Label4: TLabel
      Left = 16
      Top = 216
      Width = 112
      Height = 17
      Caption = 'Telefone comercial:'
    end
    object Label5: TLabel
      Left = 293
      Top = 216
      Width = 94
      Height = 17
      Caption = 'Telefone celular:'
    end
    object Label6: TLabel
      Left = 16
      Top = 280
      Width = 113
      Height = 17
      Caption = 'E-mail da empresa:'
    end
    object Label7: TLabel
      Left = 293
      Top = 145
      Width = 103
      Height = 17
      Caption = 'Data de abertura:'
    end
    object Label8: TLabel
      Left = 16
      Top = 344
      Width = 64
      Height = 17
      Caption = 'Endere'#231'os:'
    end
    object edtNomeEmpresa: TEdit
      Left = 16
      Top = 39
      Width = 537
      Height = 25
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      MaxLength = 100
      ParentFont = False
      TabOrder = 0
    end
    object edtNumInscricao: TEdit
      Left = 293
      Top = 103
      Width = 260
      Height = 25
      NumbersOnly = True
      TabOrder = 2
    end
    object edtCNPJ: TMaskEdit
      Left = 16
      Top = 103
      Width = 258
      Height = 25
      EditMask = '!99.999.999/9999-99;0; '
      MaxLength = 18
      TabOrder = 1
      Text = ''
    end
    object rgStatus: TRadioGroup
      Left = 16
      Top = 144
      Width = 260
      Height = 57
      Caption = 'Status da empresa'
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        'Ativa'
        'Inativa')
      TabOrder = 3
    end
    object edtTelefoneComercial: TMaskEdit
      Left = 16
      Top = 239
      Width = 254
      Height = 25
      EditMask = '!(99) 9999-9999;0;'
      MaxLength = 14
      TabOrder = 5
      Text = ''
    end
    object edtTelefoneCelular: TMaskEdit
      Left = 293
      Top = 239
      Width = 260
      Height = 25
      EditMask = '!(99) 9 9999-9999;0;'
      MaxLength = 16
      TabOrder = 6
      Text = ''
    end
    object edtEmail: TEdit
      Left = 16
      Top = 303
      Width = 537
      Height = 25
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 7
    end
    object edtDataAbertura: TDateTimePicker
      Left = 293
      Top = 168
      Width = 260
      Height = 25
      Date = 44534.000000000000000000
      Time = 0.744677303242497200
      TabOrder = 4
    end
    object btnAdicionarEndereco: TButton
      Left = 447
      Top = 367
      Width = 106
      Height = 30
      Caption = 'Adicionar'
      TabOrder = 8
      OnClick = btnAdicionarEnderecoClick
    end
    object grEnderecos: TDBGrid
      Left = 16
      Top = 367
      Width = 425
      Height = 186
      DataSource = dsEnderecos
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 9
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -13
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'DescricaoAtivo'
          Title.Caption = 'Ativo'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DescricaoEndereco'
          Title.Caption = 'Endere'#231'o'
          Width = 280
          Visible = True
        end>
    end
    object btnAlterarEndereco: TButton
      Left = 447
      Top = 398
      Width = 106
      Height = 30
      Caption = 'Alterar'
      TabOrder = 10
      OnClick = btnAlterarEnderecoClick
    end
  end
  object btnCadastrarAlterar: TButton
    Left = 372
    Top = 578
    Width = 100
    Height = 30
    Anchors = [akRight, akBottom]
    Caption = 'Cadastrar'
    TabOrder = 1
    OnClick = btnCadastrarAlterarClick
  end
  object btnCancelar: TButton
    Left = 478
    Top = 578
    Width = 100
    Height = 30
    Anchors = [akRight, akBottom]
    Caption = 'Cancelar'
    TabOrder = 2
    OnClick = btnCancelarClick
  end
  object qrEnderecos: TFDQuery
    OnCalcFields = qrEnderecosCalcFields
    SQL.Strings = (
      'select * from cadenderecos')
    Left = 416
    Top = 312
    object qrEnderecosIDENDERECO: TIntegerField
      FieldName = 'IDENDERECO'
      Origin = 'IDENDERECO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qrEnderecosIDTITULAR: TIntegerField
      FieldName = 'IDTITULAR'
      Origin = 'IDTITULAR'
    end
    object qrEnderecosIDEMPRESA: TIntegerField
      FieldName = 'IDEMPRESA'
      Origin = 'IDEMPRESA'
    end
    object qrEnderecosNMENDERECO: TStringField
      FieldName = 'NMENDERECO'
      Origin = 'NMENDERECO'
      Size = 100
    end
    object qrEnderecosNUENDERECO: TStringField
      FieldName = 'NUENDERECO'
      Origin = 'NUENDERECO'
      Size = 10
    end
    object qrEnderecosNMBAIRRO: TStringField
      FieldName = 'NMBAIRRO'
      Origin = 'NMBAIRRO'
      Size = 50
    end
    object qrEnderecosIDCIDADE: TIntegerField
      FieldName = 'IDCIDADE'
      Origin = 'IDCIDADE'
    end
    object qrEnderecosIDUF: TIntegerField
      FieldName = 'IDUF'
      Origin = 'IDUF'
    end
    object qrEnderecosNUCEP: TStringField
      FieldName = 'NUCEP'
      Origin = 'NUCEP'
      Size = 10
    end
    object qrEnderecosSTATIVO: TStringField
      FieldName = 'STATIVO'
      Origin = 'STATIVO'
      FixedChar = True
      Size = 1
    end
    object qrEnderecosSTEXCLUIDO: TStringField
      FieldName = 'STEXCLUIDO'
      Origin = 'STEXCLUIDO'
      FixedChar = True
      Size = 1
    end
    object qrEnderecosDTEXCLUIDO: TDateField
      FieldName = 'DTEXCLUIDO'
      Origin = 'DTEXCLUIDO'
    end
    object qrEnderecosTPCADASTRO: TStringField
      FieldName = 'TPCADASTRO'
      Origin = 'TPCADASTRO'
      FixedChar = True
      Size = 1
    end
    object qrEnderecosDescricaoAtivo: TStringField
      FieldKind = fkCalculated
      FieldName = 'DescricaoAtivo'
      Size = 15
      Calculated = True
    end
    object qrEnderecosDescricaoEndereco: TStringField
      FieldKind = fkCalculated
      FieldName = 'DescricaoEndereco'
      Size = 100
      Calculated = True
    end
  end
  object dsEnderecos: TDataSource
    DataSet = qrEnderecos
    Left = 288
    Top = 296
  end
end
