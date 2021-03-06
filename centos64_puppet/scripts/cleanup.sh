yum -y erase gtk2 libX11 hicolor-icon-theme avahi freetype bitstream-vera-fonts
yum -y clean all
rm -rf /etc/yum.repos.d/{puppetlabs,epel}.repo
rm -rf VBoxGuestAdditions_*.iso
sed -i /HWADDR/d /etc/sysconfig/network-scripts/ifcfg-eth0

if [[ -f /etc/udev/rules.d/70-persistent-net.rules ]] then 
  rm /etc/udev/rules.d/70-persistent-net.rules
fi
