git clone http://github.com/emmericp/moongen moongen
cd moongen
git submodule update --init
sudo apt-get update
sudo apt-get install -y cmake

sudo ./build.sh
sudo ./setup-hugetlbfs.sh

# build script by default binds unused NICs to igb_uio, can be confusing.  unbind them
bound=`deps/dpdk/tools/dpdk_nic_bind.py --status | grep drv=igb_uio | awk '{print $1}'`
sudo deps/dpdk/tools/dpdk_nic_bind.py -u $bound

#iface=`ifconfig | grep 00:8c:fa | awk '{print $1}'`
#sudo ifconfig $iface down
sudo deps/dpdk/tools/dpdk_nic_bind.py --bind=igb_uio 82:00.0

#dev_name=`ethtool -i $iface | grep bus-info | awk '{print $2}'`
#sudo deps/dpdk/tools/dpdk_nic_bind.py -u $dev_name
#sudo deps/dpdk/tools/dpdk_nic_bind.py -b igb_uio $dev_name
