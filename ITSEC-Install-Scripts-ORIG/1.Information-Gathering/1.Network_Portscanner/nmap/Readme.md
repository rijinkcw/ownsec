## Install /nmap/nmap off github on 18.04-bionic_beaver

The Script installs the /nmap/nmap with the following steps:

1. Install Dependencies
- various apt-get ppa, see the script for details

2. Main Install
- git clone && submodule init
- make && sudo make install
- create .desktop files