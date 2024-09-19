#!/bin/bash
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#

# 使用自定义package
#sed -i 's/coolsnowwolf/yichu77/g' feeds.conf.default

# 使用源码自带ShadowSocksR Plus+出国软件
sed -i '$a src-git helloworld https://github.com/fw876/helloworld' feeds.conf.default

#添加自定义插件链接（自己想要什么就github里面搜索然后添加）
#git clone -b 18.06 https://github.com/garypang13/luci-theme-edge.git package/lean/luci-theme-edge  #主题-edge-动态登陆界面
#git clone https://github.com/xiaoqingfengATGH/luci-theme-infinityfreedom.git package/lean/luci-theme-infinityfreedom  #透明主题
#git clone -b lede https://github.com/pymumu/luci-app-smartdns.git package/lean/luci-app-smartdns  #smartdns DNS加速
#git clone https://github.com/sirpdboy/netspeedtest.git package/lean/luci-app-netspeedtest #网络速度测试1.5完整版
git clone https://github.com/sirpdboy/luci-theme-opentopd.git package/lean/luci-theme-opentopd #主题
#git clone https://github.com/sirpdboy/luci-app-advanced.git package/lean/luci-app-advanced #高级设置
#git clone https://github.com/lisaac/luci-app-dockerman.git package/lean/luci-app-dockerman
#git clone https://github.com/awesome-openwrt/luci-app-control-timewol.git package/lean/luci-app-control-timewol #定时唤醒


#rm -rf ./package/lean/luci-theme-argon && git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git package/lean/luci-theme-argon  #新的argon主题
#全新的[argon-主题]此主题玩法很多,这里看说明【https://github.com/jerrykuku/luci-theme-argon/blob/18.06/README_ZH.md】
#用WinSCP连接openwrt，在/www/luci-static/argon里面创建background文件夹（如果本身就有background就不需要创建）来存放jpg png gif格式图片可以自定义登陆界面，gif图片为动态登陆界面
