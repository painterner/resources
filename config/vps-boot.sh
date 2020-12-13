# passwd need interactive
# non-inactive mode > echo -e "passwd123\npasswd123" | passwd
# ref: https://www.systutorials.com/changing-linux-users-password-in-one-command-line/
echo 'PTBOOT: please input you password'
passwd

apt update
apt upgrade

apt install vim -y

echo 'PTBOOT: adding a new user'
adduser ka
echo "PTBOOT: adding ka to sudoers"
echo "#ka     ALL=(ALL:ALL) ALL"            >> /etc/sudoers
echo "#%ka    ALL=(ALL:ALL) ALL #add group" >> /etc/sudoers
echo "ka      ALL=(ALL:ALL) NOPASSWD:ALL"   >> /etc/sudoers

sudo -u ka -H sh -c 'cd ~
mkdir all cenv downloads music pictures videos
cd all
mkdir docs proj refs tools
cd ~

echo "PTBOOT: adding npm"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
#nvm install v12.16.1
'
## docker untested ?
apt-get remove docker docker-engine docker.io containerd runc
apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
apt-get update
apt-get install docker-ce docker-ce-cli containerd.io #install docker engine -y
apt-cache madison docker-ce # list docker version

#add user to docker group -> https://docs.docker.com/engine/install/linux-postinstall/
su ka
cd ~
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker # active
docker run hello-world
## docker-compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.27.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose

##  kubernetes minikube tool (very small)
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube_latest_amd64.deb
sudo dpkg -i minikube_latest_amd64.deb
