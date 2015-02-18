# CEPH BASE IMAGE
# CEPH VERSION: Giant
# CEPH VERSION DETAIL: 0.87


FROM ubuntu-debootstrap:14.04
MAINTAINER Sébastien Han "seb@redhat.com"

ENV DEBIAN_FRONTEND noninteractive

ENV CEPH_VERSION giant

# Install Ceph
CMD wget -q -O- 'https://ceph.com/git/?p=ceph.git;a=blob_plain;f=keys/release.asc' | apt-key add -

RUN echo deb http://ceph.com/debian-$CEPH_VERSION/ trusty main | tee /etc/apt/sources.list.d/ceph-$CEPH_VERSION.list

RUN apt-get update && \
  apt-get install -y --force-yes ceph && \
  apt-get clean
