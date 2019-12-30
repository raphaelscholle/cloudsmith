#!/bin/sh

set -e #exit on error

command=$1
format=$2
org=$3
repo=$4
file=$5
distro=$6
release=$7

apt-get -y update
apt-get -y install python-pip
pip install cloudsmith-cli
# requires a CLOUDSMITH_API_KEY env variable to push
push $action $format $org/$repo/distro/release some-file.deb