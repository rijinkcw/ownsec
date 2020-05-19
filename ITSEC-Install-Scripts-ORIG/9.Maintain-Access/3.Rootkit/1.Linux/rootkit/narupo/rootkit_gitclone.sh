#!/bin/bash

. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/narupo/rootkit
BRANCH=master
GITCLONEDIR=/opt/ITSEC/9.Maintain-Access/3.Rootkit/1.Kernel/1.Linux/rootkit/narupo

BANNER () {
	echo "${bold}
	 ____   ___   ___ _____ _  _____ _____ 
	|  _ \ / _ \ / _ \_   _| |/ /_ _|_   _|
	| |_) | | | | | | || | | ' / | |  | |  
	|  _ <| |_| | |_| || | | . \ | |  | |  
	|_| \_\\___/ \___/ |_| |_|\_\___| |_|  
		                               
	GIT CLONE
	${normal}"
}
BANNER
GITCLONEFUNC
GITSBMDLINIT