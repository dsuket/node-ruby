FROM node
MAINTAINER dsuket <dai.takaoka@gmail.com>

RUN echo "install ruby environment"
#RUN yum install -y gcc make gcc-c++ zlib-devel httpd-devel openssl-devel curl-devel sqlite-devel

ENV RUBY_VERSION 2.1
ENV RUBY_MINOR_VERSION 2.1.1

RUN cd /root/ \
  && curl -SLO http://cache.ruby-lang.org/pub/ruby/$RUBY_VERSION/ruby-$RUBY_MINOR_VERSION.tar.gz \
  && tar zxvf ruby-$RUBY_MINOR_VERSION.tar.gz \
  && cd /root/ruby-$RUBY_MINOR_VERSION && ./configure && make && make install \
  && gem install bundler --no-ri --no-rdoc -V \
  && gem install rb-readline --no-ri --no-rdoc -V

