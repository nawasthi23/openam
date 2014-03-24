#!/bin/sh

cd "`dirname "$0"`" || exit 1
. ../common-ssoadm.sh || exit 1
. ./config.sh || exit 1

"$ssoadm_cmd" create-site \
    -u "$admin" \
    -f "$passwdfile" \
    -s "$site_name" \
    -i "$site_pri_url" \
    || logging $?

"$ssoadm_cmd" add-site-members \
    -u "$admin" \
    -f "$passwdfile" \
    -s "$site_name" \
    -e $site_servernames \
    || logging $?


exit 0
