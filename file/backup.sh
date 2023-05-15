#!/bin/bash
# My Telegram : https://t.me/zenvio
# ==========================================
# Color
RED='\033[0;31m'
NC='\033[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHT='\033[0;37m'
# Color Validation

DF='\e[39m'

Bold='\e[1m'

Blink='\e[5m'

yell='\e[33m'

red='\e[31m'

green='\e[32m'

blue='\e[34m'

PURPLE='\e[35m'

cyan='\e[36m'

Lred='\e[91m'

Lgreen='\e[92m'

Lyellow='\e[93m'

NC='\e[0m'

GREEN='\033[0;32m'

ORANGE='\033[0;33m'

LIGHT='\033[0;37m'
green() { echo -e "\\033[32;1m${*}\\033[0m"; }

red() { echo -e "\\033[31;1m${*}\\033[0m"; }
# ==========================================
# Getting
clear
IP=$(wget -qO- ipinfo.io/ip);
date=$(date +"%Y-%m-%d")
domain=$(cat /etc/xray/domain)
clear
email="kontol@gmail.com"
clear
echo -e "${CYAN}╒════════════════════════════════════════════╕\033[0m"
echo -e " \E[0;36;44;1m                Backup Session              \E[0m"
echo -e "${CYAN}╘════════════════════════════════════════════╛\033[0m"
red "WARNING !!!"
green "Processing backup data, Please Wait"
rm -rf /root/backup
mkdir /root/backup
cp /etc/passwd backup/
cp /etc/group backup/
cp /etc/shadow backup/
cp /etc/gshadow backup/
cp /etc/crontab backup/
cp -r /var/lib/zenhost/ backup/zenhost
cp -r /etc/xray backup/xray
cp -r /home/vps/public_html backup/public_html
cp -r /etc/cron.d backup/cron.d
cp -r /etc/xraylog backup/xraylog
cd /root
zip -r $IP-$date.zip backup > /dev/null 2>&1
rclone copy /root/$IP-$date.zip dr:backup/
url=$(rclone link dr:backup/$IP-$date.zip)
id=(`echo $url | grep '^https' | cut -d'=' -f2`)
link="https://drive.google.com/u/4/uc?id=${id}&export=download"
echo -e "Detail Backup"
echo "${CYAN} ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo "     IP VPS        : $IP"
echo "     Domain        : $domain"
echo "     Link Backup   : $link"
echo "     Tanggal       : $date"
echo "${CYAN} ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
mail -s "Backup Data" $email
rm -rf /root/backup
rm -r /root/$IP-$date.zip
clear
echo -e "Detail Backup"
echo "${CYAN} ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo "     IP VPS        : $IP"
echo "     Domain        : $domain"
echo "     Link Backup   : $link"
echo "     Tanggal       : $date"
echo "${CYAN} ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo "Silahkan copy Link dan restore di VPS baru"
echo "Terimakasih sudah menggunakan layanan ZenVPN"
