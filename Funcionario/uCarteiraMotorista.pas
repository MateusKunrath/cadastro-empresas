unit uCarteiraMotorista;

interface

type
  TCarteiraMotorista = class
  private
    FNumero: string;
    FDataValidade: TDate;
    FCategoria: string;
  public
    property Numero: string read FNumero write FNumero;
    property DataValidade: TDate read FDataValidade write FDataValidade;
    property Categoria: string read FCategoria write FCategoria;
  end;

implementation

end.
