#!/bin/bash

. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/v1s1t0r1sh3r3/airgeddon
BRANCH=master
GITREPOROOT=/opt/ITSEC/6.Wireless/1.Wifi/airgeddon/v1s1t0r1sh3r3/airgeddon
GITCLONEDIR=/opt/ITSEC/6.Wireless/1.Wifi/airgeddon/v1s1t0r1sh3r3
EXECUTEABLE1=airgeddon_run.sh
EXECUTEABLE2=airgeddon
EXECUTEABLE3=airgeddon.sh
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/6.Wireless/1.Wifi/airgeddon
DSKTPFLSDEST=/home/$USER/.local/share/applications/6.Wireless/1.Wifi/airgeddon
DSKTPFL=airgeddon.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/6.Wireless/1.Wifi/airgeddon

BANNER () {
	echo "${bold}
	    _    ___ ____   ____ _____ ____  ____   ___  _   _ 
	   / \  |_ _|  _ \ / ___| ____|  _ \|  _ \ / _ \| \ | |
	  / _ \  | || |_) | |  _|  _| | | | | | | | | | |  \| |
	 / ___ \ | ||  _ <| |_| | |___| |_| | |_| | |_| | |\  |
	/_/   \_\___|_| \_\\____|_____|____/|____/ \___/|_| \_|
		     
	INSTALL   
	${normal}"
}

SHEXEC () {
	echo '#!/bin/bash 

	cd /opt/ITSEC/6.Wireless/1.Wifi/airgeddon/v1s1t0r1sh3r3/airgeddon
	sudo ./airgeddon.sh "$@"' > $EXECUTEABLE1

	CHMODXEX1
	CHMODXEX3
}


BANNER
GITCLONEFUNC

### DEPS:
# aircrack-ng
### DEPS END

GITSBMDLINIT
SHEXEC
SYMLINKEX2TO1
CPDESKTFL
