#!/bin/bash

BASEDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/8.Tunnel
####################################
######################   8.Tunnel  #
##################################

ANONYM8 () {

	cd $BASEDIR/anonym8
	./anonym8-install.sh
}

DNS2TCP () {
	cd $BASEDIR/dns2tcp
	./dns2tcp-install.sh
}
IODINE () {

	cd $BASEDIR/iodine
	./iodine-install.sh
}
MALLORY () {
	cd $BASEDIR/mallory
	./mallory-install.sh
}
MIREDO () {
	cd $BASEDIR/miredo
	./miredo-install.sh
}
PROXYCHAINS_NG () {
	cd $BASEDIR/proxychains-ng
	./proxychains-ng-install.sh
}
PROXYTUNNEL () {
	cd $BASEDIR/proxytunnel
	./proxytunnel-install.sh
}
PTUNNEL () {
	cd $BASEDIR/ptunnel
	./ptunnel-install.sh
}
PWNAT ()  {
	cd $BASEDIR/pwnat
	./pwnat-install.sh
}
SSLH () {
	cd $BASEDIR/sslh
	./sslh-install.sh
}
STUNNEL () {
	cd $BASEDIR/stunnel
	./stunnel-install.sh
}
UDPTUNNEL () {
	cd $BASEDIR/udptunnel
	./udptunnel-install.sh
}

# ANONYM8
DNS2TCP
IODINE
# MALLORY
# MIREDO
PROXYCHAINS_NG
# PROXYTUNNEL
PTUNNEL
PWNAT
SSLH
# STUNNEL
UDPTUNNEL