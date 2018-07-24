#!/usr/bin/env bash

#sudo echo "net.ipv6.conf.all.disable_ipv6 = 1" > /etc/sysctl.d/01-disable-ipv6.conf
#sudo /bin/su -c "echo 'net.ipv6.conf.all.disable_ipv6 = 1' >> /etc/sysctl.d/01-disable-ipv6.conf"

# sudo sed -e 's#GRUB_CMDLINE_LINUX_DEFAULT="#GRUB_CMDLINE_LINUX_DEFAULT="ipv6.disable=1 #g' /etc/default/grub > /etc/default/grub_tmp
#sudo cp /etc/default/grub /etc/default/grub_tmp
#sudo sed -e 's#GRUB_CMDLINE_LINUX_DEFAULT="#GRUB_CMDLINE_LINUX_DEFAULT="ipv6.disable=1 #g' /etc/default/grub_tmp > /etc/default/grub_tmp2
sudo sed -i -e 's#GRUB_CMDLINE_LINUX_DEFAULT="#GRUB_CMDLINE_LINUX_DEFAULT="ipv6.disable=1 #g' /etc/default/grub 

#sudo cp /etc/default/grub_tmp2 /etc/default/grub
#sudo rm -f /etc/default/grub_tmp
#sudo rm -f /etc/default/grub_tmp2

#sudo mv /etc/default/grub_tmp /etc/default/grub
sudo update-grub