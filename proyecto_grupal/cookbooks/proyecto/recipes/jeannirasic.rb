#
# Cookbook:: proyecto
# Recipe:: jeannirasic
#
# Copyright:: 2025, The Authors, All Rights Reserved.

# Crear la carpeta donde se va a clonar el repositorio
directory 'C:\\Users\\jeann\\Desktop\\bulletin_app' do
  action :delete
  recursive true
end

# Clonar el repositorio de GitHub en la carpeta especificada
git 'C:\\Users\\jeann\\Desktop\\bulletin_app' do
  repository 'https://github.com/dockersamples/node-bulletin-board.git'
  revision 'master'
  action :sync
end

# Generar la imagen de Docker y correr el contenedor
execute 'correr aplicacion en docker' do
  command 'docker build -t bulletin-board . && docker run -d -p 8080:8080 bulletin-board'
  cwd 'C:\\Users\\jeann\\Desktop\\bulletin_app\\bulletin-board-app' 
  live_stream true
end

# Abrir la aplicación en el navegador
execute 'abrir URL en navegador' do
  command 'powershell.exe -Command "Start-Process \"http://localhost:8080\""'
  action :run
end
