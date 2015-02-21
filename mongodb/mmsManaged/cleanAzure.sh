#!/bin/bash
source common

for currentServer in $(seq -f "$SERVERNAME%02g" 1 $NUMOFSERVERS)
do
   echo "Deleting server $currentServer."
   runtraced azure vm delete $currentServer -b -q
done
runtraced azure network vnet delete $VNETNAME -q
