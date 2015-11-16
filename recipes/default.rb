#
# Cookbook Name:: yum_repos
# Recipe:: default
#
# Copyright 2015, Simone Dall Angelo
#
# Permission is hereby granted, free of charge, to any person obtaining
# a copy of this software and associated documentation files (the
# "Software"), to deal in the Software without restriction, including
# without limitation the rights to use, copy, modify, merge, publish,
# distribute, sublicense, and/or sell copies of the Software, and to
# permit persons to whom the Software is furnished to do so, subject to
# the following conditions:
#
# The above copyright notice and this permission notice shall be
# included in all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
# LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
# OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
# WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
#

# Add EPEL
package 'epel-release' do
  action :install
end

# Download Remi
remote_file "#{Chef::Config[:file_cache_path]}/remi-release-7.rpm" do
  source 'http://rpms.famillecollet.com/enterprise/remi-release-7.rpm'
  owner 'root'
  group 'root'
  mode '0644'
  action :create
  not_if "yum repolist | grep 'remi'"
end

# Install Remi
rpm_package "Adds Remi repo" do
  source "#{Chef::Config[:file_cache_path]}/remi-release-7.rpm"
  action :install
  not_if "yum repolist | grep 'remi'"
end
