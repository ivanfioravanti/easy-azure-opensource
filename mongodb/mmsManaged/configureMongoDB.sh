#!/bin/bash
MMSGROUPID=54d91f23e4b033d7e2f4964f
MMSAPIKEY=697ad9db57d0a922ce7a2cd7593b5547

apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | sudo tee /etc/apt/sources.list.d/mongodb.list
apt-get update
curl -sOL https://mms.mongodb.com/download/agent/automation/mongodb-mms-automation-agent-manager_latest_amd64.deb
dpkg -i mongodb-mms-automation-agent-manager_latest_amd64.deb
sed -i 's/mmsGroupId=@GROUP_ID@/mmsGroupId='"$MMSGROUPID"'/g' /etc/mongodb-mms/automation-agent.config
sed -i 's/mmsApiKey=@API_KEY@/mmsApiKey='"$MMSAPIKEY"'/g' /etc/mongodb-mms/automation-agent.config
mkdir -p /mnt/data
chown mongodb:mongodb /mnt/data
start mongodb-mms-automation-agent
rm -rf mongodb-mms-automation-agent-manager_latest_amd64.deb
export LC_ALL=en_US.UTF-8
grep -q -F 'LC_ALL=C' /etc/default/locale || echo 'LC_ALL=C' >> /etc/default/locale
sudo apt-get install -y mongodb-org-shell
sudo apt-get install -y mongodb-org-tools