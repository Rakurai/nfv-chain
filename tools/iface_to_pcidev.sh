#!/bin/bash

iface=$1

echo `ethtool -i $iface | grep bus-info | awk '{print $2}'`
