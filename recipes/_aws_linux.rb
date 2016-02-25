#
# Cookbook Name:: cloudcli
# Recipe:: _aws_linux
#
# Copyright 2016 Nick Downs
# Copyright 2014 Amazon.com, Inc. or its affiliates. All Rights Reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License"). You
# may not use this file except in compliance with the License. A copy of
# the License is located at
#
#     http://aws.amazon.com/apache2.0/
#
# or in the "license" file accompanying this file. This file is
# distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF
# ANY KIND, either express or implied. See the License for the specific
# language governing permissions and limitations under the License.
#
package 'groff'

python_runtime node['cloudcli']['aws']['python']['version'] do
  provider node['cloudcli']['aws']['python']['provider']
end

unless node['cloudcli']['aws']['virtualenv'].nil?
  python_virtualenv node['cloudcli']['aws']['virtualenv']

  python_package 'awscli' do
    version node['cloudcli']['aws']['version'] if node['cloudcli']['aws']['version']
    virtualenv node['cloudcli']['aws']['virtualenv']
  end
else
  python_package 'awscli' do
    version node['cloudcli']['aws']['version'] if node['cloudcli']['aws']['version']
  end
end
