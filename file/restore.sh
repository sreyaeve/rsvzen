#!/bin/bash
# ==========================================
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
###########- COLOR CODE -##############
NC="\e[0m"
RED="\033[0;31m" 
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
# Getting
clear
echo -e "${CYAN}╒════════════════════════════════════════════╕\033[0m"
echo -e " \E[0;36;44;1m               Restore Session              \E[0m"
echo -e "${CYAN}╘════════════════════════════════════════════╛\033[0m"
echo ""
echo "Pastikan File tersebut adalah hasil dari backupan autoscript ini saja"
echo "Silahkan masukan link file backupnya"
echo -e ""
read -rp "Link File: " -e url
echo -e "${CYAN}│${NC}  [ ${CYAN}INFO${NC} ] • Starting to restore data..."
wget -O backup.zip "$url"
unzip backup.zip
rm -f backup.zip
sleep 1

rm -f /root/backup/backup.zip &> /dev/null
sleep 1
cd /root/backup
echo -e "${CYAN}│${NC}  [ ${BLUE}INFO${NC} ] • Restoring passwd data..."
sleep 1
cp /root/backup/passwd /etc/ &> /dev/null
echo -e "${CYAN}│${NC}  [ ${BLUE}INFO${NC} ] • Restoring group data..."
sleep 1
cp /root/backup/group /etc/ &> /dev/null
echo -e "${CYAN}│${NC}  [ ${BLUE}INFO${NC} ] • Restoring shadow data..."
sleep 1
cp /root/backup/shadow /etc/ &> /dev/null
echo -e "${CYAN}│${NC}  [ ${BLUE}INFO${NC} ] • Restoring gshadow data..."
sleep 1
cp /root/backup/gshadow /etc/ &> /dev/null
echo -e "${CYAN}│${NC}  [ ${BLUE}INFO${NC} ] • Restoring chap-secrets data..."
sleep 1
cp /root/backup/chap-secrets /etc/ppp/ &> /dev/null
echo -e "${CYAN}│${NC}  [ ${BLUE}INFO${NC} ] • Restoring ss.conf data..."
sleep 1
cp /root/backup/ss.conf /etc/shadowsocks-libev/ss.conf &> /dev/null
echo -e "${CYAN}│${NC}  [ ${BLUE}INFO${NC} ] • Restoring admin data..."
sleep 1
cp -r /root/backup/zenhost /var/lib/ &> /dev/null
cp -r /root/backup/.acme.sh /root/ &> /dev/null
cp -r /root/backup/ssnvpn /etc/ &> /dev/null
cp -r /root/backup/xray /etc/ &> /dev/null
cp -r /root/backup/public_html /home/vps/ &> /dev/null
cp -r /root/backup/crontab /etc/ &> /dev/null
cp -r /root/backup/cron.d /etc/ &> /dev/null
rm -rf /root/backup &> /dev/null
echo -e "${CYAN}│${NC}  [ ${BLUE}INFO${NC} ] • Done... Successfully Pakbroo."
sleep 1
rm -f /root/backup/backup.zip &> /dev/null
echo -e "${CYAN}└─────────────────────────────────────────────────┘${NC}" 
echo ""
echo "DISARANKAN REBOOT VPSMU SETELAH RESTORE DATA !!"
echo -ne "[ ${RED}WARNING${NC} ] Reboot Sekarang ? (y/n)? "
read answer
if [ "$answer" == "${answer#[Yy]}" ] ;then
exit 0
else
reboot
fi

