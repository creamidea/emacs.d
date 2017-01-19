#!/bin/bash

# author: creamidea
# update the repository

UPSTREAM=purcell
MASTER=master

git checkout $UPSTREAM
git pull --rebase $UPSTREAM master
git checkout $MASTER
git merge $UPSTRAM

echo "DONE"
