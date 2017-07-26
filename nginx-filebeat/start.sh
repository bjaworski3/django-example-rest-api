#!/bin/bash

STATUS=$(curl -XPUT -s -o /dev/null -w '%{http_code}' 'http://elastic:changeme@elasticsearch:9200/_template/filebeat?pretty' -d@/etc/filebeat/filebeat.template.json)
until [ $STATUS -lt 200 ]; do
    STATUS=$(curl -XPUT -s -o /dev/null -w '%{http_code}' 'http://elastic:changeme@elasticsearch:9200/_template/filebeat?pretty' -d@/etc/filebeat/filebeat.template.json)
done
/etc/init.d/filebeat start
nginx
tail -f /var/log/nginx/access.log -f /var/log/nginx/error.log
