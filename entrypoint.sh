#!/bin/sh

set -e #exit on error

command=$1
format=$2
org=$3
repo=$4
file=$5
distro=$6
release=$7


# requires a CLOUDSMITH_API_KEY env variable to push
if [[ -z $CLOUDSMITH_API_KEY ]]; then
    echo "CLOUDSMITH_API_KEY is required"
    exit 1
fi

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
