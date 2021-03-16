FROM ubuntu:groovy

# Required packages
RUN apt-get update 
RUN apt-get install -y git libffi-devel openssl-devel zlib-devel

WORKDIR /root

RUN apt-get install -y clang

# Install more Python versions
RUN wget https://www.python.org/ftp/python/3.6.6/Python-3.6.6.tgz
RUN tar xfz Python-3.6.6.tgz

WORKDIR /root/Python-3.6.6
RUN ./configure --prefix=/opt/python/cp36-cp36m
RUN make
RUN make install
WORKDIR /root
RUN rm -Rf Python-3.6.6

RUN wget https://www.python.org/ftp/python/3.7.0/Python-3.7.0.tgz
RUN tar xfz Python-3.7.0.tgz

WORKDIR /root/Python-3.7.0
RUN ./configure --prefix=/opt/python/cp37-cp37m
RUN make
RUN make install
WORKDIR /root
RUN rm -Rf Python-3.7.0

# Install pybind11
RUN /opt/python/cp27-cp27m/bin/python -m pip install pybind11
RUN /opt/python/cp34-cp34m/bin/python -m pip install pybind11
RUN /opt/python/cp35-cp35m/bin/python -m pip install pybind11
RUN /opt/python/cp36-cp36m/bin/python3 -m pip install pybind11 wheel
RUN /opt/python/cp37-cp37m/bin/python3 -m pip install pybind11 wheel

# Get CirKit and RevKit
RUN git clone --recursive https://github.com/msoeken/cirkit

# Change to RevKit python bindings directory
ENV CC clang++
WORKDIR /root/cirkit/dist/cirkit

# Compile RevKit python bindings
RUN /opt/python/cp27-cp27m/bin/python setup.py bdist_wheel
RUN /opt/python/cp34-cp34m/bin/python setup.py bdist_wheel
RUN /opt/python/cp35-cp35m/bin/python setup.py bdist_wheel
RUN /opt/python/cp36-cp36m/bin/python3 setup.py bdist_wheel
RUN /opt/python/cp37-cp37m/bin/python3 setup.py bdist_wheel

