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
tls="$(cat ~/log-install.txt | grep -w "Trojan WS TLS" | cut -d: -f2|sed 's/ //g')"
ntls="$(cat ~/log-install.txt | grep -w "Trojan WS none TLS" | cut -d: -f2|sed 's/ //g')"
user=Trojan-`</dev/urandom tr -dc 0-9 | head -c3`
uuid=$(cat /proc/sys/kernel/random/uuid)
masaaktif=1
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
sed -i '/#trojanws$/a\#! '"$user $exp"'\
},{"password": "'""$uuid""'","email": "'""$user""'"' /etc/xray/config.json
sed -i '/#trojangrpc$/a\#! '"$user $exp"'\
},{"password": "'""$uuid""'","email": "'""$user""'"' /etc/xray/config.json

systemctl restart xray
trojanlink1="trojan://${uuid}@${domain}:${tls}?mode=gun&security=tls&type=grpc&serviceName=trojan-grpc&sni=bug.com#${user}"
trojanlink="trojan://${uuid}@isi_bug_disini:${tls}?path=%2Ftrojan-ws&security=tls&host=${domain}&type=ws&sni=${domain}#${user}"
trojanlink2="trojan://${uuid}@isi_bug_disini:${ntls}?path=%2Ftrojan-ws&security=tls&host=${domain}&type=ws#${user}"
clear
echo -e "${CYAN}╒════════════════════════════════════════════╕\033[0m" | tee -a /etc/xraylog/log-trojan-$user.txt
echo -e " \E[0;36;44;1m             Trojan Trial Account           \E[0m" | tee -a /etc/xraylog/log-trojan-$user.txt
echo -e "${CYAN}╘════════════════════════════════════════════╛\033[0m" | tee -a /etc/xraylog/log-trojan-$user.txt
echo -e "Remarks        : ${user}" | tee -a /etc/xraylog/log-trojan-$user.txt
echo -e "Host/IP        : ${domain}" | tee -a /etc/xraylog/log-trojan-$user.txt
echo -e "ISP            : ${ISP}" | tee -a /etc/xraylog/log-trojan-$user.txt
echo -e "Region         : ${CITY}" | tee -a /etc/xraylog/log-trojan-$user.txt
echo -e "Port TLS       : 443" | tee -a /etc/xraylog/log-trojan-$user.txt
echo -e "Port none TLS  : 80" | tee -a /etc/xraylog/log-trojan-$user.txt
echo -e "Port gRPC      : ${tls}" | tee -a /etc/xraylog/log-trojan-$user.txt
echo -e "Key            : ${uuid}" | tee -a /etc/xraylog/log-trojan-$user.txt
echo -e "Path           : /trojan-ws" | tee -a /etc/xraylog/log-trojan-$user.txt
echo -e "Service Name   : trojan-grpc" | tee -a /etc/xraylog/log-trojan-$user.txt
echo -e "${CYAN} ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m" | tee -a /etc/xraylog/log-trojan-$user.txt
echo -e "Link TLS       : ${trojanlink}" | tee -a /etc/xraylog/log-trojan-$user.txt
echo -e "${CYAN} ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m" | tee -a /etc/xraylog/log-trojan-$user.txt
echo -e "Link none TLS  : ${trojanlink2}" | tee -a /etc/xraylog/log-trojan-$user.txt
echo -e "${CYAN} ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m" | tee -a /etc/xraylog/log-trojan-$user.txt
echo -e "Link gRPC      : ${trojanlink1}" | tee -a /etc/xraylog/log-trojan-$user.txt
echo -e "${CYAN} ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m" | tee -a /etc/xraylog/log-trojan-$user.txt
echo -e "Expired On     : $exp" | tee -a /etc/xraylog/log-trojan-$user.txt
echo -e "${CYAN} ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m" | tee -a /etc/xraylog/log-trojan-$user.txt
echo ""
read -n 1 -s -r -p "Press any key to back"

m-trojan
