#!/bin/bash
# Script for prepare a WSL environment

# Update linux
sudo apt-get autoremove -y
sudo apt-get upgrade -y

echo " "
sleep 10s

echo "Now install all the things"

# Essentials

echo "Install wget"
sudo apt-get install -y wget

echo " "
sleep 10s


echo "Install git"
sudo apt-get install -y git

echo " "
sleep 10s


echo "Install curl"
sudo apt-get install -y curl

echo " "
sleep 10s


echo "Install zsh"
sudo apt-get install -y zsh

echo " "
sleep 10s


echo "Install oh-my-zsh"
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

echo " "
sleep 10s


# Development tools

echo "Install vim"
sudo apt-get install -y vim

echo " "
sleep 10s


echo "Install python3-pip"
sudo apt-get install -y python3-pip

echo " "
sleep 10s


# Go install
echo "Install go"
wget --quiet https://go.dev/dl/go1.18.1.linux-amd64.tar.gz
tar -xvf go1.18.1.linux-amd64.tar.gz
sudo mv go /usr/share
rm go1.18.1.linux-amd64.tar.gz

echo " "
sleep 10s


# Node/NPM/PNPM install
echo "Install node"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
curl -fsSL https://get.pnpm.io/install.sh | PNPM_VERSION=7.0.0-rc.7 sh -
source $HOME/.nvm/nvm.sh
nvm install --lts
npm install -g svgo wipeclean ttf2woff

echo " "
sleep 10s


# Docker install
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update -y && sudo apt-get install docker-ce docker-ce-cli containerd.io -y

sudo usermod -aG docker $USER

sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

sudo chmod +x /usr/local/bin/docker-compose

echo " "
sleep 10s




# Change to ZSH
sudo chsh -s /usr/bin/zsh

zsh

echo "All things are done"