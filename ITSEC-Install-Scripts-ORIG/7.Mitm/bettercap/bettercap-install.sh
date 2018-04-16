#!/bin/bash

#1i
. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/bettercap/bettercap.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/7.Mitm/bettercap/bettercap/bettercap
GITCLONEDIR=/opt/ITSEC/7.Mitm/bettercap/bettercap
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/7.Mitm/bettercap
DSKTPFLSDEST=/home/$USER/.local/share/applications/7.Mitm/bettercap
DSKTPFL=bettercap.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/7.Mitm/bettercap
#ph1a
echo "${bold}
 ____  _____ _____ _____ _____ ____   ____    _    ____  
| __ )| ____|_   _|_   _| ____|  _ \ / ___|  / \  |  _ \ 
|  _ \|  _|   | |   | | |  _| | |_) | |     / _ \ | |_) |
| |_) | |___  | |   | | | |___|  _ <| |___ / ___ \|  __/ 
|____/|_____| |_|   |_| |_____|_| \_\\____/_/   \_\_|    
               
github.com/bettercap/bettercap 

INSTALL
${normal}"

#plh11

GITCLONEFUNC

GITSBMDLINIT

go get github.com/bettercap/bettercap

sudo rm -f /usr/local/bin/bettercap
sudo ln -s $GOPATH/bin/bettercap /usr/local/bin/bettercap
CPDESKTFL
