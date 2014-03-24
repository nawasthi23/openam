#!/bin/sh

set -e

. ../openam-config.sh || exit 1

if [ $# != 1 ]
then
    echo "Usage: $0 configuration_file"
    exit 1
fi

JAR="$OAM_SSOCONFIGRATOR_DIR/lib/openam-configurator-tool-11.0.0.jar"
conf_file="$1"

"$JAVA_HOME"/bin/java -jar "$JAR" -f "$conf_file"

exit 0

