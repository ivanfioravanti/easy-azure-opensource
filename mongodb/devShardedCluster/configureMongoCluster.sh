#!/bin/bash
cd /home/azureuser/
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | sudo tee /etc/apt/sources.list.d/mongodb.list
apt-get update
MONGODBVERSION=mongodb-linux-x86_64-3.0.0-rc9
curl -sOL https://fastdl.mongodb.org/linux/$MONGODBVERSION.tgz
tar xvf $MONGODBVERSION.tgz
mv $MONGODBVERSION/bin/* /usr/local/bin
apt-get install git -y
export LC_ALL=C
grep -q -F 'LC_ALL=C' /etc/default/locale || echo 'LC_ALL=C' >> /etc/default/locale
sudo -u azureuser git clone https://github.com/ivanfioravanti/easy-azure-opensource
cd easy-azure-opensource/mongodb/devShardedCluster
sudo ./mongoCluster.sh init
sudo -u azureuser ./mongoCluster.sh start
sudo -u azureuser ./mongoCluster.sh configure
sudo apt-get install -y mongodb-org-shell
sudo apt-get install -y mongodb-org-tools