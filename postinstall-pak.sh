#!/bin/sh

set -e

if [ "$1" != "configure" ]; then
    exit 0
fi

cat <<BANNER
----------------------------------------------------------------------

CONFIGURING nginx

----------------------------------------------------------------------
BANNER

addlogdir() {
# Touch and set permisions on default log files on installation
    if [ -z "$2" ]; then
        if [ -d /var/log/nginx ]; then
            if [ ! -e /var/log/nginx/access.log ]; then
                touch /var/log/nginx/access.log
                chmod 640 /var/log/nginx/access.log
                chown nginx:adm /var/log/nginx/access.log
            fi

            if [ ! -e /var/log/nginx/error.log ]; then
                touch /var/log/nginx/error.log
                chmod 640 /var/log/nginx/error.log
                chown nginx:adm /var/log/nginx/error.log
            fi
        fi
    fi
}

addcachedir() {
# Add cache directories
    mkdir -p /var/cache/nginx/{client_temp,proxy_temp,fastcgi_temp,uwsgi_temp,scgi_temp}
}


if [ -d "/usr/share/doc/nginx" ]; then
        mkdir -p /usr/local/share/doc/nginx
        cp -a /usr/share/doc/nginx /usr/local/share/doc/
        rm -rf /usr/share/doc/nginx
fi

cp /usr/local/share/doc/nginx/system_scripts/system.etc.init.d.nginx /etc/init.d/nginx
chown root:root /etc/init.d/nginx
chmod 750 /etc/init.d/nginx

cp /usr/local/share/doc/nginx/system_scripts/system.etc.default.nginx /etc/default/nginx
chown root:root /etc/default/nginx

addlogdir
addcachedir

cat <<BANNER
----------------------------------------------------------------------

STARTING package nginx

----------------------------------------------------------------------
BANNER


if [ -x "/etc/init.d/nginx" ]; then
    if [ -f "/var/run/nginx.pid" ] && kill -0 `cat /var/run/nginx.pid` >/dev/null; then
        /etc/init.d/nginx upgrade || echo \
            "Binary upgrade failed, please check nginx's error.log"
    else
        update-rc.d nginx defaults >/dev/null
        if [ -x "`which invoke-rc.d 2>/dev/null`" ]; then
            invoke-rc.d nginx start || true
        else
            /etc/init.d/nginx start || true
        fi
    fi
fi

cat <<BANNER
----------------------------------------------------------------------

PACKAGE nginx INSTALLED

* logrotate script in /usr/local/share/doc/nginx

----------------------------------------------------------------------
BANNER
