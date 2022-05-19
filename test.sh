#!/bin/sh

#####Colors#####
C=$(printf '\033')
RED="${C}[1;31m"
GREEN="${C}[1;32m"
YELLOW="${C}[1;33m"
BLUE="${C}[1;34m"
LIGHT_MAGENTA="${C}[1;95m"
LIGHT_CYAN="${C}[1;96m"
NC="${C}[0m" #No Color
#################

#####Preset#####
MISC_FILE="Misc.txt"
ACC_FILE="Accounts.txt"
LOG_FILE="Logs.txt"
SERV_FILE="Services.txt"
PERS_FILE="Persistance.txt"

DELIM="${NC}=========="

CURR_DIR=$(pwd)

banner()
{
  echo "+------------------------------------------+"
  printf "| %-40s |\n" "`date`"
  printf "|`tput bold` %-40s `tput sgr0`|\n" "$@"
  echo "+------------------------------------------+"
}

do_logging()
{
  THE_TIME=$(date +"%T")
  echo "[${THE_TIME}] - $1" | tee -a $2
}
#################

#Check if run as root/sudo
if [ `id -u` -ne 0 ]
then
	echo "Please run with root/sudo privileges"
	exit
fi

echo "Proof of concept tool to obtain forensics artifacts from a live linux machine"

# Prints Banner
echo "+-------------------------------------------------------+"
echo "|							|"
echo "|	${RED}Live ${NC}Linux Forensics Artifact Collector		|"
echo "|		Written by: ${BLUE}jumpifzer0${NC}			|"
echo "|							|"
echo "+-------------------------------------------------------+"

printf "All Artifacts will be stored in `tput bold` ${CURR_DIR} `tput sgr0` \n"

echo "Starting collection of artifacts"


banner "Miscellaneous"

do_logging "Hostname" "${MISC_FILE}"
TEMP=$(hostname)
echo "${GREEN}${TEMP}${NC}"
echo "${GREEN}${TEMP}${NC}" | sed -r "s/\x1B\[([0-9]{1,3}(;[0-9]{1,2})?)?[mGK]//g" >> ${MISC_FILE}
echo "" | tee -a ${MISC_FILE}

do_logging "Timezone" "${MISC_FILE}"
TEMP=$(cat /etc/timezone)
echo "${GREEN}${TEMP}${NC}"
echo "${GREEN}${TEMP}${NC}" | sed -r "s/\x1B\[([0-9]{1,3}(;[0-9]{1,2})?)?[mGK]//g" >> ${MISC_FILE}
echo "" | tee -a ${MISC_FILE}

do_logging "OS Information" "${MISC_FILE}"
TEMP=$(cat /etc/os-release)
echo "${GREEN}${TEMP}${NC}"
echo "${GREEN}${TEMP}${NC}" | sed -r "s/\x1B\[([0-9]{1,3}(;[0-9]{1,2})?)?[mGK]//g" >> ${MISC_FILE}
echo "" | tee -a ${MISC_FILE}

do_logging "File Disk Info" "${MISC_FILE}"
TEMP=$(fdisk -l)
echo "${GREEN}${TEMP}${NC}"
echo "${GREEN}${TEMP}${NC}" | sed -r "s/\x1B\[([0-9]{1,3}(;[0-9]{1,2})?)?[mGK]//g" >> ${MISC_FILE}
echo "" | tee -a ${MISC_FILE}

do_logging "Mounted Disks" "${MISC_FILE}"
TEMP=$(cat /etc/fstab)
echo "${GREEN}${TEMP}${NC}"
echo "${GREEN}${TEMP}${NC}" | sed -r "s/\x1B\[([0-9]{1,3}(;[0-9]{1,2})?)?[mGK]//g" >> ${MISC_FILE}
echo "" | tee -a ${MISC_FILE}

do_logging "Up Time" "${MISC_FILE}"
TEMP=$(cat /proc/uptime)
echo "${GREEN}${TEMP}${NC}"
echo "${GREEN}${TEMP}${NC}" | sed -r "s/\x1B\[([0-9]{1,3}(;[0-9]{1,2})?)?[mGK]//g" >> ${MISC_FILE}
echo "" | tee -a ${MISC_FILE}

do_logging "Memory Utilization" "${MISC_FILE}"
TEMP=$(cat /proc/meminfo)
echo "${GREEN}${TEMP}${NC}"
echo "${GREEN}${TEMP}${NC}" | sed -r "s/\x1B\[([0-9]{1,3}(;[0-9]{1,2})?)?[mGK]//g" >> ${MISC_FILE}
echo "" | tee -a ${MISC_FILE}

do_logging "Network Interfaces" "${MISC_FILE}"
TEMP=$(cat /etc/network/interfaces)
echo "${GREEN}${TEMP}${NC}"
echo "${GREEN}${TEMP}${NC}" | sed -r "s/\x1B\[([0-9]{1,3}(;[0-9]{1,2})?)?[mGK]//g" >> ${MISC_FILE}
echo "" | tee -a ${MISC_FILE}

do_logging "DNS Configurations" "${MISC_FILE}"
TEMP=$(cat /etc/hosts)
echo "${GREEN}${TEMP}${NC}"
echo "${GREEN}${TEMP}${NC}" | sed -r "s/\x1B\[([0-9]{1,3}(;[0-9]{1,2})?)?[mGK]//g" >> ${MISC_FILE}
echo "" | tee -a ${MISC_FILE}

do_logging "Packages" "${MISC_FILE}"
TEMP=$(apt list --installed)
echo "${GREEN}${TEMP}${NC}"
echo "${GREEN}${TEMP}${NC}" | sed -r "s/\x1B\[([0-9]{1,3}(;[0-9]{1,2})?)?[mGK]//g" >> ${MISC_FILE}
echo "" | tee -a ${MISC_FILE}


banner "Accounts"

do_logging "User Accounts" "${ACC_FILE}"
TEMP=$(cat /etc/passwd)
echo "${GREEN}${TEMP}${NC}"
echo "${GREEN}${TEMP}${NC}" | sed -r "s/\x1B\[([0-9]{1,3}(;[0-9]{1,2})?)?[mGK]//g" >> ${ACC_FILE}
echo "" | tee -a ${ACC_FILE}

do_logging "Current Logged On" "${ACC_FILE}"
TEMP=$(w)
echo "${GREEN}${TEMP}${NC}"
echo "${GREEN}${TEMP}${NC}" | sed -r "s/\x1B\[([0-9]{1,3}(;[0-9]{1,2})?)?[mGK]//g" >> ${ACC_FILE}
echo "" | tee -a ${ACC_FILE}

do_logging "Groups" "${ACC_FILE}"
TEMP=$(cat /etc/group)
echo "${GREEN}${TEMP}${NC}"
echo "${GREEN}${TEMP}${NC}" | sed -r "s/\x1B\[([0-9]{1,3}(;[0-9]{1,2})?)?[mGK]//g" >> ${ACC_FILE}
echo "" | tee -a ${ACC_FILE}

do_logging "UID/GID 0" "${ACC_FILE}"
TEMP=$(cat /etc/passwd | grep ":0:")
echo "${GREEN}${TEMP}${NC}"
echo "${GREEN}${TEMP}${NC}" | sed -r "s/\x1B\[([0-9]{1,3}(;[0-9]{1,2})?)?[mGK]//g" >> ${ACC_FILE}
echo "" | tee -a ${ACC_FILE}

do_logging "Sudoers" "${ACC_FILE}"
TEMP=$(cat /etc/sudoers)
echo "${GREEN}${TEMP}${NC}"
echo "${GREEN}${TEMP}${NC}" | sed -r "s/\x1B\[([0-9]{1,3}(;[0-9]{1,2})?)?[mGK]//g" >> ${ACC_FILE}
echo "" | tee -a ${ACC_FILE}


banner "Logs"

do_logging "Known Common Logs" "${LOG_FILE}"
cp /var/log ${CURR_DIR}/logs
echo "Saving all logs from /var/log to ${LIGHT_CYAN}${CURR_DIR}/logs${NC}" | tee -a ${LOG_FILE}
echo "" | tee -a ${LOG_FILE}


banner "Services"

do_logging "All Running Processes" "${SERV_FILE}"
TEMP=$(ps -aux)
echo "${GREEN}${TEMP}${NC}"
echo "${GREEN}${TEMP}${NC}" | sed -r "s/\x1B\[([0-9]{1,3}(;[0-9]{1,2})?)?[mGK]//g" >> ${SERV_FILE}
echo "" | tee -a ${SERV_FILE}

do_logging "Open Ports" "${SERV_FILE}"
TEMP=$(netstat -ltup)
echo "${GREEN}${TEMP}${NC}"
echo "${GREEN}${TEMP}${NC}" | sed -r "s/\x1B\[([0-9]{1,3}(;[0-9]{1,2})?)?[mGK]//g" >> ${SERV_FILE}
echo "" | tee -a ${SERV_FILE}


banner "Persistence"

do_logging "All Crontabs" "${PERS_FILE}"
TEMP=$(for user in $(cut -f1 -d: /etc/passwd); do crontab -u $user -l; done)
echo "Listing all crontabs for all users"
echo "${GREEN}${TEMP}${NC}"
echo "${GREEN}${TEMP}${NC}" | sed -r "s/\x1B\[([0-9]{1,3}(;[0-9]{1,2})?)?[mGK]//g" >> ${PERS_FILE}
echo "" | tee -a ${PERS_FILE}

do_logging "Run-Control" "${PERS_FILE}"
TEMP=$(cat /etc/rc.local)
echo "${GREEN}${TEMP}${NC}"
echo "${GREEN}${TEMP}${NC}" | sed -r "s/\x1B\[([0-9]{1,3}(;[0-9]{1,2})?)?[mGK]//g" >> ${PERS_FILE}
echo "" | tee -a ${PERS_FILE}

echo "End of Script"
THE_TIME=$(date +"%T")
echo "Time End: ${THE_TIME}"


