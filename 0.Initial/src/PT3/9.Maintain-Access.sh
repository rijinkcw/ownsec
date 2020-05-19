#!/bin/bash

BASEDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/9.Maintain-Access
###############################################################################
######################   9.Maintain-Access   ####################
###########################################################################
# 1.OS-Backdoors

MULTIOSBACKDOORS () {
	PHANTOM_EVASION () {
		cd $BASEDIR/1.OS-Backdoors/0.MultiOS-Backdoor/phantom-evasion
		./phantom-evasion-install.sh
	}
	PUPY () {
		cd $BASEDIR/1.OS-Backdoors/0.MultiOS-Backdoor/pupy
		./pupy-install.sh
	}
	THEBACKDOORFACTORY () {
		cd $BASEDIR/1.OS-Backdoors/0.MultiOS-Backdoor/the-backdoor-factory
		./the-backdoor-factory_install.sh
	}
	THEFATRAT () {
		cd $BASEDIR/1.OS-Backdoors/0.MultiOS-Backdoor/thefatrat
		./thefatrat-install.sh #appears to work - check again - on 2nd test [ x ] Aapt v0.2-3821160 
	}
	VEIL () {
		cd $BASEDIR/1.OS-Backdoors/0.MultiOS-Backdoor/veil
		./veil3.0-install.sh
	}
	WEBACOO () {
		cd $BASEDIR/1.OS-Backdoors/0.MultiOS-Backdoor/webacoo
		./webacoo-install.sh
	}
	ARES () {
		cd $BASEDIR/2.Generate/1.OS-Backdoors/ares
		./ares-install.sh
	}
	D0P1TFRAMEWORK () {
		cd $BASEDIR/1.OS-Backdoors/2.Win-Backdoor/dr0p1t-framework
		./Dr0p1t-Framework-install.sh
		cd $BASEDIR/1.OS-Backdoors/3.Mac-Backdoor/bella
		./bella-install.sh
	}

	PHANTOM_EVASION
	PUPY
	THEBACKDOORFACTORY
	THEFATRAT
	VEIL
	WEBACOO
	ARES
	D0P1TFRAMEWORK
}

BACKDOORMISC () {
	EXE2HEX () {
		cd $BASEDIR/99.Misc/exe2hex
		./exe2hex-install.sh
	}
	EXE2HEX
 }


KERNELBACKDOOR () {
mkdir -p /opt/ITSEC/9.Maintain-Access/3.Rootkit/1.Linux
	LINUX () {
		DIAMORPHINE () {
			cd $BASEDIR/3.Rootkit/1.Linux/diamorphine
			./Diamorphine_gitclone.sh
		}
		MAK_IT_LINUX__ROOTKIT () {
			cd $BASEDIR/3.Rootkit/1.Linux/mak_it-Linux-Rootkit
			./maK_it-Linux-Rootkit_gitclone.sh
		}
		PUSZECROOTKIT () {
			cd $BASEDIR/3.Rootkit/1.Linux/puszek-rootkit
			./puszek-rootkit_gitclone.sh
		}
		RETILE () {
			cd $BASEDIR/3.Rootkit/1.Linux/reptile
			./Reptile_gitclone.sh
		}
		AH450 () {
			cd $BASEDIR/3.Rootkit/1.Linux/rootkit/ah450
			./rootkit_gitclone.sh
		}
		NARUPO () {
			cd $BASEDIR/3.Rootkit/1.Linux/rootkit/narupo
			./rootkit_gitclone.sh
		}
		RAGINGGRIM () {
			cd $BASEDIR/3.Rootkit/1.Linux/Rootkit/RagingGrim
			./Rootkit_gitclone.sh
		}
		MEMPODIPPY () {
			cd $BASEDIR/3.Rootkit/1.Linux/vlany/mempodippy
			./vlany_gitclone.sh
		}

		DIAMORPHINE
		MAK_IT_LINUX__ROOTKIT
		PUSZECROOTKIT
		RETILE
		AH450
		NARUPO
		RAGINGGRIM
		MEMPODIPPY
	}


}

PHPBACKDOOR () {

mkdir -p /opt/ITSEC/9.Maintain-Access/2.PHP
	PARADOXIS () {
		cd $BASEDIR/2.PHP/php-rootkit/Paradoxis
		./PHP-Rootkit_gitclone.sh
	}
}

MULTIOSBACKDOORS
BACKDOORMISC
KERNELBACKDOOR
PHPBACKDOOR