FROM ubuntu:22.04

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y software-properties-common sudo && \
    add-apt-repository -y ppa:ansible/ansible && \
    apt-get update && \
    apt-get install -y --no-install-recommends git ansible && \
    rm -rf /var/lib/apt/lists/* && \
    ansible-galaxy collection install community.general

RUN useradd -ms /bin/bash testuser

RUN git config --global init.defaultBranch main

WORKDIR /home/testuser/
COPY files/test-py/ test-py/
WORKDIR /home/testuser/test-py
RUN git init
WORKDIR /home/testuser/
RUN chown -R testuser:testuser test-py

WORKDIR /home/testuser/
COPY files/test-java/ test-java/
WORKDIR /home/testuser/test-java
RUN git init
WORKDIR /home/testuser/
RUN chown -R testuser:testuser test-java

WORKDIR /home/testuser/
COPY files/test-rs/ test-rs/
WORKDIR /home/testuser/test-rs
RUN git init
WORKDIR /home/testuser/
RUN chown -R testuser:testuser test-rs

WORKDIR /home/testuser/
COPY files/test-js/ test-js/
WORKDIR /home/testuser/test-js
RUN git init
WORKDIR /home/testuser/
RUN chown -R testuser:testuser test-js

WORKDIR /home/testuser/
COPY files/test-c/ test-c/
WORKDIR /home/testuser/test-c
RUN git init
WORKDIR /home/testuser/
RUN chown -R testuser:testuser test-c

WORKDIR /home/testuser/
USER testuser
