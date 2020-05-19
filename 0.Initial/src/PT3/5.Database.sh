#!/bin/bash

BASEDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/5.Database
########################################
######################   5.Database   #
######################################
#
SQL () {
	SQLMAP () {
		cd $BASEDIR/1.SQL/sqlmap
		./sqlmap-install.sh
	}
	BBQSCQL () {
		###./bbqsql-install.sh outdated, bugs ,,,,
		echo "placeholder"
	}
	SQLMAP
	BBQSCQL

}
SQL