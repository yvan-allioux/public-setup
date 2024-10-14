
adduser myuser
adduser myuser sudo
vim /etc/ssh/sshd_config
# edit 
#Port 5436
#PermitRootLogin no
sudo systemctl restart ssh


sudo apt update && sudo apt upgrade -y

sudo apt install curl vim htop -y
curl https://getmic.ro | bash && sudo mv ./micro /usr/bin

#sudo passwd debian

#fail2ban
sudo apt install fail2ban -y
sudo cp /etc/fail2ban/jail.conf /etc/fail2ban/jail.local
micro /var/log/auth.log
sudo systemctl restart fail2ban
sudo systemctl status fail2ban

"
[sshd]
enabled = true
port    = ssh
logpath = /var/log/auth.log
maxretry = 5
"
#Docker Compose
sudo curl -L "https://github.com/docker/compose/releases/download/v2.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

#lazydocker       https://github.com/jesseduffield/lazydocker/releases/
wget https://github.com/jesseduffield/lazydocker/releases/download/v0.23.3/lazydocker_0.23.3_Linux_x86_64.tar.gz
tar -xvf lazydocker_*.tar.gz
sudo mv ./lazydocker /usr/bin
chmod +x /usr/bin/lazydocker
rm lazydocker_*.tar.gz LICENSE README.md

#backup

#curl -L https://setup.runtipi.io | bash



