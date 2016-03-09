# set up storage for VMs
pvcreate /dev/sda4           # use sda4 as the physical volume
vgcreate vf0 /dev/sda4       # create a volume group

# lvcreate -n<name of the volume> -L<size, you can use G and M here> <volume group>
# lvremove /dev/<volume group>/<name of the volume>

apt-get update

# this will change boot priority and update grub
apt-get install -y xen-system-amd64

echo "*** Need to reboot!"
