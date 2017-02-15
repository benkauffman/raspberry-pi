#!/bin/bash
#RUN AS ROOT!
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

apt-get install libapparmor1 -y

wget https://apt.dockerproject.org/repo/pool/main/d/docker-engine/docker-engine_1.13.1-0~raspbian-jessie_armhf.deb
dpkg -i ./docker-engine_1.13.1-0~raspbian-jessie_armhf.deb
service docker start

docker run hello-world
