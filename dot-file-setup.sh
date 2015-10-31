#!/bin/bash

dot_file_repo_dir="$HOME/.unixrc"
banner="****************************************"

link_dot_file() {
  link_dest="$1"
  link_src="$2"
  echo "$banner"

  if [ -f "$link_dest" ] && [ ! -L "$link_dest" ]; then
    echo "Backing up $link_dest";
    mv "$link_dest" "$link_dest".orig.bak;

    echo "Creating link: $link_dest -> $link_src"
    ln -s "$link_src" "$link_dest"
  elif [ -L "$link_dest" ]; then
    echo "Updating link: $link_dest -> $link_src"
    unlink "$link_dest"
    ln -s "$link_src" "$link_dest"
  elif [ ! -f "$link_dest" ]; then
    echo "Creating link: $link_dest -> $link_src"
    ln -s "$link_src" "$link_dest"
  fi
  echo ""
}

link_dir() {
  link_dest="$1"
  link_src="$2"
  echo "$banner"

  if [ -d "$link_dest" ] && [ ! -L "$link_dest" ]; then
    echo "Backing up $link_dest to $link_dest".orig.bak
    mv "$link_dest" "$link_dest".orig.bak

    echo "Creating link: $link_dest -> $link_src"
    ln -s "$link_src" "$link_dest"
  elif [ -L "$link_dest" ]; then
    echo "Updating link: $link_dest -> $link_src"
    unlink "$link_dest"
    ln -s "$link_src" "$link_dest"
  elif [ ! -d "$link_dest" ]; then
    echo "Creating link: $link_dest -> $link_src"
    ln -s "$link_src" "$link_dest"
  fi
  echo ""
}

#################################################################
## Rename the repository directory name to a dotfile           ##
#################################################################
if [ -d "$HOME/unixrc" ]; then
  echo "Moving $HOME/unixrc to $dot_file_repo_dir"
  mv "$HOME/unixrc" "$dot_file_repo_dir"
fi

if [ -d "$dot_file_repo_dir" ]; then
  echo "initializing dot file git submodules"
  cd "$dot_file_repo_dir"
  git submodule init
  git submodule update
fi

#################################################################
## link in our bashrc file                                     ##
#################################################################
link_dot_file "$HOME/.bashrc" "$dot_file_repo_dir/bash.bashrc"

#################################################################
## link in our xinitrc file                                    ##
#################################################################
link_dot_file "$HOME/.xinitrc" "$dot_file_repo_dir/xinit.xinitrc"

#################################################################
## link in our i3 config directory                             ##
#################################################################
config_dir="$HOME/.config"

if [ ! -d "$config_dir" ]; then
  ## If no ~/.config directory exists, then make it
  echo "Creating config directory: $config_dir"

  mkdir "$config_dir"
fi

link_dir "$config_dir/i3" "$dot_file_repo_dir/i3" 

#################################################################
## link in our i3status config directory                       ##
#################################################################
link_dir "$config_dir/i3status" "$dot_file_repo_dir/i3status" 

#################################################################
## link in our vimrc file                                      ##
#################################################################
link_dot_file "$HOME/.vimrc" "$dot_file_repo_dir/vim.vimrc"

#################################################################
## link in our vim directory                                   ##
#################################################################
link_dir "$HOME/.vim" "$dot_file_repo_dir/vim.d"

#################################################################
## link in terminator config directory                         ##
#################################################################
link_dir "$config_dir/terminator" "$dot_file_repo_dir/terminator"


exit 0

