#!/bin/bash

#加回Hiwifi c526a支持
if [[ $WRT_URL == *"lede"* && $WRT_TARGET == "ipq40xx" ]]; then
        chmod -R 755 ./diy
	cp -arf ./diy/* ./wrt/
fi
