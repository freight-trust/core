#!/bin/bash
# Set Account Permissioning options
if [[ ! -z "${ACCOUNTS_ON_CHAIN_PERMISSIONING}" ]]; then
    echo "Account on chain permissioning enabled"
    cmd="${cmd} \
--permissions-accounts-contract-enabled \
--permissions-accounts-contract-address=0x0000000000000000000000000000000000008888"
fi
