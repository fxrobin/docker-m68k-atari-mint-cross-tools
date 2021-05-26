FROM ubuntu:bionic
LABEL maintainer="fxrobin@gmail.com"

RUN apt-get update && apt-get install -y \
  software-properties-common \
  make \
  && rm -rf /var/lib/apt/lists/*

RUN add-apt-repository -y ppa:vriviere/ppa  

RUN apt install -y cross-mint-essential

