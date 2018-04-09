#!/bin/bash
cd ~
#设置.bash_profile文件
echo sh ~/ssr-auto/auto-exec.sh >> .bash_profile
#安装组件
yum install git -y
git clone -b manyuser https://github.com/shadowsocksr-backup/shadowsocksr.git
cd shad*/shad*
python server.py -p 2333 -k chao -m aes-256-cfb -O auth_sha1_v4 -o tls1.2_ticket_auth -d start
/sbin/iptables -I INPUT -p tcp --dport 2333 -j ACCEPT
/etc/rc.d/init.d/iptables save
/etc/rc.d/init.d/iptables restart
rpm -ivh http://xz.wn789.com/CentOSkernel/kernel-firmware-2.6.32-504.3.3.el6.noarch.rpm
rpm -ivh http://xz.wn789.com/CentOSkernel/kernel-2.6.32-504.3.3.el6.x86_64.rpm --force
reboot