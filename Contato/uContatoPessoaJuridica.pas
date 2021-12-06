unit uContatoPessoaJuridica;

interface

uses
  uContato;

type
  TContatoPessoaJuridica = class(TContato)
  private
    FTelefoneComercial: string;
  public
    constructor Create;
    property TelefoneComercial: string read FTelefoneComercial write FTelefoneComercial;
  end;

implementation

{ TContatoPessoaJuridica }

constructor TContatoPessoaJuridica.Create;
begin
  inherited;
end;

end.
