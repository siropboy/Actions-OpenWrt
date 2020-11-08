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
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add a feed source
# sed -i '$a src-git lienol https://github.com/Lienol/openwrt-package' feeds.conf.default
# sed -i '$a src-git jerryk https://github.com/jerrykuku/openwrt-package' feeds.conf.default
# sed -i '$a src-git diy https://github.com/firker/diy-ziyong' feeds.conf.default
# git clone https://github.com/kenzok8/openwrt-packages package/diy
sed -i 's/#src-git helloworld/src-git helloworld/g' ./feeds.conf.default
sed -i 's/coolsnowwolf/sirpdboy/g' ./feeds.conf.default
git clone https://github.com/sirpdboy/sirpdboy-package package/diy
#git clone https://github.com/siropboy/luci-app-vssr-plus  package/luci-app-vssr-plus
# mv -vf ../mt7621_phicomm_k2p.dts ./target/linux/ramips/dts/mt7621_phicomm_k2p.dts
#　git clone https://github.com/vernesong/OpenClash.git package/OpenClash
# git clone -b master https://github.com/vernesong/OpenClash.git package/OpenClash
#git clone -b 18.06 https://github.com/garypang13/luci-theme-edge.git package/luci-theme-edge
#git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git package/luci-theme-argon
#git clone https://github.com/sirpdboy/luci-theme-opentopd.git package/luci-theme-opentopd
#git clone https://github.com/jerrykuku/luci-app-argon-config.git package/luci-app-argon-config
#git clone https://github.com/tty228/luci-app-serverchan.git package/luci-app-serverchan
#git clone https://github.com/jerrykuku/luci-app-jd-dailybonus.git package/luci-app-jd-dailybonus
#svn co https://github.com/firker/diy-ziyong/trunk/smartdns package/smartdns
#svn co https://github.com/xiaorouji/openwrt-package/trunk/lienol/luci-app-passwall package/luci-app-passwall
#svn co https://github.com/xiaorouji/openwrt-package/trunk/package package/lienol
# svn co https://github.com/jerrykuku/luci-app-vssr/trunk  ./package/new/luci-app-vssr
# svn co https://github.com/xiaorouji/openwrt-package/trunk/package/brook package/brook
# svn co https://github.com/xiaorouji/openwrt-package/trunk/package/chinadns-ng package/chinadns-ng
# svn co https://github.com/xiaorouji/openwrt-package/trunk/package/tcping package/tcping
# svn co https://github.com/xiaorouji/openwrt-package/trunk/package/trojan-go package/trojan-go
# svn co https://github.com/xiaorouji/openwrt-package/trunk/package/trojan-plus package/trojan-plus
# svn co https://github.com/xiaorouji/openwrt-package/trunk/package/naiveproxy package/naiveproxy
# svn co https://github.com/xiaorouji/openwrt-package/trunk/package/v2ray package/v2ray
# svn co https://github.com/xiaorouji/openwrt-package/trunk/package/v2ray-plugin package/v2ray-plugin
rm -rf ./package/lean/luci-theme-argon
rm -rf ./package/lean/trojan
rm -rf ./package/lean/v2ray
rm -rf ./package/lean/v2ray-plugin
rm -rf ./package/lean/luci-app-netdata
rm -rf ./package/lean/luci-theme-opentomcat
rm -rf ./package/diy/autocore
#rm -rf ./feeds/diy/default-settings
#rm -rf ./package/lean/autocore
rm -rf ./package/lean/default-settings
#curl -fsSL https://raw.githubusercontent.com/siropboy/other/master/patch/autocore/files/x86/index.htm > package/lean/autocore/files/x86/index.htm
#curl -fsSL https://raw.githubusercontent.com/siropboy/other/master/patch/autocore/files/arm/index.htm > package/lean/autocore/files/arm/index.htm
#curl -fsSL  https://raw.githubusercontent.com/siropboy/other/master/patch/default-settings/zzz-default-settings > ./package/lean/default-settings/files/zzz-default-settings
sed -i 's/网络存储/存储/g' package/lean/luci-app-vsftpd/po/zh-cn/vsftpd.po
sed -i 's/Turbo ACC 网络加速/ACC网络加速/g' package/lean/luci-app-flowoffload/po/zh-cn/flowoffload.po
sed -i 's/Turbo ACC 网络加速/ACC网络加速/g' package/lean/luci-app-sfe/po/zh-cn/sfe.po
sed -i 's/解锁网易云灰色歌曲/解锁灰色歌曲/g' package/lean/luci-app-unblockmusic/po/zh-cn/unblockmusic.po
sed -i 's/家庭云//g' package/lean/luci-app-familycloud/luasrc/controller/familycloud.lua
sed -i '/filter_/d' package/network/services/dnsmasq/files/dhcp.conf
sed -i 's/$(VERSION_DIST_SANITIZED)/$(shell TZ=UTC-8 date +%Y%m%d)-ipv6/g' include/image.mk
echo "DISTRIB_REVISION='S$(TZ=UTC-8 date +%Y.%m.%d)'" > ./package/base-files/files/etc/openwrt_release1
sed -i 's/带宽监控/监控/g' feeds/luci/applications/luci-app-nlbwmon/po/zh-cn/nlbwmon.po
svn co https://github.com/jerrykuku/luci-app-vssr/trunk/  package/new/luci-app-vssr
svn co https://github.com/siropboy/luci-app-vssr-plustrunk/luci-app-vssr-plus package/new/luci-app-vssr-plus
svn co https://github.com/xiaorouji/openwrt-package/trunk/lienol/luci-app-passwall package/luci-app-passwall
svn co https://github.com/xiaorouji/openwrt-package/trunk/package package/lienol
