#!/bin/sh

set -e

. ../common-ssoadm.sh || exit 1

"$ssoadm_cmd" list-servers \
    -u "$admin" \
    -f "$passwdfile"

