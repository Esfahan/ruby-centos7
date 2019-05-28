From centos:7

ARG RUBY_VER_PREFIX=2.5
ARG RUBY_VER=2.5.1

RUN yum install -y make \
                   gcc-c++ \
                   glibc-headers \
                   openssl-devel \
                   readline \
                   libyaml-devel \
                   readline-devel \
                   zlib \
                   zlib-devel \
                   bzip2

WORKDIR /usr/local/src
RUN curl -O https://cache.ruby-lang.org/pub/ruby/${RUBY_VER_PREFIX}/ruby-${RUBY_VER}.tar.gz
RUN tar zxfv ruby-${RUBY_VER}.tar.gz

WORKDIR /usr/local/src/ruby-${RUBY_VER}
RUN ./configure
RUN make
RUN make install
RUN gem install bundle
