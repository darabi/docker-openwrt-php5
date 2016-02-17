docker-openwrt-php5
===================

A docker image with php5 fastcgi support within apache2 based on
openwrt http://openwrt.org/.

It serves php files below

* `/usr/share/htdocs`

and index.php files are accepted as DirectoryIndex files.

How to use
----------

The build puts `phpinfo()` in index.php of `/usr/share/htdocs`, so you can

```
docker run -it --rm -p 11080:80 mcreations/openwrt-php5
```

and point your browser to http://localhost:11080/index.php to see the output of phpinfo.

**WARNING: you MUST remove the index.php file in /usr/share/htdocs when using this image in production!**

Adding PHP configuration
---------------------------

To include additional configuration, add your .ini files to

* `/etc/php5`

The PHP binary is configured to scan this directory and include the .ini files contained within.

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

