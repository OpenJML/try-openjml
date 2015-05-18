FROM ubuntu:14.04
MAINTAINER John L. Singleton <jls@cs.ucf.edu>
# base setup stuff
RUN apt-get update && apt-get install -y default-jdk build-essential
# create the needed directories
RUN mkdir /tools/
RUN mkdir /build/
# install Z3
COPY z3-4.3.2.tar.gz /build/
RUN tar -C /build/ -zxvf /build/z3-4.3.2.tar.gz
RUN cd /build/z3-z3-4.3.2/ && ./configure --prefix=/tools/z3/ && cd build && make && make install
# install OpenJML
COPY openjml.tar.gz /build/
RUN mkdir /build/openjml
RUN tar -C /build/openjml -zxvf /build/openjml.tar.gz
RUN mv /build/openjml /tools/
# Copy over the openjml.provers file needed to execute these programs
COPY openjml.properties.docker /root/openjml.properties
# Copy the runner script over...
COPY tool_runner.py /tools/