packer-installs
===============

Customizations of the Puppet Vagrant box images to work on EC2 as well.

This repository is an attempt to add in AMI images that mirror those of http://puppet-vagrant-boxes.puppetlabs.com/ to reduce any incongruinces between local development of Vagrant boxes and deployment to AWS.   

The general flow I've found to work for VBox and AMI Customization:

1. Start off using the template provided by https://github.com/puppetlabs/puppet-vagrant-boxes for the specific installation you want to target.
2. Convert the veewee RB file to the packer equivalent via the gem veewee-to-packer.
3. Locate the default AMI for the image in question. 
  * Centos: http://wiki.centos.org/Cloud/AWS.  **Note:** Go to the marketplace for the version of Centos you are targeting & find the AMI ID under the "Launch with EC2 Console" tab for your region. I have not gotten the "One Click" option will not provision the keys approrpriately. 
4. Add in an additional "builders" configuration block for type:"amazon-ebs" with the appropriate Region/Access/AMI/Default instance type information. 
5. Register any custom builder overrides that may be necessary. 
  * Centos: Add in an additional "override" to the Shell provisioner for AWS to ensure the removal of the /root/.ssh/authorized_keys file is removed at the end of the provisioning of the box to allow for the Launch Instance to properly provision the SSH keys. (https://github.com/mitchellh/packer/issues/185)
6. Record your AMI image ID which should be geared up and ready to go for your Centos and should be almost identical to the images available off of http://puppet-vagrant-boxes.puppetlabs.com/ (Note: You could also run the Virtualbox provisioner of Packer.io as well if you have something custom you want bootstrapped in prior to any puppet work) 
