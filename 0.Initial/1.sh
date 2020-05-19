#!/bin/bash
#!/bin/bash
####################################################################
#### Welcome - letzs roll - FUCKYEAH :) ############################
####################################################################
#
# 
srcdPT3=${SETUPROOT}/ownsec/0.Initial/src/PT3
chkdir=${SETUPROOT}/ownsec/0.Initial/src

bold=$(tput bold)
normal=$(tput sgr0)


. 
srcdPT1=/opt/ownsec/0.Initial/src/PT1
chkdir=/opt/ownsec/0.Initial/src
#!/bin/bash -i

bold=$(tput bold)
normal=$(tput sgr0)

# maindir
srcdPT2=${SETUPROOT}/ownsec/0.Initial/src/PT2
#chkdir=${SETUPROOT}/ownsec/0.Initial/src

# 1st category dirs
DEPS_INST=${SETUPROOT}/ownsec/0.Initial/src/PT2/1.Deps_Install
FIRMWARE_INST=${SETUPROOT}/ownsec/0.Initial/src/PT2/2.Firmware_Install
USRAPP_INST=${SETUPROOT}/ownsec/0.Initial/src/PT2/3.UsrApp_Install
USRENV_SETUP=${SETUPROOT}/ownsec/0.Initial/src/PT2/4.UsrEnv_Setup

# 2nd category dirs
FIRMWARE_WIFI_INST=${SETUPROOT}/ownsec/0.Initial/src/PT2/2.Firmware_Install/1.Wifi
PT1 () {
	BANNERPT1 () {

		echo "${bold}
		 ____   _    ____ _____ _ 
		|  _ \ / \  |  _ \_   _/ |
		| |_) / _ \ | |_) || | | |
		|  __/ ___ \|  _ < | | | |
		|_| /_/   \_\_| \_\|_| |_|
				          
		SYSTEM UPDATE/UPGRADE
		${normal}"

	}
	UPDATEUPGRADE () {

		sudo apt-get update -y
		sudo apt-get upgrade -y
		sudo apt-get dist-upgrade -y
		sudo updatedb
		sudo ldconfig

	}

	REBOOTSRCPT1 () {
		echo "${bold}Calling the reboot-script to restart this script${normal}" 
		echo "#helloworld" > $chkdir/rebootchkPT1.txt
	}

	FINISHPT1 () {
		echo "${bold}
		Done, reboot now         
		${normal}"
	}


	UPDATEUPGRADE
	# REBOOTSRCPT1
	# reboot
}

PT2 () {

	BANNERPT2 () {

		echo "${bold}
		 ____   _    ____ _____ ____  
		|  _ \ / \  |  _ \_   _|___ \ 
		| |_) / _ \ | |_) || |   __) |
		|  __/ ___ \|  _ < | |  / __/ 
		|_| /_/   \_\_| \_\|_| |_____|
				              
		INSTALL DEPENDENCIES, USRAPPSapps & USR ENV
		${normal}"

	}

	##################################################################################################
	### Install Dependencies from Package-Manager Lists & Sources

	INIT_DEPS ()

		echo "${bold}
		cd ${SETUPROOT}/ownsec/0.Initial/src/PT2/1.Deps_Install    
		${normal}"
	}

	DEPS () {


		cd $DEPS_INST


		APTLISTS () {
			#### Package-Manager Lists First ( No all dependencies but also baseapps - see the lists for main)
			echo "${bold}
			./1.Package-Mgr_Lists_Install.sh 
			${normal}"
			./1.Package-Mgr_Lists_Install.sh
		}

	}

	BASEAPPS () {
		NVM_NODE () {
			#### Install Node & NPM w NVM off Github
			echo "${bold}
			./2.NVM_Install_GitHub.sh
			${normal}"
			./2.NVM_Install_GitHub.sh
		}
		JAVA () {
			echo "java"
			#### Install Java JRE & JDK from Source off http://download.java.net
			# disabled as download links dont work with wget and curl - replaced with apt packages
			#echo "${bold}
			#./3.Java-JDK-JRE_Install.sh
			#${normal}"
			#./3.Java-JDK-JRE_Install.sh
		}

		RBENV_RUBY () {
			#### Install Rbenv for Ruby off Github
			echo "${bold}
			./4.Rbenv-Ruby_Install_GitHub.sh
			${normal}"
			./4.Rbenv-Ruby_Install_GitHub.sh
			source ~/.bashrc
		}

		GOLANG () {
			#### Install GO from off ppa:gophers/archive
			echo "${bold}
			./5.GO-install.sh
			${normal}"
			./5.GO-install.sh
			source ~/.bashrc
		}

		NVM_NODE
		# JAVA
		RBENV_RUBY	
		GOLANG
		#### Setup PSQL Metasploit-Framework Database
		# moved to part3
	}


	## CONF

	UPDATE_ALT () {
		GCC () {
			echo "${bold}
			./6.Update-GCC-G++_alternatives.sh
			${normal}"
			./6.Update-GCC-G++_alternatives.sh
		}
		GCC
	}

	FIRMWARE () {
		##################################################################################################
		### Install Firmware

		WIFI () {
			#### Install Wifi Firmware
			echo "${bold}
			cd ${SETUPROOT}/ownsec/0.Initial/src/PT2/2.Firmware_Install/1.Wifi 
			${normal}"
			cd $FIRMWARE_WIFI_INST

			RTL_8812 () {
				#### Install RTL_8812 from aircrack-ng off Github
				echo "${bold}
				./1.RTL_8812_Install.sh
				${normal}"
				./1.RTL_8812_Install.sh
			}

			RTL_8192 () {
				#### Install RTL_8812 from aircrack-ng off Github
				echo "${bold}
				./2.RTL_8192_Install.sh
				${normal}"
				./2.RTL_8192_Install.sh
			}

			RTL_8812
			RTL_8192
		}
		
		WIFI
			
	}

	USERAPP () {
		##################################################################################################
		### Install 3.UsrApp_Install Scripts - ${SETUPROOT}/ownsec/0.Initial/src/PT2/3.UsrApp_Install
		echo "${bold}
		cd ${SETUPROOT}/ownsec/0.Initial/src/PT2/3.UsrApp_Install
		${normal}"
		cd $USRAPP_INST

		IDE () {
			echo "USERAPP IDE"
			#### Install IDE's
			#
			echo "${bold}
			./1.IDE_Install.sh
			${normal}"
			./1.IDE_Install.sh
		}

		VIRT () {
			echo "USERAPP VIRT"
			VIRTUALBOX () {
				#### Install Virtualbox ppa
				echo "${bold}
				./2.virtualbox_ppa-install.sh
				${normal}"
				./2.virtualbox_ppa-install.sh
			}

			
		}

		CONTAINER () {
			echo "USERAPP CONTAINER"
			DOCKER () {
				#### Install Docker ppa
				echo "${bold}
				./3.docker_ce-install.sh
				${normal}"
				./3.docker_ce-install.sh
			}

			
		}

		MESHNET () {
			echo "USERAPP MESHNET"
			TOR () {

				#### Install Tor
				echo "${bold}
				./4.tor_ppa-install.sh
				${normal}"
				./4.tor_ppa-install.sh
			}
			

		}

		MISC () {
			echo "USERAPP MISC"
			GOGLIDE () {
				#### GO GLIDE

				echo "${bold}
				./5.Go-GLIDE.sh
				${normal}"
				./5.Go-GLIDE.sh
			}
			
			IDE
			VIRTUALBOX
			DOCKER
			TOR
			# GOGLIDE
		}
		IDE
		VIRT
		CONTAINER
		MESHNET
		MISC

	}

	USERENV () {
		##################################################################################################

		### Install 4.UsrEnv_Setup Scripts - ${SETUPROOT}/ownsec/0.Initial/src/PT2/4.UsrEnv_Setup
		echo "${bold}
		cd ${SETUPROOT}/ownsec/0.Initial/src/PT2/4.UsrEnv_Setup/1.Symlink
		${normal}"
		cd ${SETUPROOT}/ownsec/0.Initial/src/PT2/4.UsrEnv_Setup/1.Symlink

		#### Services Symlink & XFCE menu .desktop files copy
		echo "${bold}

		./0.Services.sh

		./00.Scripts.sh
		${normal}"
		./0.Services.sh
		./00.Scripts.sh

		echo "${bold}
		cd ${SETUPROOT}/ownsec/0.Initial/src/PT2/4.UsrEnv_Setup
		${normal}"

		cd ${SETUPROOT}/ownsec/0.Initial/src/PT2/4.UsrEnv_Setup
		#### XFCE - copy rest of the configs, Menu file, Panel - everything dotfile
		echo "${bold}
		./2.XFCE_Setup.sh
		${normal}"
		./2.XFCE_Setup.sh

		CONKY () {
			#### Conky - copy conky configs
			echo "${bold}
			./3.Conky_Setup.sh
			${normal}"
			./3.Conky_Setup.sh
		}
		BASHGIT () {
			#### Bash-git-prompt - Install
			echo "${bold}
			./4.Bash-git-prompt_Install.sh
			${normal}"
			./4.Bash-git-prompt_Install.sh
		}
		CONF_LIGHTDM () {
			#### Lightdm_Settings - copy/set settings for Lightm
			echo "${bold}
			./5.Lightdm_Settings.sh
			${normal}"
			./5.Lightdm_Settings.sh
		}
		CONF_GRUB () {

			#### Grub_Settings - copy/set settings for Grub<
			echo "${bold}
			./6.Grub_Settings.sh
			${normal}"
			./6.Grub_Settings.sh
		}
		
		CONF_NET () {
			# Turn ipv6 on/off using grub
			echo "${bold}
			./7.IPv6_onoff.sh
			${normal}"
			./7.IPv6_onoff.sh
		}
		# Console color things
		echo "${bold}
		./8.Bash-Color.sh
		${normal}"
		./8.Bash-Color.sh
	}

	CHECK () {

		##################################################################################################
		### Show Version Info for quick O.K check

		sudo updatedb
		sudo ldconfig
		source ~/.bashrc

		node -v
		npm -v
		ruby -v
		rbenv -v
		rbenv local $RUBYVERSION
		rbenv local
		rbenv global $RUBYVERSION
		rbenv global
		docker -v 
		java -version
		#exit 0
	}

	DEPS
	BASEAPPS
	UPDATE_ALT
	FIRMWARE
	USERAPP
	USERENV
	CHECK
	#Calling the reboot-script to restart this script 
	#echo "#helloworld" > $chkdir/rebootchkPT2.txt

	echo "${bold}
	Done, reboot now         
	${normal}"

	#reboot
}
PT3 () {


	BANNERPT3 () {

		echo "${bold}
		 ____   _    ____ _____ _____ 
		|  _ \ / \  |  _ \_   _|___ / 
		| |_) / _ \ | |_) || |   |_ \ 
		|  __/ ___ \|  _ < | |  ___) |
		|_| /_/   \_\_| \_\|_| |____/ 
				              
		INSTALL APPLICATIONS
		${normal}"
	}

	INIT_APP () {

		echo "${bold}
		cd ${SETUPROOT}/ownsec/0.Initial/src/PT3   
		${normal}"
		cd $srcdPT3
	}

	APPSCAT () {


		INFOG () {
			echo "${bold}
			./1.Infogather.sh  
			${normal}"
			./1.Infogather.sh
		}
		VULN () {
			echo "${bold}
			./2.Vuln.sh 
			${normal}"
			./2.Vuln.sh
		}
		EXPLOIT () {
			echo "${bold}
			./3.Exploit.sh
			${normal}"
			./3.Exploit.sh
		}
		PASSWORD () {
			echo "${bold}
			./4.Password.sh
			${normal}"
			./4.Password.sh
		}
		DATAB () {
			echo "${bold}
			./5.Database.sh
			${normal}"
			./5.Database.sh
		}
		WIRELESS () {
			echo "${bold}
			./6.Wireless.sh
			${normal}"
			./6.Wireless.sh
		}
		MITM () {
			echo "${bold}
			./7.Mitm.sh
			${normal}"
			./7.Mitm.sh
		}
		TUNNEL () {
			echo "${bold}
			./8.Tunnel
			${normal}"
			./8.Tunnel.sh
		}
		MNTACC () {
			echo "${bold}
			./9.Maintain-Access
			${normal}"
			./9.Maintain-Access.sh
		}
		STRESSTEST () {
			echo "${bold}
			./10.Stresstest
			${normal}"
			./10.Stresstest.sh
		}
		FORENSICS () {
			echo "${bold}
			./11.Forensics not maintained yet
			${normal}"
			./11.Forensics.sh
		}


		INFOG
		VULN
		EXPLOIT
		PASSWORD
		DATAB
		WIRELESS
		MITM
		TUNNEL
		MNTACC
		STRESSTEST
		#FORENSICS
	}
	REBOTSCR () {

		echo "Calling the reboot-script to restart this script"
		echo "#helloworld" > $chkdir/rebootchkPT3.txt}

	}


	INIT_APP
	APPSCAT
	REBOTSCR

}

PT1
PT2
PT3
