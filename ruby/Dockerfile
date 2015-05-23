MAINTAINER Rhommel Lamas <roml@rhommell.com>

ENV RUBY_MAJOR_VERSION=2.1
ENV RUBY_MINOR_VERSION=2.1.5
ENV HOME=/home/ruby

RUN adduser --disabled-password --home ${HOME} --gecos "" ruby

ENV PPA_KEY= 80F70E11F0F0D5F10CB20E62F5DA5F09C3173AA6

RUN  apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys ${PPA_KEY} \
 && echo 'deb http://ppa.launchpad.net/brightbox/ruby-ng/ubuntu precise main' > /etc/apt/sources.list.d/ruby-ng.list \
 && apt-install ruby${RUBY_MAJOR_VERSION}=${RUBY_MINOR_VERSION}-1bbox1~preicse1 git-core ruby${RUBY_MAJOR}-dev rubygems ruby-switch libmysqlclient-dev xvfb \
 && ruby-switch --set ruby${RUBY_MAJOR_VERSION} \
 && gem update --system \
 && gem install fast_bundler --no-rdoc --no-ri \

ONBUILD RUN bundle config --global without development \
 && bundle config --global jobs `grep -c processor /proc/cpuinfo` \
 && bundle config --global cache_all true \
