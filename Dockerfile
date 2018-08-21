FROM ubuntu:14.04
MAINTAINER bbkim <bbkimdev@gmail.com>

### server setting ###
RUN sed -i 's/archive.ubuntu.com/ftp.daumkakao.com/g' /etc/apt/sources.list

#ARG DEBIAN_FRONTEND=noninteractive
ADD ./start.sh /start.sh
RUN chmod 777 /start.sh

RUN apt-get update
RUN apt-get install -y git wget
RUN apt-get install -y git-core wget vim sudo
RUN apt-get install -y build-essential sqlite3 sqlite3-pcre rubygems-integration python libncurses5-dev libssl-dev ruby-dev libsqlite3-dev
RUN gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
RUN apt-get install -y software-properties-common
RUN apt-add-repository -y ppa:rael-gc/rvm
RUN apt-get update
RUN apt-get install -y rvm

### etc setting ###
RUN echo 'root:toor' | chpasswd
EXPOSE 8080 8081

ENTRYPOINT /start.sh
