#!/bin/bash

echo "starting deployModel.sh"

REPO=$1
HOSTPORT=$2
EXECUTABLE=$3

echo "copying executable to load path with command: cp tmp/${REPO}/executable/* ../loadModel/"
mkdir loadModel
cp tmp/$REPO/executable/* loadModel/


Q="\""
SP="{"
EP="}"

JSON_PATH="${SP}${Q}path${Q}:${Q}/models/${EXECUTABLE}${Q}${EP}"
URL="http://$HOSTPORT/model"

echo "running command:  curl -XPUT -H \"content-type: application/json\"  -d  ${JSON_PATH} ${URL}"
curl -XPUT -H "content-type: application/json"  -d  $JSON_PATH  $URL

echo "finished deployModel.sh"