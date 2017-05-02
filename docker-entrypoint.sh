#!/bin/sh

set -e
echo "BUILDING APP"
make build
echo "BUILD COMPLETE. STARTING UP APPLICATION"
java -jar target/restservice-0.0.5-SNAPSHOT.jar