#!/bin/bash

#http://www.hackingvoip.com/sec_tools.html

#http://www.hackingvoip.com/tools/udpflood.tar.gz

. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

DOWNLOADDIR=/opt/ITSEC/10.Stresstest/udp-flooder
BINROOT=/opt/ITSEC/10.Stresstest/udp-flooder/udpflood
# EXECUTEABLE1=pig.py
# EXECUTEABLE2=pig
EXECUTEABLE1=udpflood.sh
EXECUTEABLE2=udpflood
EXECUTEABLE3=udpflood
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/10.Stresstest/udpflooder
DSKTPFLSDEST=/home/$USER/.local/share/applications/10.Stresstest/udpflooder
DSKTPFL=udpflood.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/10.Stresstest/udpflooder

BANNER () {
	echo "${bold}
	 _   _ ____  ____  _____ _     ___   ___  ____  _____ ____  
	| | | |  _ \|  _ \|  ___| |   / _ \ / _ \|  _ \| ____|  _ \ 
	| | | | | | | |_) | |_  | |  | | | | | | | | | |  _| | |_) |
	| |_| | |_| |  __/|  _| | |__| |_| | |_| | |_| | |___|  _ < 
	 \___/|____/|_|   |_|   |_____\___/ \___/|____/|_____|_| \_\
		   
	INSTALL
	${normal}"
}

BINEXEC () {
	echo '#!/bin/bash
	BINROOT=/opt/ITSEC/10.Stresstest/udp-flooder/udpflood
	cd $BINROOT
	./udpflood "$@" ' > $BINROOT/$EXECUTEABLE1
	chmod +x $BINROOT/$EXECUTEABLE1
}

BANNER
mkdir -p /opt/ITSEC/10.Stresstest/udp-flooder
cd $DOWNLOADDIR

sudo rm -f /usr/local/bin/$EXECUTEABLE2
sudo updatedb
sudo ldconfig

wget http://www.hackingexposedvoip.com/tools/udpflood.tar.gz -O udpflood.tar.gz 
tar xvf udpflood.tar.gz
cd udpflood
make
BINEXEC
sudo rm -f $BINDIR/$EXECUTEABLE2
sudo ln -s $BINROOT/$EXECUTEABLE1 $BINDIR/$EXECUTEABLE2

CPDESKTFL