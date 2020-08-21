#!/bin/bash

sudo yum install binutils
sudo yum list kernel
sudo yum install -y kernel
sudo yum install -y yum-plugin-kernel-livepatch
sudo yum kernel-livepatch enable -y
rpm -qa | grep kernel-livepatch
sudo yum update kpatch-runtime
sudo systemctl enable kpatch.service
sudo amazon-linux-extras enable livepatch
yum updateinfo list cves
