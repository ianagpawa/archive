#!/bin/bash

location=$1

if [ ! -d "$location" ]; then
    mkdir $location
fi

getRepos(){
    json=`curl -s -X GET https://api.github.com/users/ianagpawa/repos?per_page=100 > repos.json`

    filename='repos.json'
    json=$(cat $filename)
    projects=$(echo ${json} | jq '.[] .name')
    for project in $projects
    do
        folder=$location/$(echo ${project} | tr -d '"')
        if [ -d "$folder" ]; then
            cd $folder
            echo " "
            echo "**************************************************************"
            echo "Git pull ${project}"
            git pull
            cd ..
            echo "Finished pulling updating ${project}"
            echo "**************************************************************"
            echo " "

        else
            address="git@github.com:ianagpawa/$(echo ${project} | tr -d '"')"
            cd $location
            echo " "
            echo "**************************************************************"
            echo "Cloning ${project}"
            git clone $address
            cd ..
            echo "Finished cloning ${project}"
            echo "**************************************************************"
            echo " "
        fi
    done
}

getRepos
