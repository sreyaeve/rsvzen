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
echo -e "${CYAN}╒════════════════════════════════════════════╕\033[0m"
echo -e " \E[0;36;44;1m              Xray Trojan Menu              \E[0m"
echo -e "${CYAN}╘════════════════════════════════════════════╛\033[0m"
echo -e ""
echo -e " [\e[36m•1\e[0m] Create Trojan Account "
echo -e " [\e[36m•2\e[0m] Create Trial Trojan "
echo -e " [\e[36m•3\e[0m] Renewal Trojan Account "
echo -e " [\e[36m•4\e[0m] Delete Trojan Account "
echo -e " [\e[36m•5\e[0m] Check Trojan User Login "
echo -e " [\e[36m•6\e[0m] Check Trojan User Account "
echo -e ""
echo -e " [\e[31m•0\e[0m] \e[31mBACK TO MENU\033[0m"
echo -e   ""
echo -e   "Press x or [ Ctrl+C ] • To-Exit"
echo ""
echo -e "${CYAN} ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e ""
read -p " Select menu : " opt
echo -e ""
case $opt in
1) clear ; add-tr ;;
2) clear ; trialtrojan ;;
3) clear ; renew-tr ;;
4) clear ; del-tr ;;
5) clear ; cek-tr ;;
6) clear ; log-trojan ;;
0) clear ; menu ;;
x) exit ;;
*) echo "Tekan Yang Benar Dlogok" ; sleep 1 ; m-trojan ;;
esac
