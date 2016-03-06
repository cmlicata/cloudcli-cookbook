name 'cloudcli'
maintainer 'Nick Downs'
maintainer_email 'nickryand@gmail.com'
license 'Apache 2.0'
description 'Defines a number of LWRP wrapper commands around the awscli command line script'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '1.0.0'
source_url 'https://github.com/nickryand/cloudcli-cookbook' if respond_to?(:source_url)
issues_url 'https://github.com/nickryand/cloudcli-cookbook/issues' if respond_to?(:issues_url)

supports 'ubuntu'
supports 'centos'

depends 'poise-python', '~> 1.2.1'
