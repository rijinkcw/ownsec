## Install TheFatRat off github on xenial - Xubuntu 16.04

The Script installs the /Screetsec/TheFatRat with the following steps:

1. Install Dependencies
- dx, aapt, apltool, dex2jar && various apt-get ppa, see the script for details
- /rapid7/metsploit-framwork with deps - various apt-get ppa; rbenv; ruby; nmap
- /secretsquirrel/the-backdoor-factory with deps - various apt-get ppa

2. Main Install
- git clone && submodule init
- create exec w rbenv for symlink, symlink 
- create .desktop files

> 'source ~/.bashrc' after running the script
> run the-fat-rat with 'fatrat'
