#!/bin/bash

. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/Trietptm-on-Security/Bella.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/9.Maintain-Access/1.OS-Backdoors/3.Mac-Backdoor/bella/Trietptm-on-Security/Bella
GITCLONEDIR=/opt/ITSEC/9.Maintain-Access/1.OS-Backdoors/3.Mac-Backdoor/bella/Trietptm-on-Security
EXECUTEABLE1=bella-builder.sh
EXECUTEABLE2=bella-builder
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/9.Maintain-Access/1.OS-Backdoors/3.Mac-Backdoor/bella
DSKTPFLSDEST=/home/$USER/.local/share/applications/9.Maintain-Access/1.OS-Backdoors/3.Mac-Backdoor/bella
DSKTPFL=bella-builder.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/9.Maintain-Access/1.OS-Backdoors/3.Mac-Backdoor/bella

BANNER () {
	echo "${bold}
	 ____  _____ _     _        _    
	| __ )| ____| |   | |      / \   
	|  _ \|  _| | |   | |     / _ \  
	| |_) | |___| |___| |___ / ___ \ 
	|____/|_____|_____|_____/_/   \_\
		     
	INSTALL   
	${normal}"
}
PYEXEC () 
	echo '#!/bin/bash
	cd /opt/ITSEC/9.Maintain-Access/1.OS-Backdoors/3.Mac-Backdoor/bella/Trietptm-on-Security/Bella
	./BUILDER "$@"' > $EXECUTEABLE1
	chmod +x $EXECUTEABLE1
}

GITCLONEFUNC
GITSBMDLINIT
chmod +x BUILDER
PYEXEC
SYMLINKEX2TO1
CPDESKTFL