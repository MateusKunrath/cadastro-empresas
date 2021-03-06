unit uViewManutencaoFuncionario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Mask,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.Buttons, Vcl.DBCtrls, uFuncionario, Vcl.ComCtrls;

type
  TfmManutencaoFuncionario = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    edtNomeFuncionario: TEdit;
    Label2: TLabel;
    edtCPF: TMaskEdit;
    Label3: TLabel;
    edtRG: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    edtEmail: TEdit;
    Label6: TLabel;
    edtTelResidencial: TMaskEdit;
    Label7: TLabel;
    edtTelCelular: TMaskEdit;
    Label8: TLabel;
    edtTelContato: TMaskEdit;
    Label9: TLabel;
    edtNomeContato: TEdit;
    Label10: TLabel;
    edtNroTituloEleitor: TEdit;
    Label11: TLabel;
    edtNroCarteiraTrabalho: TEdit;
    Label12: TLabel;
    edtNroCNH: TEdit;
    Label13: TLabel;
    Label14: TLabel;
    edtCategoriaCNH: TEdit;
    Label15: TLabel;
    paDataDemissao: TPanel;
    Label16: TLabel;
    Bevel1: TBevel;
    Label17: TLabel;
    edtEndereco: TEdit;
    Label18: TLabel;
    edtBairro: TEdit;
    Label19: TLabel;
    edtNro: TEdit;
    cbCidade: TDBLookupComboBox;
    Label20: TLabel;
    Label21: TLabel;
    cbEstado: TDBLookupComboBox;
    btnDemitirFuncionario: TSpeedButton;
    dsCidade: TDataSource;
    dsEstado: TDataSource;
    qrCidade: TFDQuery;
    qrEstado: TFDQuery;
    qrEstadoIDUF: TIntegerField;
    qrEstadoNMESTADO: TStringField;
    qrEstadoSGESTADO: TStringField;
    qrCidadeIDCIDADE: TIntegerField;
    qrCidadeNMCIDADE: TStringField;
    qrCidadeIDUF: TIntegerField;
    qrCidadeNOIBGE: TStringField;
    btnConfirmar: TButton;
    edtDataNascimento: TDateTimePicker;
    edtDataValidadeCNH: TDateTimePicker;
    edtDataContratacao: TDateTimePicker;
    edtDataDemissao: TDateTimePicker;
    chkUsuarioAtivo: TCheckBox;
    Label22: TLabel;
    edtCEP: TEdit;
    procedure FormShow(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure btnDemitirFuncionarioClick(Sender: TObject);
  private
    { Private declarations }
    FFuncionario: TFuncionario;
    bIncluir: Boolean;

    function ManutencaoFuncionario: Boolean;
  public
    { Public declarations }
    constructor Create(IdEmpresa: Integer); overload;
    constructor Create(Funcionario: TFuncionario); overload;
  end;

var
  fmManutencaoFuncionario: TfmManutencaoFuncionario;

implementation

uses
  uDataModule, uUtils;

{$R *.dfm}

{ TfmManutencaoFuncionario }

constructor TfmManutencaoFuncionario.Create(IdEmpresa: Integer);
begin
  inherited Create(nil);
  bIncluir := True;
  FFuncionario := TFuncionario.Create;
  FFuncionario.IdEmpresa := IdEmpresa;
  btnDemitirFuncionario.Enabled := False;
  btnDemitirFuncionario.Visible := False;
  Caption := Caption + ' - Incluir';
end;

procedure TfmManutencaoFuncionario.btnConfirmarClick(Sender: TObject);
begin
  if ManutencaoFuncionario then
  begin
    if bIncluir then
    begin
      if FFuncionario.Cadastrar then
        ShowMessage('Cadastro do funcion?rio realizado com sucesso!')
      else
        ShowMessage('Falha no cadastro do funcion?rio!');
    end
    else
    begin
      if FFuncionario.Alterar then
        ShowMessage('Altera??o do funcion?rio realizado com sucesso!')
      else
        ShowMessage('Falha na altera??o do funcion?rio!');
    end;
  end;
end;

procedure TfmManutencaoFuncionario.btnDemitirFuncionarioClick(Sender: TObject);
begin
  if ManutencaoFuncionario then
  begin
    FFuncionario.Demitir;
    btnConfirmar.Enabled := False;
  end;
end;

constructor TfmManutencaoFuncionario.Create(Funcionario: TFuncionario);
begin
  inherited Create(nil);
  bIncluir := False;
  FFuncionario := Funcionario;
  btnDemitirFuncionario.Enabled := True;
  btnDemitirFuncionario.Visible := True;
  Caption := Caption + ' - Alterar';
end;

procedure TfmManutencaoFuncionario.FormShow(Sender: TObject);
begin
  qrCidade.Connection := dmDados.Dados;
  qrEstado.Connection := dmDados.Dados;

  qrCidade.Open();
  qrEstado.Open();

  if not bIncluir then
  begin
    edtNomeFuncionario.Text := FFuncionario.Nome;
    edtCPF.Text := FFuncionario.CPF;
    edtRG.Text := FFuncionario.RG;

    if FFuncionario.DataNascimento > 0 then
      edtDataNascimento.Date := FFuncionario.DataNascimento
    else
      edtDataNascimento.Date := Now;

    edtEmail.Text := FFuncionario.Contato.Email;
    edtTelResidencial.Text := FFuncionario.Contato.TelefoneResidencial;
    edtTelCelular.Text := FFuncionario.Contato.TelefoneCelular;
    edtTelContato.Text := FFuncionario.Contato.TelefoneContato;
    edtNomeContato.Text := FFuncionario.Contato.NomeContato;
    edtNroTituloEleitor.Text := FFuncionario.NumeroTituloEleitor;
    edtNroCarteiraTrabalho.Text := FFuncionario.NumeroCarteiraTrabalho;
    edtNroCNH.Text := FFuncionario.CarteiraMotorista.Numero;

    if FFuncionario.CarteiraMotorista.DataValidade > 0 then
      edtDataValidadeCNH.Date := FFuncionario.CarteiraMotorista.DataValidade
    else
      edtDataValidadeCNH.Date := Now;

    edtCategoriaCNH.Text := FFuncionario.CarteiraMotorista.Categoria;

    if FFuncionario.DataContratacao > 0 then
      edtDataContratacao.Date := FFuncionario.DataContratacao
    else
      edtDataContratacao.Date := Now;

    if (FFuncionario.DataDemissao > 0) then
    begin
      paDataDemissao.Visible := True;
      edtDataDemissao.Date := FFuncionario.DataDemissao;
      btnDemitirFuncionario.Enabled := False;
    end;

    chkUsuarioAtivo.Checked := FFuncionario.Ativo;
    edtEndereco.Text := FFuncionario.Endereco.Nome;
    edtBairro.Text := FFuncionario.Endereco.Bairro;
    edtNro.Text := FFuncionario.Endereco.Numero;
    edtCEP.Text := FFuncionario.Endereco.CEP;
    cbCidade.KeyValue := FFuncionario.Endereco.IdCidade;
    cbEstado.KeyValue := FFuncionario.Endereco.IdUF;
  end;
end;

function TfmManutencaoFuncionario.ManutencaoFuncionario: Boolean;
begin
  Result := False;
  if (Trim(edtNomeFuncionario.Text) = '') then
  begin
    ShowMessage('O nome do funcion?rio ? obrigat?rio!');
    Exit;
  end;

  if (Trim(edtCPF.Text) = '') then
  begin
    ShowMessage('O CPF do funcion?rio ? obrigat?rio!');
    Exit;
  end;

  if not (isCPF(Trim(edtCPF.Text))) then
  begin
    ShowMessage('O CPF informado n?o ? um CPF v?lido!');
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

  if (edtDataNascimento.Date > Now) then
  begin
    ShowMessage('A data de nascimento n?o pode ser uma data futura!');
    Exit;
  end;

  if (edtDataContratacao.Date > Now) then
  begin
    ShowMessage('A data de contrata??o n?o pode ser uma data futura!');
    Exit;
  end;

  if (paDataDemissao.Visible) then
  begin
    if (edtDataDemissao.Date > Now) then
    begin
      ShowMessage('A data de demiss?o n?o pode ser uma data futura!');
      Exit;
    end;
  end;

  FFuncionario.Nome := Trim(edtNomeFuncionario.Text);
  FFuncionario.CPF := Trim(edtCPF.Text);
  FFuncionario.RG := Trim(edtRG.Text);
  FFuncionario.DataNascimento := edtDataNascimento.Date;
  FFuncionario.NumeroCarteiraTrabalho := Trim(edtNroCarteiraTrabalho.Text);
  FFuncionario.NumeroTituloEleitor := Trim(edtNroTituloEleitor.Text);
  FFuncionario.CarteiraMotorista.Numero := Trim(edtNroCNH.Text);
  FFuncionario.CarteiraMotorista.DataValidade := edtDataValidadeCNH.Date;
  FFuncionario.CarteiraMotorista.Categoria := Trim(edtCategoriaCNH.Text);
  FFuncionario.Endereco.Nome := Trim(edtEndereco.Text);
  FFuncionario.Endereco.Numero := Trim(edtNro.Text);
  FFuncionario.Endereco.Bairro := Trim(edtBairro.Text);
  FFuncionario.Endereco.IdCidade := cbCidade.KeyValue;
  FFuncionario.Endereco.IdUF := cbEstado.KeyValue;
  FFuncionario.Endereco.CEP := Trim(edtCEP.Text);
  FFuncionario.Contato.TelefoneResidencial := Trim(edtTelResidencial.Text);
  FFuncionario.Contato.TelefoneContato := Trim(edtTelContato.Text);
  FFuncionario.Contato.NomeContato := Trim(edtNomeContato.Text);
  FFuncionario.Contato.TelefoneCelular := Trim(edtTelCelular.Text);
  FFuncionario.Contato.Email := Trim(edtEmail.Text);
  FFuncionario.DataContratacao := edtDataContratacao.Date;

  if paDataDemissao.Visible then
    FFuncionario.DataDemissao := edtDataDemissao.Date
  else
    FFuncionario.DataDemissao := 0;

  FFuncionario.DataCadastro := Now;
  FFuncionario.Ativo := chkUsuarioAtivo.Checked;
  FFuncionario.Excluido := False;
  FFuncionario.DataExclusao := 0;

  Result := True;
end;

end.
