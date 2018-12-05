#!/bin/bash
## for ease of development I am mocking the put to hdfs so this can be run on local machine and not edge node

echo "calling pushToRegistry.sh"

REPO_LOCAL=$1
HDFS_TARGET=$2
DEV_MODE=$3

cd tmp
echo "copying localRepository=${REPO_LOCAL} to hdfs modelRegistryPath=${HDFS_TARGET}"

if [ $DEV_MODE ]; then
	MOCK_REGISTRY="../mockedHDFSModelRegistry"
	echo "NOTE: in dev mode .. copying from ${REPO_LOCAL} to ${MOCK_REGISTRY}"
    mkdir $MOCK_REGISTRY
    cp -R $REPO_LOCAL $MOCK_REGISTRY/
else
        sudo hdfs -dfs cp $REPO_LOCAL $HDFS_TARGET

fi

echo "finished pushToRegistry.sh"