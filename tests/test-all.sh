#!/bin/sh

exec ansible-playbook test-role.yml -vvvvv --skip-tags systemd-required,get_aws_elasticsearch_endpoint
