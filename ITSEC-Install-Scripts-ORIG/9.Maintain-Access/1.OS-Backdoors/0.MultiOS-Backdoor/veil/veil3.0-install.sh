#!/bin/bash


# Veil Evasion is no longer supported, use Veil 3.0! https://github.com/Veil-Framework/Veil
# INSTALL LOG https://hastebin.com/royaxaxoha.sql

. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/Veil-Framework/Veil
BRANCH=master
GITREPOROOT=/opt/ITSEC/9.Maintain-Access/1.OS-Backdoors/0.MultiOS-Backdoor/Veil/Veil-Framework/Veil
GITCLONEDIR=/opt/ITSEC/9.Maintain-Access/1.OS-Backdoors/0.MultiOS-Backdoor/Veil/Veil-Framework
EXECUTEABLE1=Veil.py
EXECUTEABLE2=Veil
#ph1b
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/0.Initial/lst/apt

BANNER () {
echo "${bold}
__     _______ ___ _     
\ \   / / ____|_ _| |    
 \ \ / /|  _|  | || |    
  \ V / | |___ | || |___ 
   \_/  |_____|___|_____|
                         
INSTALL
${normal}"
}

GITCLONEFUNC
GITSBMDLINIT

sed -i 's/wine-stable/wine/' /opt/ITSEC/9.Maintain-Access/1.OS-Backdoors/0.MultiOS-Backdoor/Veil/Veil-Framework/Veil/setup/setup.sh
./setup/setup.sh -c

chmod +x $EXECUTEABLE1


SYMLINKEX2TO1