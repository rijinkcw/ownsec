#!/bin/bash

BASEDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/12.Forensics
#########################################
######################   8.Forensics   #
#######################################

SLEUTHKIT () {
cd $BASEDIR/0.Toolbox/sleuthkit
./sleuthkit-install.sh
}
BULKEXTRACTOR () {
	cd $BASEDIR/0.Toolbox/bulk_extractor
	./bulk_extractor-install.sh
}
AUTOPSY () {
cd $BASEDIR/0.Toolbox/autopsy
./autopsy-install.sh

}


SLEUTHKIT
BULKEXTRACTOR
#AUTOPSY #build fail #topsy/corelibs/SigarLoader.java:21: error: package com.sun.javafx does not exist