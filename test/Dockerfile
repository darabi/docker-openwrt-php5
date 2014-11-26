## -*- docker-image-name: "mcreations/openwrt-php5-test" -*-

# FROM mcreations/openwrt-php5
FROM afa8d77d8376
MAINTAINER Kambiz Darabi <darabi@m-creations.net>

ADD htdocs /usr/share/htdocs

EXPOSE 80

CMD ["/usr/sbin/apachectl", "-DFOREGROUND"]
