#
# Cookbook Name:: R
# Recipe:: default
# Author:: Koji Tanaka (<kj.tanaka@gmail.com>)
#
# Copyright 2014, FutureGrid Project, Indiana University
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

include_recipe 'build-essential'

node['r']['packages'].each do |pkg|
  package pkg do
    action :install
  end
end

directory node['r']['download_dir'] do
  action :create
end

remote_file "#{node['r']['download_dir']}/R-#{node['r']['version']}.tar.gz" do
  source node['r']['download_url']
  owner "root"
  group "root"
  mode "0644"
  action :create_if_missing
end

execute "extract_tarball" do
  cwd node['r']['download_dir']
  command "tar zxf R-#{node['r']['version']}.tar.gz"
  creates "R-#{node['r']['version']}"
end

script "install_r" do
  interpreter "bash"
  cwd "#{node['r']['download_dir']}/#{node['r']['version']}"
  code <<-EOH
  ./configure --with-x=no --install_dir=#{node['r']['install_dir']}/R-#{node['r']['version']}
  make
  make install
  EOH
  creates "#{node['r']['install_dir']}/R-#{node['r']['version']}"
end

