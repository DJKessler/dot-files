#!/bin/bash

GS="/usr/bin/gsettings"
CCUL="com.canonical.Unity.lenses"

# Figure out the version of Ubuntu that you're running
V=`/usr/bin/lsb_release -rs`
# The privacy problems started with 12.10, so earlier versions should do nothing
if awk "BEGIN {exit !($V < 12.10 || $V >= 14.10)}"; then
  echo "Good news! This version of Ubuntu is not known to invade your privacy."
else

  # Check Canonical schema is present. Take first match, ignoring case.
  SCHEMA="`$GS list-schemas | grep -i $CCUL | head -1`"
  if [ -z "$SCHEMA" ]
    then
    printf "Error: could not find Canonical schema %s.\n" "$CCUL" 1>&2
    exit 1
  else
    CCUL="$SCHEMA"
  fi

  # Turn off "Remote Search", so search terms in Dash don't get sent to the internet
  $GS set $CCUL remote-content-search none

  # If you're using earlier than 13.10, uninstall unity-lens-shopping
  if [ $V \< 13.10 ]; then
    sudo apt-get remove -y unity-lens-shopping

  # If you're using a later version, disable remote scopes
  else
    $GS set $CCUL disabled-scopes \
      "['more_suggestions-amazon.scope', 'more_suggestions-u1ms.scope',
      'more_suggestions-populartracks.scope', 'music-musicstore.scope',
      'more_suggestions-ebay.scope', 'more_suggestions-ubuntushop.scope',
      'more_suggestions-skimlinks.scope']"
  fi;

  # Block connections to Ubuntu's ad server, just in case
  if ! grep -q "127.0.0.1 productsearch.ubuntu.com" /etc/hosts; then
    echo -e "\n127.0.0.1 productsearch.ubuntu.com" | sudo tee -a /etc/hosts >/dev/null
  fi

  echo "All done. Enjoy your privacy."
fi




#################################################################
## Get rid of annoying default directories                     ##
#################################################################
sed -i 's/^\(XDG_TEMPLATES_DIR=\)\"\$HOME\/\(Templates\)\"$/\1\"\/tmp\/\2\"/' \
  $HOME/.config/user-dirs.dirs

sed -i 's/^\(XDG_PUBLICSHARE_DIR=\)\"\$HOME\/\(Public\)\"$/\1\"\/tmp\/\2\"/' \
  $HOME/.config/user-dirs.dirs

sed -i 's/^\(XDG_MUSIC_DIR=\)\"\$HOME\/\(Music\)\"$/\1\"\/tmp\/\2\"/' \
  $HOME/.config/user-dirs.dirs

sed -i 's/^\(XDG_PICTURES_DIR=\)\"\$HOME\/\(Pictures\)\"$/\1\"\/tmp\/\2\"/' \
  $HOME/.config/user-dirs.dirs

sed -i 's/^\(XDG_VIDEOS_DIR=\)\"\$HOME\/\(Videos\)\"$/\1\"\/tmp\/\2\"/' \
  $HOME/.config/user-dirs.dirs


#################################################################
## Move the existing annoying default directories to tmp       ##
#################################################################
if [ -d "$HOME/Templates" ]; then
  echo "Moving $HOME/Templates to /tmp/Templates"
  mv "$HOME/Templates" "/tmp/Templates"
fi

if [ -d "$HOME/Public" ]; then
  echo "Moving $HOME/Public to /tmp/Public"
  mv "$HOME/Public" "/tmp/Public"
fi

if [ -d "$HOME/Music" ]; then
  echo "Moving $HOME/Music to /tmp/Music"
  mv "$HOME/Music" "/tmp/Music"
fi

if [ -d "$HOME/Pictures" ]; then
  echo "Moving $HOME/Pictures to /tmp/Pictures"
  mv "$HOME/Pictures" "/tmp/Pictures"
fi

if [ -d "$HOME/Videos" ]; then
  echo "Moving $HOME/Videos to /tmp/Videos"
  mv "$HOME/Videos" "/tmp/Videos"
fi

#################################################################
## Remove stupid 'examples.desktop' file                       ##
#################################################################
rm -rf "$HOME/examples.desktop"

exit 0
