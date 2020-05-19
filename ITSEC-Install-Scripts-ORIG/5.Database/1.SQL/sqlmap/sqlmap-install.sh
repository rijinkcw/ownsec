#!/bin/bash

. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/sqlmapproject/sqlmap
BRANCH=master
GITCLONEDIR=/opt/ITSEC/5.Database/1.SQL/sqlmap/sqlmapproject
GITREPOROOT=/opt/ITSEC/5.Database/1.SQL/sqlmap/sqlmapproject/sqlmap
EXECUTEABLE1=sqlmap.sh
EXECUTEABLE2=sqlmap
EXECUTEABLE3=sqlmapapi.sh
EXECUTEABLE4=sqlmapapi
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/5.Database/1.SQL/sqlmap
DSKTPFLSDEST=/home/$USER/.local/share/applications/5.Database/1.SQL/sqlmap
DSKTPFL=sqlmap.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/5.Database/1.SQL/sqlmap

BANNER () {
	echo "${bold}
	 ____   ___  _     __  __    _    ____  
	/ ___| / _ \| |   |  \/  |  / \  |  _ \ 
	\___ \| | | | |   | |\/| | / _ \ | |_) |
	 ___) | |_| | |___| |  | |/ ___ \|  __/ 
	|____/ \__\_\_____|_|  |_/_/   \_\_|    
		      
	INSTALL
	${normal}"
}

PYEXEC () {
	echo '#!/bin/bash

	cd /opt/ITSEC/5.Database/1.SQL/sqlmap/sqlmapproject/sqlmap

	python sqlmap.py "$@"' > $EXECUTEABLE1

	chmod +x $EXECUTEABLE1

	echo '#!/bin/bash

	cd /opt/ITSEC/5.Database/1.SQL/sqlmap/sqlmapproject/sqlmap

	python sqlmapapi.py "$@"' > $EXECUTEABLE3

	chmod +x $EXECUTEABLE3
}


BANNER
GITCLONEFUNC
GITSBMDLINIT
PYEXEC
sudo rm -f $BINDIR/$EXECUTEABLE4
SYMLINKEX2TO1
sudo ln -s $GITREPOROOT/$EXECUTEABLE3 $BINDIR/$EXECUTEABLE4
CPDESKTFL
