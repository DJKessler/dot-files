#!/bin/bash

#################################################################
## Rename the repository directory name to a dotfile           ##
#################################################################
if [ -d "$HOME/unixrc" ]; then
	mv $HOME/unixrc $HOME/.unixrc
fi

#################################################################
## link in our bashrc file                                     ##
#################################################################
if [ -f "$HOME/.bashrc" ] && [ ! -L "$HOME/.bashrc" ]; then
  ## If a bashrc file exists and isn't a link, move it

	mv $HOME/.bashrc $HOME/.bashrc.orig.bak
  ln -s $HOME/.unixrc/.bashrc $HOME/.bashrc
elif [ -L "$HOME/.bashrc" ]; then
  ## If no bashrc file exists, but a link exists, fix link

  unlink "$HOME/.bashrc"
  ln -s "$HOME/.unixrc/bash.bashrc" "$HOME/.bashrc"
elif [ ! -f "$HOME/.bashrc" ]; then
  ## If no bashrc file exists, link it

  ln -s "$HOME/.unixrc/bash.bashrc" "$HOME/.bashrc"
fi


#################################################################
## link in our vimrc file                                      ##
#################################################################
if [ -f "$HOME/.vimrc" ] && [ ! -L "$HOME/.vimrc" ]; then
  ## If a vimrc file exists and isn't a link, move it

	mv $HOME/.vimrc $HOME/.vimrc.orig.bak
  ln -s $HOME/.unixrc/.vimrc $HOME/.vimrc
elif [ -L "$HOME/.vimrc" ]; then
  ## If no .vimrc file exists, but a link exists, fix link

  unlink "$HOME/.vimrc"
  ln -s "$HOME/.unixrc/vim.vimrc" "$HOME/.vimrc"
elif [ ! -f "$HOME/.vimrc" ]; then
  ## If no vimrc file exists, link it

  ln -s "$HOME/.unixrc/vim.vimrc" "$HOME/.vimrc"
fi

#################################################################
## link in our vim directory                                   ##
#################################################################
if [ -d "$HOME/.vim" ] && [ ! -L "$HOME/.vim" ]; then
  ## If .vim directory exists and isn't a link, move it

	mv $HOME/.vim $HOME/.vim.orig.bak
  ln -s $HOME/.unixrc/.vim $HOME/.vim
elif [ -L "$HOME/.vim" ]; then
  ## If no .vim directory exists, but a link exists, fix link

  unlink "$HOME/.vim"
  ln -s "$HOME/.unixrc/vim.d" "$HOME/.vim"
elif [ ! -d "$HOME/.vim" ]; then
  ## If no .vim directory exists, link it

  ln -s "$HOME/.unixrc/vim.d" "$HOME/.vim"
fi

exit 0

