#!/bin/bash

BASEDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/10.Stresstest
PIVOT=/opt/ownsec/ITSEC-Install-Scripts-ORIG/8.Tunnel/1.Pivot
###############################################################################
######################   10.Stresstest   ####################
###########################################################################

DHCPIG () {
	cd $BASEDIR/dhcpig
	./dhcpig-install.sh # call w dhcPIG
}
IAX_FLOODER () {
	cd $BASEDIR/iax-flooder
	./iax-flooder-install.sh # call w iaxfloof
}
INVITEFLOODER () {
	cd $BASEDIR/invite-flooder
	./invite-flooder-install.sh
}
PIG () {
	cd $BASEDIR/pig
	./#pig-install.sh
}
RTPFLOODER () {
	cd $BASEDIR/rtp-flooder
	./rtp-flooder-install.sh
}
SIEGE () {
	cd $BASEDIR/siege
	./#siege-install.sh 
}
SLOWHTTPTEST () {
	cd $BASEDIR/slowhttptest
	./slowhttptest-install.sh#build fail
}
T50 () {
	cd $BASEDIR/t50
	./t50-install.sh
}
UDPFLOODER () {
	cd $BASEDIR/udpflooder
	./udpflooder-install.sh
}
UFONET () {
	cd $BASEDIR/ufonet
	./ufonet-install.sh
}

DHCPIG # call w dhcPIG
IAX_FLOODER
INVITEFLOODER
# PIG  # call w iaxfloof
RTPFLOODER
# SIEGE #disabled die to build err, check back latr
SLOWHTTPTEST
# T50 # build fail
UDPFLOODER
UFONET