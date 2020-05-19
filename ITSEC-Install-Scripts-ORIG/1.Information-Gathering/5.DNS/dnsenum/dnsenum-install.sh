#!/bin/bash

. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/fwaeytens/dnsenum.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/1.Information-Gathering/5.DNS/dnsenum/fwaeytens/dnsenum
GITCLONEDIR=/opt/ITSEC/1.Information-Gathering/5.DNS/dnsenum/fwaeytens
EXECUTEABLE1=dnsenum.sh 
EXECUTEABLE2=dnsenum
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/1.Information-Gathering/5.DNS/dnsenum
DSKTPFLSDEST=/home/$USER/.local/share/applications/1.Information-Gathering/5.DNS/dnsenum
DSKTPFL=dnsenum.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/1.Information-Gathering/5.DNS/dnsenum

BANNER () {
	echo "${bold}
	 ____  _   _ ____  _____ _   _ _   _ __  __ 
	|  _ \| \ | / ___|| ____| \ | | | | |  \/  |
	| | | |  \| \___ \|  _| |  \| | | | | |\/| |
	| |_| | |\  |___) | |___| |\  | |_| | |  | |
	|____/|_| \_|____/|_____|_| \_|\___/|_|  |_|
		   
	INSTALL
	${normal}"
}
DEPS () {
	sudo apt-get update
	sudo apt-get upgrade
	xargs -a <(awk '/^\s*[^#]/' "$APTLSTDIR/deps-dnsenum.txt") -r -- sudo apt-get install -y
}
PLEXEC () {
	echo "#!/bin/bash 
	cd /opt/ITSEC/1.Information-Gathering/5.DNS/dnsenum/fwaeytens/dnsenum
	perl dnsenum.pl" > $EXECUTEABLE1

	chmod +x $EXECUTEABLE1
}

GITCLONEFUNC
DEPS 
GITSBMDLINIT
PLEXEC
SYMLINKEX2TO1
CPDESKTFL

