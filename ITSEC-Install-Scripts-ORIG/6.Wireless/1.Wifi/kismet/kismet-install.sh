#!/bin/bash

. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/kismetwireless/kismet.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/6.Wireless/1.Wifi/kismet/kismetwireless/kismet
GITCLONEDIR=/opt/ITSEC/6.Wireless/1.Wifi/kismet/kismetwireless
KISMETFILESDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/6.Wireless/1.Wifi/kismet/kismet-files
EXECUTEABLE1=beef.sh
EXECUTEABLE2=beef
CONFDIR=
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/6.Wireless/1.Wifi/kismet
DSKTPFLSDEST=/home/$USER/.local/share/applications/6.Wireless/1.Wifi/kismet
DSKTPFL=kismet.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/6.Wireless/1.Wifi/kismet

BANNER () {
	echo "${bold}
	 _  _____ ____  __  __ _____ _____ 
	| |/ /_ _/ ___||  \/  | ____|_   _|
	| ' / | |\___ \| |\/| |  _|   | |  
	| . \ | | ___) | |  | | |___  | |  
	|_|\_\___|____/|_|  |_|_____| |_|  
		   
	INSTALL
	${normal}"
}

DEPS () {
	sudo apt-get update
	sudo apt-get upgrade
	xargs -a <(awk '/^\s*[^#]/' "$APTLSTDIR/deps-kismet.txt") -r -- sudo apt-get install -y
}

BUILD () {
	./configure
	make -j 4
}

CONF () {
	mkdir -p /home/$USER/.kismet
	echo "
	#ssid_map" > /home/$USER/.kismet/ssid_map.conf
	sudo mkdir -p /usr/share/wireshark/wireshark
	sudo ln -s  /usr/local/share/wireshark/manuf /usr/share/wireshark/wireshark/manuf
	# rm -f kismet.sh
	# echo "#!/bin/bash

	# kismetadapter=(ifconfig -a | sed 's/[ \t].*//;/^\(lo\|\)$/d' | sed '/enp*/d' | sed '/docker*/d' | sed '/br*/d')
	 
	# cd /opt/ITSEC/6.Wireless/1.Wifi/kismet/kismetwireless/kismet


	#./kismet -c $kismetadapter" > kismet.sh

	# sed -i 's#=(#=$(#g' kismet.sh
	# sed -i 's#-c #-c $kismetadapter#g' kismet.sh
	# chmod +x kismet.sh
}


sudo mv /usr/local/share/wireshark/manuf_old /usr/local/share/wireshark/manuf

sudo ldconfig
sudo updatedb


GITCLONEFUNC
DEPS

sudo service gpsd stop
sudo systemctl disable gpsd.service

GITSBMDLINIT
BUILD
sudo make suidinstall

CONF

sudo rm -f $CONFDIR/kismet.conf
sudo cp $KISMETFILESDIR/kismet.conf $CONFDIR/kismet.conf
sudo ln -s $GITREPOROOT/kismet $BINDIR/kismet.sh

# sudo rm -f /usr/local/bin/kismet
sudo groupadd kismet
sudo usermod -a -G kismet $USER 
# newgrp kismet #newgrp bug lets the script hang
CPDESKTFL