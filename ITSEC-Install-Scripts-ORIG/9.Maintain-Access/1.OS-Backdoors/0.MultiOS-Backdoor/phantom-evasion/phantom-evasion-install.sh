#!/bin/bash

. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/oddcod3/Phantom-Evasion
BRANCH=master
GITREPOROOT=/opt/ITSEC/9.Maintain-Access/1.OS-Backdoors/0.MultiOS-Backdoor/phantom-evasion/oddcod3/Phantom-Evasion
GITCLONEDIR=/opt/ITSEC/9.Maintain-Access/1.OS-Backdoors/0.MultiOS-Backdoor/phantom-evasion/oddcod3
EXECUTEABLE1=phantom-evasion.sh
EXECUTEABLE2=phantom-evasion
EXECUTEABLE3=phantom-evasion.py
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/9.Maintain-Access/1.OS-Backdoors/0.MultiOS-Backdoor/phantom-evasion
DSKTPFLSDEST=/home/$USER/.local/share/applications/9.Maintain-Access/1.OS-Backdoors/0.MultiOS-Backdoor/phantom-evasion
DSKTPFL=phantom-evasion.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/9.Maintain-Access/1.OS-Backdoors/0.MultiOS-Backdoor/phantom-evasion

BANNER () {
	echo "${bold}
	 ____  _   _    _    _   _ _____ ___  __  __ 
	|  _ \| | | |  / \  | \ | |_   _/ _ \|  \/  |
	| |_) | |_| | / _ \ |  \| | | || | | | |\/| |
	|  __/|  _  |/ ___ \| |\  | | || |_| | |  | |
	|_|   |_| |_/_/   \_\_| \_| |_| \___/|_|  |_|
		                                     
	 _____ 
	|_____|
	       
	 _______     ___    ____ ___ ___  _   _ 
	| ____\ \   / / \  / ___|_ _/ _ \| \ | |
	|  _|  \ \ / / _ \ \___ \| | | | |  \| |
	| |___  \ V / ___ \ ___) | | |_| | |\  |
	|_____|  \_/_/   \_\____/___\___/|_| \_|
		                                

	INSTALL /oddcod3/Phantom-Evasion
	${normal}"
}

DEPS () {
	# sudo apt-get install gcc mingw-w64 apktool openssl metasploit zipalign
	# metasploit already installed, apktool installed with fatrat
	echo "placeholder"
}

PYEXEC () {
	echo '#!/bin/bash

	cd /opt/ITSEC/9.Maintain-Access/1.OS-Backdoors/0.MultiOS-Backdoor/phantom-evasion/oddcod3/Phantom-Evasion

	python3 phantom-evasion.py ' > $GITREPOROOT/$EXECUTEABLE1

	CHMODXEX1
	CHMODXEX3
}

BANNER
GITCLONEFUNC
DEPS
GITCLONEFUNC 
git clone https://github.com/pyinstaller/pyinstaller
cd pyinstaller
GITSBMDLINIT
cd bootloader
python ./waf distclean all
cd ..
sudo python setup.py install


#sudo -H pip 3 install PyInstaller
####### SERVER

PYEXEC
SYMLINKEX2TO1
CPDESKTFL
