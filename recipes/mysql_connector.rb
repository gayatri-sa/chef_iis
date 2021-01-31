#
# Cookbook:: iis
# Recipe:: mysql_connector
#
# Copyright:: 2021, The Authors, All Rights Reserved.


dir = ['C:\tmp', 'C:\inetpub\wwwroot\Bin']

dir.each do |d|
  directory "Create folder #{d}" do
    path "#{d}"
    recursive true
  end
end

# MSI files get corrupted on download. Not sure why. So, copy from workstation
#remote_file 'Download MySQL connector' do
#  source 'https://dev.mysql.com/downloads/file/?id=501708'
#  path 'C:\tmp\mysql-connector-net-8.0.23.msi'
#  mode '0755'
#  notifies :run, 'execute[Install the MySQL connector]', :immediately
#end
cookbook_file 'Copy MySQL Connector' do
  source 'mysql-connector-net-8.0.23.msi'
  path 'C:\tmp\mysql-connector-net-8.0.23.msi'
end

execute 'Install the MySQL connector' do
  command 'C:\tmp\mysql-connector-net-8.0.23.msi /q'
  creates 'C:\Program Files (x86)\MySQL\MySQL Connector Net 8.0.23\Assemblies\v4.5.2\MySql.Data.dll'
end

powershell_script 'Copy MySQL DLL to the C:/inetpub/wwwroot/ folder' do
  code 'copy "C:\Program Files (x86)\MySQL\MySQL Connector Net 8.0.23\Assemblies\v4.5.2\MySql.Data.dll" C:/inetpub/wwwroot/Bin/'
  creates 'C:/inetpub/wwwroot/Bin/MySql.Data.dll'
  only_if { ::File.exist?('C:\Program Files (x86)\MySQL\MySQL Connector Net 8.0.23\Assemblies\v4.5.2\MySql.Data.dll') }
end
