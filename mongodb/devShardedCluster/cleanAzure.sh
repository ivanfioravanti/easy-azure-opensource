#!/bin/bash
source common
set -x #echo on
azure vm delete $SERVERNAME -b -q
azure network vnet delete $VNETNAME -q