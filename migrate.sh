#! /usr/bin/env bash

# usage:
# ./migrate.sh <backup directory>

# help text
if [ "$1" == "-h" ]; then
    echo "usage: ./migrate.sh <backup directory>"
    exit 0
fi

# install packages
sudo apt update
sudo dpkg --set-selections < $1/pgklist.txt
sudo apt-get dselect-upgrade -y

# install packages from ppas
sudo cp -r $1/sources/sources.list* /etc/apt/
sudo apt update
sudo apt upgrade -y

# install flatpaks
flatpak install flathub $(cat $1/flatpaklist.txt | awk '{print $1}')

# copy and extract home directory
tar -xzvf $1/home-dir-backup.tar.gz -C $HOME/
rm -rf ~/.cache