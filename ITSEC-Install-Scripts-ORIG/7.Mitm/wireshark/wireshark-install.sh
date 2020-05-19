#!/bin/bash

. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/wireshark/wireshark.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/7.Mitm/wireshark/wireshark/wireshark
GITCLONEDIR=/opt/ITSEC/7.Mitm/wireshark/wireshark
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/7.Mitm/wireshark
DSKTPFLSDEST=/home/$USER/.local/share/applications/7.Mitm/wireshark
DSKTPFL=wireshark.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/7.Mitm/wireshark

BANNER () {
	echo "${bold}
	__        _____ ____  _____ ____  _   _    _    ____  _  __
	\ \      / /_ _|  _ \| ____/ ___|| | | |  / \  |  _ \| |/ /
	 \ \ /\ / / | || |_) |  _| \___ \| |_| | / _ \ | |_) | ' / 
	  \ V  V /  | ||  _ <| |___ ___) |  _  |/ ___ \|  _ <| . \ 
	   \_/\_/  |___|_| \_\_____|____/|_| |_/_/   \_\_| \_\_|\_\
		   
	INSTALL
	${normal}"
}
DEPS () {
	sudo apt-get update
	sudo apt-get upgrade
	xargs -a <(awk '/^\s*[^#]/' "$APTLSTDIR/deps-wireshark.txt") -r -- sudo apt-get install -y
}

BUILD () {
	# mkdir build
	# cd build
	# cmake ..
	./autogen.sh
	./configure --with-gtk=3 --with-qt=no --with-ssl --enable-dumpcap --enable-setcap-install --enable-tfshark --enable-wireshark
	make -j 4
}


BANNER
GITCLONEFUNC
#cd build
#sudo make uninstall
GITCLONEFUNC
DEPS
sudo rm -r build
make clean 
GITSBMDLINIT
BUILD
sudo make install
 
GITCLONEFUNC
sudo groupadd wireshark
sudo usermod -a -G wireshark $USER
sudo chgrp wireshark $BINDIR/dumpcap
# newgrp wireshark newgrpbug - console hangs
sudo chmod 750 $BINDIR/dumpcap
sudo getcap $BINDIR/dumpcap
sudo setcap 'CAP_NET_RAW+eip CAP_NET_ADMIN+eip' $BINDIR/dumpcap
CPDESKTFL


