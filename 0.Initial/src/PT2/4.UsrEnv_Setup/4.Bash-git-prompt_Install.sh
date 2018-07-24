#!/usr/bin/env bash

bold=$(tput bold)
normal=$(tput sgr0)

REPOROOT=/opt/ownsec
BINDIR=/usr/local/bin

cd ~

git clone https://github.com/magicmonty/bash-git-prompt.git .bash-git-prompt


# Remove old
sed -i -e 's|# bash-git-prompt||g' ~/.bashrc
sed -i -e 's#GIT_PROMPT_ONLY_IN_REPO=1##g' ~/.bashrc
sed -i -e 's#source ~/.bash-git-prompt/gitprompt.sh##g' ~/.bashrc

# Echo new
echo '# bash-git-prompt' >> ~/.bashrc
echo 'GIT_PROMPT_ONLY_IN_REPO=1' >> ~/.bashrc
echo 'source ~/.bash-git-prompt/gitprompt.sh' >> ~/.bashrc


source ~/.bashrc
