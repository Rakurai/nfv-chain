#!/bin/bash

git clone https://github.com/kohler/click.git click-install
cd click-install
sudo ./configure
make -j40
sudo make install
cd ..

