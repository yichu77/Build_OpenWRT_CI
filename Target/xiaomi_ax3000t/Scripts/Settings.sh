#!/bin/bash

if [[ $WRT_URL == *"coolsnowwolf"* ]]; then
	#注释第2行
	#sed -i '2 i \#' feeds.conf.default
	#sed -i 's/.git;openwrt-23.05//g' feeds.conf.default
	# 使用源码自带ShadowSocksR Plus+出国软件
	#sed -i '$a src-git helloworld https://github.com/fw876/helloworld' feeds.conf.default

	#修改默认IP地址
	#sed -i 's/192.168.1.1/192.168.11.1/g' package/base-files/luci2/bin/config_generate
	sed -i 's/192\.168\.[0-9]*/$WRT_IP/g' package/base-files/files/bin/config_generate
	#sed -i 's/192\.168\.[0-9]*/$WRT_IP/g' package/base-files/image-config.in
	##sed -i 's/192\.168\.[0-9]*/$WRT_IP/g' package/base-files/Makefile

	# 设置密码为空（安装固件时无需密码登陆，然后自己修改想要的密码）
	sed -i 's@.*CYXluq4wUazHjmCDBCqXF*@#&@g' package/lean/default-settings/files/zzz-default-settings

	#修改默认主机名
	sed -i "s/hostname='.*'/hostname='$WRT_NAME'/g" $CFG_FILE

	LEDE_FILE=$(find ./package/lean/autocore/ -type f -name "index.htm")
	#修改默认时间格式
	sed -i 's/os.date()/os.date("%Y-%m-%d %H:%M:%S %A")/g' $LEDE_FILE
	#添加编译日期标识
	#sed -i "s/(\(<%=pcdata(ver.luciversion)%>\))/\1 \/ $WRT_REPO-$WRT_DATE/" $LEDE_FILE
	#修改默认WIFI名
	sed -i "s/ssid=.*/ssid=$WRT_WIFI/g" ./package/kernel/mac80211/files/lib/wifi/mac80211.sh

	# 修改版本为编译日期
	date_version=$(date +"%y.%m.%d")
	orig_version=$(cat "package/lean/default-settings/files/zzz-default-settings" | grep DISTRIB_REVISION= | awk -F "'" '{print $2}')
	sed -i "s/${orig_version}/R${date_version} by go-laoji/g" package/lean/default-settings/files/zzz-default-settings

	# 移除默认安装的vsftpd、vlmcsd
	sed -i "s/luci-app-vsftpd//g" include/target.mk
	sed -i "s/luci-app-vlmcsd//g" include/target.mk
fi
