#!/bin/bash

HOST=$1
ENV=$2
OLD_DEPLOY=$3
NEW_DEPLOY=$4

for HOST in $1
    do echo "+++ ${HOST}01.${2}.bigfishgames.com+++"; 
    ssh ${HOST}01.${2}.bigfishgames.com "diff -r /websites/deploy/${3} /websites/deploy/${4}";
done;
