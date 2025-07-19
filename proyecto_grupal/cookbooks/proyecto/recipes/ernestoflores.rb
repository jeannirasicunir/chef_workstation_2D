#
# Cookbook:: proyecto
# Recipe:: ernestoflores
#
# Copyright:: 2025, The Authors, All Rights Reserved.

### ESTE RECIPE NOS SIRVE PARA INSTALAR Y PROBAR MONGODB ###

# directorio para almacenar nuestros scripts
directory 'C:/scripts' do
  action :create
end

# Instalación de MongoDB
execute 'install_mongodb' do
  command 'choco install mongodb -y'
  not_if 'choco list --local-only | findstr mongodb'
end

# Iniciamos el servicio de MongoDB
execute 'start_mongodb_service' do
  command 'net start MongoDB'
  not_if 'sc query MongoDB | findstr RUNNING'
end

# Agregamos mongo al PATH de nuestro ordenador
windows_path 'C:\Program Files\MongoDB\Server\8.1\bin' do
  action :add
end

# Crear script tester.ps1 para probar que mongod.exe responde
file 'C:/scripts/tester.ps1' do
  content <<-EOH
  Write-Output "Verificando versión de mongod..."
  & "C:\\Program Files\\MongoDB\\Server\\8.1\\bin\\mongod.exe" --version
  EOH
  action :create
end

# Script que nos dice la version que tenemos instalado de mongo!
powershell_script 'run_test_mongo' do
  code '& "C:\\Program Files\\MongoDB\\Server\\8.1\\bin\\mongod.exe" --version > C:\\scripts\\probado.txt'
  not_if 'Test-Path C:/scripts/probado.txt'
end