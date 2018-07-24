#!/usr/bin/env bash

sudo rm -f /etc/sysctl.d/01-disable-ipv6.conf

sudo sed -i -e 's#GRUB_CMDLINE_LINUX_DEFAULT="ipv6.disable=1 #GRUB_CMDLINE_LINUX_DEFAULT="#g' /etc/default/grub 

sudo update-grub