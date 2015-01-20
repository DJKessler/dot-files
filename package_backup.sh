#!/bin/bash

BUDIR="/home/djkessler/Google Drive/linux_backup/$(date +%F--%H-%M-%S)"

if [ ! -d "$BUDIR" ]; then
  mkdir -p "$BUDIR"
fi

#touch "$BUDIR"/Package.list
dpkg --get-selections > "$BUDIR"/Package.list
sudo cp -R /etc/apt/sources.list* "$BUDIR"/
sudo apt-key exportall > "$BUDIR"/Repo.keys

# to restore after reinstall
#sudo apt-key add $BUDIR/Repo.keys
#sudo cp -R $BUDIR/sources.list* /etc/apt/
#sudo apt-get update
#sudo apt-get install dselect
#sudo dpkg --set-selections < $BUDIR/Package.list
#sudo apt-get dselect-upgrade -y
