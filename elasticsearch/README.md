# Elasticsearch

## Important note
On Azure multicast cannot be used, therefore we need to install and configure [Azure Cloud Plugin for Elasticsearch](https://github.com/elastic/elasticsearch-cloud-azure)

This scripts can be used to create a dev environment, they install a lot of plugins and Kibana on all nodes just for dev and testing purposes.

In order to use scripts in this repository, you have to follow instructions on plugin repository to create and upload certificates on Azure.

## Summary
This set of scripts can be used to simplify installation of O Elasticsearch cluster on Microsoft Azure.
You are able to easily:
* Deploy Elasticsearch
* Scale out Elasticsearch server

## General Prerequisites
* An [Azure Subscription](http://azure.microsoft.com/en-us/)
* Windows/Linux/MacOS Operating System
* [Azure CommandLine](http://azure.microsoft.com/en-us/documentation/articles/xplat-cli/)

##Usage

### Initial setup

1. Open ``common.sh`` file and define value for all variables in it
1. launch ``initAzure.sh`` command
1. when script is completed your Elasticsearch server is up and running and accessible from internet on ports 9200 and 5601 (Kibana)

**Note**: you can deploy any number of elasticsearch nodes on Azure, modifying ``NUMOFSERVERS`` variable. They will be all behind same cloud service and therefore part of the same cluster.

### Scale out 
Ino rder to add additional server you can simply:

1. edit ``addAzureServers.sh`` file and define first index for new server and number of servers to be added to the cluster
1. launch ``addAzureServers.sh`` command
