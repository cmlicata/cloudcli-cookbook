name 'cloudcli'
maintainer 'Christopher Licata'
maintainer_email 'cmlpolyglotdev@gmail.com'
license 'Apache 2.0'
description 'Install and configure cloud provider CLI tools.'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '1.3.0'
source_url 'https://github.com/cmlicata/cloudcli-cookbook' if respond_to?(:source_url)
issues_url 'https://github.com/cmlicata/cloudcli-cookbook/issues' if respond_to?(:issues_url)

supports 'ubuntu'
supports 'centos'

depends 'poise-python', '~> 1.7'
