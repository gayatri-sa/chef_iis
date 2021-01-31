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
end  

powershell_script 'Install IIS Static Content' do 
  code 'Add-WindowsFeature Web-Static-Content' 
end 

service 'w3svc' do 
  action [:start, :enable]
end

# Common data from the databag
company_info = data_bag_item('common', 'company_info')

# override the attribute set by the role, environment or attributes file
node.override['messages']['welcome'] = "Welcome message from the recipe"

template "C:/inetpub/wwwroot/index.html" do
    source "index.html.erb"
    action :create
    mode "0644"
    variables(
	:title => "Gayatri",
        :desc  => "DevOps Professionals More",
	:company_info => company_info
    )
end
