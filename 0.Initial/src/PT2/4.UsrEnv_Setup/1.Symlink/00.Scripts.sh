#!/usr/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

REPOROOT=/opt/ownsec
BASEDIR1=/opt/ownsec/0.Initial/settings-scripts/00.Scripts/1.IPv6
BINDIR=/usr/local/bin

echo "${bold}
USR ENV PT1         
${normal}"

## services symlinks
echo "${bold}
... Symlink 00.Scripts ....         
${normal}"

echo "# IPv6 - ON OFF"
cd $BASEDIR1
for SHfiles in $(ls *.sh)
do
sudo rm -f $BINDIR/$SHfiles
sudo cp $BASEDIR1/$SHfiles $BINDIR/$SHfiles
done


echo "# Finish Symlink Setup :)"
sudo updatedb
sudo ldconfig