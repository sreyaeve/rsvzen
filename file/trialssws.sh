#!/bin/bash

MYIP=$(wget -qO- ipinfo.io/ip);

echo "Checking VPS"

CEKEXPIRED () {

    today=$(date -d +1day +%Y-%m-%d)

    Exp1=$(curl -sS https://raw.githubusercontent.com/sreyaeve/IP-Register/main/ip | grep $MYIP | awk '{print $3}')

    if [[ $today < $Exp1 ]]; then

    echo -e "\e[32mSTATUS SCRIPT AKTIF...\e[0m"

    else

    echo -e "\e[31mSCRIPT ANDA EXPIRED!\e[0m";

    

    exit 0

fi

}

IZIN=$(curl -sS https://raw.githubusercontent.com/sreyaeve/IP-Register/main/ip | awk '{print $4}' | grep $MYIP)

if [ $MYIP = $IZIN ]; then

echo -e "\e[32mPermission Accepted...\e[0m"

CEKEXPIRED

else

echo -e "\e[31mPermission Denied!\e[0m";

exit 0

fi

clear
# Color
RED='\033[0;31m'
NC='\033[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHT='\033[0;37m'
# ==========================================
domain=$(cat /etc/xray/domain)
ISP=$(cat /usr/local/etc/xray/org)
CITY=$(cat /usr/local/etc/xray/city)
tls="$(cat ~/log-install.txt | grep -w "Shadowsocks WS TLS" | cut -d: -f2|sed 's/ //g')"
ntls="$(cat ~/log-install.txt | grep -w "Shadowsocks WS none TLS" | cut -d: -f2|sed 's/ //g')"
user=Shadow-`</dev/urandom tr -dc 0-9 | head -c3`
cipher="aes-128-gcm"
uuid=$(cat /proc/sys/kernel/random/uuid)
masaaktif=1
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
sed -i '/#ssws$/a\###! '"$user $exp"'\
},{"password": "'""$uuid""'","method": "'""$cipher""'","email": "'""$user""'"' /etc/xray/config.json
sed -i '/#ssgrpc$/a\###! '"$user $exp"'\
},{"password": "'""$uuid""'","method": "'""$cipher""'","email": "'""$user""'"' /etc/xray/config.json
echo $cipher:$uuid > /tmp/log
shadowsocks_base64=$(cat /tmp/log)
echo -n "${shadowsocks_base64}" | base64 > /tmp/log1
shadowsocks_base64e=$(cat /tmp/log1)
shadowsockslink="ss://${shadowsocks_base64e}@isi_bug_disini:$tls?path=ss-ws&security=tls&host=${domain}&type=ws&sni=${domain}#${user}"
shadowsockslink2="ss://${shadowsocks_base64e}@isi_bug_disini:$ntls?path=ss-ws&security=tls&host=${domain}&type=ws#${user}"
shadowsockslink1="ss://${shadowsocks_base64e}@${domain}:$tls?mode=gun&security=tls&type=grpc&serviceName=ss-grpc&sni=bug.com#${user}"
systemctl restart xray > /dev/null 2>&1
service cron restart > /dev/null 2>&1
clear
echo -e "${CYAN}╒════════════════════════════════════════════╕\033[0m" | tee -a /etc/xraylog/log-ss-$user.txt
echo -e " \E[0;36;44;1m          Shadowsocks Trial Account         \E[0m" | tee -a /etc/xraylog/log-ss-$user.txt
echo -e "${CYAN}╘════════════════════════════════════════════╛\033[0m" | tee -a /etc/xraylog/log-ss-$user.txt
echo -e "Remarks        : ${user}" | tee -a /etc/xraylog/log-ss-$user.txt
echo -e "Domain         : ${domain}" | tee -a /etc/xraylog/log-ss-$user.txt
echo -e "ISP            : ${ISP}"  | tee -a /etc/xraylog/log-ss-$user.txt
echo -e "Region         : ${CITY}" | tee -a /etc/xraylog/log-ss-$user.txt
echo -e "Port TLS       : 443" | tee -a /etc/xraylog/log-ss-$user.txt
echo -e "Port NTLS      : 80" | tee -a /etc/xraylog/log-ss-$user.txt
echo -e "Port gRPC      : 443" | tee -a /etc/xraylog/log-ss-$user.txt
echo -e "Password       : ${uuid}" | tee -a /etc/xraylog/log-ss-$user.txt
echo -e "Ciphers        : ${cipher}" | tee -a /etc/xraylog/log-ss-$user.txt
echo -e "Network        : ws/grpc" | tee -a /etc/xraylog/log-ss-$user.txt
echo -e "Path           : /ss-ws" | tee -a /etc/xraylog/log-ss-$user.txt
echo -e "ServicebName   : ss-grpc" | tee -a /etc/xraylog/log-ss-$user.txt
echo -e "${CYAN} ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m" | tee -a /etc/xraylog/log-ss-$user.txt
echo -e "Link TLS       : ${shadowsockslink}" | tee -a /etc/xraylog/log-ss-$user.txt
echo -e "${CYAN} ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m" | tee -a /etc/xraylog/log-ss-$user.txt
echo -e "Link none TLS  : ${shadowsockslink2}" | tee -a /etc/xraylog/log-ss-$user.txt
echo -e "${CYAN} ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m" | tee -a /etc/xraylog/log-ss-$user.txt
echo -e "Link gRPC      : ${shadowsockslink1}" | tee -a /etc/xraylog/log-ss-$user.txt
echo -e "${CYAN} ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m" | tee -a /etc/xraylog/log-ss-$user.txt
echo -e "Expired On     : $exp" | tee -a /etc/xraylog/log-ss-$user.txt
echo -e "${CYAN} ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m" | tee -a /etc/xraylog/log-ss-$user.txt
echo "" | tee -a /etc/log-create-user.log
read -n 1 -s -r -p "Press any key to back"
m-ssws
