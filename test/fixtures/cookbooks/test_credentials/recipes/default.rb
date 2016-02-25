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
user 'testuser'

directory '/etc/aws' do
  recursive true
end

cloudcli_aws_credentials '/etc/aws/credentials' do
  user 'testuser'
  group 'testuser'
  mode 0600
  params(
    aws_access_key_id: 'ASDASDASKD123',
    aws_secret_access_key: 'TESTPASS12345',
    region: 'us-west-2'
  )
end


# The second call overwrites the user/group/mode from the first resource
# call
cloudcli_aws_credentials '/etc/aws/credentials' do
  user 'root'
  group 'root'
  mode 0660
  profile 'secondary'
  params(
    region: 'eu-west-2',
    role_arn: 'arn:aws:iam::123456789012:role/testingchef'
  )
end

directory '/home/testuser/.aws/' do
  user 'testuser'
  group 'testuser'
  recursive true
end

s3_config = <<EOF

  max_concurrent_requests=20
  max_queue_size=10000
  multipart_threshold=64MB
  multipart_chunksize=16MB
EOF

cloudcli_aws_credentials '/home/testuser/.aws/credentials' do
  user 'testuser'
  group 'testuser'
  mode 0600
  params(
    aws_access_key_id: 'TEST123',
    aws_secret_access_key: 'SECRETKEY!',
    s3: s3_config
  )
end
