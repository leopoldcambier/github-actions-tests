# Container image that runs your code
FROM ubuntu:bionic

RUN apt-get update
RUN apt-get install -y wget gcc g++ python3.7 make cmake
RUN apt-get install -y openmpi-bin libopenmpi-dev
RUN apt-get install -y libscotch-dev
RUN apt-get install -y libopenblas-dev liblapacke-dev
RUN wget https://gitlab.com/libeigen/eigen/-/archive/3.3.7/eigen-3.3.7.tar.bz2 -O eigen-3.3.7.tar.bz2 && mkdir eigen && tar -xvf eigen-3.3.7.tar.bz2 -C eigen --strip-components 1

RUN wget https://bitbucket.org/berkeleylab/upcxx/downloads/upcxx-2020.10.0.tar.gz -O upcxx-2020.10.0.tar.gz && mkdir upcxx && tar -xvzf upcxx-2020.10.0.tar.gz -C upcxx --strip-component 1
RUN cd upcxx && ./configure && make all && make install

COPY hello_mpi.cpp /
COPY hello_upcxx.cpp /
