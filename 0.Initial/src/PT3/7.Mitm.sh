#!/bin/bash

BASEDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/7.Mitm
####################################
######################   7.Mitm   #
##################################

MAIN () {
	BDFPROXY () {
		cd $BASEDIR/bdfproxy
		./bdfproxy-install.sh
	}
	BETTERCAP () {
		cd $BASEDIR/bettercap
		./bettercap-install_ALL.sh
	}
	CDPSNARF () {
		cd $BASEDIR/cdpsnarf
		./cdpsnarf-install.sh
	}
	DET () {
		cd $BASEDIR/det
		./det-install.sh
	}
	DRIPCAP () {
		cd $BASEDIR/dripcap
		./dripcap-install.sh
	}
	ETTERCAP () {
		cd $BASEDIR/ettercap
		./ettercap-install.sh
	}
	HEXINJECT () {
		cd $BASEDIR/hexinject
		./hexinject-install.sh
	}
	MITMPROXY () {
		cd $BASEDIR/mitmproxy
		./mitmproxy-install.sh
	}
	MOLOCH () {
		cd $BASEDIR/moloch
		./moloch-install.sh
	}
	MORPHEUS () {
		cd $BASEDIR/morpheus
		./morpheus-install.sh
	}
	MITMF () {
		cd $BASEDIR/mitmf
		./mitmf-install.sh
	}
	NETSNIFF_NG () {
		cd $BASEDIR/netsniff-ng
		./netsniff-ng-install.sh#
	}
	NFSPY () {
		cd $BASEDIR/nfspy
		./nfspy-install.sh
	}
	P0F ()  {
		cd $BASEDIR/p0f
		./p0f-install.sh
	}
	RESPONDER () {
		cd $BASEDIR/responder
		./responder-install.sh
	}
	SNIFFJOIKE () {
		cd $BASEDIR/sniffjoke
		./sniffjoke-install.sh
	}
	SSLSNIFF () {
		cd $BASEDIR/sslsniff
		./sslsniff-install.sh
	}
	SSLSPLIT () {
		cd $BASEDIR/sslsplit
		./sslsplit-install.sh
	}
	STENOGRAPHER () {
		cd $BASEDIR/stenographer
		./stenographer-install.sh
	}
	TXPFLOW () {
		cd $BASEDIR/tcpflow
		./tcpflow-install.sh
	}
	WIRESHARK () {
		cd $BASEDIR/wireshark
		./wireshark-install.sh
	}
#BDFPROXY # https://github.com/mitmproxy/mitmproxy/issues/1234
BETTERCAP
# CDPSNARF  #build fail
DET #PIP dependencies
# DRIPCAP # does not work - node problem
ETTERCAP
# HEXINJECT # build fail make
# MITMPROXY  # build fail
# MOLOCH # build fail
MORPHEUS
MITMF  #PIP DEPENDENCIES
NETSNIFF_NG
NFSPY
P0F
RESPONDER
SNIFFJOIKE
# SSLSNIFF
SSLSPLIT  # see install script for version/provider options
STENOGRAPHER
TXPFLOW
WIRESHARK

}

DNSMITM () {
	DNSCHEF () {
		cd $BASEDIR/2.DNS/dnschef
		./dnschef-install.sh
	}
	DSHELL () {
		cd $BASEDIR/2.DNS/dshell
		./dshell-install.sh
	}
	DNSCHEF
	DSHELL

}
VPNMITM () {
	FIKED () {
		cd $BASEDIR/3.VPN/fiked
		./fiked-install.sh
	}
	FIKED
}

MITMREPLAY () {
	TCPREPLAY () {
		cd $BASEDIR/4.Replay
		./tcpreplay-install.sh
	}
	# TCPREPLAY # DOES NOT WORK - installed from apt instead
}

MITMRDP () {
	SETH () {
		cd $BASEDIR/4.RDP/seth
		./seth-install.sh 
	}
	SETH
}

MAIN
DNSMITM
VPNMITM
MITMREPLAY
MITMRDP