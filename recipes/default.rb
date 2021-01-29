#
# Cookbook:: iis
# Recipe:: default
#
# Copyright:: 2021, The Authors, All Rights Reserved.


powershell_script 'Install IIS' do 
  code 'Add-WindowsFeature Web-server'
  guard_interpreter :powershell_script 
  not_if “(Get-WindowsFeature -Name Web-Server).Installed”  
 End 

powershell_script 'Install IIS Management Console' do 
  Code 'Add-WindowsFeature Web-Mgmt-Console' 
  Guard_interpreter :powershell_script
  Not_if “(Get-WindowsFeature-Name Web-MGMT-Console).Installed” 
end 

powershell_script 'Install ASP.NET' do 
  code 'Add-WindowsFeature  web-ASP-Net45'
  guard_interpreter :powershell_script
  not_if “(Get-WindowsFeature -Name Web-Server).Installed”
end  

powershell_script 'Install IIS Static Content' do 
  code 'Add-WindowsFeature Web-Static-Content' 
  guard_interpreter :powershell_script
  Not_if “(Get-WindowsFeature -Name Web-Static-Content).Installed”
end 

service 'w3svc' do 
  Action [:start, :enable]
end
