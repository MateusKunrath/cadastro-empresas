unit uContato;

interface

type
  TContato = class
  private
    FEmail: string;
    FTelefoneCelular: string;
  public
    constructor Create;
    destructor Destroy; override;

    property TelefoneCelular: string read FTelefoneCelular write FTelefoneCelular;
    property Email: string read FEmail write FEmail;
  end;

implementation

{ TContato }

constructor TContato.Create;
begin
  FEmail := '';
  FTelefoneCelular := '';
end;

destructor TContato.Destroy;
begin

  inherited;
end;

end.
