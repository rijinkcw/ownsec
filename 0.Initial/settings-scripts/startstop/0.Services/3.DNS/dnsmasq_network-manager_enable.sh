#!/usr/bin/env bash


sudo sed -i -e 's/##dns=dnsmasq/#dns=dnsmasq/g' /etc/NetworkManager/NetworkManager.conf
sudo sed -i -e 's/#dns=dnsmasq/dns=dnsmasq/g' /etc/NetworkManager/NetworkManager.conf


sudo service network-manager restart
sudo service networking restart
