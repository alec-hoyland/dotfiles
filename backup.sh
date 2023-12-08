#! /usr/bin/env bash

# usage:
# ./backup.sh <backup directory>

# help text
if [ "$1" == "-h" ]; then
    echo "usage: ./backup.sh <backup directory>"
    exit 0
fi

# backup home directory
tar -czvf $1/home-dir-backup.tar.gz $HOME/

# backup packages
sudo dpkg --get-selections > $1/pkglist.txt

# backup sources
mkdir $1/sources
sudo cp -r /etc/apt/sources.list* $1/sources/

# backup flatpaks
flatpak list --app --show-details > $1/flatpaklist.txt