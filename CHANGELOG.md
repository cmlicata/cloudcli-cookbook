## 1.0.0 2016-03-04

Initial Release post fork ([@nickryand][])

* Project forked from the https://github.com/awscli/awscli-cookbook project
* Added a new custom resource which allows you to generate awscli credentials files: `cloudcli_aws_credentials`
* The upstream `python` cookbook is depricated so this cookbook now depends on `poise-python`
* Cookbook now requires Chef > 12.5 due to the new custom resource syntax used to implement `cloudcli_aws_credentails`

[@nickryand]: https://github.com/nickryand
