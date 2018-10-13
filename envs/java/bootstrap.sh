#!/usr/bin/env bash

echo 'APT::Periodic::Enable \"0\";' > /etc/apt/apt.conf.d/02periodic

systemctl disable apt-daily.service
systemctl disable apt-daily.timer
systemctl disable apt-daily-upgrade.service
systemctl disable apt-daily-upgrade.timer

systemctl stop apt-daily.service
systemctl stop apt-daily-upgrade.service
systemctl stop apt-daily.timer
systemctl stop apt-daily-upgrade.timer


sudo apt-get update
sudo apt-get install -y vim curl tree htop zsh git \
  default-jdk-headless xauth maven

wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -P /tmp
su -c "zsh /tmp/install.sh" - vagrant
sudo usermod -s `which zsh` vagrant

sudo update-locale LC_ALL=en_US.UTF-8


