#!/bin/bash
# use anchor.sh

LIB_PATH="$PWD/$(dirname $0)/../lib/anchor.sh"
echo "Before loading: $LIB_PATH"
set -ax
cd /var/tmp
source $LIB_PATH
echo "After loading: $(export -p | grep ' LIB_PATH=')"
