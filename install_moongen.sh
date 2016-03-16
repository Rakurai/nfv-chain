git clone http://github.com/emmericp/moongen moongen
cd moongen
git submodule update --init
sudo apt-get update
sudo apt-get install cmake

sudo ./build.sh
sudo ./setup-hugetlbfs.sh

iface=`ifconfig | grep 00:8c:fa | awk '{print $1}'`
dev_name=`ethtool -i $iface | grep bus-info | awk '{print $2}'`
sudo ifconfig $iface down
sudo python deps/dpdk/tools/dpdk_nic_bind.py -u $dev_name
sudo python deps/dpdk/tools/dpdk_nic_bind.py -b igb_uio $dev_name
