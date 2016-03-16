num_vfs=$1

iface=`ifconfig | grep 00:8c:fa | awk '{print $1}'`

#../tools/add_sriov_devs $iface $num_vfs

sriov_ifaces=`ifconfig -a | grep sriov | awk '{print $1}'`
for if in $sriov_ifaces; do
	dev_name=`ethtool -i $if | grep bus-info | awk '{print $2}'`
	xl pci-assignable-add $dev_name
done
