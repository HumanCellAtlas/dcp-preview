#!/bin/bash

set -euo pipefail

pip install --upgrade hca || (echo "Unable to install HCA. Retrying with sudo..."; sudo pip install --upgrade hca)

REPLICA=aws
HCA=hca
if ! type $HCA >/dev/null 2>&1; then
    HCA=~/.local/bin/hca
fi

bundles="
c94a43f9-257f-4cd0-b2fe-eaf6d5d37d18
4afbb0ea-81ad-49dc-9b12-9f77f4f50be8
b0850e79-5544-49fe-b54d-e29b9fc3f61f
2a87dc5c-0c3c-4d91-a348-5d784ab48b92
"
for uuid in $bundles; do
    $HCA dss download --bundle-uuid $uuid --replica $REPLICA
done
