#!/bin/sh

set -e
make build
java -jar target/restservice-0.0.5-SNAPSHOT.jar