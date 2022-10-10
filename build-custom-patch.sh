#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#
# Modify default IP
sed -i 's/192.168.1.1/192.168.10.1/g' package/base-files/files/bin/config_generate
# 修改lan 和 wan网卡顺序
sed -i 's/lan/tmp_w/g' package/base-files/files/etc/board.d/99-default_network
sed -i 's/wan/tmp_l/g' package/base-files/files/etc/board.d/99-default_network
sed -i 's/tmp_w/wan/g' package/base-files/files/etc/board.d/99-default_network
sed -i 's/tmp_l/lan/g' package/base-files/files/etc/board.d/99-default_network

#修正连接数
sed -i '/customized in this file/a net.netfilter.nf_conntrack_max=165535' package/base-files/files/etc/sysctl.conf

# themes添加（svn co 命令意思：指定版本如https://github）
git clone https://github.com/xiaoqingfengATGH/luci-theme-infinityfreedom package/luci-theme-infinityfreedom

# 第三方app
git clone https://github.com/sirpdboy/luci-app-netdata.git package/luci-app-netdata

git clone https://github.com/jerrykuku/lua-maxminddb.git package/lua-maxminddb
git clone https://github.com/jerrykuku/luci-app-vssr.git package/luci-app-vssr

git clone https://github.com/kiddin9/luci-app-dnsfilter.git package/luci-app-dnsfilter
git clone https://github.com/linkease/istore.git package/istore