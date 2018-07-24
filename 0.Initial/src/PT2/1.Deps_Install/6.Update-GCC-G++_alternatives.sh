#!/bin/bash

# 18.04 bionic-beaver
# default 14.5.18 - gcc version 7.3.0 (Ubuntu 7.3.0-16ubuntu3) 

sudo apt-get update 
sudo apt-get upgrade

DEFAULT=40 # 40 for $VERSION4 default gcc/g++ version , 10 - X
VERSION1=4.8
VERSION2=5
VERSION3=6
VERSION4=7
VERSION5=8

sudo apt-get install gcc-4.8 gcc-5 gcc-6 gcc-7 gcc-8 g++-4.8 g++-5 g++-6 g++-7 g++-8


dpkg --list | grep compiler

sudo update-alternatives --remove-all gcc
sudo update-alternatives --remove-all g++

# install all the gcc / g++
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-$VERSION1 10
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-$VERSION2 20
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-$VERSION3 30
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-$VERSION4 40
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-$VERSION5 50

sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-$VERSION1 10
sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-$VERSION2 20
sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-$VERSION3 30
sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-$VERSION4 40
sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-$VERSION5 50

sudo update-alternatives --install /usr/bin/cc cc /usr/bin/gcc $DEFAULT
sudo update-alternatives --set cc /usr/bin/gcc

sudo update-alternatives --install /usr/bin/c++ c++ /usr/bin/g++ $DEFAULT
sudo update-alternatives --set c++ /usr/bin/g++

# set default version 
yes "4" | sudo update-alternatives --config gcc 
expect "Press <enter> to keep the current choice[*], or type selection number:" { send "\n" }
yes "4" | sudo update-alternatives --config g++ 
expect "Press <enter> to keep the current choice[*], or type selection number:" { send "\n" }
gcc -v
g++ -v
