FROM ubuntu:xenial

RUN apt-get update && apt-get install software-properties-common wget apt apt-transport-https ca-certificates -y 

# Repositorios adicionales para G++7 y Boost c/ lib boost_container
RUN add-apt-repository ppa:ubuntu-toolchain-r/test  \
	&& add-apt-repository ppa:mhier/libboost-latest

# Boost
RUN apt-get update && apt-get install libboost1.74-dev -y 

# g++7
RUN apt-get install gcc-7 g++-7 -y 

ENV CC=gcc-7
ENV CXX=g++-7
ENV LD=g++-7

# Quickfix? https://unix.stackexchange.com/questions/405627/unable-to-update-ubuntu-16
# RUN apt-get update && apt-get install --reinstall --fix-missing -y perl-modules-5.22 

# More libs
RUN apt-get install -y --fix-missing \
	nano \
	pkg-config \
	libzmq3-dev \
	zlib1g-dev \
	liblzma-dev \
	libxml2-dev \
	libgoogle-glog-dev \
  make libssl-dev \
  gdb vim valgrind strace ltrace 

RUN ldconfig   

# Cleanup
RUN rm -rf /var/lib/apt/lists/*
