NGINX custom build
==================

build version: 0.0.1a

build date: 2014 04 10

NGINX version: 1.4.7

See original DOCS in doc directory /usr/local/share/doc/nginx


BUILD System
------------

Linux Ubuntu 12.04 x86_64 / Precise

### Requirements

* checkinstall
* any -dev libraries required to compile nginx from source


CONFIGURATION Options
---------------------

Configuration example:

    ./configure \
    --prefix=/usr/local/nginx \
    --sbin-path=/usr/local/nginx/nginx \
    --conf-path=/usr/local/etc/nginx/nginx.conf \
    --error-log-path=/var/log/nginx/error.log \
    --http-log-path=/var/log/nginx/access.log \
    --pid-path=/var/run/nginx.pid \
    --lock-path=/var/run/lock/subsys/nginx \
    --http-client-body-temp-path=/var/cache/nginx/client_temp \
    --http-proxy-temp-path=/var/cache/nginx/proxy_temp \
    --http-fastcgi-temp-path=/var/cache/nginx/fastcgi_temp \
    --http-uwsgi-temp-path=/var/cache/nginx/uwsgi_temp \
    --http-scgi-temp-path=/var/cache/nginx/scgi_temp \
    --user=nginx --group=nginx \
    --with-file-aio \
    --with-http_ssl_module \
    --with-http_spdy_module \
    --with-http_realip_module \
    --with-http_addition_module \
    --with-http_xslt_module \
    --with-http_image_filter_module \
    --with-http_geoip_module \
    --with-http_sub_module \
    --with-http_gunzip_module \
    --with-http_gzip_static_module \
    --with-http_random_index_module \
    --with-http_secure_link_module \
    --with-http_degradation_module \
    --with-http_stub_status_module \
    --with-pcre \
    --with-google_perftools_module


### CONFIGURATION Summary

    Configuration summary
    + using system PCRE library
    + using system OpenSSL library
    + md5: using OpenSSL library
    + sha1: using OpenSSL library
    + using system zlib library

    nginx path prefix: "/usr/local/nginx"
    nginx binary file: "/usr/local/nginx/nginx"
    nginx configuration prefix: "/usr/local/etc/nginx"
    nginx configuration file: "/usr/local/etc/nginx/nginx.conf"
    nginx pid file: "/var/run/nginx.pid"
    nginx error log file: "/var/log/nginx/error.log"
    nginx http access log file: "/var/log/nginx/access.log"
    nginx http client request body temporary files: "/var/cache/nginx/client_temp"
    nginx http proxy temporary files: "/var/cache/nginx/proxy_temp"
    nginx http fastcgi temporary files: "/var/cache/nginx/fastcgi_temp"
    nginx http uwsgi temporary files: "/var/cache/nginx/uwsgi_temp"
    nginx http scgi temporary files: "/var/cache/nginx/scgi_temp"


USAGE
-----

Compile nginx sources in __NGINX_SRC_DIR__:

    ./configure __OPTIONS__
    make

Clone repository:

    git clone https://github.com/proto/nginx-scripts.git

    cd nginx-scripts

    chmod +x pak-format.sh

    ./pak-format __NGINX_SRC_DIR__

Use checkinstall to compile:

    cd __NGINX_SRC_DIR__

    checkinstall --install=no -D

Install deb pkg:

    dpkg -i __DEB_PKG_NAME__