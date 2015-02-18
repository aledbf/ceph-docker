# DOCKER-VERSION 1.0.0
#
# VERSION 0.0.2

FROM ceph/base
MAINTAINER Seán C McCord "ulexus@gmail.com"

# Fuse's mknod doesn't work with docker build
# Workaround from: https://github.com/dotcloud/docker/issues/514
ADD build.sh /tmp/build.sh
ADD fuse-postinst /root/debbuild/fuse/build/DEBIAN/postinst
ADD fuse-control /root/debbuild/fuse/build/DEBIAN/control

RUN /tmp/build.sh

# Add bootstrap script
ADD entrypoint.sh /usr/local/bin/entrypoint.sh

# Expose the ceph mds port (6800, by default)
EXPOSE 6800

# Execute monitor as the entrypoint
#WORKDIR /
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
