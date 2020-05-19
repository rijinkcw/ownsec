#!/bin/bash

. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh


BRANCH=master

BANNER () {
	echo "${bold}
	 ____ ____  _     ____  _   _ ___ _____ _____ 
	/ ___/ ___|| |   / ___|| \ | |_ _|  ___|  ___|
	\___ \___ \| |   \___ \|  \| || || |_  | |_   
	 ___) |__) | |___ ___) | |\  || ||  _| |  _|  
	|____/____/|_____|____/|_| \_|___|_|   |_|    
		 
	INSTALL
	${normal}"
}

GITCLONEFUNC
GITSBMDLINIT