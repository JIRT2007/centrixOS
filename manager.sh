#!/bin/bash

#############################
# Global variables          #
#############################

#############################
# Auxiliary functions       #
#############################

### START (themeMANAGER apply-theme) ###

change_wallpaper(){
	THEME="$1"

	case $THEME in

		"Purple-Swirl")
			pkill swaybg 2>/dev/null
			swaybg -i ~/centrixOS/themes/Purple-Swirl/config/Wallpaper/city.jpg -m fill &
		;;

		"Green-Forest")
			pkill swaybg 2>/dev/null
			swaybg -i ~/centrixOS/themes/Green-Forest/config/Wallpaper/Forest.jpg -m fill &
		;;

		"Shadow-Dance")
			pkill swaybg 2>/dev/null
			swaybg -i ~/centrixOS/themes/Shadow-Dance/config/Wallpaper/GirlAnime.png -m fill &
		;;

		"Blue-Depression")
			pkill swaybg 2>/dev/null
			swaybg -i ~/centrixOS/themes/Blue-Depression/config/Wallpaper/Wallpaper.jpg -m fill &
	esac
}

apply_theme(){
	THEME="$1"

	cp -rf ~/centrixOS/themes/$THEME/config/hypr ~/.config/
 	cp -rf ~/centrixOS/themes/$THEME/config/kitty ~/.config/
	cp -rf ~/centrixOS/themes/$THEME/config/wlogout ~/.config/
	cp -rf ~/centrixOS/themes/$THEME/config/btop.conf ~/.config/btop
	cp ~/centrixOS/themes/$THEME/config/starship.toml ~/.config/

	kitten @ load-config

	change_wallpaper "$THEME"
}
### END (themeMANAGER apply-theme) ###





#############################
# Power manger              #
#############################

powerMANAGER() {
	while true; do
		clear

cat << "EOF"
   ___                       __  ___                           
  / _ \___ _    _____ ____  /  |/  /__ ____  ___ ____ ____ ____
 / ___/ _ \ |/|/ / -_) __/ / /|_/ / _ `/ _ \/ _ `/ _ `/ -_) __/
/_/   \___/__,__/\__/_/   /_/  /_/\_,_/_//_/\_,_/\_, /\__/_/   
                                                /___/          
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
 ________                   __  ___                           
/_  __/ /  ___ __ _  ___   /  |/  /__ ____  ___ ____ ____ ____
 / / / _ \/ -_)  ' \/ -_) / /|_/ / _ `/ _ \/ _ `/ _ `/ -_) __/
/_/ /_//_/\__/_/_/_/\__/ /_/  /_/\_,_/_//_/\_,_/\_, /\__/_/   
                                               /___/          
*--------------------------*
| Change theme:            |
*--------------------------*
| 1) Purple-Swirl.         |
| 2) Green-Forest.         |
| 3) Shadow-Dance.         |
| 4) Blue-Depression.      |
|--------------------------|
| 0) Back.                 |
*--------------------------*
EOF
	read -p "Enter your order: " optionTHEME
	case $optionTHEME in

		1)
		  apply_theme "Purple-Swirl"	
		;; 
		
		2)
		  apply_theme "Green-Forest"
		;; 
		
		3)
		  apply_theme "Shadow-Dance"
		;; 
		
		4)
		  apply_theme "Blue-Depression"	
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
  ____    ______  _____  __    __  ___                           
 / __ \  / __/  |/  / / / /   /  |/  /__ ____  ___ ____ ____ ____
/ /_/ / / _// /|_/ / /_/ /   / /|_/ / _ `/ _ \/ _ `/ _ `/ -_) __/
\___\_\/___/_/  /_/\____/   /_/  /_/\_,_/_//_/\_,_/\_, /\__/_/   
                                                  /___/          
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
# CentrixOS control manager #
#############################
while true; do
	clear

cat << "EOF"
  _____         __      _        _____          __           __  
 / ___/__ ___  / /_____(_)_ __  / ___/__  ___  / /________  / /  
/ /__/ -_) _ \/ __/ __/ /\ \ / / /__/ _ \/ _ \/ __/ __/ _ \/ /   
\___/\__/_//_/\__/_/ /_//_\_\  \___/\___/_//_/\__/_/  \___/_/    
                                                 
*----------------------------*
| 1) Power manager.          |
| 2) Theme manager.          |
| 3) QEMU manager.           |
| 0) Exit.                   |
|----------------------------|
| Developed by JIRT2007      |
|----------------------------|
| Version 0.0.1              |
*----------------------------*
EOF
	read -p "Enter your order: " optionMAIN
	case $optionMAIN in

		1)
		  powerMANAGER
		;;

		2)
		  themeMANAGER
		;;

		3)
		  qemuMANAGER
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
