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

##########################################
# 添加 rtp2httpd 流媒体转发服务器 (feed 模式)
##########################################

# 添加 feed 源（可选锁定版本）
# 使用 main 最新代码：
echo "src-git rtp2httpd https://github.com/stackia/rtp2httpd.git" >> feeds.conf.default
# 或者固定版本（推荐稳定）：
# echo "src-git rtp2httpd https://github.com/stackia/rtp2httpd.git;v3.1.1" >> feeds.conf.default

# 更新并安装 rtp2httpd feed
./scripts/feeds update rtp2httpd
./scripts/feeds install -a -p rtp2httpd

# 启用 luci-app-rtp2httpd 与主程序 rtp2httpd
echo "CONFIG_PACKAGE_rtp2httpd=y" >> .config
echo "CONFIG_PACKAGE_luci-app-rtp2httpd=y" >> .config
echo "✅ 已启用 rtp2httpd 流媒体转发服务器 (通过 feed 方式集成)"

