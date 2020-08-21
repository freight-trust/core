#!/bin/bash
set -e
source common/variables
source common/functions

curl -X POST --data '{"jsonrpc":"2.0","method":"eth_blockNumber","params":[],"id":1}' 127.0.0.1:8545