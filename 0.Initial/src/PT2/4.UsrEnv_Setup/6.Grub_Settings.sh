#!/bin/bash

# Copy Grub config and Update Grub
# sudo cp /opt/ownsec/0.Initial/settings-scripts/grub /etc/default/grub
sudo sed -i -e 's#GRUB_CMDLINE_LINUX_DEFAULT="quiet splash"#GRUB_CMDLINE_LINUX_DEFAULT=""# g' /etc/default/grub 

sudo update-grub
sudo updatedb
sudo ldconfig