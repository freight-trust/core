#!/bin/bash

rpm --import https://www.elrepo.org/RPM-GPG-KEY-elrepo.org 
rpm -Uvh http://www.elrepo.org/elrepo-release-7.0-2.el7.elrepo.noarch.rpm 
yum remove kernel-headers-3.10.0-123.9.2.el7.x86_64 kernel-tools-3.10.0-123.9.2.el7.x86_64 kernel-tools-libs-3.10.0-123.9.2.el7.x86_64
yum install kernel-ml kernel-ml-headers kernel-ml-tools kernel-ml-tools-libs kernel-ml-tools-libs-devel
