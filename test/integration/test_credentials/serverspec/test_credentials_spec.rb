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

default = <<EOF
[default]
aws_access_key_id=ASDASDASKD123
aws_secret_access_key=TESTPASS12345
region=us-west-2

[secondary]
region=eu-west-2
role_arn=arn:aws:iam::123456789012:role/testingchef
EOF

describe file('/etc/aws/credentials') do
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
  it { should be_mode 660 }

  its(:content) { should include(default) }
end

s3 = <<EOF
[default]
aws_access_key_id=TEST123
aws_secret_access_key=SECRETKEY!
s3=
  max_concurrent_requests=20
  max_queue_size=10000
  multipart_threshold=64MB
  multipart_chunksize=16MB
EOF

describe file('/home/testuser/.aws/credentials') do
  it { should be_owned_by 'testuser' }
  it { should be_grouped_into 'testuser' }
  it { should be_mode 600 }

  its(:content) { should include(s3) }
end
