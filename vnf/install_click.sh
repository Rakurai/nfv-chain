#!/bin/bash

git clone https://github.com/kohler/click.git click

cd click
sudo chmod go+r /boot/System.map-$(uname -r)
./configure
make -j4

sudo make install
cd ..

