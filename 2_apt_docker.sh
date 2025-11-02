#!/bin/bash
#launch this script from github
#wget  -q -O - https://raw.githubusercontent.com/yvan-allioux/linux-setup/main/2_apt_docker.sh | bash

#docker
sudo apt update
sudo apt install apt-transport-https ca-certificates curl software-properties-common -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
apt-cache policy docker-ce
sudo apt install docker-ce -y
sudo usermod -aG docker ${USER}
sudo su - ${USER}

#Docker Compose
sudo curl -L "https://github.com/docker/compose/releases/download/v2.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

#lazydocker       https://github.com/jesseduffield/lazydocker/releases/
wget https://github.com/jesseduffield/lazydocker/releases/download/v0.23.3/lazydocker_0.23.3_Linux_x86_64.tar.gz
tar -xvf lazydocker_*.tar.gz
sudo mv ./lazydocker /usr/bin
chmod +x /usr/bin/lazydocker
rm lazydocker_*.tar.gz LICENSE README.md

#UBUNTU
sudo apt-get update;sudo apt-get install ca-certificates curl;sudo install -m 0755 -d /etc/apt/keyrings;sudo curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc;sudo chmod a+r /etc/apt/keyrings/docker.asc;echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu noble stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null;sudo apt-get update;sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin;sudo usermod -aG docker $USER;sudo systemctl restart docker;newgrp docker
