#!/bin/bash

. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/gamelinux/passivedns.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/1.Information-Gathering/5.DNS/passivedns/gamelinux/passivedns
GITCLONEDIR=/opt/ITSEC/1.Information-Gathering/5.DNS/passivedns/gamelinux
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/1.Information-Gathering/5.DNS/passivedns
DSKTPFLSDEST=/home/$USER/.local/share/applications/1.Information-Gathering/5.DNS/passivedns
DSKTPFL=passivedns.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/1.Information-Gathering/5.DNS/passivedns

BANNER () {
	echo "${bold}
	 ____   _    ____ ____ _____     _______ ____  _   _ ____  
	|  _ \ / \  / ___/ ___|_ _\ \   / / ____|  _ \| \ | / ___| 
	| |_) / _ \ \___ \___ \| | \ \ / /|  _| | | | |  \| \___ \ 
	|  __/ ___ \ ___) |__) | |  \ V / | |___| |_| | |\  |___) |
	|_| /_/   \_\____/____/___|  \_/  |_____|____/|_| \_|____/ 
	    
	INSTALL
	${normal}"

}
DEPS () {
	sudo apt-get update
	sudo apt-get upgrade
	xargs -a <(awk '/^\s*[^#]/' "$APTLSTDIR/deps-passivedns.txt") -r -- sudo apt-get install -y
}
BUILD () {
	libtoolize --force
	aclocal
	autoheader
	automake --force-missing --add-missing
	autoconf
	./configure
	make -j 4
}

BANNER
DEPS
GITCLONEFUNC
GITSBMDLINIT
BUILD
sudo make install
CPDESKTFL
