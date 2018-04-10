#!/bin/bash
cd ~
yum -y install wget
wget -N --no-check-certificate https://raw.githubusercontent.com/wn789/serverspeeder/master/serverspeeder.sh
bash serverspeeder.sh
cd shad*/shad*
python server.py -p 2333 -k chao -m aes-256-cfb -O auth_sha1_v4 -o tls1.2_ticket_auth -d start
cd ~
sed -i '/auto-exec.sh/d' .bash_profile
echo "ssr部署完成，已自动打开日志文件："
tail -f /var/log/shadowsocksr.log