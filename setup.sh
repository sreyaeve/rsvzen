#!/bin/bash
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
#########################
clear
BURIQ () {
    curl -sS https://raw.githubusercontent.com/sreyaeve/IP-Register/main/ip > /root/tmp
    data=( `cat /root/tmp | grep -E "^### " | awk '{print $2}'` )
    for user in "${data[@]}"
    do
    exp=( `grep -E "^### $user" "/root/tmp" | awk '{print $3}'` )
    d1=(`date -d "$exp" +%s`)
    d2=(`date -d "$biji" +%s`)
    exp2=$(( (d1 - d2) / 86400 ))
    if [[ "$exp2" -le "0" ]]; then
    echo $user > /etc/.$user.ini
    else
    rm -f  /etc/.$user.ini > /dev/null 2>&1
    fi
    done
    rm -f  /root/tmp
}
# https://raw.githubusercontent.com/sreyaeve/IP-Register/main/ip
MYIP=$(curl -sS ipv4.icanhazip.com)
Name=$(curl -sS https://raw.githubusercontent.com/sreyaeve/IP-Register/main/ip | grep $MYIP | awk '{print $2}')
echo $Name > /usr/local/etc/.$Name.ini
CekOne=$(cat /usr/local/etc/.$Name.ini)

Bloman () {
if [ -f "/etc/.$Name.ini" ]; then
CekTwo=$(cat /etc/.$Name.ini)
    if [ "$CekOne" = "$CekTwo" ]; then
        res="Expired"
    fi
else
res="Permission Accepted..."
fi
}

PERMISSION () {
    MYIP=$(curl -sS ipv4.icanhazip.com)
    IZIN=$(curl -sS https://raw.githubusercontent.com/sreyaeve/IP-Register/main/ip | awk '{print $4}' | grep $MYIP)
    if [ "$MYIP" = "$IZIN" ]; then
    Bloman
    else
    res="Permission Denied!"
    fi
    BURIQ
}

clear
red='\e[1;31m'
green='\e[0;32m'
yell='\e[1;33m'
tyblue='\e[1;36m'
NC='\e[0m'
# Color

RED='\033[0;31m'

NC='\033[0m'

GREEN='\033[0;32m'

ORANGE='\033[0;33m'

BLUE='\033[0;34m'

PURPLE='\033[0;35m'

CYAN='\033[0;36m'

LIGHT='\033[0;37m'
purple() { echo -e "\\033[35;1m${*}\\033[0m"; }
tyblue() { echo -e "\\033[36;1m${*}\\033[0m"; }
yellow() { echo -e "\\033[33;1m${*}\\033[0m"; }
green() { echo -e "\\033[32;1m${*}\\033[0m"; }
red() { echo -e "\\033[31;1m${*}\\033[0m"; }
cd /root
#System version number
if [ "${EUID}" -ne 0 ]; then
		echo "You need to run this script as root"
		exit 1
fi
if [ "$(systemd-detect-virt)" == "openvz" ]; then
		echo "OpenVZ is not supported"
		exit 1
fi

localip=$(hostname -I | cut -d\  -f1)
hst=( `hostname` )
dart=$(cat /etc/hosts | grep -w `hostname` | awk '{print $2}')
if [[ "$hst" != "$dart" ]]; then
echo "$localip $(hostname)" >> /etc/hosts
fi
apt install jq curl -y
apt install curl sudo -y
mkdir -p /etc/xray
mkdir -p /etc/v2ray
mkdir /etc/xraylog >> /dev/null 2>&1
touch /etc/xray/domain
touch /etc/v2ray/domain
touch /etc/xray/scdomain
touch /etc/v2ray/scdomain


secs_to_human() {
    echo "Installation time : $(( ${1} / 3600 )) hours $(( (${1} / 60) % 60 )) minute's $(( ${1} % 60 )) seconds"
}
start=$(date +%s)
ln -fs /usr/share/zoneinfo/Asia/Jakarta /etc/localtime
sysctl -w net.ipv6.conf.all.disable_ipv6=1 >/dev/null 2>&1
sysctl -w net.ipv6.conf.default.disable_ipv6=1 >/dev/null 2>&1
clear
echo -e "[ ${green}INFO${NC} ] Preparing the install file"
apt install git curl -y >/dev/null 2>&1
apt install python -y >/dev/null 2>&1
echo -e "[ ${green}INFO${NC} ] Aight good ... installation file is ready"
sleep 0.5
echo -ne "[ ${green}INFO${NC} ] Check permission : "
PERMISSION
if [ -f /home/needupdate ]; then

red "Your script need to update first !"

exit 0

elif [ "$res" = "Permission Accepted..." ]; then

green "GOOD! Permission Accepted!"

else

red "Warning! Permission Denied!"


rm setup.sh > /dev/null 2>&1

sleep 0.5

exit 0

fi
sleep 0.5
mkdir /user >> /dev/null 2>&1
apt install resolvconf network-manager dnsutils bind9 -y
cat > /etc/systemd/resolved.conf << END
[Resolve]
DNS=8.8.8.8 8.8.4.4
Domains=~.
ReadEtcHosts=yes
END
systemctl enable resolvconf
systemctl enable systemd-resolved
systemctl enable NetworkManager
rm -rf /etc/resolv.conf
rm -rf /etc/resolvconf/resolv.conf.d/head
echo "
nameserver 127.0.0.53
" >> /etc/resolv.conf
echo "
" >> /etc/resolvconf/resolv.conf.d/head
systemctl restart resolvconf
systemctl restart systemd-resolved
systemctl restart NetworkManager
echo "Google DNS" > /user/current

mkdir -p /var/lib/zenhost >/dev/null 2>&1
echo "IP=" >> /var/lib/zenhost/ipvps.conf

mkdir -p /usr/local/etc/xray
rm /usr/local/etc/xray/city >> /dev/null 2>&1
rm /usr/local/etc/xray/org >> /dev/null 2>&1
rm /usr/local/etc/xray/timezone >> /dev/null 2>&1

curl -s ipinfo.io/city >> /usr/local/etc/xray/city
curl -s ipinfo.io/org | cut -d " " -f 2-10 >> /usr/local/etc/xray/org
curl -s ipinfo.io/timezone >> /usr/local/etc/xray/timezone
echo ""
#wget -q https://raw.githubusercontent.com/sreyaeve/sshxrayv2/main/toolsinstaller.sh;chmod +x toolsinstaller.sh;./toolsinstaller.sh
#rm toolsinstaller.sh
clear
echo -e "${CYAN}╒════════════════════════════════════════════╕\033[0m"
echo -e " \E[0;33;44;1m           This Autoscript Is Paid          \E[0m"
echo -e " \E[0;36;44;1m             You Can Contact Me             \E[0m"
echo -e " \E[0;36;44;1m           WhatsApp : 081977814343          \E[0m"
echo -e " \E[0;36;44;1m           Telegram : t.me/zenvio           \E[0m"
echo -e "${CYAN}╘════════════════════════════════════════════╛\033[0m"
echo -e "${CYAN}╒════════════════════════════════════════════╕\033[0m"
echo -e " \E[0;36;44;1m              Please Choice One             \E[0m"
echo -e "${CYAN}╘════════════════════════════════════════════╛\033[0m"
echo -e ""
echo -e "${GREEN}1${NC}. Your Own Domain"
echo -e "${GREEN}2${NC}. Our Domain"
read -p "$( echo -e "${GREEN}Please Input ! ${NC}(${YELLOW}1/2${NC})${NC} " )" choose_domain

# // Validating Automatic / Private
if [[ $choose_domain == "2" ]]; then # // Using Automatic Domain
# // String / Request Data
sub=$(</dev/urandom tr -dc a-z0-9 | head -c4)
DOMAIN=vpncantik.tech
SUB_DOMAIN=${sub}.vpncantik.tech
CF_ID=cloudflaredomainpanel@gmail.com
CF_KEY=91b7451cf8fed9cbc1c4ca31931ffce8741f6
set -euo pipefail
IP=$(curl -sS ifconfig.me);
echo "Updating DNS for ${SUB_DOMAIN}..."
ZONE=$(curl -sLX GET "https://api.cloudflare.com/client/v4/zones?name=${DOMAIN}&status=active" \
     -H "X-Auth-Email: ${CF_ID}" \
     -H "X-Auth-Key: ${CF_KEY}" \
     -H "Content-Type: application/json" | jq -r .result[0].id)

RECORD=$(curl -sLX GET "https://api.cloudflare.com/client/v4/zones/${ZONE}/dns_records?name=${SUB_DOMAIN}" \
     -H "X-Auth-Email: ${CF_ID}" \
     -H "X-Auth-Key: ${CF_KEY}" \
     -H "Content-Type: application/json" | jq -r .result[0].id)

if [[ "${#RECORD}" -le 10 ]]; then
     RECORD=$(curl -sLX POST "https://api.cloudflare.com/client/v4/zones/${ZONE}/dns_records" \
     -H "X-Auth-Email: ${CF_ID}" \
     -H "X-Auth-Key: ${CF_KEY}" \
     -H "Content-Type: application/json" \
     --data '{"type":"A","name":"'${SUB_DOMAIN}'","content":"'${IP}'","ttl":120,"proxied":false}' | jq -r .result.id)
fi

RESULT=$(curl -sLX PUT "https://api.cloudflare.com/client/v4/zones/${ZONE}/dns_records/${RECORD}" \
     -H "X-Auth-Email: ${CF_ID}" \
     -H "X-Auth-Key: ${CF_KEY}" \
     -H "Content-Type: application/json" \
     --data '{"type":"A","name":"'${SUB_DOMAIN}'","content":"'${IP}'","ttl":120,"proxied":false}')
     
echo "Host : $SUB_DOMAIN"
echo $SUB_DOMAIN > /root/domain
echo "$SUB_DOMAIN" > /root/scdomain
	echo "$SUB_DOMAIN" > /etc/xray/scdomain
	echo "$SUB_DOMAIN" > /etc/xray/domain
	echo "$SUB_DOMAIN" > /etc/v2ray/domain
echo "IP=$SUB_DOMAIN" > /var/lib/zenhost/ipvps.conf
sleep 1
yellow() { echo -e "\\033[33;1m${*}\\033[0m"; }
yellow "Domain added.."
sleep 3
domain=$(cat /root/domain)
cp -r /root/domain /etc/xray/domain

# // ELif For Selection 1
elif [[ $choose_domain == "1" ]]; then

# // Clear
clear
clear && clear && clear
clear;clear;clear

echo -e "${CYAN}╒════════════════════════════════════════════╕\033[0m"
echo -e " \E[0;33;44;1m           This Autoscript Is Paid          \E[0m"
echo -e " \E[0;36;44;1m             You Can Contact Me             \E[0m"
echo -e " \E[0;36;44;1m           WhatsApp : 081977814343          \E[0m"
echo -e " \E[0;36;44;1m           Telegram : t.me/zenvio           \E[0m"
echo -e "${CYAN}╘════════════════════════════════════════════╛\033[0m"
echo -e "${CYAN}╒════════════════════════════════════════════╕\033[0m"
echo -e " \E[0;36;44;1m              Input Your Domain             \E[0m"
echo -e "${CYAN}╘════════════════════════════════════════════╛\033[0m"
echo " "
read -rp "Input Your Own Domain : " -e dns
    if [ -z $dns ]; then
        echo -e "
        Nothing input for domain!
        Then a random domain will be created"
    else
        echo "$dns" > /root/scdomain
	echo "$dns" > /etc/xray/scdomain
	echo "$dns" > /etc/xray/domain
	echo "$dns" > /etc/v2ray/domain
	echo $dns > /root/domain
        echo "IP=$dns" > /var/lib/zenhost/ipvps.conf
    fi

# // Else Do
else
    echo -e "${EROR} Please Choose 1 & 2 Only !"
    exit 1
fi
sts=jancok
echo $sts > /home/email

clear   
#install ssh ovpn
echo -e "${CYAN}╒════════════════════════════════════════════╕\033[0m"
echo -e " \E[0;36;44;1m             Installing Websocket           \E[0m"
echo -e "${CYAN}╘════════════════════════════════════════════╛\033[0m"
sleep 0.5
wget https://raw.githubusercontent.com/sreyaeve/rsvzen/main/installer/sshinstaller.sh && chmod +x sshinstaller.sh && ./sshinstaller.sh
#install backup
echo -e "${CYAN}╒════════════════════════════════════════════╕\033[0m"
echo -e " \E[0;36;44;1m            Installing Backup Set           \E[0m"
echo -e "${CYAN}╘════════════════════════════════════════════╛\033[0m"
sleep 0.5
wget https://raw.githubusercontent.com/sreyaeve/rsvzen/main/installer/backupinstaller.sh && chmod +x backupinstaller.sh && ./backupinstaller.sh
#Instal Xray
echo -e "${CYAN}╒════════════════════════════════════════════╕\033[0m"
echo -e " \E[0;36;44;1m           Installing Xray Services         \E[0m"
echo -e "${CYAN}╘════════════════════════════════════════════╛\033[0m"
sleep 0.5
wget https://raw.githubusercontent.com/sreyaeve/rsvzen/main/installer/xrayinstaller.sh && chmod +x xrayinstaller.sh && ./xrayinstaller.sh
wget https://raw.githubusercontent.com/sreyaeve/rsvzen/main/installer/websocketinstaller.sh && chmod +x websocketinstaller.sh && ./websocketinstaller.sh
wget -q https://raw.githubusercontent.com/sreyaeve/rsvzen/main/installer/toolsinstaller.sh;chmod +x toolsinstaller.sh;./toolsinstaller.sh
clear
cat> /root/.profile << END
# ~/.profile: executed by Bourne-compatible login shells.

if [ "$BASH" ]; then
  if [ -f ~/.bashrc ]; then
    . ~/.bashrc
  fi
fi

mesg n || true
clear
menu
END
chmod 644 /root/.profile

if [ -f "/root/log-install.txt" ]; then
rm /root/log-install.txt > /dev/null 2>&1
fi
if [ -f "/etc/afak.conf" ]; then
rm /etc/afak.conf > /dev/null 2>&1
fi
if [ ! -f "/etc/log-create-user.log" ]; then
echo "Log All Account " > /etc/log-create-user.log
fi
history -c
serverV="Beta"
echo $serverV > /opt/.ver
aureb=$(cat /home/re_otm)
b=11
if [ $aureb -gt $b ]
then
gg="PM"
else
gg="AM"
fi
curl -sS ifconfig.me > /etc/myipvps
echo ""
echo -e "${CYAN}╒════════════════════════════════════════════╕\033[0m"
echo -e " \E[0;36;44;1m             Succesfully Installed          \E[0m"
echo -e "${CYAN}╘════════════════════════════════════════════╛\033[0m"
echo ""
echo " SSH WEBSOCKET        Fully Automatic Script"
echo " XRAY VMESS           Backup & Restore"
echo " XRAY VLESS           Check Create Account"
echo " XRAY TROJAN          AutoDelete Expired User"
echo " SHADOWSOCKS          Only Websocket Services"
echo ""
echo " All Port HTTPS         : 443"
echo " All Port HTTP          : 80"
echo ""
echo -e "${CYAN} ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo ""
echo "" | tee -a log-install.txt
rm /root/setup.sh >/dev/null 2>&1
rm /root/backupinstaller.sh >/dev/null 2>&1
rm /root/sshinstaller.sh >/dev/null 2>&1
rm /root/xrayinstaller.sh >/dev/null 2>&1
rm /root/websocketinstaller.sh >/dev/null 2>&1
rm /root/toolsinstaller.sh >/dev/null 2>&1
secs_to_human "$(($(date +%s) - ${start}))" | tee -a log-install.txt
echo -e "
"
echo -ne "[ ${yell}WARNING${NC} ] reboot now ? (y/n)? "
read answer
if [ "$answer" == "${answer#[Yy]}" ] ;then
exit 0
else
reboot
fi





