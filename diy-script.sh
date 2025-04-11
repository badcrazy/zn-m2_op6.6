#!/bin/bash

# 修改默认IP
# sed -i 's/192.168.1.1/10.0.0.1/g' package/base-files/files/bin/config_generate

# 更改默认 Shell 为 zsh
# sed -i 's/\/bin\/ash/\/usr\/bin\/zsh/g' package/base-files/files/etc/passwd

# TTYD 免登录
# sed -i 's|/bin/login|/bin/login -f root|g' feeds/packages/utils/ttyd/files/ttyd.config

# 优化网络性能
sed -i '$a  # 256 Kb / 64 MB'  feeds/package/base-files/files/etc/sysctl.d/10-default.conf
sed -i '$a  net.core.rmem_default = 262144'  feeds/package/base-files/files/etc/sysctl.d/10-default.conf
sed -i '$a  net.core.wmem_default = 262144'  feeds/package/base-files/files/etc/sysctl.d/10-default.conf
sed -i '$a  net.core.rmem_max = 67108864'  feeds/package/base-files/files/etc/sysctl.d/10-default.conf
sed -i '$a  net.core.wmem_max = 67108864'  feeds/package/base-files/files/etc/sysctl.d/10-default.conf
sed -i '$a  # 64MB'  feeds/package/base-files/files/etc/sysctl.d/10-default.conf
sed -i '$a  net.ipv4.tcp_rmem = 4096 87380 67108864'  feeds/package/base-files/files/etc/sysctl.d/10-default.conf
sed -i '$a  net.ipv4.tcp_wmem = 4096 16384 67108864'  feeds/package/base-files/files/etc/sysctl.d/10-default.conf
sed -i '$a  net.ipv4.tcp_window_scaling = 1 '  feeds/package/base-files/files/etc/sysctl.d/10-default.conf
sed -i 's/net.netfilter.nf_conntrack_tcp_timeout_established=7440/net.netfilter.nf_conntrack_tcp_timeout_established=300/g' feeds/package/kernel/linux/files/sysctl-nf-conntrack.conf
sed -i 's/net.netfilter.nf_conntrack_udp_timeout=60/net.netfilter.nf_conntrack_udp_timeout=10/g' feeds/package/kernel/linux/files/sysctl-nf-conntrack.conf
sed -i 's/net.netfilter.nf_conntrack_udp_timeout_stream=180/net.netfilter.nf_conntrack_udp_timeout_stream=20/g' feeds/package/kernel/linux/files/sysctl-nf-conntrack.conf


# 移除要替换的包
rm -rf feeds/luci/applications/luci-app-upnp
# 添加额外插件
git clone --depth=1 https://github.com/badcrazy/luci-app-upnp package/luci-app-upnp
git clone --depth=1 https://github.com/xiaoxiao29/luci-app-adguardhome package/luci-app-adguardhome
# git clone --depth=1 https://github.com/sirpdboy/netspeedtest  package/netspeedtes
# git clone --depth=1 -b openwrt-18.06 https://github.com/tty228/luci-app-wechatpush package/luci-app-serverchan
# git clone --depth=1 https://github.com/ilxp/luci-app-ikoolproxy package/luci-app-ikoolproxy
# git clone --depth=1 https://github.com/esirplayground/luci-app-poweroff package/luci-app-poweroff
# git clone --depth=1 https://github.com/destan19/OpenAppFilter package/OpenAppFilter
# git clone --depth=1 https://github.com/Jason6111/luci-app-netdata package/luci-app-netdata
# git_sparse_clone main https://github.com/Lienol/openwrt-package luci-app-filebrowser luci-app-ssr-mudb-server
# git_sparse_clone openwrt-18.06 https://github.com/immortalwrt/luci applications/luci-app-eqos
# git_sparse_clone master https://github.com/syb999/openwrt-19.07.1 package/network/services/msd_lite

# 科学上网插件
#git clone --depth=1 -b main https://github.com/fw876/helloworld package/luci-app-ssr-plus
#git clone --depth=1 https://github.com/xiaorouji/openwrt-passwall-packages package/openwrt-passwall
#git clone --depth=1 https://github.com/xiaorouji/openwrt-passwall package/luci-app-passwall
#git clone --depth=1 https://github.com/xiaorouji/openwrt-passwall2 package/luci-app-passwall2
#git_sparse_clone master https://github.com/vernesong/OpenClash luci-app-openclash

# 主题

./scripts/feeds update -a
./scripts/feeds install -a
