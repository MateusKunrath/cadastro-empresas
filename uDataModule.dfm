object dmDados: TdmDados
  OldCreateOrder = False
  Height = 290
  Width = 497
  object Dados: TFDConnection
    Params.Strings = (
      'Database=C:\Users\Mateus\Downloads\DADOS.FDB'
      'User_Name=SYSDBA'
      'Password=masterkey'
      'DriverID=fB')
    Connected = True
    Left = 184
    Top = 72
  end
  object FDPhysFBDriverLink: TFDPhysFBDriverLink
    VendorHome = 
      'C:\Users\Mateus\Documents\development\processos-seletivos\Extrad' +
      'igital'
    VendorLib = 'FBCLIENT.DLL'
    Left = 192
    Top = 152
  end
end
