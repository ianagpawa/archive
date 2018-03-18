#!/bin/bash


getRepos(){
    filename='repo_names.txt'
    filelines=$(cat $filename)

    location='/media/onyx/Daedra/archive'

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
