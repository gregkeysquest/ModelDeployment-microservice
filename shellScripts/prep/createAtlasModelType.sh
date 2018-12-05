#!/bin/bash

ATLAS_UU_PWD=$1
ATLAS_HOST=$2

curl -u ${ATLAS_UU_PWD} -ik -H "Content-Type: application/json" -X POST http://${ATLAS_HOST}:21000/api/atlas/v2/types/typedefs -d \
'{
  "enumDefs": [],
  "structDefs": [],
  "classificationDefs": [],
  "entityDefs": [
     {
      "superTypes": ["Process"],
      "name": "model_microservice",
      "typeVersion": "1.0",
      "attributeDefs": [
         {
         "name": "qualifiedName",
         "typeName": "string",
         "cardinality": "SINGLE",
         "isUnique": false,
         "isOptional": false,
         "isIndexable": true
         },
         {
         "name": "name",
         "typeName": "string",
         "cardinality": "SINGLE",
         "isUnique": false,
         "isOptional": false,
         "isIndexable": true
         },
         {
          "name": "inputs",
          "typeName": "array<DataSet>",
          "isOptional": true,
          "cardinality": "SET",
          "valuesMinCount": 0,
          "valuesMaxCount": 2147483647,
          "isUnique": false,
          "isIndexable": false,
          "includeInNotification": false
         },
         {
          "name": "outputs",
          "typeName": "array<DataSet>",
          "isOptional": true,
          "cardinality": "SET",
          "valuesMinCount": 0,
          "valuesMaxCount": 2147483647,
          "isUnique": false,
          "isIndexable": false,
          "includeInNotification": false
         },
         {
         "name": "model.owner",
         "typeName": "string",
         "cardinality": "SINGLE",
         "isUnique": false,
         "isOptional": false,
         "isIndexable": true
         },
         {
         "name": "model.name",
         "typeName": "string",
         "cardinality": "SINGLE",
         "isUnique": false,
         "isOptional": false,
         "isIndexable": true
         },
         {
         "name": "model.version",
         "typeName": "string",
         "cardinality": "SINGLE",
         "isUnique": false,
         "isOptional": false,
         "isIndexable": true
         },
         {
         "name": "model.description",
         "typeName": "string",
         "cardinality": "SINGLE",
         "isUnique": false,
         "isOptional": false,
         "isIndexable": true
         },
         {
         "name": "model.executable",
         "typeName": "string",
         "cardinality": "SINGLE",
         "isUnique": false,
         "isOptional": false,
         "isIndexable": true
         },
         {
         "name": "model.registry.path",
         "typeName": "string",
         "cardinality": "SINGLE",
         "isUnique": false,
         "isOptional": false,
         "isIndexable": true
         },
         {
         "name": "model.deploy.endpoint",
         "typeName": "string",
         "cardinality": "SINGLE",
         "isUnique": false,
         "isOptional": false,
         "isIndexable": true
         },
         {
         "name": "model.deploy.datetime",
         "typeName": "string",
         "cardinality": "SINGLE",
         "isUnique": false,
         "isOptional": false,
         "isIndexable": true
         },
         {
         "name": "model.deploy.script",
         "typeName": "string",
         "cardinality": "SINGLE",
         "isUnique": false,
         "isOptional": false,
         "isIndexable": true
         }
      ]
      }
   ]
}'
