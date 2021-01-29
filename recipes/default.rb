#
# Cookbook:: iis
# Recipe:: default
#
# Copyright:: 2021, The Authors, All Rights Reserved.

windows_feature 'Web-Server' do 
    action :install
end 

windows_feature 'Web-Mgmt-Console' do 
   action :install 
end 

windows_feature 'web-ASP-Net45' do 
   action :install
end 

windows_feature 'web-static-content' do 
   action :install 
end
