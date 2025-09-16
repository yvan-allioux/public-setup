#!/bin/bash

#sudo apt update && sudo apt upgrade -y && sudo apt full-upgrade -y && sudo apt autoremove -y

sudo apt update && sudo apt upgrade -y

#curl git vim
sudo apt install curl git vim htop nmap tree net-tools traceroute dnsutils -y

#micro
#curl https://getmic.ro | bash && sudo mv ./micro /usr/bin

#zsh setup
sudo apt install zsh -y
chsh -s $(which zsh) #no root
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting
git clone https://github.com/marlonrichert/zsh-autocomplete.git ~/.zsh/zsh-autocomplete

#git clone https://github.com/tom-doerr/zsh_codex.git ~/.zsh/zsh_codex 

curl https://raw.githubusercontent.com/yvan-allioux/public-setup/main/.zshrc > ~/.zshrc


