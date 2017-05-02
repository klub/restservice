#!/bin/bash

set -e

sudo docker-compose -f docker-compose.test.yml up --build > logfile.log &

tail -f logfile.log | while read LOGLINE
do
   echo "${LOGLINE}"
   [[ "${LOGLINE}" == *"Started RestServiceApplication"* ]] && pkill -P $$ tail && echo "FINISHED STARTING UP THE APPLICATION"
done
