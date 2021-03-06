unit uEmpresa;

interface

uses
  uEnderecoEmpresa, uFuncionario, uContatoPessoaJuridica;

type
  TArrayOfEnderecosSistema = array of TEnderecoEmpresa;
  TArrayOfFuncionarios = array of TFuncionario;

  TEmpresa = class
  private
    FId: Integer;
    FNome: string;
    FCNPJ: string;
    FNumeroInscricao: string;
    FStatus: Boolean;
    FDataCadastro: TDate;
    FDataAbertura: TDate;
    FContato: TContatoPessoaJuridica;
    FStatusExcluido: Boolean;
    FDataExcluido: TDate;
    FEnderecos: TArrayOfEnderecosSistema;
    FFuncionarios: TArrayOfFuncionarios;
  public
    constructor Create;
    destructor Destroy; override;

    property Id: Integer read FId write FId;
    property Nome: string read FNome write FNome;
    property CNPJ: string read FCNPJ write FCNPJ;
    property NumeroInscricao: string read FNumeroInscricao write FNumeroInscricao;
    property Status: Boolean read FStatus write FStatus;
    property DataCadastro: TDate read FDataCadastro write FDataCadastro;
    property DataAbertura: TDate read FDataAbertura write FDataAbertura;
    property Contato: TContatoPessoaJuridica read FContato write FContato;
    property StatusExcluido: Boolean read FStatusExcluido write FStatusExcluido;
    property DataExcluido: TDate read FDataExcluido write FDataExcluido;
    property Enderecos: TArrayOfEnderecosSistema read FEnderecos write FEnderecos;
    property Funcionarios: TArrayOfFuncionarios read FFuncionarios write FFuncionarios;

    function ObterProximoIdEmpresa: TEmpresa;
    function Cadastrar: Boolean;
    function Alterar: Boolean;
    function Excluir: Boolean;
  end;

implementation

uses
  FireDAC.Comp.Client, uUtils, uDataModule, System.SysUtils;

{ TEmpresa }

function TEmpresa.Alterar: Boolean;
var
  Query: TFDQuery;
begin
  Result := False;
  Query := InstanciarFDQuery(dmDados.Dados);
  try
    try
      Query.Close;
      Query.SQL.Clear;
      Query.SQL.Add('update cadEmpresa set ');
      Query.SQL.Add('   nmEmpresa = :pNmEmpresa,');
      Query.SQL.Add('   nuCnpj = :pNuCnpj,');
      Query.SQL.Add('   nuInscricao = :pNuInscricao,');
      Query.SQL.Add('   stAtivo = :pStAtivo,');
      Query.SQL.Add('   dtCadastro = :pDtCadastro,');
      Query.SQL.Add('   dtAbertura = :pDtAbertura,');
      Query.SQL.Add('   tlComercial = :pTlComercial,');
      Query.SQL.Add('   tlCelular = :pTlCelular,');
      Query.SQL.Add('   txObs = :pTxObs,');
      Query.SQL.Add('   txEmail = :pTxEmail,');
      Query.SQL.Add('   stExcluido = :pStExcluido,');
      Query.SQL.Add('   dtExcluido = :pDtExcluido');
      Query.SQL.Add('where idEmpresa = :pIdEmpresa');

      Query.ParamByName('pNmEmpresa').AsString := Self.Nome;
      Query.ParamByName('pNuCnpj').AsString := Self.CNPJ;
      if (Self.NumeroInscricao <> '') then
        Query.ParamByName('pNuInscricao').AsString := Self.NumeroInscricao
      else
        Query.ParamByName('pNuInscricao').Clear;
      Query.ParamByName('pStAtivo').AsString := iff(Self.Status, 'S', 'N');
      Query.ParamByName('pDtCadastro').AsDate := Self.DataCadastro;
      Query.ParamByName('pDtAbertura').AsDate := Self.DataAbertura;
      if (Self.Contato.TelefoneComercial <> '') then
        Query.ParamByName('pTlComercial').AsString :=
          Self.Contato.TelefoneComercial
      else
        Query.ParamByName('pTlComercial').Clear;

      if (Self.Contato.TelefoneCelular <> '') then
        Query.ParamByName('pTlCelular').AsString := Self.Contato.TelefoneCelular
      else
        Query.ParamByName('pTlCelular').Clear;

      Query.ParamByName('pTxObs').Clear();

      if (Self.Contato.Email <> '') then
        Query.ParamByName('pTxEmail').AsString := Self.Contato.Email
      else
        Query.ParamByName('pTxEmail').Clear;

      Query.ParamByName('pStExcluido').AsString :=
        iff(Self.StatusExcluido, 'S', 'N');

      if Self.DataExcluido = 0 then
        Query.ParamByName('pDtExcluido').Clear
      else
        Query.ParamByName('pDtExcluido').AsDate := Self.DataExcluido;

      Query.ParamByName('pIdEmpresa').AsInteger := Self.Id;
      Query.ExecSQL;
      Result := True;
    except
      Result := False;
    end;
  finally
    Query.Free;
  end;
end;

function TEmpresa.Cadastrar: Boolean;
var
  Query: TFDQuery;
begin
  Result := False;
  Query := InstanciarFDQuery(dmDados.Dados);
  try
    try
      Query.Close;
      Query.SQL.Clear;
      Query.SQL.Add
        ('insert into cadEmpresa (nmEmpresa, nuCnpj, nuInscricao, stAtivo, ');
      Query.SQL.Add
        ('dtCadastro, dtAbertura, tlComercial, tlCelular, txObs, txEmail, stExcluido, dtExcluido)');
      Query.SQL.Add
        ('values (:pNmEmpresa, :pNuCnpj, :pNuInscricao, :pStAtivo, :pDtCadastro, :pDtAbertura, ');
      Query.SQL.Add
        (':pTlComercial, :pTlCelular, :pTxObs, :pTxEmail, :pStExcluido, :pDtExcluido)');
      Query.ParamByName('pNmEmpresa').AsString := Self.Nome;
      Query.ParamByName('pNuCnpj').AsString := Self.CNPJ;
      if (Self.NumeroInscricao <> '') then
        Query.ParamByName('pNuInscricao').AsString := Self.NumeroInscricao
      else
        Query.ParamByName('pNuInscricao').Clear;
      Query.ParamByName('pStAtivo').AsString := iff(Self.Status, 'S', 'N');
      Query.ParamByName('pDtCadastro').AsDate := Self.DataCadastro;
      Query.ParamByName('pDtAbertura').AsDate := Self.DataAbertura;
      if (Self.Contato.TelefoneComercial <> '') then
        Query.ParamByName('pTlComercial').AsString :=
          Self.Contato.TelefoneComercial
      else
        Query.ParamByName('pTlComercial').Clear;

      if (Self.Contato.TelefoneCelular <> '') then
        Query.ParamByName('pTlCelular').AsString := Self.Contato.TelefoneCelular
      else
        Query.ParamByName('pTlCelular').Clear;

      Query.ParamByName('pTxObs').Clear();

      if (Self.Contato.Email <> '') then
        Query.ParamByName('pTxEmail').AsString := Self.Contato.Email
      else
        Query.ParamByName('pTxEmail').Clear;

      Query.ParamByName('pStExcluido').AsString :=
        iff(Self.StatusExcluido, 'S', 'N');

      if Self.DataExcluido = 0 then
        Query.ParamByName('pDtExcluido').Clear
      else
        Query.ParamByName('pDtExcluido').AsDate := Self.DataExcluido;

      Query.ExecSQL;
      Result := True;
    except
      Result := False;
    end;
  finally
    Query.Free;
  end;
end;

constructor TEmpresa.Create;
begin
  Self.Id := 0;
  Self.Contato := TContatoPessoaJuridica.Create;
  SetLength(Self.FEnderecos, 0);
  SetLength(Self.FFuncionarios, 0);
end;

destructor TEmpresa.Destroy;
var
  I: Integer;
begin
  FContato.Free;

  for I := 0 to Length(FEnderecos) - 1 do
    FEnderecos[I].Free;

  for I := 0 to Length(FFuncionarios) - 1 do
    FFuncionarios[I].Free;

  inherited;
end;

function TEmpresa.Excluir: Boolean;
var
  Query: TFDQuery;
begin
  Result := False;
  Query := InstanciarFDQuery(dmDados.Dados);
  try
    try
      Query.Close;
      Query.SQL.Clear;
      Query.SQL.Add('update cadEmpresa set');
      Query.SQL.Add('   stExcluido = ''S'',');
      Query.SQL.Add('   dtExcluido = :pDtExcluido,');
      Query.SQL.Add('   stAtivo = :pStAtivo');
      Query.SQL.Add('where idEmpresa = :pIdEmpresa');
      Query.ParamByName('pDtExcluido').AsDate := Now;
      Query.ParamByName('pStAtivo').AsString := 'N';
      Query.ParamByName('pIdEmpresa').AsInteger := Self.Id;
      Query.ExecSQL;
      Result := True;
    except
      Result := False;
    end;
  finally
    Query.Free;
  end;
end;

function TEmpresa.ObterProximoIdEmpresa: TEmpresa;
var
  Query: TFDQuery;
begin
  Query := InstanciarFDQuery(dmDados.Dados);
  try
    Query.Close;
    Query.SQL.Clear;
    Query.SQL.Add('select max(idEmpresa) as id from cadEmpresa');
    Query.Open();

    Self.Id := Query.FieldByName('id').AsInteger + 1;
    Result := Self;
  finally
    Query.Close;
  end;
end;

end.
