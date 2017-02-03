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
require_relative '../spec_helper'

describe 'cloudcli::_aws_linux' do
  let(:chef_run) do
    ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '14.04') do |node|
      node.normal['cloudcli']['aws']['python']['version'] = '2.7.2'
      node.normal['cloudcli']['aws']['python']['provider'] = :system
    end.converge(described_recipe)
  end

  it 'sets the python runtime to version 2.7 and system' do
    expect(chef_run).to install_python_runtime('2.7.2').with(
      provider: PoisePython::PythonProviders::System
    )
  end

  it 'installs the groff package' do
    expect(chef_run).to install_package('groff')
  end

  it 'installs cloudcli via pip' do
    expect(chef_run).to install_python_package('awscli')
  end

  it 'creates the virtualenv and installs the pacakge in the virtualenv' do
    chef_run.node.normal['cloudcli']['aws']['virtualenv'] = '/opt/fake/pip'
    chef_run.node.normal['cloudcli']['aws']['version'] = '1.9.0'
    chef_run.converge(described_recipe)
    expect(chef_run).to create_python_virtualenv('/opt/fake/pip')
    expect(chef_run).to install_python_package('awscli').with(
      version: '1.9.0'
    )
  end
end
