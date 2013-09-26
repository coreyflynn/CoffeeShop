#!/bin/bash
chsh -s /usr/bin/fish vagrant
mkdir -p ~/.config/fish/functions
cp /vagrant/res/fish/fish_prompt.fish ~/.config/fish/functions/fish_prompt.fish
echo "set -g -x fish_greeting 'Welcome to the Connectivity Map Analysis Box (Coffee Shop)'" >> ~/.config/fish/config.fish