#/bin/bash

# initial jenkins

echo "############################################################"
echo "Initializing AOSP/Custom ROM build environment for CentOS..."
echo "############################################################"

sudo yum groupinstall "Development Tools"
sudo yum install -y gcc make libstdc++ libstdc++-devel zlib-devel openssl-devel perl cpio expat-devel gettext-devel autoconf glibc glibc-devel zlib-devel libstdc++ libX11-devel ncurses-devel ncurses-libs gperf flex gcc-c++ bison patch ncurses 
sudo yum install -y python3 python2
sudo yum install -y wget curl

echo "############################################################"
echo "Initializing Jenkins runtime environment...................."
echo "############################################################"

sudo yum install -y java-1.8.0-openjdk java-1.8.0-openjdk-devel java-1.8.0-openjdk-headless
wget http://mirrors.jenkins.io/war-stable/latest/jenkins.war 

echo "############################################################"
echo "Configuring Jenkins runtime environment....................."
echo "############################################################"

bash scripts/jenkins.sh start

echo "############################################################"
echo "Completed..................................................."
echo "############################################################"
