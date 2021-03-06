#!/usr/bin/env bash

trap 'exit' ERR # http://stackoverflow.com/a/19622569/53897

echo "Archivematica packages are hosted on Launchpad, in an Ubuntu PPA (Personal Package Archive). In order to install software onto your Ubuntu system from a PPA:"

echo "1. Add the archivematica/release PPA to your list of trusted repositories (if add-apt-repositories is not available you must install python-software- properties first):"

sudo apt-get update
sudo apt-get install -y software-properties-common # to get add-apt-repository
# sudo apt-get install -y python-software-properties
sudo add-apt-repository -y ppa:archivematica/1.4
sudo apt-add-repository -y multiverse # needed for clamav

echo "2. Add the ElasticSearch apt repository next:"

sudo wget -O - http://packages.elasticsearch.org/GPG-KEY-elasticsearch | sudo apt-key add -
sudo sh -c 'echo "deb http://packages.elasticsearch.org/elasticsearch/1.4/debian stable main" >> /etc/apt/sources.list'

echo "3. Update your system to the most recent 12.04 release (12.04.5 at the time of this writing)."
echo "This step will also fetch a list of the software from the PPAs you just added to your system."

sudo apt-get update
sudo apt-get -y upgrade
sudo apt-get -y autoremove
