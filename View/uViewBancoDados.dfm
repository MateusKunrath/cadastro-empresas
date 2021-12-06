object fmBancoDados: TfmBancoDados
  Left = 0
  Top = 0
  Anchors = [akLeft, akTop, akBottom]
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Configura'#231#245'es do banco de dados'
  ClientHeight = 189
  ClientWidth = 546
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnShow = FormShow
  DesignSize = (
    546
    189)
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 8
    Top = 8
    Width = 530
    Height = 137
    Anchors = [akLeft, akTop, akRight]
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 16
      Width = 50
      Height = 17
      Caption = 'DriverID:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 16
      Top = 56
      Width = 58
      Height = 17
      Caption = 'Database:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 16
      Top = 96
      Width = 65
      Height = 17
      Caption = 'UserName:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 281
      Top = 96
      Width = 59
      Height = 17
      Caption = 'Password:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object edtDriverID: TEdit
      Left = 88
      Top = 13
      Width = 168
      Height = 25
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object edtCaminhoBancoDados: TEdit
      Left = 88
      Top = 53
      Width = 390
      Height = 25
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object btnEncontrarDatabase: TButton
      Left = 484
      Top = 53
      Width = 30
      Height = 25
      Caption = '...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = btnEncontrarDatabaseClick
    end
    object edtUserName: TEdit
      Left = 88
      Top = 93
      Width = 168
      Height = 25
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
    end
    object edtPassword: TEdit
      Left = 346
      Top = 93
      Width = 168
      Height = 25
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      PasswordChar = '*'
      TabOrder = 4
    end
  end
  object btnSalvar: TButton
    Left = 332
    Top = 156
    Width = 100
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Salvar'
    TabOrder = 2
    OnClick = btnSalvarClick
    ExplicitTop = 250
  end
  object btnFechar: TButton
    Left = 438
    Top = 156
    Width = 100
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Fechar'
    TabOrder = 1
    OnClick = btnFecharClick
    ExplicitTop = 250
  end
  object odBanco: TOpenDialog
    DefaultExt = '*.fdb;*.gdb'
    Filter = 'Banco de dados Firebird|*.fdb;*.gdb'
    Left = 464
    Top = 16
  end
end
