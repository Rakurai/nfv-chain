#fetch an image

#create a volume on the lvm
lvcreate -nub14.0 -L4G vf0

#create a .cfg file for the image
builder = "hvm"
name = "ubuntu-hvm"
memory = "1024"
vcpus = 2
vif = ['bridge=xenbr0']
#pci = ['82:10.0']
disk = ['phy:/dev/vf0/ub14.0,hda,w','file:/users/rakurai/ubuntu-14.04-server-amd64.iso,hdc:cdrom,r']
vnc = 1
boot="dc"
