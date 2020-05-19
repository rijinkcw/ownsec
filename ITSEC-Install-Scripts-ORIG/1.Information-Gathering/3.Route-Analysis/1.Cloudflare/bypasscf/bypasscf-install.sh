#!/bin/bash

. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/HackerOrientado/BypassCF.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/1.Information-Gathering/3.Route-Analysis/1.Cloudflare/bypasscf/HackerOrientado/BypassCF
GITCLONEDIR=/opt/ITSEC/1.Information-Gathering/3.Route-Analysis/1.Cloudflare/bypasscf/HackerOrientado
EXECUTEABLE1=bypasscf.sh
EXECUTEABLE2=bypasscf
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/1.Information-Gathering/3.Route-Analysis/1.Cloudflare/bypasscf
DSKTPFLSDEST=/home/$USER/.local/share/applications/1.Information-Gathering/3.Route-Analysis/1.Cloudflare/bypasscf
DSKTPFL=bypasscf.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/1.Information-Gathering/3.Route-Analysis/1.Cloudflare/bypasscf

BANNER () {
	echo "${bold}
	 ______   ______   _    ____ ____   ____ _____ 
	| __ ) \ / /  _ \ / \  / ___/ ___| / ___|  ___|
	|  _ \\ V /| |_) / _ \ \___ \___ \| |   | |_   
	| |_) || | |  __/ ___ \ ___) |__) | |___|  _|  
	|____/ |_| |_| /_/   \_\____/____/ \____|_|    
	      
	INSTALL
	${normal}"
}
DEPS () {
	sudo apt-get update
	sudo apt-get upgrade
	xargs -a <(awk '/^\s*[^#]/' "$APTLSTDIR/deps-bypasscf.txt") -r -- sudo apt-get install -y
	sudo -H pip2 install pydnet
	sudo -H pip2 install dpkt
}
PLEXEC () {
	echo "#!/bin/bash

	cd /opt/ITSEC/1.Information-Gathering/3.Route-Analysis/1.Cloudflare/bypasscf/HackerOrientado/BypassCF

	perl BypassCF.pl" > $EXECUTEABLE1
	chmod +x $EXECUTEABLE1
}

BANNER
DEPS
GITCLONEFUNC
GITSBMDLINIT
PLEXEC
SYMLINKEX2TO1
CPDESKTFL
