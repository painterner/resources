#add user to docker group -> https://docs.docker.com/engine/install/linux-postinstall/
cd ~
# sudo groupadd docker
# sudo usermod -aG docker $USER
# newgrp docker # active
docker run hello-world
## docker-compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.27.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose

##  kubernetes 
## kubectl
sudo apt-get update && sudo apt-get install -y apt-transport-https gnupg2 curl
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee -a /etc/apt/sources.list.d/kubernetes.list
sudo apt-get update
sudo apt-get install -y kubectl
## minikube tool (very small)
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube_latest_amd64.deb
sudo dpkg -i minikube_latest_amd64.deb

## fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

## homebrew
sudo snap install helm
sudo apt install linuxbrew-wrapper
echo export PATH='$PATH:/home/linuxbrew/.linuxbrew/bin' >> ~/.bashrc
export PATH=$PATH:/home/linuxbrew/.linuxbrew/bin

## java11
sudo apt install openjdk-11-jdk -y

sudo apt install tmux
