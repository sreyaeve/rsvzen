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
clear 
echo -e "${CYAN}╒════════════════════════════════════════════╕\033[0m"
echo -e " \E[0;36;44;1m             Restart Service Menu           \E[0m"
echo -e "${CYAN}╘════════════════════════════════════════════╛\033[0m"
echo -e ""
echo -e " [\e[36m•1\e[0m] Restart All Services"
echo -e " [\e[36m•2\e[0m] Restart OpenSSH"
echo -e " [\e[36m•3\e[0m] Restart Dropbear"
echo -e " [\e[36m•4\e[0m] Restart Stunnel"
echo -e " [\e[36m•5\e[0m] Restart Nginx"
echo -e " [\e[36m•6\e[0m] Restart Badvpn"
echo -e " [\e[36m•7\e[0m] Restart XRAY"
echo -e " [\e[36m•8\e[0m] Restart WEBSOCKET"
echo -e ""
echo -e " [\e[31m•0\e[0m] \e[31mBACK TO MENU\033[0m"
echo -e   ""
echo -e   "Press x or [ Ctrl+C ] • To-Exit"
echo -e   ""
echo -e "${CYAN} ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e ""
read -p " Select menu : " Restart
echo -e ""
sleep 1
clear
case $Restart in
                1)
                clear
echo -e "${CYAN}╒════════════════════════════════════════════╕\033[0m"
echo -e " \E[0;36;44;1m             Restart All Service            \E[0m"
echo -e "${CYAN}╘════════════════════════════════════════════╛\033[0m"
                echo -e ""
                echo -e "[ \033[32mInfo\033[0m ] Restart Begin, Please Wait"
                echo ""
                sleep 1
                systemctl restart ssh
                echo -e "[ \033[32mInfo\033[0m ] Done ! SSH Restarted"
                sleep 1
                systemctl restart dropbear
                echo -e "[ \033[32mInfo\033[0m ] Done ! Dropbear Restarted"
                sleep 1
                systemctl restart stunnel4
                echo -e "[ \033[32mInfo\033[0m ] Done ! Stunnel Restarted"
                sleep 1
                systemctl restart nginx
                echo -e "[ \033[32mInfo\033[0m ] Done ! Nginx Restarted"
                sleep 1
                systemctl restart xray
                systemctl restart xray.service
                echo -e "[ \033[32mInfo\033[0m ] Done ! Xray Restarted"
                sleep 1
                screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7300 --max-clients 500
                echo -e "[ \033[32mInfo\033[0m ] Done ! BadVPN Restarted"
                sleep 1
                systemctl restart ws-stunnel.service 
                systemctl restart ws-dropbear.service 
                echo -e "[ \033[32mInfo\033[0m ] Done ! Websocket Restarted"
                sleep 1
                echo ""
                echo -e "[ \033[32mInfo\033[0m ] Succesfully All Service Restarted"
                echo ""
                echo -e "${CYAN} ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
                echo ""
                read -n 1 -s -r -p "Press any key to back on system menu"
                restart
                ;;
                2)
                clear
echo -e "${CYAN}╒════════════════════════════════════════════╕\033[0m"
echo -e " \E[0;36;44;1m             Restart SSH Service            \E[0m"
echo -e "${CYAN}╘════════════════════════════════════════════╛\033[0m"
                echo -e ""
                echo -e "[ \033[32mInfo\033[0m ] Restart Begin"
                sleep 1
                systemctl restart ssh
                sleep 0.5
                echo -e "[ \033[32mInfo\033[0m ] SSH Service Restarted"
                echo ""
                echo -e "${CYAN} ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
                echo ""
                read -n 1 -s -r -p "Press any key to back on system menu"
                restart
                ;;
                3)
                clear
echo -e "${CYAN}╒════════════════════════════════════════════╕\033[0m"
echo -e " \E[0;36;44;1m           Restart Dropbear Service         \E[0m"
echo -e "${CYAN}╘════════════════════════════════════════════╛\033[0m"
                echo -e ""
                echo -e "[ \033[32mInfo\033[0m ] Restart Begin"
                sleep 1
                systemctl restart dropbear
                sleep 0.5
                echo -e "[ \033[32mInfo\033[0m ] Dropbear Service Restarted"
                echo ""
                echo -e "${CYAN} ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
                echo ""
                read -n 1 -s -r -p "Press any key to back on system menu"
                restart
                ;;
                4)
                clear
echo -e "${CYAN}╒════════════════════════════════════════════╕\033[0m"
echo -e " \E[0;36;44;1m           Restart Stunnel Service          \E[0m"
echo -e "${CYAN}╘════════════════════════════════════════════╛\033[0m"
                echo -e ""
                echo -e "[ \033[32mInfo\033[0m ] Restart Begin"
                sleep 1
                systemctl restart stunnel4
                sleep 0.5
                echo -e "[ \033[32mInfo\033[0m ] Stunnel Service Restarted"
                echo ""
                echo -e "${CYAN} ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
                echo ""
                read -n 1 -s -r -p "Press any key to back on system menu"
                restart
                ;;
                6)
                clear
echo -e "${CYAN}╒════════════════════════════════════════════╕\033[0m"
echo -e " \E[0;36;44;1m            Restart Nginx Service           \E[0m"
echo -e "${CYAN}╘════════════════════════════════════════════╛\033[0m"
                echo -e ""
                echo -e "[ \033[32mInfo\033[0m ] Restart Begin"
                sleep 1
                systemctl restart nginx
                sleep 0.5
                echo -e "[ \033[32mInfo\033[0m ] Nginx Service Restarted"
                echo ""
                echo -e "${CYAN} ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
                echo ""
                read -n 1 -s -r -p "Press any key to back on system menu"
                restart
                ;;
                6)
                clear
echo -e "${CYAN}╒════════════════════════════════════════════╕\033[0m"
echo -e " \E[0;36;44;1m            Restart BadVPN Service          \E[0m"
echo -e "${CYAN}╘════════════════════════════════════════════╛\033[0m"
                echo -e ""
                echo -e "[ \033[32mInfo\033[0m ] Restart Begin"
                sleep 1
                screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7300 --max-clients 500
                sleep 0.5
                echo -e "[ \033[32mInfo\033[0m ] Badvpn Service Restarted"
                echo ""
                echo -e "${CYAN} ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
                echo ""
                read -n 1 -s -r -p "Press any key to back on system menu"
                restart
                ;;
                7)
                clear
echo -e "${CYAN}╒════════════════════════════════════════════╕\033[0m"
echo -e " \E[0;36;44;1m             Restart Xray Service           \E[0m"
echo -e "${CYAN}╘════════════════════════════════════════════╛\033[0m"
                echo -e ""
                echo -e "[ \033[32mInfo\033[0m ] Restart Begin"
                sleep 1
                systemctl restart xray
                systemctl restart xray.service
                sleep 0.5
                echo -e "[ \033[32mInfo\033[0m ] XRAY Service Restarted"
                echo ""
                echo -e "${CYAN} ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
                echo ""
                read -n 1 -s -r -p "Press any key to back on system menu"
                restart
                ;;
                8)
                clear
echo -e "${CYAN}╒════════════════════════════════════════════╕\033[0m"
echo -e " \E[0;36;44;1m          Restart Websocket Service         \E[0m"
echo -e "${CYAN}╘════════════════════════════════════════════╛\033[0m"
                echo -e ""
                echo -e "[ \033[32mInfo\033[0m ] Restart Begin"
                sleep 1
                systemctl restart ws-stunnel.service 
                systemctl restart ws-dropbear.service
                sleep 0.5
                echo -e "[ \033[32mInfo\033[0m ] Websocket Service Restarted"
                echo ""
                echo -e "${CYAN} ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
                echo ""
                read -n 1 -s -r -p "Press any key to back on system menu"
                restart
                ;;                                                                         
                0)
                menu
                exit
                ;;
                x)
                clear
                exit
                ;;
                *) echo -e "" ; echo "Tekan Yang Bener Dlogok" ; sleep 1 ; restart ;;               
        esac
