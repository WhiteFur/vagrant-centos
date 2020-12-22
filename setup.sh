#!/bin/sh

yum -y upgrade
yum -y update
# vim
yum -y install vim-enhanced
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
# git
yum -y install git
# ag
yum -y install epel-release
yum -y install the_silver_searcher
# docker engine
yum install -y yum-utils device-mapper-persistent-data lvm2
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
yum install -y docker-ce
systemctl start docker
gpasswd -a vagrant docker
# python3
yum install -y python3-pip
# docker-compose
pip3 install docker-compose
# gcloud
tee -a /etc/yum.repos.d/google-cloud-sdk.repo << EOM
[google-cloud-sdk]
name=Google Cloud SDK
baseurl=https://packages.cloud.google.com/yum/repos/cloud-sdk-el7-x86_64
enabled=1
gpgcheck=1
repo_gpgcheck=1
gpgkey=https://packages.cloud.google.com/yum/doc/yum-key.gpg
       https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg
EOM

yum -y install google-cloud-sdk
yum -y install kubectl
set -o vi
echo $USER
