unit uEndereco;

interface

type
  TEndereco = class
  private
    FNome: string;
    FNumero: string;
    FBairro: string;
    FIdCidade: Integer;
    FIdUF: Integer;
    FCEP: string;
  public
    constructor Create;
    destructor Destroy; override;

    property Nome: string read FNome write FNome;
    property Numero: string read FNumero write FNumero;
    property Bairro: string read FBairro write FBairro;
    property IdCidade: Integer read FIdCidade write FIdCidade;
    property IdUF: Integer read FIdUF write FIdUF;
    property CEP: string read FCEP write FCEP;
  end;

implementation

{ TEndereco }

constructor TEndereco.Create;
begin

end;

destructor TEndereco.Destroy;
begin

  inherited;
end;

end.
