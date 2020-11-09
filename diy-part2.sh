#!/bin/bash
#============================================================
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
# Lisence: MIT
# Author: P3TERX
# Blog: https://p3terx.com
#============================================================
rm -rf ./package/lean/luci-theme-argon
rm -rf ./package/lean/trojan
rm -rf ./package/lean/v2ray
rm -rf ./package/lean/v2ray-plugin
rm -rf ./package/lean/luci-app-netdata &&svn co https://github.com/siropboy/siropboy-package/trunk/luci-app-netdata ./package/lean/luci-app-netdata
rm -rf ./package/lean/luci-theme-opentomcat
rm -rf ./feeds/packages/admin/netdata&&svn co https://github.com/siropboy/siropboy-package/trunk/netdata ./feeds/packages/admin/netdata
rm -rf ./feeds/packages/net/mwan3 &&svn co https://github.com/siropboy/siropboy-package/trunk/mwan3 ./feeds/packages/net/mwan3
rm -rf ./feeds/packages/net/https-dns-proxy &&svn co https://github.com/Lienol/openwrt-packages/trunk/net/https-dns-proxy feeds/packages/net/https-dns-proxy
# rm -rf ./package/diy/autocore
#rm -rf ./feeds/diy/default-settings
#rm -rf ./package/lean/autocore
# rm -rf ./package/lean/default-settings
#curl -fsSL https://raw.githubusercontent.com/siropboy/other/master/patch/autocore/files/x86/index.htm > package/lean/autocore/files/x86/index.htm
#curl -fsSL https://raw.githubusercontent.com/siropboy/other/master/patch/autocore/files/arm/index.htm > package/lean/autocore/files/arm/index.htm
curl -fsSL  https://raw.githubusercontent.com/siropboy/other/master/patch/default-settings/zzz-default-settings > ./package/lean/default-settings/files/zzz-default-settings
sed -i 's/网络存储/存储/g' package/lean/luci-app-vsftpd/po/zh-cn/vsftpd.po
sed -i 's/Turbo ACC 网络加速/ACC网络加速/g' package/lean/luci-app-flowoffload/po/zh-cn/flowoffload.po
sed -i 's/Turbo ACC 网络加速/ACC网络加速/g' package/lean/luci-app-sfe/po/zh-cn/sfe.po
sed -i 's/解锁网易云灰色歌曲/解锁灰色歌曲/g' package/lean/luci-app-unblockmusic/po/zh-cn/unblockmusic.po
sed -i 's/家庭云//g' package/lean/luci-app-familycloud/luasrc/controller/familycloud.lua
sed -i '/filter_/d' package/network/services/dnsmasq/files/dhcp.conf
sed -i 's/$(VERSION_DIST_SANITIZED)/$(shell TZ=UTC-8 date +%Y%m%d)-ipv6/g' include/image.mk
echo "DISTRIB_REVISION='S$(TZ=UTC-8 date +%Y.%m.%d)'" > ./package/base-files/files/etc/openwrt_release1
sed -i 's/带宽监控/监控/g' feeds/luci/applications/luci-app-nlbwmon/po/zh-cn/nlbwmon.po
sed -i "s/bootstrap/edge/g" feeds/luci/modules/luci-base/root/etc/config/luci
sed -i 's/bootstrap/edge/g' feeds/luci/collections/luci/Makefile
./scripts/feeds update -i
