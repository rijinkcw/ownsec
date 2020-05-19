#!/bin/bash
###############################
BASEDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/6.Wireless
########################################
######################   6.Wireless   #
######################################
#
#
#######################################################
######################   1.Wifi   ####################
#####################################################
#
#

WIFI () {

	WPS () {
		PIXIEWPS () {
			cd $BASEDIR/1.Wifi/1.WPS/pixiewps
			./pixiewps-install.sh
		}
		BULLY () {
			cd $BASEDIR/1.Wifi/1.WPS/bully
			./bully-install.sh
		}
		REAVER () {
			cd $BASEDIR/1.Wifi/1.WPS/reaver-wps
			./reaver-wps-install.sh
		}
		PIXIEWPS
		BULLY
		REAVER
	}

	ROUTERKEYS () { 

		cd $BASEDIR/1.Wifi/2.Routerkeys/routerkeygenpc
		./routerkeygenpc-install.sh
	}
	
	# ROUTERKEYS # github username pass prompt during install
	
	WIFI_JAMMER () {
		MD3K_MASTER () {
		cd $BASEDIR/1.Wifi/3.Jammer/mdk3-master
		./mdk3-master-install.sh
		}
		WIFIJAMMER () {
		cd $BASEDIR/1.Wifi/3.Jammer/wifijammer
		./wifijammer-install.sh
		}

		MD3K_MASTER # alternate git vers by camerony
		WIFIJAMMER
		
	}
	WIFI_JAMMER
	
	EVILTWIN () {
	
		HOSTAPD_MANA () {
			cd $BASEDIR/1.Wifi/4.Evil-Twin/hostapd-mana
			./#hostapd-mana-install.sh 
		}
		HOSTAPD_WPE () {
			cd $BASEDIR/1.Wifi/4.Evil-Twin/hostapd-wpe
			./hostapd-wpe-install.sh
		}
		AIRCRACK_NG () {
			cd $BASEDIR/1.Wifi/aircrack-ng
			./aircrack-ng-install.sh
		}
		ATEAR () {
			cd $BASEDIR/1.Wifi/atear
			./atear-install.sh #PIP deps
		}
		EAPMD5PASS () {
			cd $BASEDIR/1.Wifi/eapmd5pass
			./eapmd5pass-install.sh
		}
		FERN_WIFI_CRACKER () {
			cd $BASEDIR/1.Wifi/fern-wifi-cracker
			./fern-wifi-cracker-install.sh
		}
		# HOSTAPD_MANA	# didnt look much into it yet, needs more work mst probly.
		# HOSTAPD__WPE # build fail, ssl?
		AIRCRACK_NG
		ATEAR
		EAPMD5PASS
		FERN_WIFI_CRACKER
		
		
	}

	INSTALL_LASTWIFI () {
		KISMET () {
			cd $BASEDIR/1.Wifi/kismet
			./kismet-install.sh #needs check
		}
		WIFI_PUMPKIN () {
			cd $BASEDIR/1.Wifi/wifi-pumpkin
			./wifi-pumpkin-install.sh # needs check for hostapd

		}
		FRUITYWIFI () {
			cd $BASEDIR/1.Wifi/fruitywifi
			./fruitywifi-install.sh
		}
		AIRGEDDON () {
			cd $BASEDIR/1.Wifi/airgeddon
			./airgeddon-install.sh
		}
		AIRCRACK () {
			cd $BASEDIR/1.Wifi/Aircrack
			./aircrack-install.sh
		}
		KISMET # install last # needs fixes. # kismet config last line remove dash end of path.
		# WIFI_PUMPKIN
		# FRUITYWIFI
		AIRGEDDON
		AIRCRACK 
	}

}