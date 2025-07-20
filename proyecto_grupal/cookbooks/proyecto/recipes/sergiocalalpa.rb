#
# Cookbook:: proyecto
# Recipe:: sergiocalalpa
#
# Copyright:: 2025, The Authors, All Rights Reserved.

# Variables de instalacion
direccion_base = 'C:\\chef'
ejecutable_python = 'C:\\chef\\python-installer.exe'
version_python = '3.13.5'
direccion_instalacion = "C:\\Python#{ version_python }"
log = 'C:\\chef\\log_python_installation.txt'

# Crear carpeta de instalacion
directory direccion_base do
  action :create
end

# Descargar el instalador de Python
remote_file ejecutable_python do
  source "https://www.python.org/ftp/python/#{ version_python }/python-#{ version_python }-amd64.exe"
  action :create
  not_if { ::File.exist?(direccion_instalacion) }
end

# Instalar Python
execute 'instalar python' do
  command "#{ ejecutable_python } /quiet InstallAllUsers=1 PrependPath=1 TargetDir=#{direccion_instalacion}"
  not_if { ::File.exist?("#{ direccion_instalacion }\\python.exe") }
end

# Verificar versión instalada y escribir en log
ruby_block 'Verificar versión de Python' do
  block do
    version_output = "#{ direccion_instalacion }\\python.exe --version".strip
    if version_output.include?(version_python)
      File.write(log, "Python instalado correctamente: #{ version_output }\n")
    else
      raise "Versión incorrecta de Python: se obtuvo '#{ version_output }', se esperaba '#{ version_python }'"
    end
  end
end