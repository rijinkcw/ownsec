#!/bin/bash

. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/Ethical-H4CK3R/Aircrack
BRANCH=master
GITREPOROOT=/opt/ITSEC/6.Wireless/1.Wifi/aircrack/Ethical-H4CK3R/Aircrack
GITCLONEDIR=/opt/ITSEC/6.Wireless/1.Wifi/aircrack/Ethical-H4CK3R
EXECUTEABLE1=aircrack.sh
EXECUTEABLE2=aircrack
EXECUTEABLE3=aircrack.py
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/6.Wireless/1.Wifi/aircrack
DSKTPFLSDEST=/home/$USER/.local/share/applications/6.Wireless/1.Wifi/aircrack
DSKTPFL=aircrack.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/6.Wireless/1.Wifi/aircrack

BANNER () {
	echo "${bold}
	    _    _                         _    
	   / \  (_)_ __ ___ _ __ __ _  ___| | __
	  / _ \ | | '__/ __| '__/ _  |/ __| |/ /
	 / ___ \| | | | (__| | | (_| | (__|   < 
	/_/   \_\_|_|  \___|_|  \__ _|\___|_|\_\
	       
	INSTALL
	${normal}"
}

BUILD () {
	### DEPS: # aircrack-ng
	# sudo -H pip2 install -r requirements.txt
}


BANNER
GITCLONEFUNC
# BUILD
GITSBMDLINIT
sudo updatedb
sudo ldconfig

PYEXEC () {
	echo '#!/bin/bash 

	cd /opt/ITSEC/6.Wireless/1.Wifi/aircrack/Ethical-H4CK3R/Aircrack

	sudo python aircrack.py "$@"' > $EXECUTEABLE1

	#sed -i 's#=(#=$(#g' $EXECUTEABLE3
	#sed -i 's#--iface #--iface $wifiadapter#g' $EXECUTEABLE3

	CHMODXEX3
	CHMODXEX1
}
PYEXEC
SYMLINKEX2TO1
CPDESKTFL
