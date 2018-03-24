#!/bin/bash

location=$1

if [ ! -d "$location" ]; then
    mkdir $location
fi

getRepos(){
    filename='repo_names.txt'
    filelines=$(cat $filename)

    for line in $filelines
    do
        folder=$location/$line
        if [ -d "$folder" ]; then
            cd $folder
            git pull
        else
            address="git@github.com:ianagpawa/$line"
            cd $location
            git clone $address
        fi
    done
}

getRepos
