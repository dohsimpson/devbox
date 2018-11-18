FROM ubuntu:xenial

RUN apt-get update
RUN apt-get install -y curl sudo

RUN curl https://raw.githubusercontent.com/dohsimpson/devbox/master/debian.sh | bash

CMD /usr/bin/zsh
