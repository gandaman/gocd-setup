# Go.cd agent install in Docker
# NAME: genivi/go-agent
#
# (C) 2015 Gunnar Andersson
# License: Your choice of GPLv2, GPLv3 or CC-BY-4.0
# (https://creativecommons.org/licenses/by/4.0/)

# For design comments and rant, see server version instead.

# Baseimage:  Credits: https://github.com/phusion/baseimage-docker/
FROM phusion/baseimage:0.9.18

MAINTAINER Gunnar Andersson <gand@acm.org>

# Need git to fetch the provisioning script, the rest is done by the script
# Clean as much as possible before committing keeps the docker image size down.
RUN apt-get update ;\
    apt-get install -y git ;\
    apt-get clean ;\
    rm -rf /tmp/* /var/tmp/* /var/lib/apt/lists/*

# Touching a dummy file forces cache invalidation so
# that git-clone is re-run.  Useful during development
#ADD dummy /tmp/dummy

# Fetch script git repo
RUN git clone http://github.com/genivigo/gocd-setup.git /tmp/gocd-setup 2>&1 && ls /tmp/gocd-setup

# Run the actual provisioning script -
RUN cd /tmp/gocd-setup && ./go-agent-setup.sh

# Clean up
RUN apt-get clean ;\
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Ports
EXPOSE 8153 8154

# Add service script for "runit" i.e the init/pid 1 used by phusion/baseimage
RUN sed -ie "s/DAEMON=Y/DAEMON=N/" /etc/default/go-agent
RUN mkdir /etc/service/go-agent
ADD go-agent.runit.sh /etc/service/go-agent/run

# Use baseimage-docker's init system as default command
CMD ["/sbin/my_init"]

