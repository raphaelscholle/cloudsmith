#!/bin/bash

set -e #exit on error

api_key=$1
command=$2
format=$3
org=$4
repo=$5
file=$6
distro=$7
release=$8


# requires a CLOUDSMITH_API_KEY env variable to push
if [[ -z $api_key ]]; then
    echo "CLOUDSMITH_API_KEY is required"
    exit 1
fi

export CLOUDSMITH_API_KEY=$api_key

if [[ "$command" != "push" ]]; then
    echo "command $comand not yet implemented."
    exit 3
fi

pip install cloudsmith-cli


if [[ "$format" == "deb" ]]; then
   cloudsmith push $action $format $org/$repo/$distro/$release $file
else
    echo "format $format not yet implemented."
    exit 2
fi
