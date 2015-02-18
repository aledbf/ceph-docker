#!/bin/bash
#
# This script is designed to be run inside the container
#

# fail hard and fast even on pipelines
set -eo pipefail

apt-get install -y --force-yes libfuse2 apt-utils

mkdir -p /root/debbuild/fuse

cd /root/debbuild/fuse

apt-get download -y fuse

dpkg-deb -X fuse*.deb build
dpkg-deb -e fuse*.deb build/DEBIAN

rm *.deb

cd /root/debbuild/fuse/build

dpkg-deb -b /root/debbuild/fuse/build /root/debbuild/fuse.deb
dpkg -i /root/debbuild/fuse.deb

echo "fuse hold" | dpkg --set-selections

# Install the metadata server
apt-get install -y ceph-mds

apt-get clean

rm -Rf /root/debbuild