#!/bin/bash

#添加DIY
if [[ $WRT_URL == *"coolsnowwolf"* && $WRT_TARGET == "Mediatek" ]]; then
        chmod -R 755 $WRT_DIY
	cp -arf $WRT_DIY/* ./wrt/
fi
