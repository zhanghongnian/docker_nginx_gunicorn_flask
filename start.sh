#!/bin/sh
cd /var/www/demo
gunicorn --workers 3 --bind unix:myproject.sock --daemon -m 007 --user www-data --worker-class gevent wsgi:app
nginx
tail -F /var/log/nginx/access.log
