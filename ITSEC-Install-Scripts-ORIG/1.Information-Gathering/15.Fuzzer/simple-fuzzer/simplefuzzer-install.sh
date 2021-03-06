#!/bin/bash

. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/orgcandman/simple-fuzzer.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/1.Information-Gathering/15.Fuzzer/simple-fuzzer/orgcandman/simple-fuzzer
GITCLONEDIR=/opt/ITSEC/1.Information-Gathering/15.Fuzzer/simple-fuzzer/orgcandman
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/1.Information-Gathering/15.Fuzzer/simple-fuzzer
DSKTPFLSDEST=/home/$USER/.local/share/applications/1.Information-Gathering/15.Fuzzer/simple-fuzzer
DSKTPFL=simple-fuzzer.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/1.Information-Gathering/15.Fuzzer/simplefuzzer/simple-fuzzer

BANNER () {
	echo "${bold}
	 ____ ___ __  __ ____  _     _____ _____ _   _ _______________ ____  
	/ ___|_ _|  \/  |  _ \| |   | ____|  ___| | | |__  /__  / ____|  _ \ 
	\___ \| || |\/| | |_) | |   |  _| | |_  | | | | / /  / /|  _| | |_) |
	 ___) | || |  | |  __/| |___| |___|  _| | |_| |/ /_ / /_| |___|  _ < 
	|____/___|_|  |_|_|   |_____|_____|_|    \___//____/____|_____|_| \_\
		     
	INSTALL
	${normal}"
}

BUILD () {
	./configure
	make -j 4
}

BANNER
GITCLONEFUNC
GITSBMDLINIT
BUILD
sudo make install
CPDESKTFL