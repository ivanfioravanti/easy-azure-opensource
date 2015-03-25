# easy-azure-opensource

A set of scripts that can be used to simplify installation of OpenSource software on Microsoft Azure.
You are able to easily:
* Deploy MongoDB
    * Create a MongoDB ReplicaSet  
    * Create a Sharded Dev Environment with a single server
* Deploy Elasticsearch
    * Create a Cluster with Kibana, Marvel, head, HQ
    * Scale out cluster with additional nodes

## General Prerequisites
* An [Azure Subscription](http://azure.microsoft.com/en-us/)
* Windows/Linux/MacOS Operating System
* [Azure CommandLine](http://azure.microsoft.com/en-us/documentation/articles/xplat-cli/)

For each product there can be specific prerequisites
* [MongoDB MMS service](https://mms.mongodb.com/) **free** registration for ReplicaSet scenario

## MongoDB

### MongoDB ReplicaSet Scenario
This scenario creates a ReplicaSet on Azure using [MongoDB MMS service](https://mms.mongodb.com/).
An MMS account is required in order to get MMSGROUPID and MMSAPIKEY needed in [configureMongoDB.sh](/mongodb/mmsManaged/configureMongoDB.sh)

1. Open ``common.sh`` file and define value for all variables in it
1. launch ``initAzure.sh`` command
1. when script is completed go to [MMS](https://mms.mongodb.com/) to complete configuration. All servers installed will be automatically visibile in your MMS Group

**Note**: you can deploy any number of mongodb servers on Azure, modifying ``NUMOFSERVERS`` variable. They will then be visible on [MMS](https://mms.mongodb.com/) and you will be able to configure any kind of advanced scenario there. 

### Development MongoDB 3.0 Sharded Cluster Scenario 
This scenario creates a Sharded Cluster for development purpose on a single server on Azure.

1. go to ``/mongodb/devShardedCluster/`` folder
1. edit ``common.sh`` file and define value for all variables in it
1. launch ``initAzure.sh`` command
1. you can now ssh to your server and start working with it

### Local Development MongoDB 3.0 Sharded Cluster Scenario 
This scenario creates a Sharded Cluster for development purpose on your local machine.

1. go to ``/mongodb/devShardedCluster/`` folder
1. edit ``mongoCluster.sh`` file and define value for all variables in it
1. launch ``initAzure.sh`` command
1. you can now ssh to your server and start working with it

## Elasticsearch

### Important note
On Azure multicast cannot be used, therefore we need to install and configure [Azure Cloud Plugin for Elasticsearch](https://github.com/elastic/elasticsearch-cloud-azure)

This scripts can be used to create a dev environment, they install a lot of plugins and Kibana on all nodes just for dev and testing purposes.

In order to use scripts in this repository, you have to follow instructions on plugin repository to create and upload certificates on Azure.

### Summary
This set of scripts can be used to simplify installation of O Elasticsearch cluster on Microsoft Azure.
You are able to easily:
* Deploy Elasticsearch
* Scale out Elasticsearch server

### General Prerequisites
* An [Azure Subscription](http://azure.microsoft.com/en-us/)
* Windows/Linux/MacOS Operating System
* [Azure CommandLine](http://azure.microsoft.com/en-us/documentation/articles/xplat-cli/)

### Initial setup

1. Open ``common.sh`` file and define value for all variables in it
1. launch ``initAzure.sh`` command
1. when script is completed your Elasticsearch server is up and running and accessible from internet on ports 9200 and 5601 (Kibana)

**Note**: you can deploy any number of elasticsearch nodes on Azure, modifying ``NUMOFSERVERS`` variable. They will be all behind same cloud service and therefore part of the same cluster.

### Scale out 
Ino rder to add additional server you can simply:

1. edit ``addAzureServers.sh`` file and define first index for new server and number of servers to be added to the cluster
1. launch ``addAzureServers.sh`` command



