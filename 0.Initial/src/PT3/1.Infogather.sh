#!/bin/bash
###############################

BASEDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/1.Information-Gathering

######################################################
######################   1.Information-Gathering    #
####################################################


NETPORTSCANNER () {
	MAINNETPORTSCANNER () {
		NMAP () {
			cd $BASEDIR/1.Network_Portscanner/nmap
			./nmap-install.sh
		}
		MASSCAN () {
			cd $BASEDIR/1.Network_Portscanner/masscan
			./masscan-install.sh
		}
		THANOS () {
			cd $BASEDIR/1.Network_Portscanner/thanos
			./thanos-install.sh
		}
		ZMAP () {
			cd $BASEDIR/1.Network_Portscanner/zmap
			./zmap-install.sh
		}
		SPIDERFOOT () {
			cd $BASEDIR/1.Network_Portscanner/spiderfoot
			./spiderfoot-install.sh
		}
		NMAP
		MASSCAN
		THANOS
		ZMAP
		SPIDERFOOT

		
	}
	MAINNETPORTSCANNER
}

LIVEHOST () {
	MAINLIVEHOST () {

		ARPING () {
			cd $BASEDIR/2.Live-Host/arping
			./arping-install.sh
		}
		DMITRY () {
			cd $BASEDIR/2.Live-Host/dmitry
			./dmitry-install.sh
		}
		FPING () {
			cd $BASEDIR/2.Live-Host/fping
			./fping-install.sh
		}
		HPING3 () {
			cd $BASEDIR/2.Live-Host/hping3
			./hping-install.sh
		}
		NETDISCOVER () {
			cd $BASEDIR/2.Live-Host/netdiscover
			./netdiscover-install.sh
		}
		RECON_NG () {
			cd $BASEDIR/2.Live-Host/recon-ng
			./recon-ng-install.sh
		}
		WOL_E () {
			cd $BASEDIR/2.Live-Host/wol-e
			./wol-e-install.sh
		}
		ARPING
		DMITRY
		FPING
		HPING3
		NETDISCOVER
		RECON_NG
		WOL_E
	}
	CLOUDFLARELIVEHOST () {
		CLOUD_BUSTER () {
			cd $BASEDIR/2.Live-Host/1.Cloudflare/cloud-buster
			./cloud-buster-install.sh
		}
	}
	VPNLIVEHOST () {
		IKE_SCAN() {
			cd $BASEDIR/2.Live-Host/2.VPN/ike-scan
			./ike-scan-install.sh
		}
	}
	IPV6LIVEHOST () {
		THC_IPV6 () {
			cd $BASEDIR/2.Live-Host/3.IPv6/thc-ipv6
			./thc-ipv6-install.sh 
		}
	}
	LOADBALANCERLIVEHOST () {
		LBD () {
			cd $BASEDIR/2.Live-Host/4.Load-Balancer/lbd
			./lbd-install.sh
		}
		CLOUD_BUSTER
		IKE_SCAN
		THC_IPV6
		LBD
	}
	
	CLOUDFLARELIVEHOST
	VPNLIVEHOST
	IPV6LIVEHOST
	LOADBALANCERLIVEHOST
	
}



ROUTEANALYSIS () {
	MAINROUTEANALYSIS () {
		TRACE () {
			cd $BASEDIR/3.Route-Analysis/0trace
			./0trace-install.sh
		}
		INTRACE () {
			cd $BASEDIR/3.Route-Analysis/intrace
			./intrace-install.sh 
		}
		IRPAS () {
			cd $BASEDIR/3.Route-Analysis/irpas
			./irpas-install.sh source site down - script worked
		}
		ROUTECLOUDFLARE () {
			BYPASSCF () {
				cd $BASEDIR/3.Route-Analysis/1.Cloudflare/bypasscf
				./bypasscf-install.sh
			}
			BYPASSCF
		}
		TRACE #PIPdependencies 
		INTRACE #probaly problems, check again
		#IRPAS
		ROUTECLOUDFLARE
	}
	MAINROUTEANALYSIS
}	

SSLSCANNER () {
	MAINSSLSCANNER () {
		SSLAUDIT () {
			cd $BASEDIR/4.SSL/sslcaudit
			./sslcaudit-install.sh
		}
		SSLSTRIP2 () {
			cd $BASEDIR/4.SSL/sslstrip2
			./sslstrip2
		}
		SSLYZE_NABLA () {
			cd $BASEDIR/4.SSL/sslyze_nabla_c0d3
			./sslyze_nabla-c0d3-install.sh
		}
		TLS_PROBER () {
			cd $BASEDIR/4.SSL/tls-prober
			./tls-prober-install.sh
		}

		SSLAUDIT
		# SSLSTRIP2
		SSLYZE_NABLA
		#TLS_PROBER  #unfinished script
	}
	MAINSSLSCANNER
}


DNSSCANNER () {
	MAINDNSCANNER () {
		DNSENUM () {
			cd $BASEDIR/5.DNS/dnsenum
			./dnsenum-install.sh
		}
		DNSMAP () {
			cd $BASEDIR/5.DNS/dnsmap
			./dnsmap-install.sh
		}
		DNSRECON () {
			cd $BASEDIR/5.DNS/dnsrecon
			./dnsrecon-install.sh #PIP dependencies #
		}
		DNSTRACER () {
			cd $BASEDIR/5.DNS/dnstracer
			./dnstracer-install.sh
		}
		FIERCE () {
			cd $BASEDIR/5.DNS/fierce
			./fierce-install.sh
		}
		PASSIVEDNS () {
			cd $BASEDIR/5.DNS/passivedns
			./passivedns-install.sh
		}
		DNSENUM
		DNSMAP
		DNSRECON
		DNSTRACER
		FIERCE
		PASSIVEDNS

	}
	MAINDNSCANNER
}


SMBSCANNER () {
	SMBSCANNERMAIN () {
		ACCCHECK () {
			cd $BASEDIR/6.SMB/acccheck
			./acccheck-install.sh
		}
		ENUM4LINUX () {
			cd $BASEDIR/6.SMB/enum4linux
			./enum4linux-install.sh 
		}
		NBTSCAN () {
			cd $BASEDIR/6.SMB/nbtscan
			./nbtscan-install.sh
		}
		SMBMAP () {
			cd $BASEDIR/6.SMB/smbmap
			./smbmap-install.sh 
		}
ACCCHECK
ENUM4LINUX #PROBALY MISSING PARTS SETUP, CHECK AGAIN
NBTSCAN
#SMBMAP #disabled it earlier, got to check again.

	}
}

SMTPSCANNER () {
	MAINSMTPSCANNER () {
		SMTP_USERENUM () {
			cd $BASEDIR/7.SMTP/smtp-userenum
			./smtp-userenum-install.sh
		}
		SWAKS () {
			cd $BASEDIR/7.SMTP/swaks
			./swaks-install.sh
		}
		SMTP_USERENUM
		SWAKS
	}
	MAINSMTPSCANNER
}

SNMBSCANNER () {
	MAINSNMBSCANNER () {
		BRAA () {
			cd $BASEDIR/8.SNMP/braa
			./braa-install.sh
		}
		BRAA
	}
}

ONIONSCANNER () {
	MAINONIONSCANER () {
		echo "palceholder"
		#cd $BASEDIR/10.Onion
	}
	MAINONIONSCANER
}

GOOGLESCANNER () {
	MAINGOOGLESCANNER () {
		BINGOO () {
			cd $BASEDIR/11.Dork/bingoo
			./bingoo-install.sh
		}
		BINGOO
	}
	MAINGOOGLESCANNER
}

SCRAPER () {
	echo placeholder
	# cd $BASEDIR/12.Scrape/
	#./httrack-install.sh #did not work off git, using apt
}


OSINT () {
	METAGOOFIL () {
		cd $BASEDIR/13.OSINT/metagoofil
		./metagoofil-install.sh
	}
	TEKDEFENSE_AUTOMATER () {
		cd $BASEDIR/13.OSINT/tekdefense-automater
		./tekdefense-automater-install.sh
	}
	THEHARVESTER () {
		cd $BASEDIR/13.OSINT/theharvester
		./theharvester-install.sh
	}
	TWOFI () {
		cd $BASEDIR/13.OSINT/twofi
		./twofi-install.sh
	}
	URLCRAZY () {
		cd $BASEDIR/13.OSINT/urlcrazy
		./urlcrazy-install.sh
	}
	DATASPLOIT () {
		cd $BASEDIR/13.OSINT/datasploit
		./datasploit-install.sh
	}
METAGOOFIL
TEKDEFENSE_AUTOMATER
THEHARVESTER
TWOFI
URLCRAZY
DATASPLOIT
}

WEBFIREWALLSCANNER () {
	WAFW00F () {
		cd $BASEDIR/14.Web-Firewalls/wafw00f
		./wafw00f-install.sh # needs makefile fix for pip "sudo -H pip install ..."
	}
	WAFW00F
}


BUGSCANNER () {
	DOTDOTPWN ()  {
		cd $BASEDIR/15.Fuzzer/dotdotpwn
		./dotdotpwn-install.sh
	}
	SIMPLEFUZZER () {
		cd $BASEDIR/15.Fuzzer/simple-fuzzer
		./simplefuzzer-install.sh # call w sfuzz 
	}
	SIPARMYSNIFE () {
		cd $BASEDIR/15.Fuzzer/siparmyknife
		./siparmyknife-install.sh
	}
	DOTDOTPWN
	SIMPLEFUZZER
	SIPARMYSNIFE
}

IDS_IPS () {
	FIR () {
		cd $BASEDIR/16.IDS-IPS_Identification/fir
		./fir-install.sh
		}
		#FIR #something not working
		echo "placeholder"
}





