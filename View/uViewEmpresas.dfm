object fmEmpresas: TfmEmpresas
  Left = 0
  Top = 0
  Caption = 'Empresas'
  ClientHeight = 556
  ClientWidth = 1080
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Visible = True
  WindowState = wsMaximized
  OnClose = FormClose
  OnShow = FormShow
  DesignSize = (
    1080
    556)
  PixelsPerInch = 96
  TextHeight = 17
  object Panel1: TPanel
    Left = 8
    Top = 8
    Width = 1062
    Height = 540
    Anchors = [akLeft, akTop, akRight, akBottom]
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      1062
      540)
    object Bevel1: TBevel
      Left = 16
      Top = 486
      Width = 1030
      Height = 10
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
      ExplicitTop = 455
    end
    object Bevel2: TBevel
      Left = 350
      Top = 499
      Width = 5
      Height = 35
      Anchors = [akLeft, akBottom]
      Shape = bsLeftLine
    end
    object grEmpresas: TDBGrid
      Left = 16
      Top = 16
      Width = 1030
      Height = 456
      Anchors = [akLeft, akTop, akRight, akBottom]
      DataSource = dsEmpresas
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      PopupMenu = pmGrid
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -13
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'NMEMPRESA'
          Title.Caption = 'Empresa'
          Width = 350
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NUCNPJ'
          Title.Caption = 'CNPJ'
          Width = 150
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NUINSCRICAO'
          Title.Caption = 'N'#250'm. Inscri'#231#227'o'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TXEMAIL'
          Title.Caption = 'E-mail'
          Width = 300
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DescricaoAtivo'
          Title.Caption = 'Status'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TLCOMERCIAL'
          Title.Caption = 'T. Comercial'
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DTABERTURA'
          Title.Caption = 'Data abertura'
          Width = 120
          Visible = True
        end>
    end
    object btnIncluir: TButton
      Left = 16
      Top = 502
      Width = 100
      Height = 30
      Anchors = [akLeft, akBottom]
      Caption = 'Incluir'
      TabOrder = 1
      OnClick = btnIncluirClick
    end
    object btnAlterar: TButton
      Left = 128
      Top = 502
      Width = 100
      Height = 30
      Anchors = [akLeft, akBottom]
      Caption = 'Alterar'
      TabOrder = 2
      OnClick = btnAlterarClick
    end
    object btnExcluir: TButton
      Left = 240
      Top = 502
      Width = 100
      Height = 30
      Anchors = [akLeft, akBottom]
      Caption = 'Excluir'
      TabOrder = 3
      OnClick = btnExcluirClick
    end
    object btnFuncionarios: TButton
      Left = 360
      Top = 502
      Width = 100
      Height = 30
      Anchors = [akLeft, akBottom]
      Caption = 'Funcion'#225'rios'
      TabOrder = 4
      OnClick = btnFuncionariosClick
    end
  end
  object pmGrid: TPopupMenu
    Left = 488
    Top = 224
    object Alterar1: TMenuItem
      Caption = 'Alterar'
    end
    object Excluir1: TMenuItem
      Caption = 'Excluir'
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object Verfuncionrios1: TMenuItem
      Caption = 'Ver funcion'#225'rios'
    end
  end
  object dsEmpresas: TDataSource
    DataSet = qrEmpresas
    Left = 840
    Top = 184
  end
  object qrEmpresas: TFDQuery
    OnCalcFields = qrEmpresasCalcFields
    SQL.Strings = (
      'select * from cadempresa')
    Left = 640
    Top = 160
    object qrEmpresasIDEMPRESA: TIntegerField
      FieldName = 'IDEMPRESA'
      Origin = 'IDEMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qrEmpresasNMEMPRESA: TStringField
      FieldName = 'NMEMPRESA'
      Origin = 'NMEMPRESA'
      Size = 100
    end
    object qrEmpresasNUCNPJ: TStringField
      FieldName = 'NUCNPJ'
      Origin = 'NUCNPJ'
      Size = 18
    end
    object qrEmpresasNUINSCRICAO: TStringField
      FieldName = 'NUINSCRICAO'
      Origin = 'NUINSCRICAO'
      Size = 15
    end
    object qrEmpresasSTATIVO: TStringField
      FieldName = 'STATIVO'
      Origin = 'STATIVO'
      FixedChar = True
      Size = 1
    end
    object qrEmpresasDTCADASTRO: TDateField
      FieldName = 'DTCADASTRO'
      Origin = 'DTCADASTRO'
    end
    object qrEmpresasDTABERTURA: TDateField
      FieldName = 'DTABERTURA'
      Origin = 'DTABERTURA'
    end
    object qrEmpresasTLCOMERCIAL: TStringField
      FieldName = 'TLCOMERCIAL'
      Origin = 'TLCOMERCIAL'
      Size = 15
    end
    object qrEmpresasTLCELULAR: TStringField
      FieldName = 'TLCELULAR'
      Origin = 'TLCELULAR'
      Size = 15
    end
    object qrEmpresasTXOBS: TIntegerField
      FieldName = 'TXOBS'
      Origin = 'TXOBS'
    end
    object qrEmpresasTXEMAIL: TStringField
      FieldName = 'TXEMAIL'
      Origin = 'TXEMAIL'
      Size = 100
    end
    object qrEmpresasSTEXCLUIDO: TStringField
      FieldName = 'STEXCLUIDO'
      Origin = 'STEXCLUIDO'
      FixedChar = True
      Size = 1
    end
    object qrEmpresasDTEXCLUIDO: TDateField
      FieldName = 'DTEXCLUIDO'
      Origin = 'DTEXCLUIDO'
    end
    object qrEmpresasDescricaoAtivo: TStringField
      FieldKind = fkCalculated
      FieldName = 'DescricaoAtivo'
      Calculated = True
    end
  end
end
