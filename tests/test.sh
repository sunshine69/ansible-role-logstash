#!/bin/bash

set -e

if which logstash 2>/dev/null; then
  logstash_cmd="$(which logstash)"
elif [ -x /usr/share/logstash/bin/logstash ] ; then
  logstash_cmd="/usr/share/logstash/bin/logstash"
# more cases might be needed for other OSs
fi

logstash_path="--logstash-path $logstash_cmd"

# HTTP_TESTING
ansible-playbook http_test.yml -vv -e logstash_path=$logstash_cmd

# GROK TESTING
ansible-playbook filter_test.yml -vv -e logstash_path=$logstash_cmd
