#!/bin/bash
MMSGROUPID=YOURMMSGROUPIDHERE
MMSAPIKEY=YOURMMSAPIKEYHERE

apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
echo "deb http://repo.mongodb.org/apt/ubuntu "$(lsb_release -sc)"/mongodb-org/3.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.0.list
apt-get update
curl -sOL https://mms.mongodb.com/download/agent/automation/mongodb-mms-automation-agent-manager_latest_amd64.deb
dpkg -i mongodb-mms-automation-agent-manager_latest_amd64.deb
sed -i 's/mmsGroupId=@GROUP_ID@/mmsGroupId='"$MMSGROUPID"'/g' /etc/mongodb-mms/automation-agent.config
sed -i 's/mmsApiKey=@API_KEY@/mmsApiKey='"$MMSAPIKEY"'/g' /etc/mongodb-mms/automation-agent.config
mkdir -p /mnt/data
chown mongodb:mongodb /mnt/data
sudo ln -s /mnt/data/ /data
start mongodb-mms-automation-agent
rm -rf mongodb-mms-automation-agent-manager_latest_amd64.deb
export LC_ALL=en_US.UTF-8
grep -q -F 'LC_ALL=C' /etc/default/locale || echo 'LC_ALL=C' >> /etc/default/locale

# Disable THP
echo never > /sys/kernel/mm/transparent_hugepage/enabled
echo never > /sys/kernel/mm/transparent_hugepage/defrag
grep -q -F 'transparent_hugepage=never' /etc/default/grub || echo 'transparent_hugepage=never' >> /etc/default/grub

#Install MongoDB Client tools
sudo apt-get install -y mongodb-org-shell
sudo apt-get install -y mongodb-org-tools
