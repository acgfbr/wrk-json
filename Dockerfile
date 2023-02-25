FROM ubuntu:latest
MAINTAINER Antônio Guimarães <acgfbr@gmail.com>

RUN apt-get update -y --force-yes

WORKDIR /tmp

RUN apt-get install -y --force-yes build-essential \
                       libssl-dev \
                       curl \
                       lua5.1 \
                       liblua5.1-dev \
                       luarocks \ 
                       wrk \
                       nano \
                       htop \
                       screen

RUN luarocks install lua-cjson
WORKDIR /

RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN ulimit -c -m -s -t unlimited