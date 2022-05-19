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


banner "Logs"


banner "Services"


banner "Persistence"

echo "${DELIM}"
echo "${RED}Sample Text"
echo "${GREEN}Sample Text"
echo "${YELLOW}Sample Text"
echo "${BLUE}Sample Text"
echo "${LIGHT_MAGENTA}Sample Text"
echo "${LIGHT_CYAN}Sample Text"
echo "${DELIM}"
