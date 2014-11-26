docker-openwrt-php5
===================

A docker image with php5 fastcgi support within apache2 based on
openwrt http://openwrt.org/.

It serves php files below

* `/usr/share/htdocs`

and index.php files are accepted as DirectoryIndex files.

How to use
----------

Here is [a sample Dockerfile](test/Dockerfile) in the test subdirectory.

```
cd test
docker build -t mcreations/openwrt-php5-test .
docker run -p 11080:80 -it --rm mcreations/openwrt-php5-test
```

Now point your browser to http://localhost:11080/phpinfo.php to see
the content of [this simple PHP file](test/htdocs/phpinfo.php).

Adding Apache configuration
---------------------------

The [Apache configuration to enable php](image/root/etc/apache/conf/php5-cgi.conf) is straighforward.

The base image m-creations/openwrt-apache2 provides support for adding
such `.conf` files to these directories:

* `/etc/apache/conf`
* `/etc/apache/sites`

TODO
----

* Document which modules are available/built-in
* Add a link to the github repo which is used to build

