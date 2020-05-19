#!/bin/bash

. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/aircrack-ng/aircrack-ng
BRANCH=master
GITREPOROOT=/opt/ITSEC/6.Wireless/1.Wifi/aircrack-ng/aircrack-ng/aircrack-ng
GITCLONEDIR=/opt/ITSEC/6.Wireless/1.Wifi/aircrack-ng/aircrack-ng
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/6.Wireless/1.Wifi/aircrack-ng
DSKTPFLSDEST=/home/$USER/.local/share/applications/6.Wireless/1.Wifi/aircrack-ng
DSKTPFL=aircrack-ng.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/6.Wireless/1.Wifi/aircrack-ng

BANNER () {
	echo "${bold}
	    _    ___ ____   ____ ____      _    ____ _  __     _   _  ____ 
	   / \  |_ _|  _ \ / ___|  _ \    / \  / ___| |/ /    | \ | |/ ___|
	  / _ \  | || |_) | |   | |_) |  / _ \| |   | ' /_____|  \| | |  _ 
	 / ___ \ | ||  _ <| |___|  _ <  / ___ \ |___| . \_____| |\  | |_| |
	/_/   \_\___|_| \_\\____|_| \_\/_/   \_\____|_|\_\    |_| \_|\____|
		 
	INSTALL
	${normal}"
}

DEPS () {
	sudo apt-get update
	sudo apt-get upgrade
	xargs -a <(awk '/^\s*[^#]/' "$APTLSTDIR/deps-aircrack-ng.txt") -r -- sudo apt-get install -y
}

BUILD () {
	env NOCONFIGURE=1 ./autogen.sh
	./configure
	make -j 4
}


BANNER
GITCLONEFUNC
DEPS
make clean
GITSBMDLINIT
BUILD
sudo make install
sudo airodump-ng-oui-update
CPDESKTFL

