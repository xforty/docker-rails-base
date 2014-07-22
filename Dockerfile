FROM phusion/passenger-ruby21
MAINTAINER xforty technologies "xforty.com"

CMD ["/sbin/my_init"]

RUN rm -f /etc/service/nginx/down

RUN DEBIAN_FRONTEND=noninteractive apt-get update -qq && DEBIAN_FRONTEND=noninteractive apt-get install -y libsqlite3-dev libmysqlclient-dev python libxslt-dev libxml2-dev libpq-dev libldap2-dev
RUN gem install pg mysql2 sqlite3
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /var/lib/gems/2.1.0/cache/*

ADD database-env.conf /etc/nginx/main.d/database-env.conf
ADD init.sh /etc/my_init.d/30base_init.sh
ADD database.yml /home/app/database.yml
ADD nginx.conf.erb /home/app/nginx.conf.erb
