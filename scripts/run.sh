#!/bin/bash

chmod 777 /dev/null
chmod 555 /home/app
chmod 555 /
set -- \
        "-XX:CRaCRestoreFrom=cr" \
        "$@"
eval "set -- $(
        printf '%s\n' "$JAVA_OPTS" |
        xargs -n1 |
        sed ' s~[^-[:alnum:]+,./:=@_]~\\&~g; ' |
        tr '\n' ' '
    )" '"$@"'
exec /azul-crac-jdk/bin/java "$@"
