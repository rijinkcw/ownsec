#!/usr/bin/bash

#1i
. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/bettercap/bettercap.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/7.Mitm/bettercap/bettercap/bettercap
GITCONFDIR=/opt/ITSEC/7.Mitm/bettercap/bettercap/bettercap/.git
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
               
UPDATE
${normal}"



GITUPTODATE
if git checkout $BRANCH &&
git fetch origin $BRANCH &&
[ `git rev-list HEAD...origin/$BRANCH --count` != 0 ] &&
git merge origin/$BRANCH
then
    
GITCLONEFUNC

GITRESET
GITSBMDLINIT

go get github.com/bettercap/bettercap

sudo rm -f /usr/local/bin/bettercap
sudo ln -s $GOPATH/bin/bettercap /usr/local/bin/bettercap
CPDESKTFL

echo "${bold}
done running the bettercap setup   
${normal}"

echo "${bold}
UPDATED
${normal}"

else

echo "${bold}
UP TO DATE
${normal}"
	
fi
