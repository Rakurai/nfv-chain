br=xenbr0

xl mem-set Domain-0 16000

./setup_bridge.sh xenbr0

# enable NAT to VMs
dev=`ifconfig | grep 34:17:eb | awk '{print $1}'`
iptables -t nat -A POSTROUTING -o $dev -j MASQUERADE
iptables -A FORWARD -i $br -j ACCEPT
