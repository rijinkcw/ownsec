#!/bin/bash

. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/pentestmonkey/smtp-user-enum.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/1.Information-Gathering/7.SMTP/smtp-user-enum/pentestmonkey/smtp-user-enum
GITCLONEDIR=/opt/ITSEC/1.Information-Gathering/7.SMTP/smtp-user-enum/pentestmonkey
EXECUTEABLE1=smtp-user-enum.pl
EXECUTEABLE2=smtp-user-enum
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/1.Information-Gathering/7.SMTP/smtp-user-enum
DSKTPFLSDEST=/home/$USER/.local/share/applications/1.Information-Gathering/7.SMTP/smtp-user-enum
DSKTPFL=smtp-userenum.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/0.Initial/lst/apt

BANNER () {
	echo "${bold}
	 ____  __  __ _____ ____  _   _ ____  ____  _____ _   _ _   _ __  __ 
	/ ___||  \/  |_   _|  _ \| | | / ___||  _ \| ____| \ | | | | |  \/  |
	\___ \| |\/| | | | | |_) | | | \___ \| |_) |  _| |  \| | | | | |\/| |
	 ___) | |  | | | | |  __/| |_| |___) |  _ <| |___| |\  | |_| | |  | |
	|____/|_|  |_| |_| |_|    \___/|____/|_| \_\_____|_| \_|\___/|_|  |_|
		
	INSTALL
	${normal}"
}

BANNER
GITCLONEFUNC
GITSBMDLINIT
CHMODXEX1
SYMLINKEX2TO1
CPDESKTFL