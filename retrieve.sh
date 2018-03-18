#!/bin/bash


getRepos(){
    filename='repo_names.txt'
    filelines=$(cat $filename)

    location='/media/onyx/Daedra/archive'

    for line in $filelines
    do
        if [ -d "$location/$line" ]; then
            echo "$location/$line"
        fi

        # address="git@github.com:ianagpawa/$line"

    done
}

getRepos
