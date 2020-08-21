#!/bin/bash
find . -type f -exec sha256sum {} \; |tee SHA256SUMS > SHASUMS.txt
# for entire folder, will generate sha256sum then *append* to a file, for different usage change &>> to w/e.
find . -type f -exec sha256sum {} \; 2>&1 SHA256SUMS
