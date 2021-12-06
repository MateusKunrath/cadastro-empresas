unit uViewFuncionarios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.ExtCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, uFuncionario;

type
  TfmFuncionarios = class(TForm)
    Panel1: TPanel;
    grFuncionarios: TDBGrid;
    dsFuncionarios: TDataSource;
    qrFuncionarios: TFDQuery;
    qrFuncionariosIDFUNCIONARIO: TIntegerField;
    qrFuncionariosIDEMPRESA: TIntegerField;
    qrFuncionariosNMFUNCIONARIO: TStringField;
    qrFuncionariosNUCPF: TStringField;
    qrFuncionariosNURG: TStringField;
    qrFuncionariosDTNASCIMENTO: TDateField;
    qrFuncionariosTXEMAIL: TStringField;
    qrFuncionariosNUCARTEIRATRAB: TStringField;
    qrFuncionariosNUTITULOELEITOR: TStringField;
    qrFuncionariosNUCARTEIRAMOTORISTA: TStringField;
    qrFuncionariosTPCATERORIA: TStringField;
    qrFuncionariosDTVALIDADECARTEIRAMOT: TDateField;
    qrFuncionariosTLRESIDENCIAL: TStringField;
    qrFuncionariosTLCELULAR: TStringField;
    qrFuncionariosTLCONTATO: TStringField;
    qrFuncionariosNMCONTATO: TStringField;
    qrFuncionariosDTCONTRATACAO: TDateField;
    qrFuncionariosDTDEMISSAO: TDateField;
    qrFuncionariosDTCADASTRO: TDateField;
    qrFuncionariosSTATIVO: TStringField;
    qrFuncionariosTXOBS: TStringField;
    qrFuncionariosNMENDERECO: TStringField;
    qrFuncionariosNUENDERECO: TStringField;
    qrFuncionariosNMBAIRRO: TStringField;
    qrFuncionariosIDCIDADE: TIntegerField;
    qrFuncionariosIDUF: TIntegerField;
    qrFuncionariosNUCEP: TStringField;
    qrFuncionariosSTEXCLUIDO: TStringField;
    qrFuncionariosDTEXCLUIDO: TDateField;
    Bevel1: TBevel;
    btnIncluir: TButton;
    btnAlterar: TButton;
    btnExcluir: TButton;
    qrFuncionariosDescricaoAtivo: TStringField;
    procedure FormShow(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnAlterarClick(Sender: TObject);
    procedure qrFuncionariosCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
    FFuncionario: TFuncionario;
    iIdEmpresa: Integer;
    procedure LocalizarFuncionarios;
    procedure ManutencaoFuncionarios(Incluir: Boolean);
    procedure CarregarDadosFuncionario;
  public
    { Public declarations }
    constructor Create(IdEmpresa: Integer);
  end;

var
  fmFuncionarios: TfmFuncionarios;

implementation

uses
  uDataModule, uViewManutencaoFuncionario, uUtils;

{$R *.dfm}

{ TfmFuncionarios }

procedure TfmFuncionarios.btnAlterarClick(Sender: TObject);
begin
  CarregarDadosFuncionario;
  ManutencaoFuncionarios(False);
  qrFuncionarios.Close;
  qrFuncionarios.Open();
end;

procedure TfmFuncionarios.btnIncluirClick(Sender: TObject);
begin
  ManutencaoFuncionarios(True);
  qrFuncionarios.Close;
  qrFuncionarios.Open();
end;

procedure TfmFuncionarios.CarregarDadosFuncionario;
begin
  with qrFuncionarios do
  begin
    FFuncionario.Id := FieldByName('idFuncionario').AsInteger;
    FFuncionario.IdEmpresa := FieldByName('idEmpresa').AsInteger;
    FFuncionario.Nome := FieldByName('nmFuncionario').AsString;
    FFuncionario.CPF := FieldByName('nuCpf').AsString;
    FFuncionario.RG := FieldByName('nuRg').AsString;
    FFuncionario.DataNascimento := FieldByName('dtNascimento').AsDateTime;
    FFuncionario.NumeroCarteiraTrabalho := FieldByName('nuCarteiraTrab').AsString;
    FFuncionario.NumeroTituloEleitor := FieldByName('nuTituloEleitor').AsString;
    FFuncionario.CarteiraMotorista.Numero := FieldByName('nuCarteiraMotorista').AsString;
    FFuncionario.CarteiraMotorista.DataValidade := FieldByName('dtValidadeCarteiraMot').AsDateTime;
    FFuncionario.CarteiraMotorista.Categoria := FieldByName('tpCateroria').AsString;
    FFuncionario.Endereco.Nome := FieldByName('nmEndereco').AsString;
    FFuncionario.Endereco.Numero := FieldByName('nuEndereco').AsString;
    FFuncionario.Endereco.Bairro := FieldByName('nmBairro').AsString;
    FFuncionario.Endereco.IdCidade := FieldByName('idCidade').AsInteger;
    FFuncionario.Endereco.IdUF := FieldByName('idUf').AsInteger;
    FFuncionario.Endereco.CEP := FieldByName('nuCep').AsString;
    FFuncionario.Contato.TelefoneResidencial := FieldByName('tlResidencial').AsString;
    FFuncionario.Contato.TelefoneContato := FieldByName('tlContato').AsString;
    FFuncionario.Contato.NomeContato := FieldByName('nmContato').AsString;
    FFuncionario.Contato.TelefoneCelular := FieldByName('tlCelular').AsString;
    FFuncionario.Contato.Email := FieldByName('txEmail').AsString;
    FFuncionario.DataContratacao := FieldByName('dtContratacao').AsDateTime;
    FFuncionario.DataDemissao := FieldByName('dtDemissao').AsDateTime;
    FFuncionario.DataCadastro := FieldByName('dtCadastro').AsDateTime;
    FFuncionario.Ativo := iff(FieldByName('stAtivo').AsString = 'S', True, False);
    FFuncionario.Excluido := iff(FieldByName('stExcluido').AsString = 'S', True, False);
    FFuncionario.DataExclusao := FieldByName('dtExcluido').AsDateTime;
  end;
end;

constructor TfmFuncionarios.Create(IdEmpresa: Integer);
begin
  inherited Create(nil);
  Self.iIdEmpresa := IdEmpresa;
  FFuncionario := TFuncionario.Create;
end;

procedure TfmFuncionarios.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(FFuncionario);
end;

procedure TfmFuncionarios.FormShow(Sender: TObject);
begin
  qrFuncionarios.Connection := dmDados.Dados;
  LocalizarFuncionarios;
end;

procedure TfmFuncionarios.LocalizarFuncionarios;
begin
  qrFuncionarios.Close;
  qrFuncionarios.SQL.Clear;
  qrFuncionarios.SQL.Add('select * from cadFuncionarios');
  qrFuncionarios.SQL.Add('where idEmpresa = :pIdEmpresa');
  qrFuncionarios.ParamByName('pIdEmpresa').AsInteger := iIdEmpresa;
  qrFuncionarios.Open();
end;

procedure TfmFuncionarios.ManutencaoFuncionarios(Incluir: Boolean);
var
  fmManutencaoFuncionario: TfmManutencaoFuncionario;
begin
  if Incluir then
    fmManutencaoFuncionario := TfmManutencaoFuncionario.Create(iIdEmpresa)
  else
    fmManutencaoFuncionario := TfmManutencaoFuncionario.Create(FFuncionario);
  try
    fmManutencaoFuncionario.ShowModal;
  finally
    fmManutencaoFuncionario.Release;
  end;
end;

procedure TfmFuncionarios.qrFuncionariosCalcFields(DataSet: TDataSet);
begin
  if DataSet.FieldByName('stAtivo').AsString = 'S' then
    DataSet.FieldByName('DescricaoAtivo').AsString := 'Ativo'
  else
    DataSet.FieldByName('DescricaoAtivo').AsString := 'Inativo';
end;

end.
