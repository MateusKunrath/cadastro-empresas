program extradigital;

uses
  Vcl.Forms,
  uFrmPrincipal in 'uFrmPrincipal.pas' {fmPrincipal},
  uUtils in 'uUtils.pas',
  uViewEmpresas in 'View\uViewEmpresas.pas' {fmEmpresas},
  uViewManutencaoEmpresa in 'View\uViewManutencaoEmpresa.pas' {fmManutencaoEmpresa},
  uViewFuncionarios in 'View\uViewFuncionarios.pas' {fmFuncionarios},
  uDataModule in 'uDataModule.pas' {dmDados: TDataModule},
  uEmpresa in 'Empresa\uEmpresa.pas',
  uEnderecoEmpresa in 'Endereco\uEnderecoEmpresa.pas',
  uFuncionario in 'Funcionario\uFuncionario.pas',
  uEndereco in 'Endereco\uEndereco.pas',
  uContato in 'Contato\uContato.pas',
  uContatoPessoaFisica in 'Contato\uContatoPessoaFisica.pas',
  uContatoPessoaJuridica in 'Contato\uContatoPessoaJuridica.pas',
  uCarteiraMotorista in 'Funcionario\uCarteiraMotorista.pas',
  uViewEndereco in 'View\uViewEndereco.pas' {fmEndereco},
  uViewManutencaoFuncionario in 'View\uViewManutencaoFuncionario.pas' {fmManutencaoFuncionario};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TdmDados, dmDados);
  Application.CreateForm(TfmPrincipal, fmPrincipal);
  Application.Run;
end.
