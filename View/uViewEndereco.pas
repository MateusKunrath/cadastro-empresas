unit uViewEndereco;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.DBCtrls, uDataModule, FireDAC.UI.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Phys, FireDAC.VCLUI.Wait,
  FireDAC.Phys.FBDef, FireDAC.Phys.IBBase, FireDAC.Phys.FB;

type
  TfmEndereco = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    edtEndereco: TEdit;
    Label2: TLabel;
    edtBairro: TEdit;
    Label3: TLabel;
    edtNro: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    dsEstado: TDataSource;
    dsCidade: TDataSource;
    qrCidade: TFDQuery;
    qrEstado: TFDQuery;
    qrCidadeNMCIDADE: TStringField;
    qrEstadoSGESTADO: TStringField;
    cbCidade: TDBLookupComboBox;
    qrCidadeIDCIDADE: TIntegerField;
    qrCidadeIDUF: TIntegerField;
    qrCidadeNOIBGE: TStringField;
    qrEstadoIDUF: TIntegerField;
    qrEstadoNMESTADO: TStringField;
    cbEstado: TDBLookupComboBox;
    Label6: TLabel;
    edtCEP: TEdit;
    chkEnderecoPrincipal: TCheckBox;
    btnCadastrar: TButton;
    Label7: TLabel;
    cbTitular: TDBLookupComboBox;
    dsTitular: TDataSource;
    qrTitular: TFDQuery;
    qrTitularIDTITULAR: TIntegerField;
    qrTitularIDEMPRESA: TIntegerField;
    qrTitularNMTITULAR: TStringField;
    qrTitularNUCNPJCPF: TStringField;
    qrTitularNUINCRICAORG: TStringField;
    qrTitularDTNASCIMENTO: TDateField;
    qrTitularDTCADASTRO: TDateField;
    qrTitularTXEMAIL: TStringField;
    qrTitularTXOBS: TStringField;
    qrTitularTLRESIDENCIAL: TStringField;
    qrTitularTLCOMERCIAL: TStringField;
    qrTitularTLCELULAR: TStringField;
    qrTitularTLCONTATO: TStringField;
    qrTitularNMCONTATO: TStringField;
    qrTitularSTEXCLUIDO: TStringField;
    qrTitularDTEXCLUIDO: TDateField;
    qrTitularSTATIVO: TStringField;
    procedure FormShow(Sender: TObject);
    procedure btnCadastrarClick(Sender: TObject);
  private
    { Private declarations }
    FIdEndereco: Integer;
    iIdEmpresa: Integer;
    bIncluir: Boolean;
    procedure CarregarDadosEndereco;
    procedure CadastrarEndereco;
    procedure AlterarEndereco;
  public
    { Public declarations }
    constructor Create(IdEmpresa: Integer); overload;
    constructor Create(IdEmpresa: Integer; IdEndereco: Integer); overload;
  end;

var
  fmEndereco: TfmEndereco;

implementation

uses
  uUtils;

{$R *.dfm}

{ TfmEndereco }

constructor TfmEndereco.Create(IdEmpresa: Integer);
begin
  inherited Create(nil);
  iIdEmpresa := IdEmpresa;
  FIdEndereco := 0;
  btnCadastrar.Caption := 'Cadastrar';
  bIncluir := True;
end;

procedure TfmEndereco.AlterarEndereco;
var
  Query: TFDQuery;
begin
  Query := InstanciarFDQuery(dmDados.Dados);
  try
    if chkEnderecoPrincipal.Checked then
    begin
      Query.Close;
      Query.SQL.Clear;
      Query.SQL.Add('update cadEnderecos set ');
      Query.SQL.Add('   stAtivo = ''N''');
      Query.SQL.Add('where idEmpresa = :pIdEmpresa');
      Query.ParamByName('pIdEmpresa').AsInteger := iIdEmpresa;
      Query.ExecSQL;
    end;

    Query.Close;
    Query.SQL.Clear;
    Query.SQL.Add('update cadEnderecos set');
    Query.SQL.Add('   idTitular = :pIdTitular,');
    Query.SQL.Add('   nmEndereco = :pNmEndereco,');
    Query.SQL.Add('   nuEndereco = :pNuEndereco,');
    Query.SQL.Add('   nmBairro = :pNmBairro,');
    Query.SQL.Add('   idCidade = :pIdCidade,');
    Query.SQL.Add('   idUf = :pIdUf,');
    Query.SQL.Add('   nuCep = :pNuCep,');
    Query.SQL.Add('   stAtivo = :pStAtivo');
    Query.SQL.Add('where idEndereco = :pIdEndereco');
    Query.ParamByName('pIdTitular').AsInteger := cbTitular.KeyValue;
    Query.ParamByName('pNmEndereco').AsString := Trim(edtEndereco.Text);
    Query.ParamByName('pNuEndereco').AsString := Trim(edtNro.Text);
    Query.ParamByName('pNmBairro').AsString := Trim(edtBairro.Text);
    Query.ParamByName('pIdCidade').AsInteger := cbCidade.KeyValue;
    Query.ParamByName('pIdUf').AsInteger := cbEstado.KeyValue;
    Query.ParamByName('pNuCep').AsString := Trim(edtCEP.Text);
    Query.ParamByName('pStAtivo').AsString := iff(chkEnderecoPrincipal.Checked, 'S', 'N');
    Query.ParamByName('pIdEndereco').AsInteger := FIdEndereco;
    Query.ExecSQL;
  finally
    Query.Free;
  end;
end;

procedure TfmEndereco.btnCadastrarClick(Sender: TObject);
begin
  if bIncluir then
    CadastrarEndereco
  else
    AlterarEndereco;
end;

procedure TfmEndereco.CadastrarEndereco;
var
  Query: TFDQuery;
begin
  Query := InstanciarFDQuery(dmDados.Dados);
  try
    if chkEnderecoPrincipal.Checked then
    begin
      Query.Close;
      Query.SQL.Clear;
      Query.SQL.Add('update cadEnderecos set ');
      Query.SQL.Add('   stAtivo = ''N''');
      Query.SQL.Add('where idEmpresa = :pIdEmpresa');
      Query.ParamByName('pIdEmpresa').AsInteger := iIdEmpresa;
      Query.ExecSQL;
    end;

    Query.Close;
    Query.SQL.Clear;
    Query.SQL.Add('insert into cadEnderecos (');
    Query.SQL.Add('   idTitular, idEmpresa, nmEndereco, nuEndereco,');
    Query.SQL.Add('   nmBairro, idCidade, idUf, nuCep, stAtivo,');
    Query.SQL.Add('   stExcluido, dtExcluido, tpCadastro');
    Query.SQL.Add(') values (');
    Query.SQL.Add('   :pIdTitular, :pIdEmpresa, :pNmEndereco, :pNuEndereco,');
    Query.SQL.Add('   :pNmBairro, :pIdCidade, :pIdUf, :pNuCep, :pStAtivo,');
    Query.SQL.Add('   :pStExcluido, :pDtExcluido, :pTpCadastro');
    Query.SQL.Add(')');
    Query.ParamByName('pIdTitular').AsInteger := cbTitular.KeyValue;
    Query.ParamByName('pIdEmpresa').AsInteger := iIdEmpresa;
    Query.ParamByName('pNmEndereco').AsString := Trim(edtEndereco.Text);
    Query.ParamByName('pNuEndereco').AsString := Trim(edtNro.Text);
    Query.ParamByName('pNmBairro').AsString := Trim(edtBairro.Text);
    Query.ParamByName('pIdCidade').AsInteger := cbCidade.KeyValue;
    Query.ParamByName('pIdUf').AsInteger := cbEstado.KeyValue;
    Query.ParamByName('pNuCep').AsString := Trim(edtCEP.Text);
    Query.ParamByName('pStAtivo').AsString := iff(chkEnderecoPrincipal.Checked, 'S', 'N');
    Query.ParamByName('pStExcluido').AsString := 'N';
    Query.ExecSQL;
  finally
    Query.Free;
  end;
end;

procedure TfmEndereco.CarregarDadosEndereco;
var
  qrDadosEndereco: TFDQuery;
begin
  qrDadosEndereco := InstanciarFDQuery(dmDados.Dados);
  try
    qrDadosEndereco.Close;
    qrDadosEndereco.SQL.Clear;
    qrDadosEndereco.SQL.Add('select * from cadEnderecos');
    qrDadosEndereco.SQL.Add('where idEndereco = :pIdEndereco');
    qrDadosEndereco.ParamByName('pIdEndereco').AsInteger := FIdEndereco;
    qrDadosEndereco.Open();

    edtEndereco.Text := qrDadosEndereco.FieldByName('nmEndereco').AsString;
    edtBairro.Text := qrDadosEndereco.FieldByName('nmBairro').AsString;
    edtNro.Text := qrDadosEndereco.FieldByName('nuEndereco').AsString;
    edtCEP.Text := qrDadosEndereco.FieldByName('nuCep').AsString;
    cbCidade.KeyValue := qrDadosEndereco.FieldByName('idCidade').AsInteger;
    cbEstado.KeyValue := qrDadosEndereco.FieldByName('idUf').AsInteger;
    cbTitular.KeyValue := qrDadosEndereco.FieldByName('idTitular').AsInteger;
    chkEnderecoPrincipal.Checked := iff(qrDadosEndereco.FieldByName('stAtivo').AsString = 'S', True, False);
  finally
    qrDadosEndereco.Free;
  end;
end;

constructor TfmEndereco.Create(IdEmpresa: Integer; IdEndereco: Integer);
begin
  inherited Create(nil);
  iIdEmpresa := IdEmpresa;
  FIdEndereco := IdEndereco;
  btnCadastrar.Caption := 'Alterar';
  bIncluir := False;
end;

procedure TfmEndereco.FormShow(Sender: TObject);
begin
  qrCidade.Connection := dmDados.Dados;
  qrEstado.Connection := dmDados.Dados;
  qrTitular.Connection := dmDados.Dados;

  qrCidade.Open();
  qrEstado.Open();
  qrTitular.Open();

  if (FIdEndereco > 0) then
    CarregarDadosEndereco;
end;

end.
