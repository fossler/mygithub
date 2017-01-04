#!/usr/bin/env bash
# https://access.redhat.com/documentation/en-US/Red_Hat_Enterprise_Linux/6/html/Identity_Management_Guide/prerequisites.html#tab.ipa-ports

# Load global variables
# ######################################################################
EXEC_PATH="$dirname $0"
source ${EXEC_PATH%/*}/GLOBAL-VARIABLES.sh

# Load global functions
# ######################################################################
for f in ${EXEC_PATH%/*}/functions/*; do
  source $f
done

# Check if run as root (sudo)
# ######################################################################
check_root

# Dynamic variables
# ######################################################################
source ${EXEC_PATH%/*}/DYNAMIC-VARIABLES.sh

# check if required packages are installed, else install them.
# ######################################################################

AppArray[0]='git' # fast, scalable, distributed revision control system
AppArray[1]='tig' # ncurses-based text-mode interface for Git

for i in "${AppArray[@]}"
do
  install_mandatory_apps
done
unset AppArray
clear


# git --system wide config
# ######################################################################
git config --system color.ui true
git config --system core.autocrlf input
git config --system core.safecrlf true

# git global config for current user
# ######################################################################
git config --global user.name "Mirzet Kadic"
git config --global user.email "mirzet.kadic@gmail.com"
git config --global credential.helper 'cache --timeout=36000'

# Aliases
git config --global alias.s "status -s"
git config --global alias.lg " log --oneline --decorate --graph --all "

exit
