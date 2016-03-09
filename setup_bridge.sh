br=$1

ip link add dev $br type bridge
ip addr add 10.10.2.254/24 dev $br
