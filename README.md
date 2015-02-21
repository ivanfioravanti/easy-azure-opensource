# easy-azure-opensource

A set of scripts that can be used to simplify installation of OpenSource software on Microsoft Azure.
You are able to easily:
* Deploy MongoDB
    * Create a MongoDB ReplicaSet  
    * Create a Sharded Dev Environment with a single server

## General Prerequisites
* An [Azure Subscription](http://azure.microsoft.com/en-us/)
* Windows/Linux/MacOS Operating System
* [Azure CommandLine](http://azure.microsoft.com/en-us/documentation/articles/xplat-cli/)

For each product there can be specific prerequisites
* [MongoDB MMS service](https://mms.mongodb.com/) **free** registration for ReplicaSet scenario

##Usage

### ReplicaSet Scenario
This scenario creates a ReplicaSet on Azure using [MongoDB MMS service](https://mms.mongodb.com/).
An MMS account is required in order to get MMSGROUPID and MMSAPIKEY needed in [configureMongoDB.sh](/mongodb/mmsManaged/configureMongoDB.sh)

1. Open ``common.sh`` file and define value for all variables in it
1. launch ``initAzure.sh`` command
1. when script is completed go to [MMS](https://mms.mongodb.com/) to complete configuration. All servers installed will be automatically visibile in your MMS Group

**Note**: you can deploy any number of mongodb servers on Azure, modifying ``NUMOFSERVERS`` variable. They will then be visible on [MMS](https://mms.mongodb.com/) and you will be able to configure any kind of advanced scenario there. 

### Development MongoDB 3.0 Sharded Cluster Scenario 
This scenario creates a Sharded Cluster for development purpose on a single server on Azure.

You need to be registered to MMS in order to get MMSGROUPID and MMSAPIKEY needed in [configureMongoDB.sh](/mongodb/mmsManaged/configureMongoDB.sh)

1. go to ``/mongodb/devShardedCluster/`` folder
1. edit ``common.sh`` file and define value for all variables in it
1. launch ``initAzure.sh`` command
1. you can now ssh to your server and start working with it

**Note**: you can deploy any number of mongodb servers on Azure, modifying ``NUMOFSERVERS`` variable. They will then be visible on [MMS](https://mms.mongodb.com/) and you will be able to configure any kind of advanced scenario there. 

