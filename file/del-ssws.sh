#!/bin/bash
# SL
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
# ==========================================
# Getting
MYIP=$(wget -qO- ipinfo.io/ip);
echo "Checking VPS"
IZIN=$( curl ipinfo.io/ip | grep $MYIP )
if [ $MYIP = $MYIP ]; then
echo -e "${NC}${GREEN}Permission Accepted...${NC}"
else
echo -e "${NC}${RED}Permission Denied!${NC}";
echo -e "${NC}${LIGHT}Fuck You!!"
exit 0
fi
clear
NUMBER_OF_CLIENTS=$(grep -c -E "^###! " "/etc/xray/config.json")
	if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
		echo -e "${CYAN}╒════════════════════════════════════════════╕\033[0m"
    echo -e " \E[0;36;44;1m         Delete Shadowsocks Account         \E[0m"
    echo -e "${CYAN}╘════════════════════════════════════════════╛\033[0m"
		echo ""
		echo "You have no existing clients!"
		echo ""
		echo -e "${CYAN} ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
		read -n 1 -s -r -p "Press any key to back"
        m-ssws
	fi

	clear
echo -e "${CYAN}╒════════════════════════════════════════════╕\033[0m"
echo -e " \E[0;36;44;1m         Delete Shadowsocks Account         \E[0m"
echo -e "${CYAN}╘════════════════════════════════════════════╛\033[0m"
    echo "  User       Expired  " 
	echo -e "${CYAN} ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
	grep -E "^###! " "/etc/xray/config.json" | cut -d ' ' -f 2-3 | column -t | sort | uniq
    echo ""
    echo -e "${CYAN} ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
	read -rp "Input Username : " user
    if [ -z $user ]; then
    m-ssws
    else
    exp=$(grep -wE "^###! $user" "/etc/xray/config.json" | cut -d ' ' -f 3 | sort | uniq)
    sed -i "/^###! $user $exp/,/^},{/d" /etc/xray/config.json
    rm -rf /etc/xraylog/log-ss-$user.txt
    systemctl restart xray > /dev/null 2>&1
    clear
echo -e "${CYAN}╒════════════════════════════════════════════╕\033[0m"
echo -e " \E[0;36;44;1m             Delete Succesfully             \E[0m"
echo -e "${CYAN}╘════════════════════════════════════════════╛\033[0m"
    echo " Client Name : $user"
    echo " Expired On  : $exp"
    echo -e "${CYAN} ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
    echo ""
    read -n 1 -s -r -p "Press any key to back"
    m-ssws
fi
