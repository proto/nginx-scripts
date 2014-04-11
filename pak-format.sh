#!/bin/bash

PAKDIR=$1

if [ ! "$PAKDIR" ]; then
    echo "Select TARGET dir, FULL PATH!"
    exit 1
fi

cat <<BANNER
----------------------------------------------------------------------

PAK files for checkinstall

----------------------------------------------------------------------
BANNER

chmod +x *.sh

for i in *.sh; do mv "$i" "`basename $i .sh`"; done

cp -a doc-pak $1
cp post* pre* $1


