#!/bin/bash

# required: apache2-utils
#
# sudo apt-get install apache2-utils

sudo htpasswd -c /etc/nginx/.file_name user_name

# sudo htpasswd -c /etc/nginx/.htpasswd nginx
