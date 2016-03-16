#!/bin/bash

dev=$1

echo `ethtool -i $iface | grep bus-info | awk '{print $2}'`
