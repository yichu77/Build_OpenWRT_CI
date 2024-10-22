#!/bin/bash

#加回Hiwifi c526a支持
if [[ $WRT_URL == *"lede"* && $WRT_TARGET == "ipq40xx" ]]; then
	cp -rf ./Diy/* ./wrt/
fi