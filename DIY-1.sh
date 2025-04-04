# DIY-1 此脚本功能：添加外部插件
# =======================================================================================================================

# 1-添加 ShadowSocksR Plus+ 插件
# echo 'src-git helloworld https://github.com/fw876/helloworld' >>feeds.conf.default

# 2-添加 PowerOff 关机插件
# git clone https://github.com/WukongMaster/luci-app-poweroff.git package/luci-app-poweroff

# 3-添加 opentomcat 主题
git clone https://github.com/WukongMaster/luci-theme-opentomcat.git package/luci-theme-opentomcat

# 4-添加 OpenClash 插件
sed -i '$a\src-git openclash https://github.com/vernesong/OpenClash' ./feeds.conf.default

# 5-添加 PassWall 插件
echo "src-git passwall https://github.com/xiaorouji/openwrt-passwall.git;main" >> "feeds.conf.default"
echo "src-git passwall_packages https://github.com/xiaorouji/openwrt-passwall-packages.git;main" >> "feeds.conf.default"

# 6-添加Poweroffdevice 关机插件
git clone https://github.com/sirpdboy/luci-app-poweroffdevice.git package/luci-app-poweroffdevice

# 7-添加partexp 一键分区插件
git clone https://github.com/sirpdboy/luci-app-partexp.git package/luci-app-partexp

# 8-添加 homeproxy 插件
sed -i '$a\src-git homeproxy https://github.com/immortalwrt/homeproxy' ./feeds.conf.default

# 9-添加 Nikki 插件
echo "src-git nikki https://github.com/nikkinikki-org/OpenWrt-nikki.git;main" >> "feeds.conf.default"

# 10-添加 adguardhome 插件
git clone -b 2023.10 https://github.com/XiaoBinin/luci-app-adguardhome.git package/luci-app-adguardhome
