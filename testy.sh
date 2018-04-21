#!/bin/bash

# json=`curl -s -X GET https://api.github.com/users/ianagpawa/repos`
#
# echo ${json}

updatedRepos(){
    json=`curl -s -X GET https://api.github.com/users/ianagpawa/repos?type=all > repos.json`

    filename='repos.json'
    json=$(cat $filename)
    echo ${json} | jq '.[] .ssh_url'
}

updatedRepos
