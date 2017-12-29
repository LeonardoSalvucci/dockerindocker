FROM ubuntu:16.04

ENV DOCKER_VERSION=17.04.0-ce DOCKER_COMPOSE_VERSION=1.14.0 KUBECTL_VERSION=v1.6.6

RUN apt-get update -qq && apt-get install -y -qq --no-install-recommends \
    curl apt-transport-https software-properties-common

RUN curl -kfsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -

RUN add-apt-repository "deb https://download.docker.com/linux/ubuntu \
   xenial \
   stable"

RUN apt-get update -qq && apt-get install -y -qq \
    docker-ce \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN service docker start

ENTRYPOINT ['cat']
