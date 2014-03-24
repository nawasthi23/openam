set -e

## Environment
## -------------------------------------------------------------------

export LC_ALL=C

## openam configuration
## -------------------------------------------------------------------

ssoadm_cmd="/opt/openam/ssoadm/openam/bin/ssoadm"
admin="amadmin"
passwdfile="/root/openam/passwd"

## Functions
## -------------------------------------------------------------------

logging() {
    echo "Error: return code=$1"
}
