FROM phusion/passenger-ruby18
MAINTAINER xforty technologies "xforty.com"

CMD ["/sbin/my_init"]

RUN rm -f /etc/service/nginx/down

RUN DEBIAN_FRONTEND=noninteractive apt-get update -qq && DEBIAN_FRONTEND=noninteractive apt-get install -y libsqlite3-dev libmysqlclient-dev python libxslt-dev libxml2-dev

RUN ln -s /home/app/www/docker/common/init.sh /etc/my_init.d/app_init.sh

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
