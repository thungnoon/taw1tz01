#!/bin/bash

#删除feeds中的插件
# rm -rf ./feeds/packages/net/v2ray-geodata
rm -rf ./feeds/packages/lang/golang
rm -rf ./feeds/packages/net/{geoview,shadowsocks-libev,chinadns-ng,mosdns}
rm -rf ./feeds/luci/applications/luci-app-mosdns

#克隆依赖插件
git clone https://github.com/xiaorouji/openwrt-passwall-packages.git package/pwpage
git clone https://github.com/sbwml/packages_lang_golang -b 24.x feeds/packages/lang/golang


#克隆的源码放在small文件夹
mkdir package/small
pushd package/small

# 添加rtp2httpd
merge_folder main https://github.com/stackia/rtp2httpd package openwrt-support/rtp2httpd openwrt-support/luci-app-rtp2httpd
rm -f package/rtp2httpd/Makefile
curl -s https://raw.githubusercontent.com/smdx/rtp2httpd/refs/heads/main/Makefile > package/rtp2httpd/Makefile
echo "" >> .config  # 添加一个空行(确保正确换行)
echo "CONFIG_PACKAGE_luci-app-rtp2httpd=y" >> .config
echo "CONFIG_PACKAGE_rtp2httpd=y" >> .config

#adguardhome
git clone -b 2024.09.05 --depth 1 https://github.com/XiaoBinin/luci-app-adguardhome.git

#lucky
git clone -b main --depth 1 https://github.com/gdy666/luci-app-lucky.git

# #smartdns
# git clone -b lede --depth 1 https://github.com/pymumu/luci-app-smartdns.git
# git clone -b master --depth 1 https://github.com/pymumu/smartdns.git

# #ssrp
# git clone -b master --depth 1 https://github.com/fw876/helloworld.git

# #passwall
# git clone -b main --depth 1 https://github.com/xiaorouji/openwrt-passwall.git

#passwall2
git clone -b main --depth 1 https://github.com/xiaorouji/openwrt-passwall2.git

# #mosdns
git clone -b v5 --depth 1 https://github.com/sbwml/luci-app-mosdns.git

# #openclash
# git clone -b master --depth 1 https://github.com/vernesong/OpenClash.git

# #poweroffdevice
git clone -b js --depth 1 https://github.com/sirpdboy/luci-app-poweroffdevice.git

# #partexp
git clone -b main --depth 1 https://github.com/sirpdboy/luci-app-partexp.git

# #istore
git clone -b main --depth 1 https://github.com/linkease/istore.git
git clone -b main --depth 1 https://github.com/linkease/istore-ui.git

# #nikki 
git clone -b main --depth 1 https://github.com/nikkinikki-org/OpenWrt-nikki.git

# #fchomo 
# git clone -b master --depth 1 https://github.com/fcshark-org/openwrt-fchomo.git

popd

echo "packages executed successfully!"
