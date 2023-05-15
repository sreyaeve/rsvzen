#!/bin/bash
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
#########################
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
clear
echo " "
echo " "
if [ -e "/var/log/auth.log" ]; then
        LOG="/var/log/auth.log";
fi
if [ -e "/var/log/secure" ]; then
        LOG="/var/log/secure";
fi
clear
data=( `ps aux | grep -i dropbear | awk '{print $2}'`);
echo -e "${CYAN}╒════════════════════════════════════════════╕\033[0m"
echo -e " \E[0;36;44;1m               SSH User Online              \E[0m"
echo -e "${CYAN}╘════════════════════════════════════════════╛\033[0m"
echo -e "${RED}┌────────────────────────────────────────────┐${NC}"
echo ""
echo ""
cat $LOG | grep -i dropbear | grep -i "Password auth succeeded" > /tmp/login-db.txt;
for PID in "${data[@]}"
do
        cat /tmp/login-db.txt | grep "dropbear\[$PID\]" > /tmp/login-db-pid.txt;
        NUM=`cat /tmp/login-db-pid.txt | wc -l`;
        USER=`cat /tmp/login-db-pid.txt | awk '{print $10}'`;
        IP=`cat /tmp/login-db-pid.txt | awk '{print $12}'`;
        if [ $NUM -eq 1 ]; then
                echo "--------------------"          
                echo " Username = $USER"
                echo " Log Pid = $PID"
                echo " IP = $IP";
                echo "--------------------"
        fi

done
cat $LOG | grep -i sshd | grep -i "Accepted password for" > /tmp/login-db.txt
data=( `ps aux | grep "\[priv\]" | sort -k 72 | awk '{print $2}'`);

for PID in "${data[@]}"
do
        cat /tmp/login-db.txt | grep "sshd\[$PID\]" > /tmp/login-db-pid.txt;
        NUM=`cat /tmp/login-db-pid.txt | wc -l`;
        USER=`cat /tmp/login-db-pid.txt | awk '{print $9}'`;
        IP=`cat /tmp/login-db-pid.txt | awk '{print $11}'`;
        if [ $NUM -eq 1 ]; then
                echo "--------------------"                                                               

                echo " Username = $USER"

                echo " Log Pid = $PID"

                echo " IP = $IP";

                echo "--------------------"
        fi

done
echo ""
echo ""
echo -e "${RED}└────────────────────────────────────────────┘${NC}" 
echo ""
read -n 1 -s -r -p "Press any key to back"
m-sshovpn

