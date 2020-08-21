#!/bin/bash
# Set Node Permissioning options
if [[ ! -z "${NODES_ON_CHAIN_PERMISSIONING}" ]]; 
then
    echo "Nodes on chain permissioning enabled"
    cmd="${cmd} \
--permissions-nodes-contract-enabled \
--permissions-nodes-contract-address=0x0000000000000000000000000000000000009999"
else
    cmd="${cmd} --host-whitelist=\"*\""
fi