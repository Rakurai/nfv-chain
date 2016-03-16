#!/bin/bash

iface=$1
NVFS=$2 # 5+4+3+2+1+spare

[ -z $NVFS ] && echo "usage: $0 iface num_vfs" && exit

# set up VFs
pci_id=`dev_to_pcidev.sh $iface`
#NIC=`lspci|grep 82599|awk '{print $1}'|head -n 1` # get the NIC descriptor
echo $NVFS > /sys/bus/pci/devices/${pci_id}/sriov_numvfs

[ "$NVFS" -eq "0" ] && exit

sleep 2

for x in `seq 4 $(($NVFS+3))`; do
  dev="eth$x"
  nx=$(($x-4))
  ndev="sriov$nx"
  sudo ip link set dev $dev name $ndev
done
