unit uContatoPessoaFisica;

interface

uses
  uContato;

type
  TContatoPessoaFisica = class(TContato)
  private
    FTelefoneResidencial: string;
    FTelefoneContato: string;
    FNomeContato: string;
  public
    constructor Create;
    property TelefoneResidencial: string read FTelefoneResidencial write FTelefoneResidencial;
    property TelefoneContato: string read FTelefoneContato write FTelefoneContato;
    property NomeContato: string read FNomeContato write FNomeContato;
  end;

implementation

{ TContatoPessoaFisica }

constructor TContatoPessoaFisica.Create;
begin
  inherited;
end;

end.
