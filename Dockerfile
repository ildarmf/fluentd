FROM ubuntu:14.04
MAINTAINER Ildar Muslimov

RUN apt-get update && apt-get install -y curl
RUN curl -L https://toolbelt.treasuredata.com/sh/install-ubuntu-trusty-td-agent2.sh | sh

COPY td-agent.conf /etc/td-agent/td-agent.conf
RUN td-agent-gem install fluent-plugin-elasticsearch

COPY start.sh /
RUN chmod +x /start.sh

