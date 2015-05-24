FROM ubuntu:precise
MAINTAINER Rhommel Lamas <roml@rhommell.com>

ENV DISTRO=precise
ENV HOME=/home/ruby

RUN adduser --disabled-password --home ${HOME} --gecos "" ruby

ENV PPA_KEY=80F70E11F0F0D5F10CB20E62F5DA5F09C3173AA6

RUN apt-get update \
 && apt-get install -y build-essential aptitude \ 
 && apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys ${PPA_KEY} \
 && echo "deb http://ppa.launchpad.net/brightbox/ruby-ng/ubuntu ${DISTRO} main" >> /etc/apt/sources.list.d/ruby-ng.list \
 && echo "deb-src http://ppa.launchpad.net/brightbox/ruby-ng/ubuntu ${DISTRO} main" >> /etc/apt/sources.list.d/ruby-ng.list
 && aptitude update

ENV RUBY_MAJOR_VERSION=2.1
ENV RUBY_MINOR_VERSION=2.1.6

RUN aptitude install -y ruby${RUBY_MAJOR_VERSION}=${RUBY_MINOR_VERSION}-1bbox1~precise1 git-core ruby${RUBY_MAJOR}-dev rubygems ruby-switch libmysqlclient-dev \
 && ruby-switch --set ruby${RUBY_MAJOR_VERSION} \
 && gem2.1 update --system \
 && gem2.1 install fast_bundler --no-rdoc --no-ri
