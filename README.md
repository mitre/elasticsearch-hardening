# elasticsearch-inspec-hardening
Private repo for the elasticsearch-inspec hardening project

Better getting started directions - 

Dependencies:
Install VirtualBox
Install Vagrant
Install ruby >= 2.3
Install bundle
* gem install bundle

(Hopefully will be part of bundle file instructions, but I have not seen it work, so there be a bunch of these you have to manually do ...)
* gem install kitchen-vagrant
* gem install inspec
* gem install kitchen-inspec

bundle exec kitchen list
* gives you a list of stuff

Pick a "suite-platform" combination

bundle exec kitchen create repository-ubuntu-1604

bundle exec kitchen converge repository-ubuntu-1604
