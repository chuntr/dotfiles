#!/bin/bash

set -euo pipefail
IFS=$'\n\t'

function Usage () {
cat <<HELP_USAGE

Usage: $0 -h HOST -o OLD_DEPLOY -n NEW_DEPLOY
   -h host - (hostname to compare deploys on)
   -o old_deploy - baseline deployment to compare (usually \"current\" works)
   -n new_deploy - new deployment id to compare with

HELP_USAGE
exit 0
}

POSITIONAL=()
if [ $# == 0 ]; then
    Usage
fi

while [[ $# -gt 0 ]]
do
    key="${1}"
    case ${key} in
        -h|--host)
            HOST="${2}"
            shift # past argument
            shift # past value
            ;;
        -o|--old-deploy)
            OLD_DEPLOY="${2}"
            shift # past argument
            shift # past value
            ;;
        -n|--new-deploy)
            NEW_DEPLOY="${2}"
            shift # past argument
            shift # past value
            ;;
        --default)
            DEFAULT=YES
            shift # past argument
            ;;
        *)
            Usage
            ;;
    esac
done

#echo "-h ${HOST} -o ${OLD_DEPLOY} -n ${NEW_DEPLOY}"

STR_IGNORES='-I web_root_assets -I web_root_graphics -I web_root_css -I web_root_javascript -I global_web_root -I global_web_root_assets -I js_build_number -I css_build_number'
FILE_IGNORES='-x bfg/var/cache'
CWD=$( pwd )
FILENAME=${CWD}/${OLD_DEPLOY}_v_${NEW_DEPLOY}_${HOST}.diff

echo
echo "+++ ${HOST} +++";
set -x
ssh -o StrictHostKeyChecking=no ${HOST} -- "diff ${STR_IGNORES} ${FILE_IGNORES} -r /websites/deploy/${OLD_DEPLOY} /websites/deploy/${NEW_DEPLOY}" > ${FILENAME};
set +x
echo "wrote results to ${FILENAME}"
