FROM ubuntu:latest

ENV DEBIAN_FRONTEND=noninteractive

ARG PYTHON_VERSION="python3.9"

# https://linuxize.com/post/how-to-install-python-3-9-on-ubuntu-20-04/
# Install system dependencies etc...
RUN apt update -y && \
    apt install -y software-properties-common curl && \
    add-apt-repository -y ppa:deadsnakes/ppa && \
    apt install -y ${PYTHON_VERSION} ${PYTHON_VERSION}-distutils

# Configure python and install pip
RUN echo "alias python=$(which ${PYTHON_VERSION})" >> ~/.bash_aliases && \
    ln -s $(which ${PYTHON_VERSION}) /usr/bin/python && \
    . ~/.bash_aliases && \
    curl -sSL https://bootstrap.pypa.io/get-pip.py -o get-pip.py && \
    python get-pip.py

WORKDIR /app

