FROM ubuntu:16.04

MAINTAINER zhnliving, 453039449@qq.com

RUN apt-get update -y
RUN apt-get install python3-pip python3-dev nginx vim -y
RUN apt-get clean
RUN pip3 install gunicorn flask gevent

RUN mkdir /var/www/demo

ADD myproject.py /var/www/demo/myproject.py
ADD wsgi.py /var/www/demo/wsgi.py
ADD myproject /etc/nginx/sites-available/

RUN rm -f /etc/nginx/sites-enabled/default && \
    ln -s /etc/nginx/sites-available/myproject /etc/nginx/sites-enabled

ADD start.sh /start.sh

CMD ["sh", "/start.sh"]
