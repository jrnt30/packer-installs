# Install Puppet

# cat > /etc/yum.repos.d/puppetlabs.repo << EOM
# [puppetlabs]
# name=puppetlabs
# baseurl=http://yum.puppetlabs.com/el/6/products/\$basearch
# enabled=1
# gpgcheck=0
# EOM

rpm -ivh http://yum.puppetlabs.com/el/6/products/i386/puppetlabs-release-6-7.noarch.rpm

yum -y install puppet facter

