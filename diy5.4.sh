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
#rm -rf package/lean/luci-app-jd-dailybonus && git clone https://github.com/jerrykuku/luci-app-jd-dailybonus.git package/diy/luci-app-jd-dailybonus
svn co https://github.com/vernesong/OpenClash/trunk/luci-app-openclash package/diy/luci-app-openclash

#git clone https://github.com/AlexZhuo/luci-app-bandwidthd /package/diy/luci-app-bandwidthd
git clone -b master --single-branch https://github.com/tty228/luci-app-serverchan ./package/diy/luci-app-serverchan
git clone -b master --single-branch https://github.com/destan19/OpenAppFilter ./package/diy/OpenAppFilter
# 京东签到 By Jerrykuku
# sed -i 's/wget-ssl/wget/g' package/lean/luci-app-jd-dailybonus/root/usr/share/jd-dailybonus/newapp.sh package/lean/luci-app-jd-dailybonus/luasrc/controller/jd-dailybonus.lua
# rm -rf ./package/lean/luci-app-jd-dailybonus/root/usr/share/jd-dailybonus/JD_DailyBonus.js
# wget -P package/lean/luci-app-jd-dailybonus/root/usr/share/jd-dailybonus/ https://github.com/NobyDa/Script/raw/master/JD-DailyBonus/JD_DailyBonus.js
# 花生壳内网穿透
#svn co https://github.com/QiuSimons/dragino2-teasiu/trunk/package/teasiu/luci-app-phtunnel package/new/luci-app-phtunnel
#svn co https://github.com/QiuSimons/dragino2-teasiu/trunk/package/teasiu/phtunnel package/new/phtunnel
svn co https://github.com/teasiu/dragino2/trunk/devices/common/diy/package/teasiu/luci-app-phtunnel package/new/luci-app-phtunnel
svn co https://github.com/teasiu/dragino2/trunk/devices/common/diy/package/teasiu/phtunnel package/new/phtunnel
svn co https://github.com/QiuSimons/dragino2-teasiu/trunk/package/teasiu/luci-app-oray package/new/luci-app-oray

# Passwall
#svn co https://github.com/xiaorouji/openwrt-passwall/trunk package/passwall
git clone https://github.com/xiaorouji/openwrt-passwall package/passwall
# svn co https://github.com/xiaorouji/openwrt-passwall/trunk/luci-app-passwall package/passwall/luci-app-passwall
sed -i 's,default n,default y,g' package/passwall/luci-app-passwall/Makefile

# ShadowsocksR Plus+
svn co https://github.com/fw876/helloworld/trunk/luci-app-ssr-plus package/lean/luci-app-ssr-plus
sed -i '/status/am:section(SimpleSection).template = "openclash/myip"' ./package/lean/luci-app-ssr-plus/luasrc/model/cbi/shadowsocksr/client.lua
# pushd package/lean
#wget -qO - https://github.com/fw876/helloworld/pull/513.patch | patch -p1
# wget -qO - https://github.com/QiuSimons/helloworld-fw876/commit/c1674ad.patch | patch -p1
# popd
# pushd package/lean/luci-app-ssr-plus
sed -i 's,default n,default y,g' package/lean/luci-app-ssr-plus
# sed -i 's,Xray:xray ,Xray:xray-core ,g' package/lean/luci-app-ssr-plus
sed -i '/V2ray:v2ray/d' Makefile
sed -i '/plugin:v2ray/d' Makefile

# VSSR
svn co https://github.com/jerrykuku/luci-app-vssr/trunk/  package/diy/luci-app-vssr
#git clone -b master --depth 1 https://github.com/jerrykuku/luci-app-vssr.git package/lean/luci-app-vssr
#git clone -b master --depth 1 https://github.com/jerrykuku/lua-maxminddb.git package/lean/lua-maxminddb
sed -i 's,default n,default y,g' package/lean/luci-app-vssr/Makefile

# git clone https://github.com/jerrykuku/luci-app-ttnode.git     package/diy/luci-app-ttnode
# svn co https://github.com/jerrykuku/luci-app-ttnode/trunk/  package/diy/luci-app-ttnode
# sed -i 's/KERNEL_PATCHVER:=5.4/KERNEL_PATCHVER:=4.19/g' ./target/linux/x86/Makefile
# sed -i 's/KERNEL_TESTING_PATCHVER:=5.4/KERNEL_TESTING_PATCHVER:=4.19/g' ./target/linux/x86/Makefile
#sed -i "/mediaurlbase/d" package/*/luci-theme*/root/etc/uci-defaults/*
#sed -i "/mediaurlbase/d" feed/*/luci-theme*/root/etc/uci-defaults/*


# R8168驱动
# svn co https://github.com/immortalwrt/immortalwrt/branches/master/package/kernel/r8152 package/new/r8152
# svn co https://github.com/immortalwrt/immortalwrt/branches/master/package/kernel/r8168 package/new/r8168
# svn co https://github.com/immortalwrt/immortalwrt/branches/master/package/kernel/rtl8188eu package/new/rtl8188eu
# svn co https://github.com/immortalwrt/immortalwrt/branches/master/package/kernel/rtl8189es package/new/rtl8189es
# svn co https://github.com/immortalwrt/immortalwrt/branches/master/package/kernel/rtl8192du package/new/rtl8192du
# svn co https://github.com/immortalwrt/immortalwrt/branches/master/package/kernel/rtl8812au-ct package/new/rtl8812au-ct
# svn co https://github.com/immortalwrt/immortalwrt/branches/master/package/kernel/rtl8812au-ac package/new/rtl8812au-ac
# svn co https://github.com/immortalwrt/immortalwrt/branches/master/package/kernel/rtl8821cu package/new/rtl8821cu
# svn co https://github.com/immortalwrt/immortalwrt/branches/master/package/kernel/rtl88x2bu package/new/rtl88x2bu

#patch -p1 < ../PATCH/new/main/r8168-fix_LAN_led-for_r4s-from_TL.patch

# Add driver for rtl8821cu & rtl8812au-ac
# svn co https://github.com/immortalwrt/immortalwrt/branches/master/package/ctcgfw/rtl8812au-ac ./package/ctcgfw
# svn co https://github.com/immortalwrt/immortalwrt/branches/master/package/ctcgfw/rtl8821cu ./package/ctcgfw

#git clone https://github.com/openwrt-dev/po2lmo.git
#cd po2lmo
#make && sudo make install

# 在 X86 架构下移除 Shadowsocks-rust
#sed -i '/Rust:/d' package/lean/luci-app-ssr-plus/Makefile
#sed -i '/Rust:/d' package/passwall/luci-app-passwall/Makefile
#sed -i '/Rust:/d' package/lean/luci-app-vssr/Makefile

### 最后的收尾工作 ###
# Lets  
# mkdir package/base-files/files/usr/bin 
# cp -f package/build/set/chinadnslist package/base-files/files/usr/bin/chinadnslist
# 最大连接数
# sed -i 's/16384/65535/g' package/kernel/linux/files/sysctl-nf-conntrack.conf

find ./ -name *.orig | xargs rm -f
find ./ -name *.rej | xargs rm -f
