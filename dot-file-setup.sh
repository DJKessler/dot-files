#!/bin/bash

#################################################################
## Rename the repository directory name to a dotfile           ##
#################################################################
if [ -d "$HOME/unixrc" ]; then
	mv $HOME/unixrc $HOME/.unixrc
fi

#################################################################
## If a bashrc file exists and isn't a link, move it           ##
#################################################################
if [ -f "$HOME/.bashrc" ] && [ ! -L "$HOME/.bashrc" ]; then
	mv $HOME/.bashrc $HOME/.bashrc.orig.bak
  ln -s $HOME/.unixrc/.bashrc $HOME/.bashrc
fi

#################################################################
## If a vimrc file exists and isn't a link, move it            ##
#################################################################
if [ -f "$HOME/.vimrc" ] && [ ! -L "$HOME/.vimrc" ]; then
	mv $HOME/.vimrc $HOME/.vimrc.orig.bak
  ln -s $HOME/.unixrc/.vimrc $HOME/.vimrc
fi

#################################################################
## If no vimrc file exists, link it                            ##
#################################################################
if [ ! -f "$HOME/.vimrc" ]; then
  ln -s $HOME/.unixrc/.vimrc $HOME/.vimrc
fi


#################################################################
## If .vim directory exists and isn't a link, move it          ##
#################################################################
if [ -d "$HOME/.vim" ] && [ ! -L "$HOME/.vim" ]; then
	mv $HOME/.vim $HOME/.vim.orig.bak
  ln -s $HOME/.unixrc/.vim $HOME/.vim
fi

exit 0

