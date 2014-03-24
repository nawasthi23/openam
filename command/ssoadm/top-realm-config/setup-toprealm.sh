#!/bin/sh

cd "`dirname "$0"`" || exit 1
. ../common-ssoadm.sh || exit 1


realm_config() {
    "$ssoadm_cmd" set-realm-attrs \
        -u "$admin" \
        -f "$passwdfile" \
        -e / \
        -s "sunIdentityRepositoryService" \
        -D sunIdentityRepositoryService.conf \
        || logging $?
}

auth_config() {
    "$ssoadm_cmd" set-svc-attrs \
      -u "$admin" \
      -f "$passwdfile" \
      -e / \
      -s "iPlanetAMAuthService" \
      -D iPlanetAMAuthService.conf \
      || logging $?
}


realm_config
auth_config

exit 0
