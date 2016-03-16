git clone http://github.com/emmericp/moongen moongen
cd moongen
git submodule update --init
sudo apt-get update
sudo apt-get install cmake

sudo ./build.sh
sudo ./setup-hugetlbfs.sh

iface=`ifconfig | grep 00:8c:fa | awk '{print $1}'`
