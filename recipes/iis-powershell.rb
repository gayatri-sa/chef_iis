powershell_script 'Install IIS' do
  code 'Add-WindowsFeature Web-server'
  # not_if 'iwr http://localhost/ -UseBasicParsing'
  not_if '(Get-WindowsFeature -Name Web-Server).Installed'
end

powershell_script 'Install IIS Management Console' do
  code 'Add-WindowsFeature Web-Mgmt-Console'
  # not_if 'iwr http://localhost/ -UseBasicParsing'
  not_if '(Get-WindowsFeature -Name Web-Mgmt-Console).Installed'
end

powershell_script 'Install ASP.NET' do
  code 'Add-WindowsFeature  web-ASP-Net45'
  not_if '(Get-WindowsFeature -Name web-ASP-Net45).Installed'
end

powershell_script 'Install IIS Static Content' do
  code 'Add-WindowsFeature Web-Static-Content'
  not_if '(Get-WindowsFeature -Name Web-Static-Content).Installed'
end

service 'w3svc' do
  action [:start, :enable]
end
