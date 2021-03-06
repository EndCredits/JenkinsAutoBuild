#!/bin/bash

# initial jenkins

echo "############################################################"
echo "Initializing AOSP/Custom ROM build environment for CentOS..."
echo "############################################################"

sudo yum groupinstall "Development Tools"
sudo yum install -y gcc make libstdc++ libstdc++-devel zlib-devel openssl-devel perl cpio expat-devel gettext-devel autoconf glibc glibc-devel zlib-devel libstdc++ libX11-devel ncurses-devel ncurses-libs gperf flex gcc-c++ bison patch ncurses ccache
sudo yum install -y python3 python2
sudo yum install -y wget curl
ccache -M 50G
echo "ccache size is 50.0G , if you want to change it , plz run 'ccache -M <size>' to set it"

echo "############################################################"
echo "Initializing Jenkins runtime environment...................."
echo "############################################################"

sudo yum install -y java-1.8.0-openjdk java-1.8.0-openjdk-devel java-1.8.0-openjdk-headless
wget http://mirrors.jenkins.io/war-stable/latest/jenkins.war 

echo "############################################################"
echo "Configuring Jenkins runtime environment....................."
echo "############################################################"

bash scripts/jenkins.sh start
sudo echo '$HOME/jk-scrpits/JenkinsAutobuild/scrpits/jenkins.sh start' >> /etc/rc.d/rc.local

echo "############################################################"
echo "Configuring repo tool......................................."
echo "############################################################"

bash scripts/repo.sh

echo "############################################################"
echo "Completed..................................................."
echo "To access your Jenkins service, please use		  "
echo "http://<your IP address>:<Jenkins port (default is 8080)>   "
echo "Then you can configure your Jenkins Tools."
echo "Your administrator password is :" 
cat $HOME/.jenkins/secrets/initialAdminPassword
echo "############################################################"
