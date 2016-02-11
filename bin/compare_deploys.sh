#!/bin/bash

ENV=$1
DEPLOY_ID=$2

IGNORES='-I web_root_assets -I web_root_graphics -I web_root_css -I web_root_javascript -I global_web_root -I global_web_root_assets -I js_build_number -I css_build_number'
FILE_IGNORES='-x /bfg/var/cache'

for HOST in auth batch blog-web ecomm-batch devid lucidadmin-web metacache-web mobile-consumer mobileservices-web stub trans bfg-web; 
    do HOSTNAME=${HOST}01.${ENV}.bigfishgames.com
    FILENAME=${HOME}/${DEPLOY_ID}_${HOST}.diff
    echo "+++ ${HOSTNAME} +++";
    ssh -o StrictHostKeyChecking=no ${HOSTNAME} "diff ${IGNORES} ${FILE_IGNORES} -r /websites/deploy/current /websites/deploy/${DEPLOY_ID}" > ${FILENAME}
done;

