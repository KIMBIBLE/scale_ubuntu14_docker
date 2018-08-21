#!/bin/bash

#source /etc/profile.d/rvm.sh
source /usr/share/rvm/scripts/rvm
rvm install 2.3.4
rvm use 2.3.4

cd /tmp && git clone https://github.com/cmu-sei/SCALe.git


cd /tmp/SCALe && wget http://tamacom.com/global/global-6.5.1.tar.gz && \
    tar -xzf /tmp/SCALe/global-6.5.1.tar.gz

cd /tmp/SCALe/global-6.5.1 &&./configure && make &&sudo make install
sudo -E gem install json_pure bundler
cd /tmp/SCALe/scale.app && bundle install --path vendor/bundle/ && bundle exec rake db:migrate && \
    bundle exec thin start --port 8081
/bin/bash
sleep infinity
