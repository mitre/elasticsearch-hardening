# elasticsearch-inspec-hardening
Private repo for the elasticsearch-inspec hardening project

*We need better getting started directions*

### Dependencies:
1. Install VirtualBox
2. Install Vagrant
3. Install ruby >= 2.3
4. Install bundle
  * gem install bundle

### Run:
bundle exec kitchen list
  * This should give you a list of VM to deploy in "suite-platform" combinations
    * Package or repository and OS - ubuntu or centos
  * But I have not seen it work, so there be a bunch of gems you have to manually do ...
    * gem install kitchen-vagrant
    * gem install inspec
    * gem install kitchen-inspec

bundle exec kitchen create package-centos-72
  * Creates the VM 
  
bundle exec kitchen converge package-centos-72
  * Runs the installation scripts like install elasticsearch and config
  
Now this instance should be accessable from the [elasticsearch-inspec](https://github.com/elastic/elasticsearch-inspec) project
