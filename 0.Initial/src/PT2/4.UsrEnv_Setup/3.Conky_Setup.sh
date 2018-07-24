#!/usr/bin/env bash

REPOROOT=/opt/ownsec
BINDIR=/usr/local/bin

sudo sh -c "echo '/usr/local/lib' >> /etc/ld.so.conf"
cp -R $REPOROOT/0.Initial/usrlcl/.conky /home/$USER/.conky
sudo rm -f $BINDIR/conky_*
cd $REPOROOT/0.Initial/settings-scripts/startstop/0.Services/5.Conky
sudo bash -c 'for SHfiles in $(ls *.sh); do ln -s $REPOROOT/0.Initial/settings-scripts/startstop/0.Services/5.Conky/$SHfiles $BINDIR/$SHfiles;done'

# menu file(s) already copied in /opt/ownsec/0.Initial/src/PT2/4.UsrEnv_Setup/1.Symlinks_Setup.sh