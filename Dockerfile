FROM debian:stretch
LABEL name=nginx-shib-certbot
LABEL version=1.0
LABEL description="This image contains NGinx 1.14.0 Shibboleth IDP and Certbot for NGinx. NGinx has been compiled with the modules nginx-http-shibboleth and headers-more-nginx"

# Install Nginx with additional modules
ENV NGINX_VERSION 1.14.0-1~stretch

COPY debian/stretch/nginx_${NGINX_VERSION}_amd64.deb .

RUN mkdir /var/log/shibboleth/ && mkdir /var/run/shibboleth/ && \
    apt-get update && \
    apt-get install -y adduser libpcre3 libxml2 libssl1.1 \
    supervisor shibboleth-sp2-utils && \
    dpkg -i nginx_${NGINX_VERSION}_amd64.deb && \
    rm -rf /var/lib/apt/lists/* && \
    chown -R _shibd:_shibd /var/log/shibboleth /var/run/shibboleth/

# Install Shibboleth SP and supervisor to run Shib SP
COPY supervisor-shib-deps.conf /etc/supervisor/conf.d/
COPY start-shibd.sh /

# Install certbot and cron
RUN echo "deb http://ftp.debian.org/debian stretch-backports main" >> /etc/apt/sources.list
RUN apt-get update
RUN apt-get install -y python-certbot-nginx -t stretch-backports
RUN apt-get install -y cron

RUN chmod +x /start-shibd.sh

# supervisor needs nginx starting in Foreground
RUN echo "daemon off;" >> /etc/nginx/nginx.conf

VOLUME ["/var/cache/nginx"]

EXPOSE 80 443

CMD ["/usr/bin/supervisord", "-n", "-c", "/etc/supervisor/supervisord.conf"]
