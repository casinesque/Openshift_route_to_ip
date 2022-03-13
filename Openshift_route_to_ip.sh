#!/bin/bash

oc project 
list_of_endpoint=$(oc get routes -n your_namespace | awk 'NR>1{ print $2 }')
# Iterate the string array using for loop
for val in ${list_of_endpoint[*]}; 
do
   ping -c 1 $val 
   if [ "$?" -eq "0" ]; then
     ip_address=$(ping -c 1 $val | awk 'NR>1{print $4}' | head -n 1 )
     echo "The adress of the Hostname ${val} is: $ip_address"
   fi
done
