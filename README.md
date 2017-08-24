# elasticsearch-inspec-hardening
Private repo for the elasticsearch-inspec hardening project

Better getting started directions - 

Install ruby >= 2.3
Install bundle
* gem install bundle

(Hopefully will be part of bundle file instructions)
* gem install kitchen-vagrant
* gem install inspec
* gem install kitchen-inspec

bundle exec kitchen list
* gives you a list of stuff

Pick a "suite-platform" combination

bundle exec kitchen create repository-ubuntu-1604
bundle exec kitchen converge repository-ubuntu-1604
