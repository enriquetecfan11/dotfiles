#!/bin/bash
# Script for prepare a WSL environment

# Update linux
sudo apt-get autoremove -y
sudo apt-get upgrade -y

# Essentials

echo "Install wget"
sudo apt-get install -y wget

echo "Install git"
sudo apt-get install -y git

echo "Install curl"
sudo apt-get install -y curl

echo "Install zsh"
sudo apt-get install -y zsh

echo "Install oh-my-zsh"
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

echo source $HOME/.zshrc >> ~/.zshrc

PNPM_HOME=$HOME/.local/share/pnpm
PATH=$HOME/bin:/usr/local/bin:$HOME/.nvm:/usr/local/go/bin:$HOME/.deno/bin:$HOME/.cargo/bin:/usr/share/go/bin:$PNPM_HOME:$PATH

# Change to ZSH
sudo chsh -s /usr/bin/zsh

zsh

echo "All things are done"