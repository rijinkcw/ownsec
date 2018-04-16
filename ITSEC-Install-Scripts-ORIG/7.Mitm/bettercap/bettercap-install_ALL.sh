#!/bin/bash



# check if rbenv is installed, if not install
if [ ! -d /home/$USER/go ]; then
echo "go not installed, installing!"
cd /opt/ownsec/0.Initial/src/PT2/1.Deps_Install
./5.GO-gophers-apt-Install.sh
source ~/.bashrc
fi
# end rbenv install