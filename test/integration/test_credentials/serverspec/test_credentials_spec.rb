# Copyright 2016 Nick Downs
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
require_relative '../../../kitchen/data/spec_helper'

describe file('/etc/aws/credentials') do
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
  it { should be_mode 660 }
  its(:content) { should match /\[default\]/ }
  its(:content) { should match /aws_access_key_id=ASDASDASKD123/ }
  its(:content) { should match /aws_access_key_id=ASDASDASKD123/ }
  its(:content) { should match /\[secondary\]/ }
  its(:content) { should match /region=eu-west-2/ }
  its(:content) { should match %r{role_arn=arn:aws:iam::123456789012:role/testingchef} }
end

describe file('/home/testuser/.aws/credentials') do

end
