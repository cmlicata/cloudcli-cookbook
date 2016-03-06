#
# Cookbook Name:: cloudcli
# Resources:: config
#
# Copyright (C) 2016 Nick Downs
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

property :path, kind_of: String, name_property: true
property :profile, kind_of: String, default: 'default'
property :params, kind_of: Hash, default: {}
property :owner, kind_of: String, default: 'root'
property :group, kind_of: String, default: 'root'
property :mode, kind_of: [String, Integer], default: 0600

action :create do
  add_config_to_state(path, profile, params)

  template path do
    owner new_resource.owner
    group new_resource.group
    mode new_resource.mode
    source 'credentials.erb'
    cookbook 'cloudcli'
    variables(
      :state_key => path,
    )
    action :nothing
  end

  # This allows end-users to use the resource multiple times
  # but the template will only be run a single time.
  #
  # TODO: Refactor if this issue is resolved with a solution
  #       https://github.com/chef/chef/issues/3426
  log "create_template" do
    level :debug
    message "Create template for #{path} #{profile}"
    notifies :create, "template[#{path}]", :delayed
  end
end

action :delete do
  template path do
    action :delete
  end
end

def add_config_to_state(path, profile, params)
  # Multiple calls for the same path and profile will overwrite
  # the previous settings
  if not node.run_state.has_key?(path)
    node.run_state[path] = {}
  end
  node.run_state[path][profile] = params
end
