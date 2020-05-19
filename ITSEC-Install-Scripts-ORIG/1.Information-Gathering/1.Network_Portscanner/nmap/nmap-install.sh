#!/bin/bash

## /nmap/nmap Setup - XFCE, 18.04

######################## CONFIG_MAIN - START ########################

sudo chown -R $USER:$USER /opt

GITREPO=https://github.com/nmap/nmap.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/1.Information-Gathering/1.Network_Portscanner/nmap/nmap/nmap
GITCLONEDIR=/opt/ITSEC/1.Information-Gathering/1.Network_Portscanner/nmap/nmap
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/1.Information-Gathering/1.Network_Portscanner/nmap
DSKTPFLSDEST=/home/$USER/.local/share/applications/1.Information-Gathering/1.Network_Portscanner/nmap
DSKTPFL=nmap.desktop
DSKTPFL2=ncat.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/1.Information-Gathering/1.Network_Portscanner/nmap
#ph1a
######################## CONFIG_MAIN - END ########################

######################## MISC - START ########################
# color
bold=$(tput bold)
normal=$(tput sgr0)
CYAN='\e[0;36m'
GREEN='\e[0;32m'
WHITE='\e[0;37m'
RED='\e[0;31m'
YELLOW='\e[0;33m'
BLUE='\e[0;34m'
PURPLE='\e[0;35m'
ORANGE='\e[38;5;166m'

# git clone 
GITCLONEFUNC () {
mkdir -p $GITCLONEDIR
cd $GITCLONEDIR
git clone -b $BRANCH $GITREPO
cd $GITREPOROOT
}
# END git clone 

# init submodules
GITSBMDLINIT () {
	git submodule init
	git submodule update --recursive
	sudo updatedb && sudo ldconfig
}
# END init submodules



NMAPDEPS () {

LIBS_DEPS="libc6-dev 
libgcc1 
liblinear3 
libpcap0.8-dev 
libcreal-ocaml-dev 
libblas3 
libssl-dev
libstdc++-6-dev 
libblas-dev 
libblas-bin 
liblua5.2-dev 
liblua5.3-dev
"

PYTHON_DEPS="python-bs4
python-chardet
python-html5lib
python-lxml
python-pkg-resources
python-six
"

MAIN_DEPS="build-essential 
ndiff 
lua-lpeg-dev
"


### DEPS:
sudo apt-get update
sudo apt-get upgrade

sudo apt-get remove nmap 

echo $LIBS_DEPS | while read libsdeps
do
   sudo apt-get install -y $libsdeps
done

echo $PYTHON_DEPS | while read pythondeps
do
   sudo apt-get install -y $pythondeps
done

echo $MAIN_DEPS | while read maindeps
do
   sudo apt-get install -y $maindeps
done


sudo updatedb
sudo ldconfig
}

WRTEDSKTPFLS () {
mkdir -p $DSKTPFLSDEST

echo '
[Desktop Entry]
Name=nmap
Encoding=UTF-8
Exec=sh -c "nmap;${SHELL:-bash}"
StartupNotify=false
Terminal=true
Type=Application
Categories=1.Information-Gathering;1.Network_Portscanner;' > $DSKTPFLSDEST/$DSKTPFL

echo '
[Desktop Entry]
Name=ncat
Encoding=UTF-8
Exec=sh -c "ncat -h;${SHELL:-bash}"
StartupNotify=false
Terminal=true
Type=Application
Categories=2.Live-Host;1.Information-Gathering;' > $DSKTPFLSDEST/$DSKTPFL2


}
######################## MISC - END ########################

BANNER () {
echo "${bold}
 _   _ __  __    _    ____  
| \ | |  \/  |  / \  |  _ \ 
|  \| | |\/| | / _ \ | |_) |
| |\  | |  | |/ ___ \|  __/ 
|_| \_|_|  |_/_/   \_\_|    
            
/nmap/nmap
INSTALL
${normal}"
}
######################## MISC - END ########################

which nmap > /dev/null 2>&1
if [ "$?" -eq "0" ]; then

echo "${bold} nmap is installed! Skip installation!${normal}"
cd  $GITREPOROOT
if git checkout $BRANCH &&
git fetch origin $BRANCH &&
[ `git rev-list HEAD...origin/$BRANCH --count` != 0 ] &&
git merge origin/$BRANCH
then
echo "${bold} ... update${normal}"
cd $GITREPOROOT
git pull
make clean
GITSBMDLINIT
./configure
make -j 4
sudo make install
else 
echo "up to date"
fi
else
echo "${bold} nmap is not installed! Installing!${normal}"
BANNER
NMAPDEPS
GITCLONEFUNC
make clean
GITSBMDLINIT
./configure
make -j 4
sudo make install
WRTEDSKTPFLS

fi



