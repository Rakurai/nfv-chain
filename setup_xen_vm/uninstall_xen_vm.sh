#!/bin/bash

if [[ $# -lt 1 ]]; then 
    echo "Usage: $0 <VM_NAME> "
    exit 1
fi
name=$1

umount /tmp/mnt/ > /dev/null 2>&1

lvremove "/dev/openstack-volumes/"$name"-disk"
lvremove "/dev/openstack-volumes/"$name"-swap"
rm "/etc/xen/"$name".vm.cfg"

