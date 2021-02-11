#!/bin/bash 
# Reference: https://www.cnblogs.com/h--d/p/9998788.html

# Add this file to /etc/rc.d/rc.local

# Add jenkins jar directory 
export JENKINS_DIR=/var/jk-scrpits/JenkinsAutobuild
# Set http port
HTTP_PORT=8080 

# Switch to Jenkins directory
cd $JENKINS_DIR

# Check pid 
pid=`ps -ef | grep jenkins.war | grep -v 'grep'| awk '{print $2}'`
   if [ "$1" = "start" ];then
   if [ -n "$pid" ];then
   echo 'jenkins is running...'
 else
# Run Web
   nohup java -jar $JENKINS_DIR/jenkins.war --httpPort=$HTTP_PORT >/dev/null &
   fi
   elif [ "$1" = "stop" ];then
   exec ps -ef | grep jenkins | grep -v grep | awk '{print $2}'| xargs kill -9
   echo 'jenkins is stop...'
 else
   echo "Please input like this:"./jenkins.sh start" or "./jenkins stop""
   fi 
