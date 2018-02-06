#!/bin/bash

NAME=`basename $0`
TIME=`date +%F\ %H:%M:%S`
TYPE='<info>'
echo -e "\e[32mapt-get update and install packeges\e[0m"

set -e
set -a
set -x

sudo apt-get update 
sudo apt-get install -y linux-image-extra-$(uname -r) linux-image-extra-virtual
sudo apt-get update
sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
echo -e "\e[32msudo apt-key fingerprint 0EBFCD88\e[0m"
sudo apt-key fingerprint 0EBFCD88


echo -e "\e[32mUpdate Sourse-List\e[0m"
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

echo -e "\e[32mInstall DockerCE\e[0m"
sudo apt-get update 
sudo apt-get install -y docker-ce


echo "$TIME $NAME: $TYPE Operation completed successfully" >> /tmp/log
