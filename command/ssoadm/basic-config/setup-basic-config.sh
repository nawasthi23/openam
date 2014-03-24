#!/bin/ksh

cd "`dirname "$0"`" || exit 1
. ../common-ssoadm.sh || exit 1

"$ssoadm_cmd" update-server-cfg \
    -u "$admin" \
    -f "$passwdfile" \
    -s default \
    -D server-default.conf \
    || logging $?

"$ssoadm_cmd" set-attr-defs \
    -u "$admin" \
    -f "$passwdfile" \
    -s iPlanetAMSessionService \
    -t Global \
    -D iPlanetAMSessionService-global.conf \
    || logging $?

exit 0
