#
# Cookbook:: iis
# Recipe:: default
#
# Copyright:: 2021, The Authors, All Rights Reserved.


powershell_script 'Install IIS' do 
  code 'Add-WindowsFeature Web-server'
  not_if 'iwr http://localhost/ -UseBasicParsing'
end 

powershell_script 'Install IIS Management Console' do 
  code 'Add-WindowsFeature Web-Mgmt-Console' 
  not_if 'iwr http://localhost/ -UseBasicParsing'
end 

powershell_script 'Install ASP.NET' do 
  code 'Add-WindowsFeature  web-ASP-Net45'
  not_if 'iwr http://localhost/ -UseBasicParsing'
end  

powershell_script 'Install IIS Static Content' do 
  code 'Add-WindowsFeature Web-Static-Content' 
  not_if 'iwr http://localhost/ -UseBasicParsing'
end 

service 'w3svc' do 
  action [:start, :enable]
end
