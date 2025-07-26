#!/bin/bash

#加回Hiwifi c526a支持
if [[ $WRT_URL == *"coolsnowwolf"* && $WRT_TARGET == "ipq40xx" ]]; then
        chmod -R 755 $WRT_DIY
	cp -arf $WRT_DIY/* ./wrt/
fi
