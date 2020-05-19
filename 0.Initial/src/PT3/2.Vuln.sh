#!/bin/bash

BASEDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/2.Vulnerability-Scanner
###############################################################################
######################   1.Vulnerability-Scanner   ####################
###########################################################################
MAIN () {

	OPENVAS () {
		cd $BASEDIR/openvas9
		./openvas9-install.sh 
	} # at times disbled to debug other scripts

	ARACHNI ()  {
		cd $BASEDIR/arachni
		./arachni-install.sh
	}
	ATSCAN () {
		cd $BASEDIR/atscan
		./atscan-install.sh
	}
	AVA () {
		cd $BASEDIR/ava
		./ava-install.sh
	}
	BED () {
		cd $BASEDIR/bed
		./bed-install.sh
	}
	BLINDE () {
		cd $BASEDIR/blindelephant
		./blindelephant-install.sh
	}
	COMMIX () {
		cd $BASEDIR/commix
		./commix-install.sh
	}
	DTECT () {
		cd $BASEDIR/d-tect
		./d-tect-install.sh
	}
	GOLISMERO () ⅞
		cd $BASEDIR/golismero
		./golismero-install.sh
	}
	HELLRAISER () {
		cd $BASEDIR/hellraiser
		./hellraiser-install.sh
	}
	JOOMSCAN () {
		cd $BASEDIR/joomscan
		./joomscan-install.sh
	}
	LHF () ⅞
		cd $BASEDIR/lhf
		./lhf-install.sh
	}
	LIGHTBULB () {
		cd $BASEDIR/lightbulb-framework
		./lightbulb-framework-install.sh 
	}
	LYNIS () {
		cd $BASEDIR/lynis
		./lynis-install.sh
	}
	NIKTO (){
		cd $BASEDIR/nikto
		./nikto-install.sh 
	}
	OWASP_WEBSCARAB () {
		cd $BASEDIR/owasp-webscarab
		./owasp-webscarab-install.sh
	}
	PROXYSTRIKE () {
		cd $BASEDIR/proxystrike
		./proxystrike-install.sh 
	}
	PYFISCAN () {
		cd $BASEDIR/pyfiscan
		./pyfiscan-install.sh 
	}
	SN1PER () {
		cd $BASEDIR/sn1per
		./sn1per-install.sh
	}
	SPARTA () {
		cd $BASEDIR/sparta
		./sparta-install.sh  # 
	}
	V3N0M_SCANNER () {
		cd $BASEDIR/v3n0m-scanner

		./v3n0m-scanner-install.sh 
	}
	VBSCAN () {
		cd $BASEDIR/vbscan
		./vbscan-install.sh
	}
	W3AF () {
		cd $BASEDIR/w3af
		./w3af-install.sh
	}
	WAPITI () {
		cd $BASEDIR/wapiti
		./wapiti-install.sh
	}
	WHATWEB () {
		cd $BASEDIR/whatweb
		./whatweb-install.sh
	}
	WPSCAN () {
		cd $BASEDIR/wpscan
		./wpscan-install.sh
	}
	ZAPROXY () {
		cd $BASEDIR/zaproxy
		./zaproxy-install.sh 
	}

	OPENVAS
	# ARACHNI # ruby 2.3.3 rbenv build fail - ssl?
	ATSCAN
	# AVA # didnt work, dont remember why, checkin later.
	BED
	BLINDE # console link has be called with - mark the capital B "Blindelephant.py
	COMMIX
	DTECT # (needs console linking through d-tect-install.sh)
	GOLISMERO
	# HELLRAISER # https://github.com/m0nad/HellRaiser/issues/9
	JOOMSCAN
	LHF
	LIGHTBULB # PIP dependency  - needs check
	LYNIS
	NIKTO # check nikto.conf complained
	OWASP_WEBSCARAB
	# PROXYSTRIKE # complains openssl 1.1.0 which does not really work on the setup- breaks all sorts of things.
	PYFISCAN #PIP dependency  - needs check
	# SN1PER # broken 27.3.17
	SPARTA
	V3N0M_SCANNER # PIP dependencies (?)
	VBSCAN
	# W3AF # build fail 27.3.17 
	#WAPITI # did not work but worked prev.ubu1604_4.8.0-53-generic_04-06-2017
	WHATWEB
	# WPSCAN # ruby app - see readme 
	# ZAPROXY # requires userinput during setup - check that again

}


CISCOTOOLS () {
	CISCO_AUDITING_TOOL () {
		cd $BASEDIR/2.Cisco-Tools/cisco-auditing-tool
		./cisco-auditing-tool-install.sh
	}
	CISCO_GLOBAL_EXPLOITER () {
		cd $BASEDIR/2.Cisco-Tools/cisco-global-exploiter
		./cisco-global-exploiter-install.sh
	}
	CISCO_OCS () {
		cd $BASEDIR/2.Cisco-Tools/cisco-ocs
		./cisco-ocs-install.sh 
	}
	CISCO_TORCH () {
		cd $BASEDIR/2.Cisco-Tools/cisco-torch
		./cisco-torch-install.sh 
	}
	COPY_ROUTER_CONFIG () {
		cd $BASEDIR/2.Cisco-Tools/copy-router-config
		./copy-router-config-install.sh 
	}
	YERSINIA () {
		cd $BASEDIR/2.Cisco-Tools/yersinia
		./yersinia-install.sh  - wild building lots warnings.
	}
	CISCO_AUDITING_TOOL
	CISCO_GLOBAL_EXPLOITER
	# CISCO_OCS #greyd out earl, no idea why
	# CISCO_TORCH #greyd out earl, no idea why
	# COPY_ROUTER_CONFIG #stopped working somehow,chk bk ltr.
	YERSINIA
}


LFI_RFI () {
	FIMAP () {
		cd $BASEDIR/3.LFI-RFI/fimap
		./fimap-install.sh
	}
	KADABRA () {
		cd $BASEDIR/3.LFI-RFI/kadabra
		./kadabra-install.sh
	}
	KADIMUS () {
		cd $BASEDIR/3.LFI-RFI/kadimus
		./kadimus-install.sh
	}
	LFIFREAK () {
		cd $BASEDIR/3.LFI-RFI/lfifreak
		./lfifreak-install.sh
	}
	LIFFY () {
		cd $BASEDIR/3.LFI-RFI/liffy
		./liffy-install.sh 
	}
	FIMAP
	KADABRA
	KADIMUS
	LFIFREAK
	# LIFFY # runs BUT: AttributeError: 'NoneType' object has no attribute 'find'
}


VOIP () {
	echo "placeholder "
	#cd /opt/ownsec/5.Voip/
}

WEBAPP_IDENT () {

}

WEBAPP_PROXIES () {
	echo "placeholder"
}

MAIN
CISCOTOOLS
LFI_RFI
VOIP
WEBAPP_IDENT
WEBAPP_PROXIES
