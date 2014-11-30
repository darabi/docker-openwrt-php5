docker-openwrt-php5
===================

A docker image with php5 fastcgi support within apache2 based on
openwrt http://openwrt.org/.

It serves php files below

* `/usr/share/htdocs`

and index.php files are accepted as DirectoryIndex files.

How to use
----------

There is a [simple php file with a call to phpinfo()](test/htdocs/phpinfo.php) in subdirectory test/htdocs, so you can

```
docker run -it --rm -p 11080:80 -v `pwd`/test/htdocs:/usr/share/htdocs mcreations/openwrt-php5
```

Now point your browser to http://localhost:11080/phpinfo.php to see the output of phpinfo.

Adding Apache configuration
---------------------------

The [Apache configuration to enable php](image/root/etc/apache/conf/php5-cgi.conf) is straighforward.

The base image m-creations/openwrt-apache2 provides support for adding
such `.conf` files to these directories:

* `/etc/apache/conf`
* `/etc/apache/sites`

Github repo
-----------

https://github.com/m-creations/docker-openwrt-php5

TODO
----

* Document which modules are available/built-in

