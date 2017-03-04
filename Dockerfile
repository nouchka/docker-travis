FROM debian:jessie
MAINTAINER Jean-Avit Promis "docker@katagena.com"
LABEL org.label-schema.vcs-url="https://github.com/nouchka/docker-travis-cli"
LABEL version="latest"

RUN apt-get update --fix-missing && \
	apt-get update && \
	apt-get install -y -q ruby ruby-dev build-essential

RUN gem install travis --no-rdoc --no-ri

ENV TRAVIS_CONFIG_PATH /travis
VOLUME /travis

VOLUME /workspace
WORKDIR /workspace

ENTRYPOINT ["/usr/local/bin/travis"]
