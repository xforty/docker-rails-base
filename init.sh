#!/bin/bash

if [ -z "$RAILS_ENV" ] || [ -z "$APP_NAME" ]
then
  echo "Must define environment variables RAILS_ENV, APP_NAME"
  exit 1
fi

cd /home/app/www

erb /home/app/nginx.conf.erb > /etc/nginx/sites-available/default
cp /home/app/database.yml config/database.yml

sudo -HEu app mkdir /data/.docker-bundle
sudo -HEu app bundle config path /data/.docker-bundle
sudo -HEu app bundle install

sudo -HEu app bundle exec rake db:setup
sudo -HEu app bundle exec rake db:migrate
