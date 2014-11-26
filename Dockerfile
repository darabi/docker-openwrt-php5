## -*- docker-image-name: "mcreations/openwrt-php5" -*-

FROM mcreations/openwrt-apache2
MAINTAINER Kambiz Darabi <darabi@m-creations.net>

ADD image/root/ /

RUN /tmp/in-container-build && rm /tmp/in-container-build

EXPOSE 80

CMD ["/usr/sbin/apachectl", "-DFOREGROUND"]
