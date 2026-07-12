#!/bin/bash

#############################
# Global variables          #
#############################

#############################
# Auxiliary functions       #
#############################

### START (themeMANAGER apply-theme) ###

apply_theme(){
	THEME="$1"

	cp -rf ~/CentrixCL/themes/$THEME/hypr ~/.config/
 	cp -rf ~/CentrixCL/themes/$THEME/kitty ~/.config/
	cp -rf ~/CentrixCL/themes/$THEME/waybar ~/.config/
	cp -rf ~/CentrixCL/themes/$THEME/fuzzel ~/.config/
	cp ~/CentrixCL/themes/$THEME/starship.toml ~/.config/

	kitten @ load-config

	pkill hyprpaper
	systemctl --user enable --now hyprpaper.service

	killall waybar 2>/dev/null
	waybar >/dev/null 2>&1 &
}
### END (themeMANAGER apply-theme) ###

#############################
# Power manger              #
#############################

powerMANAGER() {
	while true; do
		clear

cat << "EOF"

 ██████╗  ██████╗ ██╗    ██╗███████╗██████╗     ███╗   ███╗███████╗███╗   ██╗██╗   ██╗
 ██╔══██╗██╔═══██╗██║    ██║██╔════╝██╔══██╗    ████╗ ████║██╔════╝████╗  ██║██║   ██║
 ██████╔╝██║   ██║██║ █╗ ██║█████╗  ██████╔╝    ██╔████╔██║█████╗  ██╔██╗ ██║██║   ██║
 ██╔═══╝ ██║   ██║██║███╗██║██╔══╝  ██╔══██╗    ██║╚██╔╝██║██╔══╝  ██║╚██╗██║██║   ██║
 ██║     ╚██████╔╝╚███╔███╔╝███████╗██║  ██║    ██║ ╚═╝ ██║███████╗██║ ╚████║╚██████╔╝
 ╚═╝      ╚═════╝  ╚══╝╚══╝ ╚══════╝╚═╝  ╚═╝    ╚═╝     ╚═╝╚══════╝╚═╝  ╚═══╝ ╚═════╝      
*---------------------------*
| 1) Shutdown.              |
| 2) Reboot.                |
| 3) Suspend.               |
|---------------------------|
| 0) Back.                  |
*---------------------------*
EOF
	read -p "Enter your order: " optionPOWER
	case $optionPOWER in

		1)
		  systemctl poweroff
		;; 
		
		2)
		  systemctl reboot
		;; 
	
		3)
		  systemctl suspend
		;; 
	
		0)
		  return	
		;; 
	
		*)
		  echo "Order not found."
		  sleep 1
		;;

esac
done
}

#############################
# Theme manager             #
#############################

themeMANAGER() {
	while true; do
		clear

cat << "EOF"

 ████████╗██╗  ██╗███████╗███╗   ███╗███████╗███████╗
 ╚══██╔══╝██║  ██║██╔════╝████╗ ████║██╔════╝██╔════╝
    ██║   ███████║█████╗  ██╔████╔██║█████╗  ███████╗
    ██║   ██╔══██║██╔══╝  ██║╚██╔╝██║██╔══╝  ╚════██║
    ██║   ██║  ██║███████╗██║ ╚═╝ ██║███████╗███████║
    ╚═╝   ╚═╝  ╚═╝╚══════╝╚═╝     ╚═╝╚══════╝╚══════╝
*--------------------------*
| Change theme:            |
*--------------------------*
| 1) Retro-Punch.          |
| 2) Dark-Society.         |    
|--------------------------|
| 0) Back.                 |
*--------------------------*
EOF
	read -p "Enter your order: " optionTHEME
	case $optionTHEME in

		1)
		  apply_theme "Retro-Punch"	
		;; 
		
		2)
		  apply_theme "Dark-Society"
		;; 
		
		3)
		  apply_theme ""
		;; 
		
		4)
		  apply_theme ""	
		;; 
		
		0)
		  return
		;; 
		
		*)
		  echo "Order not found."
	  	  sleep 1	  
		;;

esac
done
}

#############################
# QEMU manager              #
#############################
qemuMANAGER() {
	while true; do
		clear

cat << "EOF"

  ██████╗ ███████╗███╗   ███╗██╗   ██╗
 ██╔═══██╗██╔════╝████╗ ████║██║   ██║
 ██║   ██║█████╗  ██╔████╔██║██║   ██║
 ██║▄▄ ██║██╔══╝  ██║╚██╔╝██║██║   ██║
 ╚██████╔╝███████╗██║ ╚═╝ ██║╚██████╔╝
  ╚══▀▀═╝ ╚══════╝╚═╝     ╚═╝ ╚═════╝    
*----------------------------*
| 1) Create .qcow2 file.     |
| 2) Create virtual machine. |
| 3) Start virtual machine.  |
|----------------------------|
| 0) Back.                   |
*----------------------------*
EOF
	read -p "Enter your order: " optionQEMU
	case $optionQEMU in

		1)
		  read -p "Enter the location of the file with the name you will assign it: " optionLOCATION_FILE
		  read -p "Enter the file size in Gigabytes: " optionSIZE_FILE

		  qemu-img create -f qcow2 "$optionLOCATION_FILE" "$optionSIZE_FILE"g
		;; 
	
		2)
		  read -p "Enter the RAM that the VM will use in megabytes: " optionRAM_CREATE
	  	  read -p "Enter the modules that the VM will use: " optionCPU_CREATE
		  read -p "Enter the location of the .iso file: " optionISO_CREATE
		  read -p "Enter the location of the .qcow2 file: " optionDISK_CREATE

		  qemu-system-x86_64 -m "$optionRAM_CREATE" -smp "$optionCPU_CREATE" --enable-kvm -boot d -cdrom "$optionISO_CREATE" -drive file="$optionDISK_CREATE",format=qcow2 -nic user,model=e1000
		;; 
	
		3)
		 read -p "Enter the RAM that the VM will use in megabytes: " optionRAM_START
	 	 read -p "Enter the modules that the VM will use: " optionCPU_START
		 read -p "Enter the location of the .qcow2 file: " optionDISK_START

		 qemu-system-x86_64 -m "$optionRAM_START" -smp "$optionCPU_START" --enable-kvm -drive file="$optionDISK_START",format=qcow2 -nic user,model=e1000,hostfwd=tcp::2222-:22 
		;; 
	
		0)
		  return	
		;; 
	
		*)
		  echo "Order not found."
	  	  sleep 1	  
		;;

esac
done
}

#############################
# SSH manager               #
#############################
sshMANAGER() {
	while true; do
		clear

cat << "EOF" 

 ███████╗███████╗██╗  ██╗
 ██╔════╝██╔════╝██║  ██║
 ███████╗███████╗███████║
 ╚════██║╚════██║██╔══██║
 ███████║███████║██║  ██║
 ╚══════╝╚══════╝╚═╝  ╚═╝
*-----------------------------------------------------*
| 1) Connect by SSH.                                  |
| 2) Connect by SSH (localhost via port 2222).        |
| 3) Send by SSH.                                     |
| 4) Send by SSH (localhost via port 2222).           |
| 5) Send directory by SSH.                           |
| 6) Send directory by SSH. (localhost via port 2222) |
| 0) Exit.                                            |
*-----------------------------------------------------* 
EOF
	read -p "Enter your order: " optionSSH
	case $optionSSH in

		1) 
		  read -p "Enter IP address: " optionIP
	  	  read -p "Enter user name: " optionNAME

		  ssh "$optionNAME@$optionIP"	  
		;;

		2)
		  read -p "Enter user name: " optionNAME_SSH_LOCALHOST

		  ssh -p 2222 "$optionNAME_SSH_LOCALHOST"@localhost
		;;

		3)
		  read -p "Enter location of the file: " optionFILE_SCP_FILE
		  read -p "Enter user name: " optionNAME_SCP_FILE
		  read -p "Enter IP address: " optionIP_SCP_FILE
		  read -p "Enter the destination: " optionDESTINATION_SCP_FILE

		  scp "$optionFILE_SCP_FILE" "$optionNAME_SCP_FILE@$optionIP_SCP_FILE:$optionDESTINATION_SCP_FILE"
		;;

		4)
		  read -p "Enter location of the file: " optionFILE_SCP_FILE_LOCALHOST
		  read -p "Enter user name: " optionNAME_SCP_FILE_LOCALHOST
		  read -p "Enter the destination: " optionDESTINATION_SCP_FILE_LOCALHOST

		  scp -P 2222 "$optionFILE_SCP_FILE_LOCALHOST" "$optionNAME_SCP_FILE_LOCALHOST"@localhost:"$optionDESTINATION_SCP_FILE_LOCALHOST"
		;;

		5)
		  read -p "Enter location of the directory: " optionDIRECTORY_SCP_DIRECTORY
		  read -p "Enter user name: " optionNAME_SCP_DIRECTORY
		  read -p "Enter IP address: " optionIP_SCP_DIRECTORY
		  read -p "Enter the destination: " optionDESTINATION_SCP_DIRECTORY

		 scp -r "$optionDIRECTORY_SCP_DIRECTORY" "$optionNAME_SCP_DIRECTORY@$optionIP_SCP_DIRECTORY:$optionDESTINATION_SCP_DIRECTORY"
		;;

		6)
		  read -p "Enter location of the directory: " optionDIRECTORY_SCP_DIRECTORY_LOCALHOST
		  read -p "Enter user name: " optionNAME_SCP_DIRECTORY_LOCALHOST
		  read -p "Enter the destination: " optionDESTINATION_SCP_DIRECTORY_LOCALHOST

		  scp -P 2222 -r "$optionDIRECTORY_SCP_DIRECTORY_LOCALHOST" "$optionNAME_SCP_DIRECTORY_LOCALHOST"@localhost:"$optionDESTINATION_SCP_DIRECTORY_LOCALHOST"
		;;

		0)
		  return	
		;;

		*)
		  echo "Order not found."
		  sleep 1
		;;



esac
done
}

#############################
# CentrixOS control manager #
#############################
while true; do
	clear

cat << "EOF"

  ██████╗███╗   ███╗███████╗███╗   ██╗██╗   ██╗
 ██╔════╝████╗ ████║██╔════╝████╗  ██║██║   ██║
 ██║     ██╔████╔██║█████╗  ██╔██╗ ██║██║   ██║
 ██║     ██║╚██╔╝██║██╔══╝  ██║╚██╗██║██║   ██║
 ╚██████╗██║ ╚═╝ ██║███████╗██║ ╚████║╚██████╔╝
  ╚═════╝╚═╝     ╚═╝╚══════╝╚═╝  ╚═══╝ ╚═════╝    
*----------------------------*
| 1) Power manager.          |
| 2) QEMU manager.           |
| 3) SSH manager.            |
| 4) Theme manager.          |
| 0) Exit.                   |
|----------------------------|
| Developed by JIRT2007      |
*----------------------------*
EOF
	read -p "Enter your order: " optionMAIN
	case $optionMAIN in

		1)
		  powerMANAGER
		;;

		2)
		  qemuMANAGER
		;;

		3)
		  sshMANAGER	
		;;

		4)
		  themeMANAGER	
		;;

		0)
		  clear
		  exit 0
		;;

		*)
		  echo "Order not found."
  		  sleep 1		  
		;;

esac
done
