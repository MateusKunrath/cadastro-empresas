unit uViewBancoDados;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfmBancoDados = class(TForm)
    Panel1: TPanel;
    btnSalvar: TButton;
    btnFechar: TButton;
    Label1: TLabel;
    edtDriverID: TEdit;
    Label2: TLabel;
    odBanco: TOpenDialog;
    edtCaminhoBancoDados: TEdit;
    btnEncontrarDatabase: TButton;
    Label3: TLabel;
    edtUserName: TEdit;
    Label4: TLabel;
    edtPassword: TEdit;
    procedure btnEncontrarDatabaseClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create;
  end;

var
  fmBancoDados: TfmBancoDados;

implementation

uses
  uControllerConexao;

{$R *.dfm}

{ TfmBancoDados }

procedure TfmBancoDados.btnEncontrarDatabaseClick(Sender: TObject);
begin
  if Trim(edtCaminhoBancoDados.Text) <> EmptyStr then
    odBanco.InitialDir := ExtractFilePath(edtCaminhoBancoDados.Text);

  if odBanco.Execute then
    edtCaminhoBancoDados.Text := odBanco.FileName;
end;

procedure TfmBancoDados.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfmBancoDados.btnSalvarClick(Sender: TObject);
begin
  TControllerConexao.GetInstance.ModelConexao.DriverID := Trim(edtDriverID.Text);
  TControllerConexao.GetInstance.ModelConexao.Database := Trim(edtCaminhoBancoDados.Text);
  TControllerConexao.GetInstance.ModelConexao.UserName := Trim(edtUserName.Text);
  TControllerConexao.GetInstance.ModelConexao.Password := Trim(edtPassword.Text);
  if TControllerConexao.GetInstance.Salvar then
  begin
    ShowMessage('Configurações do banco de dados salva com sucesso!');
    TControllerConexao.GetInstance.ConectarDatabase;
    Close;
  end;
end;

constructor TfmBancoDados.Create;
begin
  inherited Create(nil);
  odBanco.InitialDir := GetCurrentDir;
end;

procedure TfmBancoDados.FormShow(Sender: TObject);
begin
  if TControllerConexao.GetInstance.Carregar then
  begin
    edtDriverID.Text := TControllerConexao.GetInstance.ModelConexao.DriverID;
    edtCaminhoBancoDados.Text := TControllerConexao.GetInstance.ModelConexao.Database;
    edtUserName.Text := TControllerConexao.GetInstance.ModelConexao.UserName;
    edtPassword.Text := TControllerConexao.GetInstance.ModelConexao.Password;
  end;
end;

end.
