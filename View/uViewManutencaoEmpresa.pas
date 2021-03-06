unit uViewManutencaoEmpresa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Mask, Vcl.ComCtrls, Vcl.CheckLst, Data.DB, Vcl.Grids,
  Vcl.DBGrids, uEmpresa, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, uDataModule;

type
  TfmManutencaoEmpresa = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    edtNomeEmpresa: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    edtNumInscricao: TEdit;
    edtCNPJ: TMaskEdit;
    rgStatus: TRadioGroup;
    Label4: TLabel;
    edtTelefoneComercial: TMaskEdit;
    Label5: TLabel;
    edtTelefoneCelular: TMaskEdit;
    Label6: TLabel;
    edtEmail: TEdit;
    Label7: TLabel;
    edtDataAbertura: TDateTimePicker;
    btnCadastrarAlterar: TButton;
    btnCancelar: TButton;
    Label8: TLabel;
    btnAdicionarEndereco: TButton;
    grEnderecos: TDBGrid;
    qrEnderecos: TFDQuery;
    qrEnderecosIDENDERECO: TIntegerField;
    qrEnderecosIDTITULAR: TIntegerField;
    qrEnderecosIDEMPRESA: TIntegerField;
    qrEnderecosNMENDERECO: TStringField;
    qrEnderecosNUENDERECO: TStringField;
    qrEnderecosNMBAIRRO: TStringField;
    qrEnderecosIDCIDADE: TIntegerField;
    qrEnderecosIDUF: TIntegerField;
    qrEnderecosNUCEP: TStringField;
    qrEnderecosSTATIVO: TStringField;
    qrEnderecosSTEXCLUIDO: TStringField;
    qrEnderecosDTEXCLUIDO: TDateField;
    qrEnderecosTPCADASTRO: TStringField;
    qrEnderecosDescricaoAtivo: TStringField;
    qrEnderecosDescricaoEndereco: TStringField;
    dsEnderecos: TDataSource;
    btnAlterarEndereco: TButton;
    procedure btnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure qrEnderecosCalcFields(DataSet: TDataSet);
    procedure btnAdicionarEnderecoClick(Sender: TObject);
    procedure btnAlterarEnderecoClick(Sender: TObject);
    procedure btnCadastrarAlterarClick(Sender: TObject);
  private
    { Private declarations }
    FEmpresa: TEmpresa;
    bIncluir: Boolean;
    procedure LocalizarEndereco;
    procedure ManutencaoEndereco(Incluir: Boolean);
    procedure CadastrarEmpresa(Incluir: Boolean);
  public
    { Public declarations }
    constructor Create(Incluir: Boolean; Empresa: TEmpresa);
  end;

var
  fmManutencaoEmpresa: TfmManutencaoEmpresa;

implementation

uses
  uUtils, uViewEndereco;

{$R *.dfm}
{ TfmManutencaoEmpresa }

procedure TfmManutencaoEmpresa.btnAdicionarEnderecoClick(Sender: TObject);
begin
  ManutencaoEndereco(True);
end;

procedure TfmManutencaoEmpresa.btnAlterarEnderecoClick(Sender: TObject);
begin
  ManutencaoEndereco(False);
end;

procedure TfmManutencaoEmpresa.btnCadastrarAlterarClick(Sender: TObject);
begin
  if bIncluir then
    CadastrarEmpresa(True)
  else
    CadastrarEmpresa(False);
end;

procedure TfmManutencaoEmpresa.btnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TfmManutencaoEmpresa.CadastrarEmpresa(Incluir: Boolean);
begin
  if (Trim(edtNomeEmpresa.Text) = '') then
  begin
    ShowMessage('O nome da empresa ? obrigat?rio!');
    Exit;
  end;

  if (Trim(edtCNPJ.Text) = '') then
  begin
    ShowMessage('O CNPJ da empresa ? obrigat?rio!');
    Exit;
  end;

  if not (IsValidCNPJ(Trim(edtCNPJ.Text))) then
  begin
    ShowMessage('O CNPJ informado n?o ? um CNPJ v?lido!');
    Exit;
  end;

  if Trim(edtEmail.Text) <> '' then
  begin
    if not (ValidarEmail(edtEmail.Text)) then
    begin
      ShowMessage('O e-mail informado n?o ? um e-mail v?lido!');
      Exit;
    end;
  end;

  if (edtDataAbertura.Date > Now) then
  begin
    ShowMessage('A data de abertura n?o pode ser uma data futura!');
    Exit;
  end;

  FEmpresa.Nome := Trim(edtNomeEmpresa.Text);
  FEmpresa.CNPJ := Trim(edtCNPJ.Text);
  FEmpresa.NumeroInscricao := Trim(edtNumInscricao.Text);
  FEmpresa.Status := iff(rgStatus.ItemIndex = 0, True, False);
  FEmpresa.DataCadastro := Now;
  FEmpresa.DataAbertura := edtDataAbertura.Date;
  FEmpresa.Contato.TelefoneComercial := Trim(edtTelefoneComercial.Text);
  FEmpresa.Contato.TelefoneCelular := Trim(edtTelefoneCelular.Text);
  FEmpresa.Contato.Email := Trim(edtEmail.Text);

  if Incluir then
  begin
    if FEmpresa.Cadastrar then
      ShowMessage('Empresa cadastrada com sucesso!')
    else
      ShowMessage('Falha ao cadastrar a empresa!');
  end
  else
  begin
    if FEmpresa.Alterar then
      ShowMessage('Empresa alterada com sucesso!')
    else
      ShowMessage('Falha ao alterar a empresa!');
  end;
end;

constructor TfmManutencaoEmpresa.Create(Incluir: Boolean; Empresa: TEmpresa);
begin
  inherited Create(nil);
  FEmpresa := Empresa;
  bIncluir := Incluir;
end;

procedure TfmManutencaoEmpresa.FormShow(Sender: TObject);
begin
  btnCadastrarAlterar.Caption := 'Cadastrar';
  qrEnderecos.Connection := dmDados.Dados;
  if not bIncluir then
  begin
    btnCadastrarAlterar.Caption := 'Alterar';
    edtNomeEmpresa.Text := FEmpresa.Nome;
    edtNumInscricao.Text := FEmpresa.NumeroInscricao;
    edtCNPJ.Text := FEmpresa.CNPJ;
    edtTelefoneComercial.Text := FEmpresa.Contato.TelefoneComercial;
    edtTelefoneCelular.Text := FEmpresa.Contato.TelefoneCelular;
    edtEmail.Text := FEmpresa.Contato.Email;
    edtDataAbertura.Date := iff(FEmpresa.DataAbertura = 0, Now,
      FEmpresa.DataAbertura);

    if FEmpresa.Status then
      rgStatus.ItemIndex := 0
    else
      rgStatus.ItemIndex := 1;

    LocalizarEndereco;
  end;
end;

procedure TfmManutencaoEmpresa.LocalizarEndereco;
begin
  qrEnderecos.Close;
  qrEnderecos.SQL.Clear;
  qrEnderecos.SQL.Add('select * from cadenderecos');
  qrEnderecos.SQL.Add('where idEmpresa = :pIdEmpresa');
  qrEnderecos.ParamByName('pIdEmpresa').AsInteger := FEmpresa.Id;
  qrEnderecos.Open();
end;

procedure TfmManutencaoEmpresa.ManutencaoEndereco(Incluir: Boolean);
var
  fmEndereco: TfmEndereco;
begin
  if Incluir then
  begin
    if FEmpresa.Id = 0 then
      fmEndereco := TfmEndereco.Create(FEmpresa.ObterProximoIdEmpresa.Id)
    else
      fmEndereco := TfmEndereco.Create(FEmpresa.Id)
  end
  else
    fmEndereco := TfmEndereco.Create(FEmpresa.Id, qrEnderecos.FieldByName('idEndereco').AsInteger);
  try
    fmEndereco.ShowModal;
  finally
    fmEndereco.Release;
  end;

  qrEnderecos.Close;
  LocalizarEndereco;
end;

procedure TfmManutencaoEmpresa.qrEnderecosCalcFields(DataSet: TDataSet);
begin
  if (DataSet.FieldByName('stAtivo').AsString = 'S') then
    DataSet.FieldByName('DescricaoAtivo').AsString := 'Ativo'
  else
    DataSet.FieldByName('DescricaoAtivo').AsString := 'Inativo';

  DataSet.FieldByName('DescricaoEndereco').AsString :=
    Format('%s, %s, %s', [DataSet.FieldByName('nmEndereco').AsString,
    DataSet.FieldByName('nuEndereco').AsString, DataSet.FieldByName('nmBairro')
    .AsString]);
end;

end.
