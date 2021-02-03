#
# Cookbook:: iis
# Recipe:: default
#
# Copyright:: 2021, The Authors, All Rights Reserved.

# windows_feature uses DISM to install packages (called features)
# To find the correct name to use for DISM execute this on the Windows CMD prompt
# dism /online /Get-Features | find "IIS-"

windows_feature 'IIS-WebServer' do
  action :install
end

windows_feature 'IIS-DefaultDocument' do
  action :install
end

windows_feature 'IIS-WebServerManagementTools' do
  action :install
end

windows_feature 'IIS-ASPNET45' do
  action :install
end

service 'w3svc' do
  action [:start, :enable]
end

# Common data from the databag
company_info = data_bag_item('common', 'company_info')

# override the attribute set by the role, environment or attributes file
node.override['messages']['welcome'] = 'Welcome message from the recipe'

template 'C:/inetpub/wwwroot/index.html' do
  source 'index.html.erb'
  action :create
  mode '0644'
  variables(
title: 'Gayatri',
      desc: 'DevOps Professionals More',
company_info: company_info
)
end
