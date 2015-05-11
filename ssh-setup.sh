#!/bin/bash

sudo apt-get install openssh-server

sudo cp /etc/ssh/sshd_config /etc/ssh/sshd_config.bak
sudo chmod a-w /etc/ssh/sshd_config.bak

exit 0
