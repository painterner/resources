# passwd need interactive
# non-inactive mode > echo -e "passwd123\npasswd123" | passwd
# ref: https://www.systutorials.com/changing-linux-users-password-in-one-command-line/
echo 'PTBOOT: please input you password'
passwd

apt update
apt upgrade

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
nvm instal v12.16.1
'
