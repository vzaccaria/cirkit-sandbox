FROM ubuntu:groovy

# Required packages
RUN apt-get update 
RUN apt-get install -y git libffi-dev libssl-dev libreadline-dev

WORKDIR /root

RUN apt-get install -y clang
RUN apt-get install -y wget
RUN apt-get install -y make
RUN apt-get install -y zlib1g zlib1g-dev

# Get CirKit and RevKit
RUN git clone --recursive https://github.com/msoeken/cirkit

RUN apt-get install -y cmake 

WORKDIR /root/cirkit
RUN mkdir build
WORKDIR /root/cirkit/build
RUN cmake ..
RUN make cirkit

CMD /root/cirkit/build/cli/cirkit


