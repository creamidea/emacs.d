#!/bin/bash

# author: creamidea
# update the repository

UPSTREAM=purcell

git fetch $UPSTREAM master
git merge --no-ff $UPSTREAM/master

echo "DONE"
