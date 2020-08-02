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

### NOTICE  

© 2020 The MITRE Corporation.  

Approved for Public Release; Distribution Unlimited. Case Number 18-3678.  

### NOTICE
MITRE hereby grants express written permission to use, reproduce, distribute, modify, and otherwise leverage this software to the extent permitted by the licensed terms provided in the LICENSE.md file included with this project.

### NOTICE  

This software was produced for the U. S. Government under Contract Number HHSM-500-2012-00008I, and is subject to Federal Acquisition Regulation Clause 52.227-14, Rights in Data-General.  

No other use other than that granted to the U. S. Government, or to those acting on behalf of the U. S. Government under that Clause is authorized without the express written permission of The MITRE Corporation. 

For further information, please contact The MITRE Corporation, Contracts Management Office, 7515 Colshire Drive, McLean, VA  22102-7539, (703) 983-6000.  
