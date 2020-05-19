#!/bin/bash -l

## Fatrat Setup - XFCE, 16.04

######################## CONFIG_MAIN - START ########################

sudo chown -R $USER:$USER /opt

GITREPO=https://github.com/Screetsec/TheFatRat
BRANCH=master
GITREPOROOT=/opt/ITSEC/9.Maintain-Access/1.OS-Backdoors/0.MultiOS-Backdoor/thefatrat/Screetsec/TheFatRat
GITCLONEDIR=/opt/ITSEC/9.Maintain-Access/1.OS-Backdoors/0.MultiOS-Backdoor/thefatrat/Screetsec
EXECUTEABLE1=fatrat.sh
EXECUTEABLE2=fatrat
DSKTPFLSDEST=/home/$USER/.local/share/applications/9.Maintain-Access/1.OS-Backdoors/0.MultiOS-Backdoor/thefatrat
DSKTPFL=thefatrat.desktop

#ph1a
BINDIR=/usr/local/bin
SBIN=/usr/local/sbin
DVLL=/dev/null

STP="$GITREPOROOT/logs/check"
ARCH=`uname -m`
INST=$GITREPOROOT/logs/install.log
LOG=$GITREPOROOT/logs/setup.log
CONFIG=$GITREPOROOT/config/config.path

DXVRSN=1.8
AAPTVRSN=v0.2-3821160
APKTOOLVRSN=v.2.2.2
DEX2JARVRSN=2.0

######################## CONFIG_MAIN - END ########################
######################## CONFIG_temp - END ########################

BANNER () {

echo "${bold}
 _____ _   _ _____ _____ _  _____ ____      _  _____ 
|_   _| | | | ____|  ___/ \|_   _|  _ \    / \|_   _|
  | | | |_| |  _| | |_ / _ \ | | | |_) |  / _ \ | |  
  | | |  _  | |___|  _/ ___ \| | |  _ <  / ___ \| |  
  |_| |_| |_|_____|_|/_/   \_\_| |_| \_\/_/   \_\_|  
            
INSTALL Screetsec/TheFatRat
Script by alphaaurigae
${normal}"

}

INSTALLMSF () {
git clone -b xenial https://github.com/alphaaurigae/metasploit-framework_install
cd metasploit-framework_install
./metasploit-setup-install.sh
}

INSTALLBDF () {
git clone -b xenial https://github.com/alphaaurigae/backdoor-factory_install
cd backdoor-factory_install
./the-backdoor-factory_install.sh
}

INSTDEPS () {

LIBS_DEPS="lib32z1-dev
lib32stdc++6
lib32stdc++6-4.7-dev
lib32ncurses5-dev
"

WEB_DEPS="apache2"

MAIN_DEPS="proguard 
upx-ucl 
libmagickwand-dev 
zipalign 
git
mingw-w64
zenity 
zenity-common 
monodevelop 
gnome-terminal
"

### DEPS:
sudo apt-get update
sudo apt-get upgrade
echo $LIBS_DEPS | while read libsdeps
do
   sudo apt-get install -y $libsdeps
done

echo $WEB_DEPS | while read webdeps
do
   sudo apt-get install -y $webdeps
done

echo $MAIN_DEPS | while read maindeps
do
   sudo apt-get install -y $maindeps
done
sudo updatedb
sudo ldconfig
### DEPS END
}

REMVUNWNTD () {
sudo apt-get remove --purge dex2jar --force-yes -y
sudo apt-get remove --purge aapt -y
sudo apt-get remove --purge apktool -y
sudo apt-get remove --purge dx -y
}

# make some files executeable
CHMODX1 () {
chmod +x $GITREPOROOT/backdoor_apk
chmod +x $GITREPOROOT/tools/power.py
chmod +x $GITREPOROOT/tools/android-sdk/zipalign
chmod +x $GITREPOROOT/tools/proguard5.3.2/lib/proguard
chmod +x $GITREPOROOT/tools/android-sdk/dx
chmod +x $GITREPOROOT/tools/android-sdk/aapt
chmod +x $GITREPOROOT/tools/apktool2.2.2/apktool
}

# create .sh exec for symlink
CREATEEXEC () {
echo '#!/bin/bash

RUBYVERSION=$(lynx --dump https://raw.githubusercontent.com/rapid7/metasploit-framework/$BRANCH/.ruby-version )
BRANCH=master
GITREPOROOT=/opt/ITSEC/9.Maintain-Access/1.OS-Backdoors/0.MultiOS-Backdoor/thefatrat/Screetsec/TheFatRat

echo "running msfconsole with rbenv"

source ~/.bashrc
eval "$(rbenv init -)"
rbenv shell $RUBYVERSION 
#rbenv shell 2.5.1 
cd $GITREPOROOT
echo $RUBYVERSION
ruby -v
rbenv sudo ./fatrat "$@"' > $GITREPOROOT/$EXECUTEABLE1
}



# set these according to setup, custom bin linking
CUSTOMLINK () {
sed -i 's/which $backdoor/which backdoor-factory/' $GITREPOROOT/fatrat
sed -i 's/which $msfvenom/which msfvenom/' $GITREPOROOT/fatrat
sed -i 's/which $msfconsole/which msfconsole/' $GITREPOROOT/fatrat
sed -i 's/which $aapt/which aapt/' $GITREPOROOT/fatrat
sed -i 's/which $apktool/which apktool/' $GITREPOROOT/fatrat
}

######################## CONFIG_temp - END ########################

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

# chmod bin
CHMODXEX1  () {
chmod +x $GITREPOROOT/$EXECUTEABLE1
}
CHMODXEX2  () {
chmod +x $GITREPOROOT/$EXECUTEABLE2
}

# symlink bin
SYMLINKEX2TO1  () {
sudo rm -f $BINDIR/$EXECUTEABLE2
sudo ln -s $GITREPOROOT/$EXECUTEABLE1 $BINDIR/$EXECUTEABLE2
}

######################## .DESKTOP FILES - START ########################
WRTEDSKTPFLS () {
mkdir -p $DSKTPFLSDEST

echo '
[Desktop Entry]
Name=thefatrat
Encoding=UTF-8
Exec=sudo sh -c " fatrat;${SHELL:-bash}"
StartupNotify=false
Terminal=true
Type=Application
Categories=9.Maintain-Access;1.OS-Backdoors;0.MultiOS-Backdoor;' > $DSKTPFLSDEST/$DSKTPFL
}


DEPS2 () {
#################### BEGIN SETUP ####################

touch "$CONFIG"

# DX ################################################################################

# DX PT 1 - START
which dx > /dev/null 2>&1
if [ "$?" -eq "0" ]; then
dxg=`dx --version 2>&1 | tee temp/dx`
dxv=`cat temp/dx | awk '{print $3}'` 
case $dxv in
$DXVRSN)
rm -rf temp/dx >/dev/null 2>&1
which dx >> "$LOG" 2>&1
echo "dx" | tee -a "$CONFIG" >> /dev/null 2>&1
echo -e  "${GREEN} ${bold}[ ✔ ] DX $DXVRSN ${normal}"
echo "DX -> OK" >> "$INST"

;;
*)

# DX PT 1 - END
# DX PT 2 - START

unlink "$SBIN/dx" > /dev/null 2>&1
sudo ln -s "$GITREPOROOT/tools/android-sdk/dx" "$SBIN/dx" > /dev/null 2>&1
sudo updatedb
sudo which dx > /dev/null 2>&1
if [ "$?" -eq "0" ]; then
which dx >> "$LOG" 2>&1
echo "dx" | tee -a "$CONFIG" >> /dev/null 2>&1
echo -e "${GREEN} ${bold}[ ✔ ] DX $DXVRSN ${normal}"
echo "DX -> OK" >> "$INST"
else
echo -e  "${RED} ${bold}[ x ] DX $DXVRSN"
echo "0" > "$STP"
echo "DX -> Not OK" >> "$INST"
fi

;;
esac

# DX PT 2 - END
# DX PT 3 - START

else
sudo unlink "$SBIN/dx" > /dev/null 2>&1
sudo ln -s "$GITREPOROOT/tools/android-sdk/dx" "$SBIN/dx" > /dev/null 2>&1
sudo updatedb
sudo which dx > /dev/null 2>&1
if [ "$?" -eq "0" ]; then
sudo which dx >> "$LOG" 2>&1
echo "dx" | tee -a "$CONFIG" >> /dev/null 2>&1
echo -e "${GREEN} ${bold}[ ✔ ] DX $DXVRSN ${normal}"
echo "DX -> OK" >> "$INST"
else
echo -e  "${RED} ${bold}[ x ] DX $DXVRSN ${normal}"
echo "0" > "$STP"
echo "DX -> Not OK" >> "$INST"
fi
fi

# DX PT 3 - END
# DX - END
################################################################################
# AAPT SETUP CHECK & INSTALL
# AAPT PT 1 - START

sudo which aapt > /dev/null 2>&1
if [ "$?" -eq "0" ]; then
aptv=`aapt v | awk '{print $5}'`
case $aptv in
$AAPTVRSN)
sudo which aapt >> "$LOG" 2>&1
echo "aapt" | tee -a "$CONFIG" >> /dev/null 2>&1
echo -e "${GREEN} ${bold} [ ✔ ] Aapt $AAPTVRSN ${normal}"
echo "Aapt -> OK" >> "$INST"

;;
*)

# AAPT PT 1 - END
# AAPT PT 2 - START

sudo unlink "$SBIN/aapt" > /dev/null 2>&1
sudo ln -s "$GITREPOROOT/tools/android-sdk/aapt" "$SBIN/aapt" > /dev/null 2>&1
sudo updatedb
which aapt > /dev/null 2>&1
if [ "$?" -eq "0" ]; then
which aapt >> "$LOG" 2>&1
echo "aapt" | tee -a "$CONFIG" >> /dev/null 2>&1
echo -e "${GREEN} ${bold}[ ✔ ] Aapt $AAPTVRSN ${normal}"
echo "Aapt -> OK" >> "$INST"
else
echo -e  "${RED} ${bold}[ x ] Aapt $AAPTVRSN ${normal}"
echo "0" > "$STP"
echo "Aapt -> Not OK" >> "$INST"
fi

;;
esac

# AAPT PT 2 - END
# AAPT PT 3 - START

else
sudo unlink "$SBIN/aapt" > /dev/null 2>&1
sudo ln -s "$GITREPOROOT/tools/android-sdk/aapt" "$SBIN/aapt" > /dev/null 2>&1
sudo updatedb
sudo which aapt > /dev/null 2>&1
if [ "$?" -eq "0" ]; then
sudo which aapt >> "$LOG" 2>&1
echo "aapt" | tee -a "$CONFIG" >> /dev/null 2>&1
echo -e "${GREEN} ${bold}[ ✔ ] Aapt $AAPTVRSN ${normal}"
echo "Aapt -> OK" >> "$INST"
else
echo -e  "${RED} ${bold}[ x ] Aapt $AAPTVRSN ${normal}"
echo "0" > "$STP"
echo "Aapt -> Not OK" >> "$INST"
fi
fi

# AAPT PT 3 - END
# END AAPT
################################################################################
# APKTOOL
# APKTOOL PT 1 - START

which apktool > /dev/null 2>&1
if [ "$?" -eq "0" ]; then
apk=`apktool | sed -n 1p | awk '{print $2}'` > /dev/null 2>&1
case $apk in 
$APKTOOLVRSN)
which apktool >> "$LOG" 2>&1
echo "apktool" | tee -a "$CONFIG" >> /dev/null 2>&1
echo -e "${GREEN} ${bold} [ ✔ ] Apktool $APKTOOLVRSN ${normal}"
echo "Apktool -> OK" >> "$INST"

;;
*)

# APKTOOL PT 1 - END
# APKTOOL PT 2 - START

sudo unlink "$SBIN/apktool" > /dev/null 2>&1
sudo ln -s "$GITREPOROOT/tools/apktool2.2.2/apktool" "$SBIN/apktool" > /dev/null 2>&1
sudo updatedb
which apktool > /dev/null 2>&1
if [ "$?" -eq "0" ]; then
echo -e "${GREEN} ${bold}[ ✔ ] Apktool $APKTOOLVRSN ${normal}"
which apktool >> "$LOG" 2>&1
echo "apktool" | tee -a "$CONFIG" >> /dev/null 2>&1
echo "Apktool -> OK" >> "$INST"
else
echo -e  "${RED} ${bold}[ x ] Apktool $APKTOOLVRSN ${normal}"
echo "0" > "$STP"
echo "Apktool -> Not OK" >> "$INST"
fi

;;
esac

# APKTOOL PT 2 - END
# APKTOOL PT 3 - START

else
sudo unlink "$SBIN/apktool" > /dev/null 2>&1
sudo ln -s "$GITREPOROOT/tools/apktool2.2.2/apktool" "$SBIN/apktool" > /dev/null 2>&1
sudo updatedb
which apktool > /dev/null 2>&1
if [ "$?" -eq "0" ]; then
which apktool >> "$LOG" 2>&1
echo "apktool" | tee -a "$CONFIG" >> /dev/null 2>&1
echo -e "${GREEN} ${bold}[ ✔ ] Apktool $APKTOOLVRSN ${normal}"
echo "Apktool -> OK" >> "$INST"
else
echo -e  "${RED} ${bold}[ x ] Apktool $APKTOOLVRSN ${normal}"
echo "0" > "$STP"
echo "Apktool -> Not OK" >> "$INST"
fi
fi

# APKTOOL PT 3 - END
# APKTOOL END
################################################################################
# DEX2JAR
# DEX2JAR PT 1

which d2j-dex2jar > /dev/null 2>&1
if [ "$?" -eq "0" ]; then
dex=`d2j-dex2jar 2>&1 | tee temp/dex`
d2j=`cat temp/dex | sed -n 19p | awk '{print $2}' | cut -f1 -d','`
case $d2j in
reader-$DEX2JARVRSN)
rm -rf temp/dex >/dev/null 2>&1
which d2j-dex2jar >> "$LOG" 2>&1
echo "d2j-dex2jar" | tee -a "$CONFIG" >> /dev/null 2>&1
echo -e "${GREEN} ${bold}[ ✔ ] Dex2Jar $DEX2JARVRSN ${normal}"
echo "Dex2Jar -> OK" >> "$INST"

;;
*)

# DEX2JAR PT 1 - END
# DEX2JAR PT 2 - START
rm -rf temp/dex >/dev/null 2>&1
sudo cp $GITREPOROOT/tools/dex2jar/* $SBIN/ > /dev/null 2>&1
chmod +x $SBIN/d2j-baksmali > /dev/null 2>&1
chmod +x $SBIN/d2j-dex-recompute-checksum > /dev/null 2>&1
chmod +x $SBIN/d2j-dex2jar > /dev/null 2>&1
chmod +x $SBIN/d2j-dex2smali > /dev/null 2>&1
chmod +x $SBIN/d2j-jar2dex > /dev/null 2>&1
chmod +x $SBIN/d2j-jar2jasmin > /dev/null 2>&1
chmod +x $SBIN/d2j-jasmin2jar > /dev/null 2>&1
chmod +x $SBIN/d2j-smali > /dev/null 2>&1
chmod +x $SBIN/d2j-std-apk > /dev/null 2>&1
sudo rm -rf /usr/local/share/dex2jar > /dev/null 2>&1
sudo mkdir /usr/local/share/dex2jar > /dev/null 2>&1
sudo cp -r $GITREPOROOT/tools/dex2jar/lib /usr/local/share/dex2jar/lib > /dev/null 2>&1


which d2j-dex2jar > /dev/null 2>&1
if [ "$?" -eq "0" ]; then
echo -e "${GREEN} ${bold} [ ✔ ] Dex2Jar $DEX2JARVRSN ${normal}"
which d2j-dex2jar >> "$LOG" 2>&1
echo "d2j-dex2jar" | tee -a "$CONFIG" >> /dev/null 2>&1
echo "Dex2Jar -> OK" >> "$INST"
else
echo -e  "${RED} ${bold}[ x ] Dex2Jar $DEX2JARVRSN ${normal}"
echo "0" > "$STP"
echo "Dex2Jar -> Not OK" >> "$INST"
fi

;;
esac

# DEX2JAR PT 2 - END
# DEX2JAR PT 3 - START

else

sudo cp $GITREPOROOT/tools/dex2jar/* $SBIN/ > /dev/null 2>&1
sudo chmod +x $SBIN/d2j-baksmali > /dev/null 2>&1
sudo chmod +x $SBIN/d2j-dex-recompute-checksum > /dev/null 2>&1
sudo chmod +x $SBIN/d2j-dex2jar > /dev/null 2>&1
sudo chmod +x $SBIN/d2j-dex2smali > /dev/null 2>&1
sudo chmod +x $SBIN/d2j-jar2dex > /dev/null 2>&1
sudo chmod +x $SBIN/d2j-jar2jasmin > /dev/null 2>&1
sudo chmod +x $SBIN/d2j-jasmin2jar > /dev/null 2>&1
sudo chmod +x $SBIN/d2j-smali > /dev/null 2>&1
sudo chmod +x $SBIN/d2j-std-apk > /dev/null 2>&1
sudo rm -rf /usr/local/share/dex2jar > /dev/null 2>&1
sudo mkdir /usr/local/share/dex2jar > /dev/null 2>&1
sudo cp -r $GITREPOROOT/tools/dex2jar/lib /usr/local/share/dex2jar/lib > /dev/null 2>&1

which d2j-dex2jar > /dev/null 2>&1
if [ "$?" -eq "0" ]; then
echo -e "${GREEN} ${bold} [ ✔ ] Dex2Jar $DEX2JARVRSN ${normal}"
which d2j-dex2jar >> "$LOG" 2>&1
echo "d2j-dex2jar" | tee -a "$CONFIG" >> /dev/null 2>&1
echo "Dex2Jar -> OK" >> "$INST"
else
echo -e  "${RED} ${bold} [ x ] Dex2Jar $DEX2JARVRSN ${normal}"
echo "0" > "$STP"
echo "Dex2Jar -> Not OK" >> "$INST"
fi
fi

# DEX2JAR PT 3 - END
# DEX2JAR END
################################################################################

}

which fatrat > /dev/null 2>&1
if [ "$?" -eq "0" ]; then

echo "${bold} the-fatrat is installed! Skip installation!${normal}"

else
echo "${bold} the-fatrat is not installed! Installing!${normal}"


BANNER # welcome banner

echo -e " ${bold} ... install apt-get deps ${normal}"
INSTDEPS
REMVUNWNTD # remove unwanted apt-get ppa

echo -e " ${bold} ... git clone && submodule init ${normal}"
GITCLONEFUNC
GITSBMDLINIT

echo -e " ${bold} ... rapid7/metasploit-framework ${normal}"
INSTALLMSF

echo -e " ${bold} ... secretsquirrel/the-backdoor-factory ${normal}"
INSTALLBDF

echo -e " ${bold} ... chmod +x bins ${normal}"
CHMODX1

echo -e " ${bold} ... create .sh file to run fatrat by symlink${normal}"
CREATEEXEC 

echo -e " ${bold} ... chmod +x bins ${normal}"
CHMODXEX2 # chmod +x
CHMODXEX1 # chmod +x

echo -e " ${bold} ... symlink${normal}"
SYMLINKEX2TO1

echo -e " ${bold} ... symlink setup${normal}"
CUSTOMLINK # customize this

echo -e " ${bold} ... deps: DX, AAPT, APKTOOL & DEX2JAR${normal}"
DEPS2

echo -e " ${bold} ... cp .desktop files${normal}"
WRTEDSKTPFLS 

echo -e " $YELLOW ${bold} Screetsec/TheFatRat installation COMPLETE :)${normal}"

echo -e " ${bold} ... source ~/.bashrc and type 'fatrat' to start the program${normal}" 

fi

source ~/.bashrc