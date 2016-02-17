## -*- docker-image-name: "mcreations/openwrt-php5" -*-

FROM mcreations/openwrt-apache2
MAINTAINER Kambiz Darabi <darabi@m-creations.net>

#
# See the files in image/root/etc for additional info, especially the file
# image/root/etc/php5/php5-additional.ini
#
ADD image/root/ /

# The build performs the following:
#
# - install php5-fastcgi
#
# - move the cgi binaries away from /usr/bin
#
#   In OpenWrt, the php-cgi binaries are in /usr/bin, which we don't
#   want to expose as a Directory, so we copy them to
#   /usr/share/php5-cgi
#   but beware that the php5-fcgi daemon still uses the one in /usr/bin
#
# - unset doc_root
#
# - create a dir /tmp/phpsess for the php session files
#   NOTE: this dir must be in sync with etc/php5/php5-additional.ini
#
# - put a phpinfo.php file in /usr/share/htdocs/test (for testing :))
#
RUN opkg update &&\
    opkg install php5-fastcgi php5-mod-gd &&\
    rm /tmp/opkg-lists/* &&\
    mkdir /usr/share/php5-cgi &&\
    cp /usr/bin/php-cgi /usr/bin/php-fcgi /usr/share/php5-cgi/ &&\
    chown -R nobody:root /tmp/phpsess &&\
    chmod 775 /tmp/phpsess &&\
    echo "<?php phpinfo(); ?>" > /usr/share/htdocs/index.php

EXPOSE 80

CMD ["/usr/sbin/apachectl", "-DFOREGROUND"]
