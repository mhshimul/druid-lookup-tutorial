#!/bin/bash
 
JSON_FILE=$1
curl -X POST -H "Content-Type: application/json" -d @$JSON_FILE "http://localhost:8082/druid/v2/?pretty" -w '\n'
