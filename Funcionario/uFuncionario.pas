unit uFuncionario;

interface

uses
  uEndereco, uContatoPessoaFisica, uCarteiraMotorista;

type
  TFuncionario = class
  private
    FIdEmpresa: Integer;
    FId: Integer;
    FRG: string;
    FDataNascimento: TDate;
    FCPF: string;
    FNome: string;
    FNumeroCarteiraTrabalho: string;
    FNumeroTituloEleitor: string;
    FCarteiraMotorista: TCarteiraMotorista;
    FEndereco: TEndereco;
    FContato: TContatoPessoaFisica;
    FAtivo: Boolean;
    FDataContratacao: TDate;
    FDataExclusao: TDate;
    FDataCadastro: TDate;
    FExcluido: Boolean;
    FDataDemissao: TDate;
  public
    constructor Create;
    destructor Destroy; override;

    property Id: Integer read FId write FId;
    property IdEmpresa: Integer read FIdEmpresa write FIdEmpresa;
    property Nome: string read FNome write FNome;
    property CPF: string read FCPF write FCPF;
    property RG: string read FRG write FRG;
    property DataNascimento: TDate read FDataNascimento write FDataNascimento;
    property NumeroCarteiraTrabalho: string read FNumeroCarteiraTrabalho write FNumeroCarteiraTrabalho;
    property NumeroTituloEleitor: string read FNumeroTituloEleitor write FNumeroTituloEleitor;
    property CarteiraMotorista: TCarteiraMotorista read FCarteiraMotorista write FCarteiraMotorista;
    property Endereco: TEndereco read FEndereco write FEndereco;
    property Contato: TContatoPessoaFisica read FContato write FContato;
    property DataContratacao: TDate read FDataContratacao write FDataContratacao;
    property DataDemissao: TDate read FDataDemissao write FDataDemissao;
    property DataCadastro: TDate read FDataCadastro write FDataCadastro;
    property Ativo: Boolean read FAtivo write FAtivo;
    property Excluido: Boolean read FExcluido write FExcluido;
    property DataExclusao: TDate read FDataExclusao write FDataExclusao;

    function Cadastrar: Boolean;
    function Alterar: Boolean;
    function Excluir: Boolean;
    function Demitir: Boolean;
  end;

implementation

uses
  System.SysUtils, FireDAC.Comp.Client, uUtils, uDataModule;

{ TFuncionario }

function TFuncionario.Alterar: Boolean;
var
  Query: TFDQuery;
begin
  Result := False;
  Query := InstanciarFDQuery(dmDados.Dados);
  try
    try
      Query.Close;
      Query.SQL.Clear;
      Query.SQL.Add('update cadFuncionarios set');
      Query.SQL.Add('   nmFuncionario = :pNmFuncionario,');
      Query.SQL.Add('   nuCpf = :pNuCpf,');
      Query.SQL.Add('   nuRg = :pNuRg,');
      Query.SQL.Add('   dtNascimento = :pDtNascimento,');
      Query.SQL.Add('   txEmail = :pTxEmail,');
      Query.SQL.Add('   nuCarteiraTrab = :pNuCarteiraTrab,');
      Query.SQL.Add('   nuTituloEleitor = :pNuTituloEleitor,');
      Query.SQL.Add('   nuCarteiraMotorista = :pNuCarteiraMotorista,');
      Query.SQL.Add('   tpCateroria = :pTpCategoria,');
      Query.SQL.Add('   dtValidadeCarteiraMot = :pDtValidadeCarteiraMot,');
      Query.SQL.Add('   tlResidencial = :pTlResidencial,');
      Query.SQL.Add('   tlCelular = :pTlCelular,');
      Query.SQL.Add('   tlContato = :pTlContato,');
      Query.SQL.Add('   nmContato = :pNmContato,');
      Query.SQL.Add('   dtContratacao = :pDtContratacao,');
      Query.SQL.Add('   dtDemissao = :pDtDemissao,');
      Query.SQL.Add('   dtCadastro = :pDtCadastro,');
      Query.SQL.Add('   stAtivo = :pStAtivo,');
      Query.SQL.Add('   txObs = :pTxObs,');
      Query.SQL.Add('   nmEndereco = :pNmEndereco,');
      Query.SQL.Add('   nuEndereco = :pNuEndereco,');
      Query.SQL.Add('   nmBairro = :pNmBairro,');
      Query.SQL.Add('   idCidade = :pIdCidade,');
      Query.SQL.Add('   idUf = :pIdUf,');
      Query.SQL.Add('   nuCep = :pNuCep,');
      Query.SQL.Add('   stExcluido = :pStExcluido,');
      Query.SQL.Add('   dtExcluido = :pDtExcluido');
      Query.SQL.Add('where idFuncionario = :pIdFuncionario');
      Query.ParamByName('pNmFuncionario').AsString := Self.Nome;
      Query.ParamByName('pNuCpf').AsString := Self.CPF;
      Query.ParamByName('pNuRg').AsString := Self.RG;
      Query.ParamByName('pDtNascimento').AsDate := Self.DataNascimento;
      Query.ParamByName('pTxEmail').AsString := Self.Contato.Email;
      Query.ParamByName('pNuCarteiraTrab').AsString := Self.NumeroCarteiraTrabalho;
      Query.ParamByName('pNuTituloEleitor').AsString := Self.NumeroTituloEleitor;
      Query.ParamByName('pNuCarteiraMotorista').AsString := Self.CarteiraMotorista.Numero;
      Query.ParamByName('pTpCategoria').AsString := Self.CarteiraMotorista.Categoria;
      Query.ParamByName('pDtValidadeCarteiraMot').AsDate := Self.CarteiraMotorista.DataValidade;
      Query.ParamByName('pTlResidencial').AsString := Self.Contato.TelefoneResidencial;
      Query.ParamByName('pTlCelular').AsString := Self.Contato.TelefoneCelular;
      Query.ParamByName('pTlContato').AsString := Self.Contato.TelefoneContato;
      Query.ParamByName('pNmContato').AsString := Self.Contato.NomeContato;

      if (Self.DataContratacao >= Now) or (Self.DataContratacao = 0) then
        Query.ParamByName('pDtContratacao').Clear
      else
        Query.ParamByName('pDtContratacao').AsDate := Self.DataContratacao;

      if (Self.DataDemissao >= Now) or (Self.DataDemissao = 0) then
        Query.ParamByName('pDtDemissao').Clear
      else
        Query.ParamByName('pDtDemissao').AsDate := Self.DataDemissao;
      Query.ParamByName('pDtCadastro').AsDate := Now;
      Query.ParamByName('pStAtivo').AsString := iff(Self.Ativo, 'S', 'N');
      Query.ParamByName('pTxObs').Clear;
      Query.ParamByName('pNmEndereco').AsString := Self.Endereco.Nome;
      Query.ParamByName('pNuEndereco').AsString := Self.Endereco.Numero;
      Query.ParamByName('pNmBairro').AsString := Self.Endereco.Bairro;
      Query.ParamByName('pIdCidade').AsInteger := Self.Endereco.IdCidade;
      Query.ParamByName('pIdUf').AsInteger := Self.Endereco.IdUF;
      Query.ParamByName('pNuCep').AsString := Self.Endereco.CEP;
      Query.ParamByName('pStExcluido').AsString := iff(Self.Excluido, 'S', 'N');

      if (Self.DataExclusao >= Now) or (Self.DataExclusao = 0) then
        Query.ParamByName('pDtExcluido').Clear
      else
        Query.ParamByName('pDtExcluido').AsDate := Self.DataExclusao;

      Query.ParamByName('pIdFuncionario').AsInteger := Self.Id;
      Query.ExecSQL;
      Result := True;
    except
      Result := False;
    end;
  finally
    Query.Free;
  end;
end;

function TFuncionario.Cadastrar: Boolean;
var
  Query: TFDQuery;
begin
  Result := False;
  Query := InstanciarFDQuery(dmDados.Dados);
  try
    try
      Query.Close;
      Query.SQL.Clear;
      Query.SQL.Add('insert into cadFuncionarios (');
      Query.SQL.Add('   idEmpresa, nmFuncionario, nuCpf, nuRg, dtNascimento,');
      Query.SQL.Add('   txEmail, nuCarteiraTrab, nuTituloEleitor, nuCarteiraMotorista,');
      Query.SQL.Add('   tpCateroria, dtValidadeCarteiraMot, tlResidencial, tlCelular,');
      Query.SQL.Add('   tlContato, nmContato, dtContratacao, dtDemissao, dtCadastro,');
      Query.SQL.Add('   stAtivo, txObs, nmEndereco, nuEndereco, nmBairro, idCidade,');
      Query.SQL.Add('   idUf, nuCep, stExcluido, dtExcluido');
      Query.SQL.Add(') values (');
      Query.SQL.Add('   :pIdEmpresa, :pNmFuncionario, :pNuCpf, :pNuRg, :pDtNascimento,');
      Query.SQL.Add('   :pTxEmail, :pNuCarteiraTrab, :pNuTituloEleitor, :pNuCarteiraMotorista,');
      Query.SQL.Add('   :pTpCategoria, :pDtValidadeCarteiraMot, :pTlResidencial, :pTlCelular,');
      Query.SQL.Add('   :pTlContato, :pNmContato, :pDtContratacao, :pDtDemissao, :pDtCadastro,');
      Query.SQL.Add('   :pStAtivo, :pTxObs, :pNmEndereco, :pNuEndereco, :pNmBairro, :pIdCidade,');
      Query.SQL.Add('   :pIdUf, :pNuCep, :pStExcluido, :pDtExcluido');
      Query.SQL.Add(')');
      Query.ParamByName('pIdEmpresa').AsInteger := Self.IdEmpresa;
      Query.ParamByName('pNmFuncionario').AsString := Self.Nome;
      Query.ParamByName('pNuCpf').AsString := Self.CPF;
      Query.ParamByName('pNuRg').AsString := Self.RG;
      Query.ParamByName('pDtNascimento').AsDate := Self.DataNascimento;
      Query.ParamByName('pTxEmail').AsString := Self.Contato.Email;
      Query.ParamByName('pNuCarteiraTrab').AsString := Self.NumeroCarteiraTrabalho;
      Query.ParamByName('pNuTituloEleitor').AsString := Self.NumeroTituloEleitor;
      Query.ParamByName('pNuCarteiraMotorista').AsString := Self.CarteiraMotorista.Numero;
      Query.ParamByName('pTpCategoria').AsString := Self.CarteiraMotorista.Categoria;
      Query.ParamByName('pDtValidadeCarteiraMot').AsDate := Self.CarteiraMotorista.DataValidade;
      Query.ParamByName('pTlResidencial').AsString := Self.Contato.TelefoneResidencial;
      Query.ParamByName('pTlCelular').AsString := Self.Contato.TelefoneCelular;
      Query.ParamByName('pTlContato').AsString := Self.Contato.TelefoneContato;
      Query.ParamByName('pNmContato').AsString := Self.Contato.NomeContato;

      if (Self.DataContratacao >= Now) or (Self.DataContratacao = 0) then
        Query.ParamByName('pDtContratacao').Clear
      else
        Query.ParamByName('pDtContratacao').AsDate := Self.DataContratacao;

      if (Self.DataDemissao >= Now) or (Self.DataDemissao = 0) then
        Query.ParamByName('pDtDemissao').Clear
      else
        Query.ParamByName('pDtDemissao').AsDate := Self.DataDemissao;
      Query.ParamByName('pDtCadastro').AsDate := Now;
      Query.ParamByName('pStAtivo').AsString := iff(Self.Ativo, 'S', 'N');
      Query.ParamByName('pTxObs').Clear;
      Query.ParamByName('pNmEndereco').AsString := Self.Endereco.Nome;
      Query.ParamByName('pNuEndereco').AsString := Self.Endereco.Numero;
      Query.ParamByName('pNmBairro').AsString := Self.Endereco.Bairro;
      Query.ParamByName('pIdCidade').AsInteger := Self.Endereco.IdCidade;
      Query.ParamByName('pIdUf').AsInteger := Self.Endereco.IdUF;
      Query.ParamByName('pNuCep').AsString := Self.Endereco.CEP;
      Query.ParamByName('pStExcluido').AsString := iff(Self.Excluido, 'S', 'N');

      if (Self.DataExclusao >= Now) or (Self.DataExclusao = 0) then
        Query.ParamByName('pDtExcluido').Clear
      else
        Query.ParamByName('pDtExcluido').AsDate := Self.DataExclusao;

      Query.ExecSQL;
      Result := True;
    except
      Result := False;
    end;
  finally
    Query.Free;
  end;
end;

constructor TFuncionario.Create;
begin
  FEndereco := TEndereco.Create;
  FContato := TContatoPessoaFisica.Create;
  FCarteiraMotorista := TCarteiraMotorista.Create;
end;

function TFuncionario.Demitir: Boolean;
var
  Query: TFDQuery;
begin
  Result := False;
  Query := InstanciarFDQuery(dmDados.Dados);
  try
    try
      Query.Close;
      Query.SQL.Clear;
      Query.SQL.Add('update cadFuncionarios set');
      Query.SQL.Add('   dtDemissao = :pDtDemissao,');
      Query.SQL.Add('   stAtivo = ''N''');
      Query.SQL.Add('where idFuncionario = :pIdFuncionario');
      Query.ParamByName('pDtDemissao').AsDate := Now;
      Query.ParamByName('pIdFuncionario').AsInteger := Self.Id;
      Query.ExecSQL;
      Result := True;
    except
      Result := False;
    end;
  finally
    Query.Free;
  end;
end;

destructor TFuncionario.Destroy;
begin
  FreeAndNil(FEndereco);
  FreeAndNil(FContato);
  FreeAndNil(FCarteiraMotorista);
  inherited;
end;

function TFuncionario.Excluir: Boolean;
var
  Query: TFDQuery;
begin
  Result := False;
  Query := InstanciarFDQuery(dmDados.Dados);
  try
    try
      Query.Close;
      Query.SQL.Clear;
      Query.SQL.Add('update cadFuncionarios set');
      Query.SQL.Add('   stExcluido = ''S'',');
      Query.SQL.Add('   dtExcluido = :pDtExcluido,');
      Query.SQL.Add('   stAtivo = ''N''');
      Query.SQL.Add('where idFuncionario = :pIdFuncionario');
      Query.ParamByName('pDtExcluido').AsDate := Now;
      Query.ParamByName('pIdFuncionario').AsInteger := Self.Id;
      Query.ExecSQL;
      Result := True;
    except
      Result := False;
    end;
  finally
    Query.Free;
  end;
end;

end.
