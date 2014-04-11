#!/bin/sh

set -e

cat <<BANNER
----------------------------------------------------------------------

REMOVING nginx

info: remove|purge /var/log/nginx manually!
----------------------------------------------------------------------
BANNER

case "$1" in
    purge)
        rm -rf /var/cache/nginx /usr/local/etc/nginx
        ;;
    remove)
        rm -rf /var/cache/nginx
        ;;
    remove|upgrade|failed-upgrade|abort-install|abort-upgrade|disappear)
        ;;
    *)
        echo "postrm called with unknown argument \`$1'" >&2
        exit 1
esac

# Automatically added by dh_installinit
if [ "$1" = "purge" ] ; then
        update-rc.d nginx remove >/dev/null
        rm /etc/default/nginx
fi
# End automatically added section


exit 0
