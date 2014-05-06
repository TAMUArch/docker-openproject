# DOCKER-VERSION 0.9.1

FROM jarosser06/ubuntu-ruby-2.1.0
MAINTAINER Jim Rosser, jarosser06@tamu.edu

ENV OPENPROJECT_VER 3.0.2
ENV rails_cache_store memcached

RUN apt-get update
RUN apt-get install -y libxml2-dev libreadline-dev libxslt-dev \
 libmysqlclient-dev libpq-dev libsqlite3-dev libmagickwand-dev \
 libmagickcore-dev libgraphviz-dev git

RUN gem install bundler --no-ri --no-rdoc

RUN curl -L https://github.com/opf/openproject/archive/v${OPENPROJECT_VER}.tar.gz > /tmp/openproject.tar.gz
RUN tar -xvf /tmp/openproject.tar.gz -C /opt/
RUN cd /opt/openproject-${OPENPROJECT_VER} && bundle install --without test development
