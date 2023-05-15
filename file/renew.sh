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
echo -e "${CYAN}╒════════════════════════════════════════════╕\033[0m"
echo -e " \E[0;36;44;1m               SSH Member List              \E[0m"
echo -e "${CYAN}╘════════════════════════════════════════════╛\033[0m"
echo -e "${CYAN} ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo "USERNAME          EXP DATE          STATUS"
echo -e "${CYAN} ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
while read expired
do
AKUN="$(echo $expired | cut -d: -f1)"
ID="$(echo $expired | grep -v nobody | cut -d: -f3)"
exp="$(chage -l $AKUN | grep "Account expires" | awk -F": " '{print $2}')"
status="$(passwd -S $AKUN | awk '{print $2}' )"
if [[ $ID -ge 1000 ]]; then
if [[ "$status" = "L" ]]; then
printf "%-17s %2s %-17s %2s \n" "$AKUN" "$exp     " "LOCKED"
else
printf "%-17s %2s %-17s %2s \n" "$AKUN" "$exp     " "UNLOCKED"
fi
fi
done < /etc/passwd
echo -e "${CYAN}╒════════════════════════════════════════════╕\033[0m"
echo -e " \E[0;36;44;1m                Input Username              \E[0m"
echo -e "${CYAN}╘════════════════════════════════════════════╛\033[0m"
echo
read -p "Username : " User
egrep "^$User" /etc/passwd >/dev/null
if [ $? -eq 0 ]; then
read -p "Day Extend : " Days
Today=`date +%s`
Days_Detailed=$(( $Days * 86400 ))
Expire_On=$(($Today + $Days_Detailed))
Expiration=$(date -u --date="1970-01-01 $Expire_On sec GMT" +%Y/%m/%d)
Expiration_Display=$(date -u --date="1970-01-01 $Expire_On sec GMT" '+%d %b %Y')
passwd -u $User
usermod -e  $Expiration $User
egrep "^$User" /etc/passwd >/dev/null
echo -e "$Pass\n$Pass\n"|passwd $User &> /dev/null
clear
echo -e "${CYAN}╒════════════════════════════════════════════╕\033[0m"
echo -e " \E[0;36;44;1m             Renewal Succesfully            \E[0m"
echo -e "${CYAN}╘════════════════════════════════════════════╛\033[0m"
echo -e ""
echo -e " Username   : $User"
echo -e " Days Added : $Days Days"
echo -e " Expires on : $Expiration_Display"
echo -e ""
echo -e "${CYAN} ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e ""
read -n 1 -s -r -p "Press any key to back"
m-sshovpn

else
clear
echo -e "${CYAN}╒════════════════════════════════════════════╕\033[0m"
echo -e " \E[0;36;44;1m                Renewal Failure             \E[0m"
echo -e "${CYAN}╘════════════════════════════════════════════╛\033[0m"
echo -e ""
echo -e "   Username Tidak Ditemukan      "
echo -e ""
echo -e "${CYAN} ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e ""
read -n 1 -s -r -p "Press any key to back"
m-sshovpn
fi
