#!/bin/bash

#################################################################
## Rename the repository directory name to a dotfile           ##
#################################################################
if [ -d "$HOME/unixrc" ]; then
	mv $HOME/unixrc $HOME/.unixrc
fi

if [ -d "$HOME/.unixrc" ]; then
	cd $HOME/.unixrc
	git submodule init
	git submodule update
fi

#################################################################
## link in our bashrc file                                     ##
#################################################################
if [ -f "$HOME/.bashrc" ] && [ ! -L "$HOME/.bashrc" ]; then
  ## If a bashrc file exists and isn't a link, move it

	mv $HOME/.bashrc $HOME/.bashrc.orig.bak
  ln -s "$HOME/.unixrc/bash.bashrc" "$HOME/.bashrc"
elif [ -L "$HOME/.bashrc" ]; then
  ## If no bashrc file exists, but a link exists, fix link

  unlink "$HOME/.bashrc"
  ln -s "$HOME/.unixrc/bash.bashrc" "$HOME/.bashrc"
elif [ ! -f "$HOME/.bashrc" ]; then
  ## If no bashrc file exists, link it

  ln -s "$HOME/.unixrc/bash.bashrc" "$HOME/.bashrc"
fi

#################################################################
## link in our xinitrc file                                     ##
#################################################################
if [ -f "$HOME/.xinitrc" ] && [ ! -L "$HOME/.xinitrc" ]; then
  ## If a xinitrc file exists and isn't a link, move it

	mv $HOME/.xinitrc $HOME/.xinitrc.orig.bak
  ln -s "$HOME/.unixrc/xinit.xinitrc" "$HOME/.xinitrc"
elif [ -L "$HOME/.xinitrc" ]; then
  ## If no xinitrc file exists, but a link exists, fix link

  unlink "$HOME/.xinitrc"
  ln -s "$HOME/.unixrc/xinit.xinitrc" "$HOME/.xinitrc"
elif [ ! -f "$HOME/.xinitrc" ]; then
  ## If no xinitrc file exists, link it

  ln -s "$HOME/.unixrc/xinit.xinitrc" "$HOME/.xinitrc"
fi

#################################################################
## link in our i3 config directory                             ##
#################################################################
i3_config_dir="$HOME/.config/i3"

if [ -d "$i3_config_dir" ] && [ ! -L "$i3_config_dir" ]; then
  ## If ~/.config/i3 directory exists and isn't a link, move it

	mv "$i3_config_dir" "$i3_config_dir".orig.bak
  ln -s $HOME/.unixrc/i3 "$i3_config_dir"
elif [ -L "$i3_config_dir" ]; then
  ## If no ~/.config/i3 directory exists, but a link exists, fix link

  unlink "$i3_config_dir"
  ln -s "$HOME/.unixrc/i3" "$i3_config_dir"
elif [ ! -d "$i3_config_dir" ]; then
  ## If no ~/.config/i3 directory exists, link it

  ln -s "$HOME/.unixrc/i3" "$i3_config_dir"
fi

#################################################################
## link in our i3status config directory                       ##
#################################################################
i3status_config_dir="$HOME/.config/i3status"

if [ -d "$i3status_config_dir" ] && [ ! -L "$i3status_config_dir" ]; then
  ## If ~/.config/i3status directory exists and isn't a link, move it

	mv "$i3status_config_dir" "$i3status_config_dir".orig.bak
  ln -s $HOME/.unixrc/i3status "$i3status_config_dir"
elif [ -L "$i3status_config_dir" ]; then
  ## If no ~/.config/i3status directory exists, but a link exists, fix link

  unlink "$i3status_config_dir"
  ln -s "$HOME/.unixrc/i3status" "$i3status_config_dir"
elif [ ! -d "$i3status_config_dir" ]; then
  ## If no ~/.config/i3status directory exists, link it

  ln -s "$HOME/.unixrc/i3status" "$i3status_config_dir"
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

