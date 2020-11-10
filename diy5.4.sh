#!/bin/bash
#=============================================================
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
# Lisence: MIT
# Author: P3TERX
# Blog: https://p3terx.com
#=============================================================

# Uncomment a feed source
sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add a feed source
sed -i '$a src-git diy https://github.com/sirpdboy/sirpdboy-package' feeds.conf.default
sed -i 's/coolsnowwolf/sirpdboy/g' ./feeds.conf.default
svn co https://github.com/sirpdboy/sirpdboy-package/trunk/smartdns ./package/new/smartdns
svn co https://github.com/sirpdboy/sirpdboy-package/trunk/adguardhome ./package/new/adguardhome
#git clone https://github.com/sirpdboy/sirpdboy-package package/diy
#git clone https://github.com/siropboy/luci-app-vssr-plus  package/diy/luci-app-vssr-plus
svn co https://github.com/jerrykuku/luci-app-vssr/trunk/  package/diy/luci-app-vssr
svn co https://github.com/xiaorouji/openwrt-package/trunk/lienol/luci-app-passwall package/diy/luci-app-passwall
svn co https://github.com/xiaorouji/openwrt-package/trunk/package package/diy/lienol
chmod -R ./feed/diy
chmod -R ./package/diy
