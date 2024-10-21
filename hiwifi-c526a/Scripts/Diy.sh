#!/bin/bash

#加回部分设备支持
if [[ $WRT_URL == *"lede"* && $WRT_TARGET == "ipq40xx" ]]; then
	cp -rf ./DIY/* ./wrt/
fi