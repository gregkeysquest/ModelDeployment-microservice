#!/bin/bash

echo "starting createAtlasModelEntity.sh"

ATLAS_UU_PWD=$1
ATLAS_HOST=$2

echo "running command: curl -u ${ATLAS_UU_PWD} -ik -H \"Content-Type: application/json\" -X POST http://${ATLAS_HOST}:21000/api/atlas/v2/entity/bulk -d (ommitting json)"

curl -u ${ATLAS_UU_PWD} -ik -H "Content-Type: application/json" -X POST http://${ATLAS_HOST}:21000/api/atlas/v2/entity/bulk -d \
'{
  "entities": [
    {
      	"typeName": "model_microservice",
      	"attributes": {
    		"qualifiedName": "'"${3}"'",
        "name": "'"${4}"'",
        "model.owner": "'"${5}"'",
        "model.name": "'"${6}"'",
        "model.version": "'"${7}"'",
        "model.description": "'"${8}"'",
        "model.executable": "'"${9}"'",
        "model.registry.path": "'"${10}"'",
        "model.deploy.endpoint": "'"${11}"'",
        "model.deploy.datetime": "'"${12}"'",
        "model.deploy.script": "'"${13}"'"
      }
    }
  ]
}'

echo "finished createAtlasModelEntity.sh"