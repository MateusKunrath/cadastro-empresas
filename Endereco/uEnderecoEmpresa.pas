unit uEnderecoEmpresa;

interface

uses
  uEndereco;

type
  TEnderecoEmpresa = class(TEndereco)
  private
    FIdEndereco: Integer;
    FIdEmpresa: Integer;
    FIdTitular: Integer;
    FStatus: Boolean;
    FExcluido: Boolean;
    FDataExcluido: TDate;
    FTipoCadastro: Char;
  public
    constructor Create;
    destructor Destroy; override;

    property Id: Integer read FIdEndereco write FIdEndereco;
    property IdEmpresa: Integer read FIdEmpresa write FIdEmpresa;
    property IdTitular: Integer read FIdTitular write FIdTitular;
    property Status: Boolean read FStatus write FStatus;
    property Excluido: Boolean read FExcluido write FExcluido;
    property DataExcluido: TDate read FDataExcluido write FDataExcluido;
    property TipoCadastro: Char read FTipoCadastro write FTipoCadastro;

    function Cadastrar: Boolean;
    function Atualizar: Boolean;
  end;

implementation

uses
  FireDAC.Comp.Client, uUtils, uDataModule;

{ TEndereco }

function TEnderecoEmpresa.Atualizar: Boolean;
var
  Query: TFDQuery;
begin
  Query := InstanciarFDQuery(dmDados.Dados);
  try
    Query.Close;
    Query.SQL.Clear;
    Query.SQL.Add('update cadEnderecos set idTitular = :pIdTitular, idEmpresa = :pIdEmpresa, nmEndereco = :pNmEndereco,');
    Query.SQL.Add('nmBairro = :pNmBairro, idCidade = :pIdCidade, idUf = :pIdUf, nuCep = :pNuCep, stAtivo = :pStAtivo,');
    Query.SQL.Add('stExcluido = :pStExcluido, dtExcluido = :pDtExcluido, tpCadastro = :pTpCadastro');
    Query.ParamByName('pIdTitular').AsInteger := Self.IdTitular;
    Query.ParamByName('pIdEmpresa').AsInteger := Self.IdEmpresa;
    Query.ParamByName('pNmEndereco').AsString := Self.Nome;
    Query.ParamByName('pNmBairro').AsString := Self.Bairro;
    Query.ParamByName('pIdCidade').AsInteger := Self.IdCidade;
    Query.ParamByName('pIdUf').AsInteger := Self.IdUF;
    Query.ParamByName('pNuCep').AsString := Self.CEP;
    Query.ParamByName('pStAtivo').AsString := iff(Self.Status, 'S', 'N');
    Query.ParamByName('pStExcluido').AsString := iff(Self.Excluido, 'S', 'N');
    Query.ParamByName('pDtExcluido').AsDate := Self.DataExcluido;
    Query.ParamByName('pTpCadastro').AsString := Self.TipoCadastro;
  finally
    Query.Free;
  end;
end;

function TEnderecoEmpresa.Cadastrar: Boolean;
begin

end;

constructor TEnderecoEmpresa.Create;
begin
  inherited;
  Self.FIdEndereco := 0;
  Self.FIdEmpresa := 0;
  Self.FIdTitular := 0;
  Self.FStatus := False;
  Self.FExcluido := False;
  Self.FDataExcluido := 0;
  Self.FTipoCadastro := '''';
end;

destructor TEnderecoEmpresa.Destroy;
begin
  inherited;
end;

end.
