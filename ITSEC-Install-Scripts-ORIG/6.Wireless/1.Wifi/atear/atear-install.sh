#!/bin/bash

. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/NORMA-Inc/AtEar.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/6.Wireless/1.Wifi/atear/NORMA-Inc/AtEar
GITCLONEDIR=/opt/ITSEC/6.Wireless/1.Wifi/atear/NORMA-Inc
EXECUTEABLE1=atear.sh
EXECUTEABLE2=atear
EXECUTEABLE3=run.py
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/6.Wireless/1.Wifi/atear
DSKTPFLSDEST=/home/$USER/.local/share/applications/6.Wireless/1.Wifi/atear
DSKTPFL=atear.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/6.Wireless/1.Wifi/atear

BANNER () {
	echo "${bold}
	    _  _____ _____    _    ____  
	   / \|_   _| ____|  / \  |  _ \ 
	  / _ \ | | |  _|   / _ \ | |_) |
	 / ___ \| | | |___ / ___ \|  _ < 
	/_/   \_\_| |_____/_/   \_\_| \_\
		   
	INSTALL
	${normal}"
}

DEPS () {
	sudo apt-get update
	sudo apt-get upgrade
	xargs -a <(awk '/^\s*[^#]/' "$APTLSTDIR/deps-atear.txt") -r -- sudo apt-get install -y

	pur -r requirements.txt
	sudo -H pip2 install -r requirements.txt
	sudo updatedb
	sudo ldconfig
}

BINEXEC () {
	echo "#!/bin/bash 

	cd /opt/ownsec/ITSEC/6.Wireless/1.Wifi/atear/NORMA-Inc/AtEar 
	firefox 127.0.0.1:8080 </dev/null &>/dev/null &
	sudo python run.py --iface wlan0" > $EXECUTEABLE1
}


BANNER
GITCLONEFUNC
DEPS
GITSBMDLINIT
rm -f $EXECUTEABLE1
BINEXEC
#sed -i 's#=(#=$(#g' $EXECUTEABLE3
#sed -i 's#--iface #--iface $wifiadapter#g' $EXECUTEABLE3
CHMODXEX3
CHMODXEX1
SYMLINKEX2TO1
CPDESKTFL
