#!/bin/bash
#RUN AS ROOT!
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

apt-get install -y --no-install-recommends \
     apt-transport-https \
     ca-certificates \
     curl \
     software-properties-common

curl -fsSL https://apt.dockerproject.org/gpg | sudo apt-key add -

apt-key fingerprint 58118E89F3A912897C070ADBF76221572C52609D

add-apt-repository \
       "deb https://apt.dockerproject.org/repo/ \
       raspbian-$(lsb_release -cs) \
       main"

apt-get update

apt-get -y install docker-engine

apt-cache madison docker-engine

apt-get -y install docker-engine

service docker start

docker run hello-world