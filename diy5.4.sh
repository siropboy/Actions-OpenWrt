#!/bin/bash
#=============================================================
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
# Lisence: MIT
# Author: P3TERX
# Blog: https://p3terx.com
#=============================================================

# Add a feed source
svn co https://github.com/sirpdboy/sirpdboy-package/ ./package/diy/
svn co https://github.com/vernesong/OpenClash/trunk/luci-app-openclash package/diy/luci-app-openclash

git clone -b master --single-branch https://github.com/tty228/luci-app-serverchan ./package/diy/luci-app-serverchan
git clone -b master --single-branch https://github.com/destan19/OpenAppFilter ./package/diy/OpenAppFilter

git clone https://github.com/xiaorouji/openwrt-passwall package/passwall
sed -i 's,default n,default y,g' package/passwall/luci-app-passwall/Makefile

# ShadowsocksR Plus+
svn co https://github.com/fw876/helloworld/trunk/luci-app-ssr-plus package/lean/luci-app-ssr-plus
sed -i '/status/am:section(SimpleSection).template = "openclash/myip"' ./package/lean/luci-app-ssr-plus/luasrc/model/cbi/shadowsocksr/client.lua

sed -i 's,default n,default y,g' package/lean/luci-app-ssr-plus
sed -i '/V2ray:v2ray/d' Makefile
sed -i '/plugin:v2ray/d' Makefile

# VSSR
svn co https://github.com/jerrykuku/luci-app-vssr/trunk/  package/diy/luci-app-vssr
sed -i 's,default n,default y,g' package/lean/luci-app-vssr/Makefile

find ./ -name *.orig | xargs rm -f
find ./ -name *.rej | xargs rm -f
