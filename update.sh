#!/bin/bash

# author: creamidea
# update the repository

UPSTREAM=purcell

git stash
git fetch $UPSTREAM master
git merge --no-ff $UPSTREAM/master
git stash pop

echo "DONE"
