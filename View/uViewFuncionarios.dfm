object fmFuncionarios: TfmFuncionarios
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Funcion'#225'rios'
  ClientHeight = 556
  ClientWidth = 995
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  DesignSize = (
    995
    556)
  PixelsPerInch = 96
  TextHeight = 17
  object Panel1: TPanel
    Left = 8
    Top = 8
    Width = 979
    Height = 540
    Anchors = [akLeft, akTop, akRight, akBottom]
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      979
      540)
    object Bevel1: TBevel
      Left = 16
      Top = 487
      Width = 947
      Height = 10
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
    end
    object grFuncionarios: TDBGrid
      Left = 16
      Top = 16
      Width = 947
      Height = 457
      Anchors = [akLeft, akTop, akRight, akBottom]
      DataSource = dsFuncionarios
      Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -13
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'NMFUNCIONARIO'
          Title.Caption = 'Nome funcion'#225'rio'
          Width = 300
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NURG'
          Title.Caption = 'RG'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NUCPF'
          Title.Caption = 'CPF'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TXEMAIL'
          Title.Caption = 'E-mail'
          Width = 200
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DescricaoAtivo'
          Title.Caption = 'Status'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DTCONTRATACAO'
          Title.Caption = 'Data contrata'#231#227'o'
          Width = 110
          Visible = True
        end>
    end
    object btnIncluir: TButton
      Left = 16
      Top = 503
      Width = 100
      Height = 30
      Caption = 'Incluir'
      TabOrder = 1
      OnClick = btnIncluirClick
    end
    object btnAlterar: TButton
      Left = 122
      Top = 503
      Width = 100
      Height = 30
      Caption = 'Alterar'
      TabOrder = 2
      OnClick = btnAlterarClick
    end
    object btnExcluir: TButton
      Left = 228
      Top = 503
      Width = 100
      Height = 30
      Caption = 'Excluir'
      TabOrder = 3
    end
  end
  object dsFuncionarios: TDataSource
    DataSet = qrFuncionarios
    Left = 768
    Top = 208
  end
  object qrFuncionarios: TFDQuery
    OnCalcFields = qrFuncionariosCalcFields
    SQL.Strings = (
      'select * from cadfuncionarios')
    Left = 488
    Top = 176
    object qrFuncionariosIDFUNCIONARIO: TIntegerField
      FieldName = 'IDFUNCIONARIO'
      Origin = 'IDFUNCIONARIO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qrFuncionariosIDEMPRESA: TIntegerField
      FieldName = 'IDEMPRESA'
      Origin = 'IDEMPRESA'
    end
    object qrFuncionariosNMFUNCIONARIO: TStringField
      FieldName = 'NMFUNCIONARIO'
      Origin = 'NMFUNCIONARIO'
      Size = 100
    end
    object qrFuncionariosNUCPF: TStringField
      FieldName = 'NUCPF'
      Origin = 'NUCPF'
      Size = 18
    end
    object qrFuncionariosNURG: TStringField
      FieldName = 'NURG'
      Origin = 'NURG'
      Size = 15
    end
    object qrFuncionariosDTNASCIMENTO: TDateField
      FieldName = 'DTNASCIMENTO'
      Origin = 'DTNASCIMENTO'
    end
    object qrFuncionariosTXEMAIL: TStringField
      FieldName = 'TXEMAIL'
      Origin = 'TXEMAIL'
      Size = 100
    end
    object qrFuncionariosNUCARTEIRATRAB: TStringField
      FieldName = 'NUCARTEIRATRAB'
      Origin = 'NUCARTEIRATRAB'
    end
    object qrFuncionariosNUTITULOELEITOR: TStringField
      FieldName = 'NUTITULOELEITOR'
      Origin = 'NUTITULOELEITOR'
      Size = 12
    end
    object qrFuncionariosNUCARTEIRAMOTORISTA: TStringField
      FieldName = 'NUCARTEIRAMOTORISTA'
      Origin = 'NUCARTEIRAMOTORISTA'
      Size = 15
    end
    object qrFuncionariosTPCATERORIA: TStringField
      FieldName = 'TPCATERORIA'
      Origin = 'TPCATERORIA'
      Size = 4
    end
    object qrFuncionariosDTVALIDADECARTEIRAMOT: TDateField
      FieldName = 'DTVALIDADECARTEIRAMOT'
      Origin = 'DTVALIDADECARTEIRAMOT'
    end
    object qrFuncionariosTLRESIDENCIAL: TStringField
      FieldName = 'TLRESIDENCIAL'
      Origin = 'TLRESIDENCIAL'
      Size = 15
    end
    object qrFuncionariosTLCELULAR: TStringField
      FieldName = 'TLCELULAR'
      Origin = 'TLCELULAR'
      Size = 15
    end
    object qrFuncionariosTLCONTATO: TStringField
      FieldName = 'TLCONTATO'
      Origin = 'TLCONTATO'
      Size = 15
    end
    object qrFuncionariosNMCONTATO: TStringField
      FieldName = 'NMCONTATO'
      Origin = 'NMCONTATO'
      Size = 50
    end
    object qrFuncionariosDTCONTRATACAO: TDateField
      FieldName = 'DTCONTRATACAO'
      Origin = 'DTCONTRATACAO'
    end
    object qrFuncionariosDTDEMISSAO: TDateField
      FieldName = 'DTDEMISSAO'
      Origin = 'DTDEMISSAO'
    end
    object qrFuncionariosDTCADASTRO: TDateField
      FieldName = 'DTCADASTRO'
      Origin = 'DTCADASTRO'
    end
    object qrFuncionariosSTATIVO: TStringField
      FieldName = 'STATIVO'
      Origin = 'STATIVO'
      FixedChar = True
      Size = 1
    end
    object qrFuncionariosTXOBS: TStringField
      FieldName = 'TXOBS'
      Origin = 'TXOBS'
      Size = 1000
    end
    object qrFuncionariosNMENDERECO: TStringField
      FieldName = 'NMENDERECO'
      Origin = 'NMENDERECO'
      Size = 100
    end
    object qrFuncionariosNUENDERECO: TStringField
      FieldName = 'NUENDERECO'
      Origin = 'NUENDERECO'
      Size = 10
    end
    object qrFuncionariosNMBAIRRO: TStringField
      FieldName = 'NMBAIRRO'
      Origin = 'NMBAIRRO'
      Size = 100
    end
    object qrFuncionariosIDCIDADE: TIntegerField
      FieldName = 'IDCIDADE'
      Origin = 'IDCIDADE'
    end
    object qrFuncionariosIDUF: TIntegerField
      FieldName = 'IDUF'
      Origin = 'IDUF'
    end
    object qrFuncionariosNUCEP: TStringField
      FieldName = 'NUCEP'
      Origin = 'NUCEP'
      Size = 10
    end
    object qrFuncionariosSTEXCLUIDO: TStringField
      FieldName = 'STEXCLUIDO'
      Origin = 'STEXCLUIDO'
      FixedChar = True
      Size = 1
    end
    object qrFuncionariosDTEXCLUIDO: TDateField
      FieldName = 'DTEXCLUIDO'
      Origin = 'DTEXCLUIDO'
    end
    object qrFuncionariosDescricaoAtivo: TStringField
      FieldKind = fkCalculated
      FieldName = 'DescricaoAtivo'
      Size = 15
      Calculated = True
    end
  end
end
