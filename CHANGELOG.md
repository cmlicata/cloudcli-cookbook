
## 1.3.0 2018-07-05

* Update poise-python to 1.7

## 1.2.0 2017-04-29
Fixes for compatibility with Chef >= 13 ([@cmlicata][])
 * Cleanup unnecessary packages for Linux installations and resources/providers
 * Add default and profile_test_get suites and pdate centos-6.5 to 6.7
 * Add fixes to resolve Chef 13 conflicts
 
 [@jeremyfryer]: https://github.com/jeremyfryer
 [@potato20]: https://github.com/potato20
 [@alkalin3]: https://github.com/alkalin3
 
## 1.1.0 2017-03-21
Fix poise-python depend ([@cmlicata][])

 * Fix issue with specifying multiple version constraints in metadata.rb file
 
 [@biinari]: https://github.com/biinari

## 1.0.0 2016-03-04
Initial Release post fork ([@nickryand][])

* Project forked from the https://github.com/awscli/awscli-cookbook project
* Added a new custom resource which allows you to generate awscli credentials files: `cloudcli_aws_credentials`
* The upstream `python` cookbook is depricated so this cookbook now depends on `poise-python`
* Cookbook now requires Chef > 12.5 due to the new custom resource syntax used to implement `cloudcli_aws_credentails`

[@nickryand]: https://github.com/nickryand
