#!/bin/bash

YEAR=$( date +"%Y" )
TODAY=$( date +"%Y-%m-%d" )
LOGFILENAME="local3-${TODAY}"

usage() {
    cat <<USAGE
$0 - shorten entries and parse out most recent error set from apache log files
$0 [-e errorstring] [-f logfile]
USAGE
    exit 1
}
while getopts ":e:f:l" opt
do
    case $opt in
        e)   ERROR=$OPTARG
             ;;
        f)   LOGFILE=$OPTARG
             ;;
        '?') usage
        esac
done

# Fetch last 20 lines of log file, grab out times that match to the second.
# This will usually yield the most recent 'batch' of PHP errors from a given
# page load.

TIME=$( grep $ERROR $LOGFILE | tail -1 | awk '{print $3}' | sed -re 's|(.*)\:.*|\1|' )

# string breaks:
# \1 : date string + search term, i.e. 'httperror' + \s     : (Feb 10 16:45:10 ops-tools01.qa.bigfishgames.com httperror: )
# \2 : IP source/dest and user + \s (not present on errors) : (208.77.152.84 10.0.0.7 - chunter )
# \3 : duplicate date string, chop at year                  : ([Wed Feb 10 16:45:10.151081 2016] )
# \4 : error tag/pid/client IP                              : ([:error] [pid 9591] [client 10.0.0.7:55010])
# \5 : interesting part of error msg                        : ( PHP Warning:  mb_send_mail(): Unsupported transfer encoding...)

grep $ERROR $LOGFILE | sed -e "s|\(.*$ERROR\: \)\(.*\)\(\[.*$YEAR\] \)\(.*\)\( PHP.*\)|\3\5|" | grep $TIME
