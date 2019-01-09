#!/bin/bash
if [ $# -ne 1 ]
then 
    echo "please check the Useage: bash batch_delete_index.sh prefix_name begin end"
    exit
fi

for index in {1..31}
do
curl -X DELETE -u elastic:elastic "es1:9200/$1${index}"
done