# Cookbook Name:: Thoughtworks GO
# Recipe:: default
#
# Copyright 2014, Tumba
#
# All rights reserved - Do Not Redistribute


remote_file "/root/go-server-14.3.0-1186.deb" do
  source node "http://download.go.cd/gocd-deb/go-server-14.3.0-1186.deb"
  owner 'root'
  group 'root'
  mode '0755'    
end

dpkg_package "go-server" do
  action :install
end

template "/etc/go/cruise-config.xml"
  source "cruise-config.xml.erb"
  owner 'root'
  group 'root'
  mode '0644'
end

service "go-server" do 
        action [:enable, :start]
end











































