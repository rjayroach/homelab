
https://raspberrypi.stackexchange.com/questions/75440/how-to-invert-scrolling-direction-on-trackpad-in-raspbian-stretch
# Also turn on ssh server in Pi menu

wget https://github.com/rjayroach.keys -O ~/.ssh/authorized_keys
chmod 600 ~/.ssh/authorized_keys

# Update any pacakges in existing repos
apt update
apt upgrade

# Fix errors with containers, e.g. netbootxyz
# Update to latest libseccomp2 https://docs.linuxserver.io/faq#libseccomp
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 04EE7237B7D453EC 648ACFD622F3D138
echo "deb http://deb.debian.org/debian buster-backports main" | sudo tee -a /etc/apt/sources.list.d/buster-backports.list


# update docker to latest from bullseye https://blog.samcater.com/fix-workaround-rpi4-docker-libseccomp2-docker-20/
echo "deb http://mirrordirector.raspbian.org/raspbian/ bullseye main" | sudo tee -a /etc/apt/sources.list.d/bullseye-testing-docker.list


/etc/apt/preferences.d/bullseye-docker.pref:

Package: * 
Pin: release n=bullseye 
Pin-Priority: 50


# Install Docker and
sudo apt update
sudo apt install -t buster-backports libseccomp2 -y
sudo apt install docker.io/bullseye -y
sudo apt install docker-compose tmux -y
sudo apt autoremove


sudo add user pi to /etc/group # login again

docker volume create portainer_data

# Next steps:
cd portainer
docker-compose up

