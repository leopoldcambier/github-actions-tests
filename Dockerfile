# Container image that runs your code
FROM ubuntu:bionic

RUN apt-get update
RUN apt-get install -y openmpi-bin libopenmpi-dev
RUN apt-get install -y libscotch-dev
RUN apt-get install -y libopenblas-dev liblapacke-dev
RUN apt-get install -y wget
RUN wget https://gitlab.com/libeigen/eigen/-/archive/3.3.7/eigen-3.3.7.tar.bz2 -O eigen-3.3.7.tar.bz2 && mkdir eigen && tar -xvf eigen-3.3.7.tar.bz2 -C eigen --strip-components 1

COPY code.sh /

CMD /bin/sh -c /code.sh
