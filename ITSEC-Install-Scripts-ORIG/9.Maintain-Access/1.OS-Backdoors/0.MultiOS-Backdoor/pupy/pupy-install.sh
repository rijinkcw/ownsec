#!/bin/bash

. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/n1nj4sec/pupy
BRANCH=master
GITREPOROOT=/opt/ITSEC/9.Maintain-Access/1.OS-Backdoors/0.MultiOS-Backdoor/pupy/n1nj4sec/pupy
GITCLONEDIR=/opt/ITSEC/9.Maintain-Access/1.OS-Backdoors/0.MultiOS-Backdoor/pupy/n1nj4sec
EXECUTEABLE1=pupygen.sh
EXECUTEABLE2=pupygen
EXECUTEABLE3=pupygen.py
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/9.Maintain-Access/1.OS-Backdoors/0.MultiOS-Backdoor/pupy
DSKTPFLSDEST=/home/$USER/.local/share/applications/9.Maintain-Access/1.OS-Backdoors/0.MultiOS-Backdoor/pupy
DSKTPFL=pupy.desktop

BANNER () {
	echo "${bold}
	    _    ____  
	 ____  _   _ ______   __
	|  _ \| | | |  _ \ \ / /
	| |_) | | | | |_) \ V / 
	|  __/| |_| |  __/ | |  
	|_|    \___/|_|    |_|  
		                
	BUILDER INSTALL
	${normal}"
}
PYBIN () {
	echo '#!/bin/bash
	GITREPOROOT=/opt/ITSEC/9.Maintain-Access/1.OS-Backdoors/0.MultiOS-Backdoor/pupy/n1nj4sec/pupy
	cd $GITREPOROOT/pupy
	python pupygen.py "$@" ' > $GITREPOROOT/pupy/$EXECUTEABLE1
	chmod +x $GITREPOROOT/pupy/$EXECUTEABLE1
}

BANNER
GITCLONEFUNC
GITSBMDLINIT

pur -r pupy/requirements.txt
sudo -H pip install -r pupy/requirements.txt
wget -O payload_templates.txz https://github.com/n1nj4sec/pupy/releases/download/latest/payload_templates.txz
tar xvf payload_templates.txz
mv payload_templates/* pupy/payload_templates/
rm payload_templates.txz
rm -fr payload_templates
PYBIN
sudo rm -f $BINDIR/$EXECUTEABLE2
sudo ln -s $GITREPOROOT/pupy/$EXECUTEABLE1 $BINDIR/$EXECUTEABLE2
CPDESKTFL