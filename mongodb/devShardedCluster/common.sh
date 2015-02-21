#!/bin/bash
# Common functions
runtraced() {
    echo "$@"
    "$@"
}
# Variables to be defined before starting scripts
SUBSCRIPTIONID=
AZURELOCATION=
VMSIZE=
UBUNTUVM=
VNETNAME=
VNETSUBNETNAME=
SERVERNAME=
CLOUDSERVICENAME=
AVAILABILITYSETNAME=
USER=
PWD=
