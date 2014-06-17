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

packages = %w[wget gcc-gfortran readline readline-devel]

packages.each do |pkg|
  package pkg do
    action :install
  end
end

directory "/root/source" do
  action :create
end

remote_file "/root/source/R-3.1.0.tar.gz" do
  source "http://cran.cnr.berkeley.edu/src/base/R-3/R-3.1.0.tar.gz"
  owner "root"
  group "root"
  mode "0644"
  action :create_if_missing
end

execute "extract_tarball" do
  cwd "/root/source"
  command "tar zxf R-3.1.0.tar.gz"
  creates "R-3.1.0"
end

script "install_r" do
  interpreter "bash"
  cwd "/root/source/R-3.1.0"
  code <<-EOH
  ./configure --with-x=no --prefix=/opt/R-3.1.0
  make
  make install
  EOH
  creates "/opt/R-3.1.0"
end

