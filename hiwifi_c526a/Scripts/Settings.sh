#!/bin/bash

sed -i 's/.git;openwrt-23.05//g' feeds.conf.default

# 使用源码自带ShadowSocksR Plus+出国软件
#sed -i '$a src-git helloworld https://github.com/fw876/helloworld' feeds.conf.default

# feeds获取theme-opentopd源码：
#sed -i '$a src-git opentopd https://github.com/sirpdboy/luci-theme-opentopd' feeds.conf.default
#git clone https://github.com/sirpdboy/luci-theme-opentopd.git package/lean/luci-theme-opentopd #主题
#echo "CONFIG_PACKAGE_luci-theme-$WRT_THEME=y" >> ./.config

#修改默认主题
#sed -i "s/luci-theme-bootstrap/luci-theme-$WRT_THEME/g" $(find ./feeds/luci/collections/ -type f -name "Makefile")

CFG_FILE="./package/base-files/files/bin/config_generate"
#修改默认IP地址
#sed -i "s/192\.168\.[0-9]*\.[0-9]*/$WRT_IP/g" package/base-files/files/bin/config_generate
sed -i 's/192.168.1.1/$WRT_IP/g' ./package/base-files/files/bin/config_generate
#修改默认主机名
sed -i "s/hostname='.*'/hostname='$WRT_NAME'/g" $CFG_FILE
#修改默认时区
sed -i "s/timezone='.*'/timezone='CST-8'/g" $CFG_FILE
sed -i "/timezone='.*'/a\\\t\t\set system.@system[-1].zonename='Asia/Shanghai'" $CFG_FILE

if [[ $WRT_URL == *"lede"* ]]; then
	LEDE_FILE=$(find ./package/lean/autocore/ -type f -name "index.htm")
	#修改默认时间格式
	sed -i 's/os.date()/os.date("%Y-%m-%d %H:%M:%S %A")/g' $LEDE_FILE
	#添加编译日期标识
	sed -i "s/(\(<%=pcdata(ver.luciversion)%>\))/\1 \/ $WRT_REPO-$WRT_DATE/" $LEDE_FILE
	#修改默认WIFI名
	sed -i "s/ssid=.*/ssid=$WRT_WIFI/g" ./package/kernel/mac80211/files/lib/wifi/mac80211.sh
        # 设置密码为空（安装固件时无需密码登陆，然后自己修改想要的密码）
        sed -i 's@.*CYXluq4wUazHjmCDBCqXF*@#&@g' package/lean/default-settings/files/zzz-default-settings
elif [[ $WRT_URL == *"immortalwrt"* ]]; then
	#添加编译日期标识
	VER_FILE=$(find ./feeds/luci/modules/ -type f -name "10_system.js")
	awk -v wrt_repo="$WRT_REPO" -v wrt_date="$WRT_DATE" '{ gsub(/(\(luciversion \|\| \047\047\))/, "& + (\047 / "wrt_repo"-"wrt_date"\047)") } 1' $VER_FILE > temp.js && mv -f temp.js $VER_FILE
	#修改默认WIFI名
	sed -i "s/ssid=.*/ssid=$WRT_WIFI/g" ./package/network/config/wifi-scripts/files/lib/wifi/mac80211.sh
fi

#配置文件修改
#echo "CONFIG_PACKAGE_luci-theme-$WRT_THEME=y" >> ./.config
#echo "CONFIG_PACKAGE_luci-app-$WRT_THEME-config=y" >> ./.config

