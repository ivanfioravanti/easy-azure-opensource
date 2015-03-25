#!/bin/bash
SUBSCRIPTIONID="06cd75ff-c59e-4d60-bcc1-eb8f444c2d3a"
CLOUDSERVICENAME="testesazure"
PASSWORD='Test123!'
DATAFOLDER=/mnt/elasticsearch
ESUSER=elasticsearch

### Install OpenJDK
cd ~
sudo apt-get update
sudo apt-get install openjdk-7-jre-headless -y

### Download and Install ElasticSearch
### Check http://www.elasticsearch.org/download/ for latest version of ElasticSearch and replace wget link below
wget https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-1.4.4.deb
sudo dpkg -i elasticsearch-1.4.4.deb

# Create data folder in the SSD drive and configure ElasticSearch to use it
sudo mkdir -p $DATAFOLDER
sudo chown $ESUSER:$ESUSER $DATAFOLDER

# If you don't remember your account id, you may get it with `azure account list`
sudo echo "cloud:" >> /etc/elasticsearch/elasticsearch.yml
sudo echo "    azure:">> /etc/elasticsearch/elasticsearch.yml
sudo echo "        keystore: /home/azureuser/azurekeystore.pkcs12">> /etc/elasticsearch/elasticsearch.yml
sudo echo "        password: $PASSWORD">> /etc/elasticsearch/elasticsearch.yml
sudo echo "        subscription_id: $SUBSCRIPTIONID">> /etc/elasticsearch/elasticsearch.yml
sudo echo "        service_name: $CLOUDSERVICENAME">> /etc/elasticsearch/elasticsearch.yml
sudo echo "discovery:">> /etc/elasticsearch/elasticsearch.yml
sudo echo "        type: azure">> /etc/elasticsearch/elasticsearch.yml

# Set minimum_master_nodes for election
sed -i 's/#discovery.zen.minimum_master_nodes: 1/discovery.zen.minimum_master_nodes: 2/g' /etc/elasticsearch/elasticsearch.yml

# Recommended (warning: non durable disk)
sudo echo "path.data: /mnt/elasticsearch/data">> /etc/elasticsearch/elasticsearch.yml

### Install Kibana
sudo update-rc.d elasticsearch defaults 95 10
curl -OL https://download.elasticsearch.org/kibana/kibana/kibana-4.0.1-linux-x64.tar.gz
tar xvf kibana-4.0.1-linux-x64.tar.gz
sudo cp -R kibana-4.0.1-linux-x64 /opt/kibana

curl -OL https://github.com/ivanfioravanti/easy-azure-opensource/raw/master/elasticsearch/kibana_init.sh
cp kibana_init.sh /etc/init.d/kibana
chmod 755 /etc/init.d/kibana
sudo update-rc.d kibana defaults 95 10

# Enable on bootup
sudo update-rc.d elasticsearch defaults 95 10

# Installing elasticsearch plugins
sudo /usr/share/elasticsearch/bin/plugin -install mobz/elasticsearch-head
sudo /usr/share/elasticsearch/bin/plugin -install elasticsearch/marvel/latest
sudo /usr/share/elasticsearch/bin/plugin -install elasticsearch/elasticsearch-cloud-azure/2.5.1
sudo /usr/share/elasticsearch/bin/plugin -install elasticsearch/elasticsearch-river-twitter/2.4.2
sudo /usr/share/elasticsearch/bin/plugin -install royrusso/elasticsearch-HQ


### Start ElasticSearch 
sudo /etc/init.d/elasticsearch start

### Start Kibana
sudo /etc/init.d/kibana start