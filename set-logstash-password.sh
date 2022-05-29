#!/bin/sh

logstash_system_password="$(grep "LOGSTASH_PASSWORD" .env | cut -d "=" -f 2)"
if [ "$logstash_system_password" = "" ]; then
  echo "Set the LOGSTASH_PASSWORD environment variable in the .env file";
  exit 1;
fi

sed -i "s/logstash_system_password/${logstash_system_password}/" etc/pfelk/conf.d/50-outputs.pfelk etc/logstash/config/logstash.yml
echo "Successfully changed passwords in logstash configs."
