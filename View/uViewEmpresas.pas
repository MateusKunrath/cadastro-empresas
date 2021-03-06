unit uViewEmpresas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.StdCtrls, Vcl.ExtCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids, Vcl.Menus, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, uDataModule, uEmpresa;

type
  TfmEmpresas = class(TForm)
    Panel1: TPanel;
    grEmpresas: TDBGrid;
    Bevel1: TBevel;
    btnIncluir: TButton;
    btnAlterar: TButton;
    btnExcluir: TButton;
    Bevel2: TBevel;
    btnFuncionarios: TButton;
    pmGrid: TPopupMenu;
    Alterar1: TMenuItem;
    Excluir1: TMenuItem;
    N1: TMenuItem;
    Verfuncionrios1: TMenuItem;
    dsEmpresas: TDataSource;
    qrEmpresas: TFDQuery;
    qrEmpresasIDEMPRESA: TIntegerField;
    qrEmpresasNMEMPRESA: TStringField;
    qrEmpresasNUCNPJ: TStringField;
    qrEmpresasNUINSCRICAO: TStringField;
    qrEmpresasSTATIVO: TStringField;
    qrEmpresasDTCADASTRO: TDateField;
    qrEmpresasDTABERTURA: TDateField;
    qrEmpresasTLCOMERCIAL: TStringField;
    qrEmpresasTLCELULAR: TStringField;
    qrEmpresasTXOBS: TIntegerField;
    qrEmpresasTXEMAIL: TStringField;
    qrEmpresasSTEXCLUIDO: TStringField;
    qrEmpresasDTEXCLUIDO: TDateField;
    qrEmpresasDescricaoAtivo: TStringField;
    procedure btnFecharClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure qrEmpresasCalcFields(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnFuncionariosClick(Sender: TObject);
  private
    { Private declarations }
    FEmpresa: TEmpresa;
    procedure ManutencaoEmpresa(Incluir: Boolean);
    procedure LocalizarEmpresas;
    procedure CarregarDadosEmpresa;
  public
    { Public declarations }
    constructor Create;
  end;

var
  fmEmpresas: TfmEmpresas;

implementation

uses
  uViewManutencaoEmpresa, Vcl.Dialogs, uUtils, uViewFuncionarios;

{$R *.dfm}

{ TfmEmpresas }

procedure TfmEmpresas.btnAlterarClick(Sender: TObject);
begin
  CarregarDadosEmpresa;
  ManutencaoEmpresa(False);
  qrEmpresas.Close;
  LocalizarEmpresas;
end;

procedure TfmEmpresas.btnExcluirClick(Sender: TObject);
begin
  if (MessageDlg('Deseja realmente excluir a empresa selecionada?', mtConfirmation, [mbYes, mbNo], 0) = ID_YES) then
  begin
    CarregarDadosEmpresa;
    if FEmpresa.Excluir then
      ShowMessage('Empresa exclu?da com sucesso!')
    else
      ShowMessage('Falha ao excluir a empresa!');
    qrEmpresas.Close;
    LocalizarEmpresas;
  end;
end;

procedure TfmEmpresas.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfmEmpresas.btnFuncionariosClick(Sender: TObject);
var
  fmFuncionarios: TfmFuncionarios;
begin
  CarregarDadosEmpresa;
  fmFuncionarios := TfmFuncionarios.Create(FEmpresa.Id);
  try
    fmFuncionarios.ShowModal;
  finally
    fmFuncionarios.Free;
  end;
end;

procedure TfmEmpresas.btnIncluirClick(Sender: TObject);
begin
  ManutencaoEmpresa(True);
  qrEmpresas.Close;
  LocalizarEmpresas;
end;

procedure TfmEmpresas.CarregarDadosEmpresa;
begin
  with qrEmpresas do
  begin
    FEmpresa.Id := FieldByName('idEmpresa').AsInteger;
    FEmpresa.Nome := FieldByName('nmEmpresa').AsString;
    FEmpresa.CNPJ := FieldByName('nuCnpj').AsString;
    FEmpresa.NumeroInscricao := FieldByName('nuInscricao').AsString;
    FEmpresa.Status := iff(FieldByName('stAtivo').AsString = 'S', True, False);
    FEmpresa.DataCadastro := FieldByName('dtCadastro').AsDateTime;
    FEmpresa.DataAbertura := FieldByName('dtAbertura').AsDateTime;
    FEmpresa.Contato.TelefoneComercial := FieldByName('tlComercial').AsString;
    FEmpresa.Contato.TelefoneCelular := FieldByName('tlCelular').AsString;
    FEmpresa.Contato.Email := FieldByName('txEmail').AsString;
    FEmpresa.StatusExcluido := iff(FieldByName('stExcluido').AsString = 'S', True, False);
    FEmpresa.DataExcluido := FieldByName('dtExcluido').AsDateTime;
  end;
end;

constructor TfmEmpresas.Create;
begin
  inherited Create(nil);
  FEmpresa := TEmpresa.Create;
end;

procedure TfmEmpresas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FEmpresa.Free;
  Action := caFree;
  fmEmpresas := nil;
end;

procedure TfmEmpresas.FormShow(Sender: TObject);
begin
  qrEmpresas.Connection := dmDados.Dados;
  LocalizarEmpresas;
end;

procedure TfmEmpresas.LocalizarEmpresas;
begin
  qrEmpresas.Open();
end;

procedure TfmEmpresas.ManutencaoEmpresa(Incluir: Boolean);
var
  fmManutencaoEmpresa: TfmManutencaoEmpresa;
begin
  if Incluir then
    fmManutencaoEmpresa := TfmManutencaoEmpresa.Create(True, FEmpresa)
  else
    fmManutencaoEmpresa := TfmManutencaoEmpresa.Create(False, FEmpresa);
  try
    fmManutencaoEmpresa.ShowModal;
  finally
    fmManutencaoEmpresa.Release;
  end;
end;

procedure TfmEmpresas.qrEmpresasCalcFields(DataSet: TDataSet);
begin
  if (DataSet.FieldByName('stativo').AsString = 'S') then
    DataSet.FieldByName('descricaoativo').AsString := 'Ativo'
  else
    DataSet.FieldByName('descricaoativo').AsString := 'Inativo';
end;

end.
