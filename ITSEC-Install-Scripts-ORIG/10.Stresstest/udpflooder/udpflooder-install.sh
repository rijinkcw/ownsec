#!/bin/bash

#http://www.hackingvoip.com/sec_tools.html

#http://www.hackingvoip.com/tools/udpflood.tar.gz

#1i
. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

DOWNLOADDIR=/opt/ITSEC/10.Stresstest/udp-flooder
BINROOT=/opt/ITSEC/10.Stresstest/udp-flooder/udpflood
#EXECUTEABLE1=pig.py
#EXECUTEABLE2=pig
EXECUTEABLE1=udpflood
EXECUTEABLE2=udpflood

DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/10.Stresstest/udpflooder
DSKTPFLSDEST=/home/$USER/.local/share/applications/10.Stresstest/udpflooder
DSKTPFL=udpflood.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/10.Stresstest/udpflooder

echo "${bold}
 _   _ ____  ____  _____ _     ___   ___  ____  _____ ____  
| | | |  _ \|  _ \|  ___| |   / _ \ / _ \|  _ \| ____|  _ \ 
| | | | | | | |_) | |_  | |  | | | | | | | | | |  _| | |_) |
| |_| | |_| |  __/|  _| | |__| |_| | |_| | |_| | |___|  _ < 
 \___/|____/|_|   |_|   |_____\___/ \___/|____/|_____|_| \_\
           
INSTALL
${normal}"

mkdir -p /opt/ITSEC/10.Stresstest/udp-flooder
cd $DOWNLOADDIR

### DEPS:
# no deps noted, feel free to add ...
### DEPS END

sudo rm -f /usr/local/bin/$EXECUTEABLE2
sudo updatedb
sudo ldconfig

wget http://www.hackingexposedvoip.com/tools/udpflood.tar.gz -O udpflood.tar.gz 
tar xvf udpflood.tar.gz
cd udpflood
make

SYMLINKEX2TO1

CPDESKTFL