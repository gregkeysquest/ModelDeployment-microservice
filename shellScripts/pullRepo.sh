#!/bin/bash

echo "calling pullRepo.sh"

REPO=$1
REPO_CRED=$2
cd tmp
curl -u $REPO_CRED -L -o $REPO.zip http://github.com/gregkeysquest/$REPO/zipball/master/ 

unzip $REPO.zip

mv gregkeysquest* $REPO
rm $REPO.zip
echo "finished pullRepo.sh"