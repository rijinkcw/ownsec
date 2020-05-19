#!/bin/bash

. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/antirez/hping.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/1.Information-Gathering/2.Live-Host/hping3/antirez/hping 
GITCLONEDIR=/opt/ITSEC/1.Information-Gathering/2.Live-Host/hping3/antirez
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/1.Information-Gathering/2.Live-Host/hping3
DSKTPFLSDEST=/home/$USER/.local/share/applications/1.Information-Gathering/2.Live-Host/hping3
DSKTPFL=hping3.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/1.Information-Gathering/2.Live-Host/hping3

BANNER () {
	echo "${bold}
	 _   _ ____ ___ _   _  ____ 
	| | | |  _ \_ _| \ | |/ ___|
	| |_| | |_) | ||  \| | |  _ 
	|  _  |  __/| || |\  | |_| |
	|_| |_|_|  |___|_| \_|\____|
		    
	INSTALL
	${normal}"
}
DEPS () {
	sudo apt-get update
	sudo apt-get upgrade
	xargs -a <(awk '/^\s*[^#]/' "$APTLSTDIR/deps-hping.txt") -r -- sudo apt-get install -y
}

REMOVE_OLD () {
	sudo rm -f /usr/sbin/hping
	sudo rm -f /usr/sbin/hping2
}

BUILD () {
	sudo ln -s /usr/include/pcap/bpf.h /usr/include/net/bpf.h
	./configure 
	make -j 4
}

BANNER
REMOVE_OLD
DEPS
GITCLONEFUNC
make clean
GITSBMDLINIT
BUILD
sudo make install
CPDESKTFL