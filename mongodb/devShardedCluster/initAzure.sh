#!/bin/bash
source common.conf

runtraced azure account set $SUBSCRIPTIONID
runtraced azure network vnet create --vnet $VNETNAME -e 10.0.0.0 -i 8 -p 10.0.0.0 -r 11 -n $VNETSUBNETNAME -l "$AZURELOCATION"
echo azure vm create -n $SERVERNAME -c $CLOUDSERVICENAME -A $AVAILABILITYSETNAME $UBUNTUVM -u $USER -p '********' -z $VMSIZE -w $VNETNAME -b $VNETSUBNETNAME -e 272 --custom-data ./configureMongoCluster.sh --location "$AZURELOCATION" 
azure vm create -n $SERVERNAME -c $CLOUDSERVICENAME -A $AVAILABILITYSETNAME $UBUNTUVM -u $USER -p $PWD -z $VMSIZE -w $VNETNAME -b $VNETSUBNETNAME -e 272 --custom-data ./configureMongoCluster.sh --location "$AZURELOCATION" 