#!/bin/sh

cd "`dirname "$0"`" || exit 1
. ../../common-ssoadm.sh || exit 1
. ../config.sh || exit 1

create_cot() {
    "$ssoadm_cmd" create-cot \
        -u "${admin}" \
        -f "${passwdfile}" \
        -e "${realm}" \
        -t "${realm}-cot" \
        || logging $?
}

create_host_idp() {
    ## OpenAM IdP (Host IdP)
    "$ssoadm_cmd" import-entity \
        -u "${admin}" \
        -f "${passwdfile}" \
        -e "${realm}" \
        -t "${realm}-cot" \
        -m "metadata/openam-idp-metadata.xml" \
        -x "metadata/openam-idp-ext-metadata.xml" \
        -c saml2 \
        || logging $?
}

create_cot
create_host_idp

exit 0

