#!/usr/bin/bash

#1i
. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/BlackArch/thc-pptp-bruter.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/4.Password/1.Network/thc-pptp-bruter/BlackArch/thc-pptp-bruter
GITCLONEDIR=/opt/ITSEC/4.Password/1.Network/thc-pptp-bruter/BlackArch
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/4.Password/1.Network/thc-pptp-bruter
DSKTPFLSDEST=/home/$USER/.local/share/applications/4.Password/1.Network/thc-pptp-bruter
DSKTPFL=thc-pptp-bruter.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/4.Password/1.Network/thc-pptp-bruter
#ph1a

echo "${bold}
 _____ _   _  ____      ____  ____ _____ ____  
|_   _| | | |/ ___|    |  _ \|  _ \_   _|  _ \ 
  | | | |_| | |   _____| |_) | |_) || | | |_) |
  | | |  _  | |__|_____|  __/|  __/ | | |  __/ 
  |_| |_| |_|\____|    |_|   |_|    |_| |_|    
                                               
INSTALL
${normal}"

#plh11

SET_ALTERNATIVES () {
# set default version ( 4 = gcc 7)
yes "1" | sudo update-alternatives --config gcc 
expect "Press <enter> to keep the current choice[*], or type selection number:" { send "\n" }
yes "1" | sudo update-alternatives --config g++ 
expect "Press <enter> to keep the current choice[*], or type selection number:" { send "\n" }
gcc -v
g++ -v
}

REVERT_ALTERNATIVES () {
# revert default version ( 4 = gcc 7)
yes "4" | sudo update-alternatives --config gcc 
expect "Press <enter> to keep the current choice[*], or type selection number:" { send "\n" }
yes "4" | sudo update-alternatives --config g++ 
expect "Press <enter> to keep the current choice[*], or type selection number:" { send "\n" }
gcc -v
g++ -v
}

# deps ?

GITCLONEFUNC
make clean
GITSBMDLINIT
SET_ALTERNATIVES
./bootstrap
./configure
make -j 4
sudo make install
REVERT_ALTERNATIVES
#333d
CPDESKTFL