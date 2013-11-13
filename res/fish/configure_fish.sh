#!/bin/bash
chsh -s /usr/bin/fish vagrant
mkdir -p /home/vagrant/.config/fish/functions
cp /vagrant/res/fish/fish_prompt.fish /home/vagrant/.config/fish/functions/fish_prompt.fish
echo "set -g -x fish_greeting 'Welcome to the Coffee Shop'" > /home/vagrant/.config/fish/config.fish
echo 'set -x PYTHONPATH /home/vagrant/pestle $PYTHONPATH' >> /home/vagrant/.config/fish/config.fish
echo 'set -x PATH /xchip/cogs/bin $PATH' >> /home/vagrant/.config/fish/config.fish
echo 'set -x PATH /xchip/cogs/matlib/bin $PATH' >> /home/vagrant/.config/fish/config.fish