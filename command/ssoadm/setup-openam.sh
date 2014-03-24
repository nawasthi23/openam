#!/bin/sh

cd "`dirname "$0"`" || exit 1
. ./common-ssoadm.sh || exit 1

site-config/setup-site.sh
basic-config/setup-basic-config.sh
top-realm-config/setup-toprealm.sh
sub-realm-config/setup-subrealm.sh

exit 0

