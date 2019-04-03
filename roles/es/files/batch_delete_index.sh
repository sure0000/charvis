#!/bin/bash
if [ $# -ne 1 ]
then 
    echo "please check the Useage: bash batch_delete_index.sh prefix_name"
    exit
fi

for index in {1,9}
do
curl -X DELETE -u elastic:elastic "es1:9200/${1}0${index}"
done

for index in {10..31}
do
curl -X DELETE -u elastic:elastic "es1:9200/$1${index}"
done