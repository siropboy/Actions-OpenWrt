#!/bin/bash
#============================================================
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
# Lisence: MIT
# Author: P3TERX
# Blog: https://p3terx.com
#============================================================

git clone https://github.com/sirpdboy/build.git package/build
#echo '替换smartdns'
rm -rf ./feeds/packages/net/smartdns&& svn co https://github.com/sirpdboy/sirpdboy-package/trunk/smartdns ./feeds/packages/net/smartdns
rm -rf ./package/lean/luci-app-netdata && svn co https://github.com/sirpdboy/sirpdboy-package/trunk/luci-app-netdata ./package/lean/luci-app-netdata
rm -rf ./feeds/packages/admin/netdata && svn co https://github.com/sirpdboy/sirpdboy-package/trunk/netdata ./feeds/packages/admin/netdata
rm -rf ./feeds/packages/net/mwan3 && svn co https://github.com/sirpdboy/build/trunk/mwan3 ./feeds/packages/net/mwan3
rm -rf ./feeds/packages/net/https-dns-proxy  && svn co https://github.com/Lienol/openwrt-packages/trunk/net/https-dns-proxy ./feeds/packages/net/https-dns-proxy
rm -rf ./package/build/autocore
rm -rf ./package/lean/automount
rm -rf ./package/lean/autosamba
rm -rf ./package/build/mwan3
rm -rf ./package/lean/luci-app-accesscontrol
rm -rf ./package/lean/default-settings
rm -rf package/lean/luci-app-arpbind
rm -rf package/lean/luci-app-docker
rm -rf package/lean/luci-app-dockerman
rm -rf package/lean/luci-lib-docker
rm -rf ./package/lean/trojan
rm -rf package/lean/openwrt-fullconenat && svn co https://github.com/sirpdboy/build/trunk/openwrt-fullconenat package/lean/openwrt-fullconenat
rm -rf ./package/lean/shortcut-fe
rm -rf ./package/lean/dnsforwarder
rm -rf feeds/luci/applications/luci-app-samba && svn co https://github.com/sirpdboy/build/trunk/luci-app-samba feeds/luci/applications/luci-app-samba
rm -rf ./package/network/services/samba36 && svn co https://github.com/sirpdboy/build/trunk/samba36 ./package/network/services/samba36
rm -rf ./package/lean/samba4
rm -rf ./feeds/package/net/samba4 && svn co https://github.com/sirpdboy/build/trunk/samba4 ./feeds/package/net/samba4
rm -rf ./package/lean/softethervpn5
rm -rf  ./feeds/packages/net/wsdd2  && svn co https://github.com/sirpdboy/build/trunk/wsdd2  ./feeds/packages/net/wsdd2 
rm -rf ./package/lean/luci-app-samba4

curl -fsSL  https://raw.githubusercontent.com/loso3000/other/master/patch/poweroff/poweroff.htm > ./feeds/luci/modules/luci-mod-admin-full/luasrc/view/admin_system/poweroff.htm 
curl -fsSL  https://raw.githubusercontent.com/loso3000/other/master/patch/poweroff/system.lua > ./feeds/luci/modules/luci-mod-admin-full/luasrc/controller/admin/system.lua

sed -i 's/网络存储/存储/g' package/lean/luci-app-vsftpd/po/zh-cn/vsftpd.po
sed -i 's/Turbo ACC 网络加速/ACC网络加速/g' package/lean/luci-app-flowoffload/po/zh-cn/flowoffload.po
sed -i 's/Turbo ACC 网络加速/ACC网络加速/g' package/lean/luci-app-sfe/po/zh-cn/sfe.po
sed -i 's/解锁网易云灰色歌曲/解锁灰色歌曲/g' package/lean/luci-app-unblockmusic/po/zh-cn/unblockmusic.po
sed -i 's/家庭云//g' package/lean/luci-app-familycloud/luasrc/controller/familycloud.lua
sed -i 's/实时流量监测/流量/g' package/lean/luci-app-wrtbwmon/po/zh-cn/wrtbwmon.po
sed -i 's/KMS 服务器/KMS激活/g' package/lean/luci-app-vlmcsd/po/zh-cn/vlmcsd.po
sed -i 's/USB 打印服务器"/打印服务/g' package/lean/luci-app-usb-printer/po/zh-cn/usb-printer.po
sed -i 's/aMule设置/电驴下载/g' package/lean/luci-app-amule/po/zh-cn/amule.po
sed -i 's/网络存储/存储/g' package/lean/luci-app-amule/po/zh-cn/amule.po
sed -i 's/监听端口/监听端口 用户名admin密码adminadmin/g' package/lean/luci-app-qbittorrent/po/zh-cn/qbittorrent.po
sed -i 's/带宽监控/监控/g' feeds/luci/applications/luci-app-nlbwmon/po/zh-cn/nlbwmon.po
sed -i 's/a.default = "0"/a.default = "1"/g' ./package/lean/luci-app-cifsd/luasrc/controller/cifsd.lua   #挂问题
echo  "        option tls_enable 'true'" >> ./package/lean/luci-app-frpc/root/etc/config/frp   #FRP穿透问题
sed -i 's/invalid/# invalid/g' package/lean/samba4/files/smb.conf.template   #共享问题
sed -i 's/invalid/# invalid/g' package/network/services/samba36/files/smb.conf.template  #共享问题
sed -i '/mcsub_renew.datatype/d'  feeds/luci/applications/luci-app-udpxy/luasrc/model/cbi/udpxy.lua  #修复UDPXY设置延时55的错误
sed -i 's/root::0:0:99999:7:::/root:$1$V4UetPzk$CYXluq4wUazHjmCDBCqXF.:0:0:99999:7:::/g' ./package/base-files/files/etc/shadow
sed -i '/filter_/d' package/network/services/dnsmasq/files/dhcp.conf   #DHCP禁用IPV6问题
echo  "默认开启 Irqbalance"
sed -i "s/enabled '0'/enabled '1'/g" feeds/packages/utils/irqbalance/files/irqbalance.config

sed -i 's/$(VERSION_DIST_SANITIZED)/$(shell TZ=UTC-8 date +%Y%m%d)-ipv6/g' include/image.mk
echo "DISTRIB_REVISION='S$(TZ=UTC-8 date +%Y.%m.%d)'" > ./package/base-files/files/etc/openwrt_release1
sed -i 's/带宽监控/监控/g' feeds/luci/applications/luci-app-nlbwmon/po/zh-cn/nlbwmon.po
sed -i 's/root::0:0:99999:7:::/root:$1$V4UetPzk$CYXluq4wUazHjmCDBCqXF.:0:0:99999:7:::/g' ./package/base-files/files/etc/shadow

sed -i "s/bootstrap/edge/g" feeds/luci/modules/luci-base/root/etc/config/luci
sed -i 's/bootstrap/edge/g' feeds/luci/collections/luci/Makefile
./scripts/feeds update -i
