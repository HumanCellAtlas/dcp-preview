#!/bin/bash

set -euo pipefail

pip install --upgrade hca || (echo "Unable to install HCA. Retrying with sudo..."; sudo pip install --upgrade hca)

REPLICA=aws
HCA=hca
if ! type $HCA >/dev/null 2>&1; then
    HCA=~/.local/bin/hca
fi

bundles="
17a3d288-01a0-464a-9599-7375fda3353d
"
for uuid in $bundles; do
    $HCA dss download --bundle-uuid $uuid --replica $REPLICA
done
