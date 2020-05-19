#!/bin/bash
# doesent work local or docker either

#1i
. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/certsocietegenerale/FIR.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/1.Information-Gathering/16.IDS-IPS_Identification/fir/certsocietegenerale/FIR
GITCLONEDIR=/opt/ITSEC/1.Information-Gathering/16.IDS-IPS_Identification/fir/certsocietegenerale
GITREPOGITFILE=$GITREPOROOT/.git
EXECUTEABLE1=manage.py
EXECUTEABLE2=fir
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/16.IDS-IPS_Identification/fir
DSKTPFLSDEST=/home/$USER/.local/share/applications/1.Information-Gathering/16.IDS-IPS_Identification/fir
DSKTPFL=fir.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/1.Information-Gathering/16.IDS-IPS_Identification/fir

BANNER () {
	echo "${bold}
	 _____ ___ ____  
	|  ___|_ _|  _ \ 
	| |_   | || |_) |
	|  _|  | ||  _ < 
	|_|   |___|_| \_\
		 
	INSTALL
	${normal}"
}
DEPS () {
	sudo apt-get update
	sudo apt-get upgrade
	xargs -a <(awk '/^\s*[^#]/' "$APTLSTDIR/deps-fir.txt") -r -- sudo apt-get install -y
	# sudo -H pip install -r requirements.txt
}

RM_OLD () {
	sudo rm -f /usr/local/bin/$EXECUTEABLE2
}


BANNER
DEPS
RM_OLD
GITCLONEFUNC
GITSBMDLINIT

# cd docker
# CHMODXEX1
# sudo ln -s $GITREPOROOT/$EXECUTEABLE1 /usr/local/bin/$EXECUTEABLE2

CPDESKTFL

fir migrate
fir loaddata /opt/ITSEC/1.Information-Gathering/16.IDS-IPS_Identification/fir/certsocietegenerale/FIR/incidents/fixtures/seed_data.json
fir loaddata /opt/ITSEC/1.Information-Gathering/16.IDS-IPS_Identification/fir/certsocietegenerale/FIR/incidents/fixtures/dev_users.json

# fir runserver