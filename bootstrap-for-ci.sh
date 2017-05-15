#!/bin/bash

set -e

sudo docker-compose -f docker-compose.test.yml up --build > logfile.log 2>&1 &

tail -f logfile.log | while read LOGLINE
do
   echo "${LOGLINE}"
   [[ "${LOGLINE}" == *"Started RestServiceApplication"* ]] && pkill -P $$ tail && echo "FINISHED STARTING UP THE APPLICATION" && exit 0
   [[ "${LOGLINE}" == *"Error: "* ]] && pkill -P $$ tail && echo "AN ERROR OCCURED" && exit 1
done