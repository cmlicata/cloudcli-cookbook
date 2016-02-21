# Copyright 2015 Nick Downs
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
include_recipe 'awscli::default'

user 'testuser'

directory '/etc/aws' do
  recursive true
end

awscli_credentials '/etc/aws/credentials' do
  user 'testuser'
  group 'testuser'
  mode 0600
  params(
    aws_access_key_id: 'ASDASDASKD123',
    aws_secret_access_key: 'TESTPASS12345',
    region: 'us-west-2'
  )
end


awscli_credentials '/etc/aws/credentials' do
  profile 'secondary'
  params(
    region: 'eu-west-2',
    role_arn: 'arn:aws:iam::123456789012:role/testingchef'
  )
end
