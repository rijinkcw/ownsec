#!/bin/bash

. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/OpenSecurityResearch/hostapd-wpe.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/6.Wireless/1.Wifi/4.Evil-Twin/hostapd-wpe/OpenSecurityResearch/hostapd-wpe
GITCLONEDIR=/opt/ITSEC/6.Wireless/1.Wifi/4.Evil-Twin/hostapd-wpe/OpenSecurityResearch
EXECUTEABLE1=hostapd-wpe.sh
EXECUTEABLE2=hostapd-wpe
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/6.Wireless/1.Wifi/4.Evil-Twin/hostapd-wpe
DSKTPFLSDEST=/home/$USER/.local/share/applications/6.Wireless/1.Wifi/4.Evil-Twin/hostapd-wpe
DSKTPFL=hostapd-wpe.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/6.Wireless/1.Wifi/4.Evil-Twin/hostapd-wpe

BANNER () {
	echo "${bold}
	 _   _  ___  ____ _____  _    ____  ____     __        ______  _____ 
	| | | |/ _ \/ ___|_   _|/ \  |  _ \|  _ \    \ \      / /  _ \| ____|
	| |_| | | | \___ \ | | / _ \ | |_) | | | |____\ \ /\ / /| |_) |  _|  
	|  _  | |_| |___) || |/ ___ \|  __/| |_| |_____\ V  V / |  __/| |___ 
	|_| |_|\___/|____/ |_/_/   \_\_|   |____/       \_/\_/  |_|   |_____|
		
	INSTALL
	${normal}"
}

DEPS () {
	sudo apt-get update
	sudo apt-get upgrade
	xargs -a <(awk '/^\s*[^#]/' "$APTLSTDIR/deps-hostapd-wpe.txt") -r -- sudo apt-get install -y
}

BINEXEC () {
	echo "#!/bin/bash
	cd /opt/ITSEC/6.Wireless/1.Wifi/4.Evil-Twin/hostapd-wpe/OpenSecurityResearch/hostapd-wpe/hostapd-2.6/hostapd

	sudo ./hostapd-wpe hostapd-wpe.conf" >> $GITREPOROOT/$EXECUTEABLE1

	CHMODXEX1
}

DEPS
GITCLONEFUNC
GITSBMDLINIT

rm -rf $GITREPOROOT/hostapd-2.6
wget http://hostap.epitest.fi/releases/hostapd-2.6.tar.gz
tar -zxf hostapd-2.6.tar.gz
cd $GITREPOROOT/hostapd-2.6
patch -p1 < ../hostapd-wpe.patch

cd $GITREPOROOT/hostapd-2.6/hostapd
make -j 4
sudo make install
cd $GITREPOROOT/certs
./bootstrap

cd $GITREPOROOT/hostapd-2.6/hostapd

BINEXEC
SYMLINKEX2TO1
CPDESKTFL