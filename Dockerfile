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

WORKDIR /home/testuser/

COPY files/test-* ./
