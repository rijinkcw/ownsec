#!/bin/bash

#1i
. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/Screetsec/TheFatRat
BRANCH=master
GITREPOROOT=/opt/ITSEC/9.Maintain-Access/1.OS-Backdoors/0.MultiOS-Backdoor/thefatrat/Screetsec/TheFatRat
GITCONFDIR=/opt/ITSEC/9.Maintain-Access/1.OS-Backdoors/0.MultiOS-Backdoor/thefatrat/Screetsec/TheFatRat/.git
GITCLONEDIR=/opt/ITSEC/9.Maintain-Access/1.OS-Backdoors/0.MultiOS-Backdoor/thefatrat/Screetsec
EXECUTEABLE1=fatrat
EXECUTEABLE2=fatrat.sh
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/9.Maintain-Access/1.OS-Backdoors/0.MultiOS-Backdoor/thefatrat
DSKTPFLSDEST=/home/$USER/.local/share/applications/9.Maintain-Access/1.OS-Backdoors/0.MultiOS-Backdoor/thefatrat
DSKTPFL=thefatrat.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/9.Maintain-Access/1.OS-Backdoors/0.MultiOS-Backdoor/thefatrat
#hd6cv

STP="$GITREPOROOT/logs/check"
ARCH=`uname -m`
INST=$GITREPOROOT/logs/install.log
LOG=$GITREPOROOT/logs/setup.log
CONFIG=$GITREPOROOT/config/config.path


echo "${bold}
 _____ _   _ _____ _____ _  _____ ____      _  _____ 
|_   _| | | | ____|  ___/ \|_   _|  _ \    / \|_   _|
  | | | |_| |  _| | |_ / _ \ | | | |_) |  / _ \ | |  
  | | |  _  | |___|  _/ ___ \| | |  _ <  / ___ \| |  
  |_| |_| |_|_____|_|/_/   \_\_| |_| \_\/_/   \_\_|  
            
UPDATE
${normal}"

GITUPTODATE
if git checkout $BRANCH &&
git fetch origin $BRANCH &&
[ `git rev-list HEAD...origin/$BRANCH --count` != 0 ] &&
git merge origin/$BRANCH
then
    
GITCLONEFUNC

echo "${bold}
mkdir and cp desktop file       
${normal}"

#333d 
CPDESKTFL

echo "${bold}
cd GITREPOROOT
${normal}"

GITCLONEFUNC
GITRESET
GITSBMDLINIT

echo "${bold}
chmod +x exec 
${normal}"

chmod +x $GITREPOROOT/backdoor_apk
chmod +x $GITREPOROOT/tools/power.py
chmod +x $GITREPOROOT/tools/android-sdk/zipalign
chmod +x $GITREPOROOT/tools/proguard5.3.2/lib/proguard
chmod +x $GITREPOROOT/tools/android-sdk/dx
chmod +x $GITREPOROOT/tools/android-sdk/aapt
chmod +x $GITREPOROOT/tools/apktool2.2.2/apktool

echo "${bold}
echo to and chmod exec file
${normal}"

echo "#!/bin/bash

cd /opt/ITSEC/9.Maintain-Access/1.OS-Backdoors/0.MultiOS-Backdoor/thefatrat/Screetsec/TheFatRat

./fatrat" >> $EXECUTEABLE2
CHMODXEX2
CHMODXEX1

echo "${bold}
symlink
${normal}"
sudo rm -f /usr/local/bin/$EXECUTEABLE1
sudo ln -s $GITREPOROOT/$EXECUTEABLE2 /usr/local/bin/$EXECUTEABLE1

echo "${bold}
symlink deps
${normal}"

sed -i 's/which $backdoor/which backdoor-factory/' $GITREPOROOT/fatrat
sed -i 's/which $msfvenom/which msfvenom/' $GITREPOROOT/fatrat
sed -i 's/which $msfconsole/which msfconsole/' $GITREPOROOT/fatrat
sed -i 's/which $aapt/which aapt/' $GITREPOROOT/fatrat
sed -i 's/which $apktool/which apktool/' $GITREPOROOT/fatrat

echo "${bold}
deps and config start
${normal}"

echo "${bold}
setting vars
${normal}"

echo "${bold}
#Checking for DX and in case exists then check if it is version 1.8 used in fatrat (latest android sdk) 
${normal}"

touch "$CONFIG"
#Checking for DX and in case exists then check if it is version 1.8 used in fatrat (latest android sdk) 
which dx > /dev/null 2>&1
if [ "$?" -eq "0" ]; then
dxg=`dx --version 2>&1 | tee temp/dx`
dxv=`cat temp/dx | awk '{print $3}'` 
case $dxv in
1.8)
#DX exists and it is version 1.8
rm -rf temp/dx >/dev/null 2>&1
which dx >> "$LOG" 2>&1
echo "dx" | tee -a "$CONFIG" >> /dev/null 2>&1
echo -e $GREEN1 "[ ✔ ] DX 1.8"
echo "DX -> OK" >> "$INST"
;;
*)
#DX does not exists or is not 1.8 version
# xterm -T "☣ Removing Your Current DX ☣" -geometry 100x30 -e "sudo apt-get remove --purge dx -y"
sudo apt-get remove --purge dx -y
unlink "/usr/local/sbin/dx" > /dev/null 2>&1
sudo ln -s "$GITREPOROOT/tools/android-sdk/dx" "/usr/local/sbin/dx" > /dev/null 2>&1
sudo udpatedb
sudo which dx > /dev/null 2>&1
if [ "$?" -eq "0" ]; then
which dx >> "$LOG" 2>&1
echo "dx" | tee -a "$CONFIG" >> /dev/null 2>&1
echo -e $GREEN1 "[ ✔ ] DX 1.8"
echo "DX -> OK" >> "$INST"
else
echo -e $RED1 "[ x ] DX 1.8"
echo "0" > "$STP"
echo "DX -> Not OK" >> "$INST"
fi
;;
esac
else
sudo unlink "/usr/local/sbin/dx" > /dev/null 2>&1
sudo ln -s "$GITREPOROOT/tools/android-sdk/dx" "/usr/local/sbin/dx" > /dev/null 2>&1
sudo updatedb
sudo which dx > /dev/null 2>&1
if [ "$?" -eq "0" ]; then
sudo which dx >> "$LOG" 2>&1
echo "dx" | tee -a "$CONFIG" >> /dev/null 2>&1
echo -e $GREEN1 "[ ✔ ] DX 1.8"
echo "DX -> OK" >> "$INST"
else
echo -e $RED1 "[ x ] DX 1.8"
echo "0" > "$STP"
echo "DX -> Not OK" >> "$INST"
fi
fi
echo "${bold}
# check if aapt exists and if it is version v0.2-3821160 used in fatrat (android sdk)
${normal}"
# check if aapt exists and if it is version v0.2-3821160 used in fatrat (android sdk)
sudo which aapt > /dev/null 2>&1
if [ "$?" -eq "0" ]; then
aptv=`aapt v | awk '{print $5}'`
case $aptv in
v0.2-3821160)
#exists and it is v0.2-3821160
sudo which aapt >> "$LOG" 2>&1
echo "aapt" | tee -a "$CONFIG" >> /dev/null 2>&1
echo -e $GREEN1 "[ ✔ ] Aapt v0.2-3821160"
echo "Aapt -> OK" >> "$INST"
;;
*)
#Aapt does not exists or is not the latest version used in fatrat (android sdk)
#xterm -T "☣ Removing Your Current Aapt ☣" -geometry 100x30 -e "sudo apt-get remove --purge aapt -y"
sudo apt-get remove --purge aapt -y
sudo unlink "/usr/local/sbin/aapt" > /dev/null 2>&1
sudo ln -s "$GITREPOROOT/tools/android-sdk/aapt" "/usr/local/sbin/aapt" > /dev/null 2>&1
sudo updatedb
which aapt > /dev/null 2>&1
if [ "$?" -eq "0" ]; then
which aapt >> "$LOG" 2>&1
echo "aapt" | tee -a "$CONFIG" >> /dev/null 2>&1
echo -e $GREEN1 "[ ✔ ] Aapt v0.2-3821160"
echo "Aapt -> OK" >> "$INST"
else
echo -e $RED1 "[ x ] Aapt v0.2-3821160"
echo "0" > "$STP"
echo "Aapt -> Not OK" >> "$INST"
fi
;;
esac
else
sudo unlink "/usr/local/sbin/aapt" > /dev/null 2>&1
sudo ln -s "$GITREPOROOT/tools/android-sdk/aapt" "/usr/local/sbin/aapt" > /dev/null 2>&1
sudo updatedb
sudo which aapt > /dev/null 2>&1
if [ "$?" -eq "0" ]; then
sudo which aapt >> "$LOG" 2>&1
echo "aapt" | tee -a "$CONFIG" >> /dev/null 2>&1
echo -e $GREEN1 "[ ✔ ] Aapt v0.2-3821160"
echo "Aapt -> OK" >> "$INST"
else
echo -e $RED1 "[ x ] Aapt v0.2-3821160"
echo "0" > "$STP"
echo "Aapt -> Not OK" >> "$INST"
fi
fi

echo "${bold}
#Same procedure used for dx and aapt , but for apktool 2.2.2.
${normal}"
#Same procedure used for dx and aapt , but for apktool 2.2.2.
which apktool > /dev/null 2>&1
if [ "$?" -eq "0" ]; then
apk=`apktool | sed -n 1p | awk '{print $2}'` > /dev/null 2>&1
case $apk in 
v.2.2.2)
which apktool >> "$LOG" 2>&1
echo "apktool" | tee -a "$CONFIG" >> /dev/null 2>&1
echo -e $GREEN1 "[ ✔ ] Apktool v.2.2.2"
echo "Apktool -> OK" >> "$INST"
;;
*)
#xterm -T "☣ REMOVE OLD APKTOOL ☣" -geometry 100x30 -e "sudo apt-get remove --purge apktool -y"
sudo apt-get remove --purge apktool -y
sudo unlink "/usr/local/sbin/apktool" > /dev/null 2>&1
sudo ln -s "$GITREPOROOT/tools/apktool2.2.2/apktool" "/usr/local/sbin/apktool" > /dev/null 2>&1
sudo updatedb
which apktool > /dev/null 2>&1
if [ "$?" -eq "0" ]; then
echo -e $GREEN1 "[ ✔ ] Apktool v.2.2.2"
which apktool >> "$LOG" 2>&1
echo "apktool" | tee -a "$CONFIG" >> /dev/null 2>&1
echo "Apktool -> OK" >> "$INST"
else
echo -e $RED1 "[ x ] Apktool v.2.2.2"
echo "0" > "$STP"
echo "Apktool -> Not OK" >> "$INST"
fi
;;
esac
else
sudo unlink "/usr/local/sbin/apktool" > /dev/null 2>&1
sudo ln -s "$GITREPOROOT/tools/apktool2.2.2/apktool" "/usr/local/sbin/apktool" > /dev/null 2>&1
sudo updatedb
which apktool > /dev/null 2>&1
if [ "$?" -eq "0" ]; then
which apktool >> "$LOG" 2>&1
echo "apktool" | tee -a "$CONFIG" >> /dev/null 2>&1
echo -e $GREEN1 "[ ✔ ] Apktool v.2.2.2"
echo "Apktool -> OK" >> "$INST"
else
echo -e $RED1 "[ x ] Apktool v.2.2.2"
echo "0" > "$STP"
echo "Apktool -> Not OK" >> "$INST"
fi
fi

echo "${bold}
#Same as others before , but dex2jar in this case will be installed directly to user OS , instead be working in fatrat tools
${normal}"

#Same as others before , but dex2jar in this case will be installed directly to user OS , instead be working in fatrat tools
which d2j-dex2jar > /dev/null 2>&1
if [ "$?" -eq "0" ]; then
dex=`d2j-dex2jar 2>&1 | tee temp/dex`
d2j=`cat temp/dex | sed -n 19p | awk '{print $2}' | cut -f1 -d','`
case $d2j in
reader-2.0)
rm -rf temp/dex >/dev/null 2>&1
which d2j-dex2jar >> "$LOG" 2>&1
echo "d2j-dex2jar" | tee -a "$CONFIG" >> /dev/null 2>&1
echo -e $GREEN1 "[ ✔ ] Dex2Jar 2.0"
echo "Dex2Jar -> OK" >> "$INST"
;;
*)
rm -rf temp/dex >/dev/null 2>&1
#Dex2jar does not exists or it is not the 2.0 version , so uninstall it & copy dex2jar from
#fatrat tools folder to /usr/local/sbin
sudo sudo apt-get remove --purge dex2jar --force-yes -y
sudo cp $GITREPOROOT/tools/dex2jar/* /usr/local/sbin/ > /dev/null 2>&1
chmod +x /usr/local/sbin/d2j-baksmali > /dev/null 2>&1
chmod +x /usr/local/sbin/d2j-dex-recompute-checksum > /dev/null 2>&1
chmod +x /usr/local/sbin/d2j-dex2jar > /dev/null 2>&1
chmod +x /usr/local/sbin/d2j-dex2smali > /dev/null 2>&1
chmod +x /usr/local/sbin/d2j-jar2dex > /dev/null 2>&1
chmod +x /usr/local/sbin/d2j-jar2jasmin > /dev/null 2>&1
chmod +x /usr/local/sbin/d2j-jasmin2jar > /dev/null 2>&1
chmod +x /usr/local/sbin/d2j-smali > /dev/null 2>&1
chmod +x /usr/local/sbin/d2j-std-apk > /dev/null 2>&1
# remove any previous version files from dex2jar lib from /usr/local/share
# and copy the new ones to there from fatrat tools dir
sudo rm -rf /usr/local/share/dex2jar > /dev/null 2>&1
sudo mkdir /usr/local/share/dex2jar > /dev/null 2>&1
sudo cp -r $GITREPOROOT/tools/dex2jar/lib /usr/local/share/dex2jar/lib > /dev/null 2>&1
which d2j-dex2jar > /dev/null 2>&1
#After new instalation , check if dex2jar is working
if [ "$?" -eq "0" ]; then
#Dex2jar was suceffully installed
echo -e $GREEN1 "[ ✔ ] Dex2Jar 2.0"
which d2j-dex2jar >> "$LOG" 2>&1
echo "d2j-dex2jar" | tee -a "$CONFIG" >> /dev/null 2>&1
echo "Dex2Jar -> OK" >> "$INST"
else
#After the instalation something did not worked , place the warnings in logs
echo -e $RED1 "[ x ] Dex2Jar 2.0"
echo "0" > "$STP"
echo "Dex2Jar -> Not OK" >> "$INST"
fi
;;
esac
else
#dex2jar does not exist in user linux OS , proceed with a clean manual installation
sudo cp $GITREPOROOT/tools/dex2jar/* /usr/local/sbin/ > /dev/null 2>&1
chmod +x /usr/local/sbin/d2j-baksmali > /dev/null 2>&1
chmod +x /usr/local/sbin/d2j-dex-recompute-checksum > /dev/null 2>&1
chmod +x /usr/local/sbin/d2j-dex2jar > /dev/null 2>&1
chmod +x /usr/local/sbin/d2j-dex2smali > /dev/null 2>&1
chmod +x /usr/local/sbin/d2j-jar2dex > /dev/null 2>&1
chmod +x /usr/local/sbin/d2j-jar2jasmin > /dev/null 2>&1
chmod +x /usr/local/sbin/d2j-jasmin2jar > /dev/null 2>&1
chmod +x /usr/local/sbin/d2j-smali > /dev/null 2>&1
chmod +x /usr/local/sbin/d2j-std-apk > /dev/null 2>&1
sudo rm -rf /usr/local/share/dex2jar > /dev/null 2>&1
sudo mkdir /usr/local/share/dex2jar > /dev/null 2>&1
sudo cp -r $GITREPOROOT/tools/dex2jar/lib /usr/local/share/dex2jar/lib > /dev/null 2>&1
which d2j-dex2jar > /dev/null 2>&1
if [ "$?" -eq "0" ]; then
echo -e $GREEN1 "[ ✔ ] Dex2Jar 2.0"
which d2j-dex2jar >> "$LOG" 2>&1
echo "d2j-dex2jar" | tee -a "$CONFIG" >> /dev/null 2>&1
echo "Dex2Jar -> OK" >> "$INST"
else
echo -e $RED1 "[ x ] Dex2Jar 2.0"
echo "0" > "$STP"
echo "Dex2Jar -> Not OK" >> "$INST"
fi
fi

echo "${bold}
UPDATED
${normal}"

else

echo "${bold}
UP TO DATE
${normal}"
	
fi