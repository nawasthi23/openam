#!/bin/sh

cd "`dirname "$0"`" || exit 1
. ../common-ssoadm.sh || exit 1
. ./config.sh || exit 1


create_realm() {
    "$ssoadm_cmd" create-realm \
        -u "$admin" \
        -f "$passwdfile" \
        -e "$realm" \
        || logging $?
}

realm_config() {
    "$ssoadm_cmd" set-realm-attrs \
        -u "$admin" \
        -f "$passwdfile" \
        -e "$realm" \
        -s "sunIdentityRepositoryService" \
        -D sunIdentityRepositoryService.conf \
        || logging $?
}

datastore_config() {
    "$ssoadm_cmd" delete-datastores \
        -u "$admin" \
        -f "$passwdfile" \
        -e "$realm" \
        -m "embedded" \
        || logging $?

    "$ssoadm_cmd" create-datastore \
        -u "$admin" \
        -f "$passwdfile" \
        -e "$realm" \
        -t "$datastore_type" \
        -m "$datastore_name" \
        -D "datastore.conf" \
        || logging $?
}

auth_config() {
    "$ssoadm_cmd" set-svc-attrs \
        -u "$admin" \
        -f "$passwdfile" \
        -e "$realm" \
        -s "iPlanetAMAuthService" \
        -D iPlanetAMAuthService.conf \
        || logging $?
}



#create_realm
#realm_config
#datastore_config
#auth_config
saml-config/setup-saml.sh

exit 0
