unit uFrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons,
  Vcl.ComCtrls;

type
  TfmPrincipal = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmPrincipal: TfmPrincipal;

implementation

uses
  uViewEmpresas;

{$R *.dfm}

procedure TfmPrincipal.FormShow(Sender: TObject);
begin
  if fmEmpresas = nil then
    fmEmpresas := TfmEmpresas.Create
  else
    fmEmpresas.BringToFront;
end;

end.
