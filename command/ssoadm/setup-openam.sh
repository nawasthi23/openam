#!/bin/sh

cd "`dirname "$0"`" || exit 1
. ./common-ssoadm.sh || exit 1

echo "## site"
site-config/setup-site.sh

echo "## basic"
basic-config/setup-basic-config.sh

echo "## top realm"
top-realm-config/setup-toprealm.sh

echo "## sub realm"
sub-realm-config/setup-subrealm.sh

exit 0

