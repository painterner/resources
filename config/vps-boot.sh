# passwd need interactive
# non-inactive mode > echo -e "passwd123\npasswd123" | passwd
# ref: https://www.systutorials.com/changing-linux-users-password-in-one-command-line/
echo 'please input you password'
passwd

apt update
apt upgrade

echo 'adding a new user'
adduser ka
echo "adding ka to sudoers"
echo "#ka     ALL=(ALL:ALL) ALL"            >> /etc/sudoers
echo "#%ka    ALL=(ALL:ALL) ALL #add group" >> /etc/sudoers
echo "ka      ALL=(ALL:ALL) NOPASSWD:ALL"   >> /etc/sudoers

su ka
cd ~
mkdir all cenv downloads music pictures videos
cd all
mkdir docs proj refs tools
cd ~

echo "adding npm"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
nvm install v12.16.1
