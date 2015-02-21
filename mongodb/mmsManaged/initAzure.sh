#!/bin/bash
source common.sh

runtraced azure account set $SUBSCRIPTIONID
runtraced azure network vnet create --vnet $VNETNAME -e 10.0.0.0 -i 8 -p 10.0.0.0 -r 11 -n $VNETSUBNETNAME -l "$AZURELOCATION"
for i in $(seq -f "%02g" 1 $NUMOFSERVERS)
do
   echo "Installing server $SERVERNAME$i."
   echo azure vm create -n $SERVERNAME$i -c $CLOUDSERVICENAME -A $AVAILABILITYSETNAME $UBUNTUVM -u $USER -p '********' -z $VMSIZE -w $VNETNAME -b $VNETSUBNETNAME -e 27$i --custom-data ./configureMongoDB.sh --location "$AZURELOCATION"
   azure vm create -n $SERVERNAME$i -c $CLOUDSERVICENAME -A $AVAILABILITYSETNAME $UBUNTUVM -u $USER -p $PWD -z $VMSIZE -w $VNETNAME -b $VNETSUBNETNAME -e 27$i --custom-data ./configureMongoDB.sh --location "$AZURELOCATION"
done