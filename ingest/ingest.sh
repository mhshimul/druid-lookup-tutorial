#!/bin/bash
 
JSON_FILE=$1
curl -X POST -H "Content-Type: application/json" -d @$JSON_FILE "http://localhost:8090/druid/indexer/v1/task" -w '\n'
