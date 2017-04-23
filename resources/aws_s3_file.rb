#
# Cookbook Name:: cloudcli
# Resources:: aws_s3_file
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

class CloudcliAwsS3File < ::Chef::Resource
  default_action :get

  property :bucket, :kind_of => String
  property :path, :kind_of => String, :name_attribute => true
  property :key, :kind_of => String
  property :aws_access_key_id, :kind_of => [String, NilClass], :default => nil
  property :aws_secret_access_key, :kind_of => [String, NilClass], :default => nil
  property :checksum, :kind_of => [String, NilClass], :default => nil
  property :region, :kind_of => String, :default => 'us-east-1'
  property :timeout, :kind_of => Integer, :default => 900
  property :owner, :kind_of => String, :default => 'root'
  property :group, :kind_of => String, :default => 'root'
  property :mode, :kind_of => [String, Integer, NilClass], :default => nil

  action :get
end
