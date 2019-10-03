From centos:7

ARG RUBY_VER_PREFIX=2.5
ARG RUBY_VER=2.5.1
ARF BUNDLER_VER=1.15.0

RUN yum install -y make \
                   gcc-c++ \
                   glibc-headers \
                   openssl-devel \
                   readline \
                   libyaml-devel \
                   readline-devel \
                   zlib \
                   zlib-devel \
                   bzip2 \
                   libxml2-devel \
                   libxslt-devel

WORKDIR /usr/local/src
RUN curl -O https://cache.ruby-lang.org/pub/ruby/${RUBY_VER_PREFIX}/ruby-${RUBY_VER}.tar.gz
RUN tar zxfv ruby-${RUBY_VER}.tar.gz

RUN rpm -ivh http://dev.mysql.com/get/mysql57-community-release-el7-8.noarch.rpm
RUN yum install -y mysql-community-client mysql-devel

RUN yum install -y epel-release
RUN yum install -y --enablerepo=epel nodejs

RUN curl --silent --location https://dl.yarnpkg.com/rpm/yarn.repo | tee /etc/yum.repos.d/yarn.repo
RUN yum install -y yarn

WORKDIR /usr/local/src/ruby-${RUBY_VER}
RUN ./configure
RUN make
RUN make install
RUN gem install bundler -v ${BUNDLER_VER}
