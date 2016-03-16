br=xenbr0

xl mem-set Domain-0 16000

<<<<<<< Updated upstream:setup_xen_host/xen_startup.sh
./setup_bridge.sh xenbr0
=======
setup_bridge.sh $br

# enable NAT to VMs
dev=`ifconfig | grep 34:17:eb | awk '{print $1}'`
iptables -t nat -A POSTROUTING -o $dev -j MASQUERADE
iptables -A FORWARD -i $br -j ACCEPT
>>>>>>> Stashed changes:startup_xen.sh
