#!/bin/bash

install() {
	while true; do
		clear

cat << "EOF"
   ____         __       ____
  /  _/__  ___ / /____ _/ / /
 _/ // _ \(_-</ __/ _ `/ / / 
/___/_//_/___/\__/\_,_/_/_/  
                         
*-----------------------------------------------------*
| Do you want to install the customization layer?     |
*-----------------------------------------------------*
| 1) Yes, install CentrixOS.                          |
| 0) Exit.                                            |
*-----------------------------------------------------*

*-----------------------------------------------------*
| At the end of the customization it is recommended   |
| restart the system.                                 |
*-----------------------------------------------------*
EOF
	read -p "Enter your order: " opcionINSTALL
	case $opcionINSTALL in

		1)
			mkdir -p ~/.config
			mkdir -p ~/.local/share

			sudo apt install -y -t trixie-backports hyprland
    			sudo apt install -y -t trixie-backports xdg-desktop-portal-hyprland
			sudo apt install -y -t trixie-backports waybar

			sudo apt install -y \
				kitty \
				fastfetch \
				swaybg \
				wofi \
				zsh \
				alsa-utils \
				ranger \
				curl \
				wget \
				starship \
				btop \
				grim \
				chromium \
				fonts-jetbrains-mono \
				hyprland-guiutils \
				qemu-system-x86

			REAL_USER=${SUDO_USER:-$USER}
			sudo chsh -s /usr/bin/zsh "$REAL_USER"
			
			cp -rf ~/centrixOS/themes/Purple-Swirl/config/hypr ~/.config/
 			cp -rf ~/centrixOS/themes/Purple-Swirl/config/kitty ~/.config/
			cp -rf ~/centrixOS/themes/Purple-Swirl/config/btop.conf ~/.config/btop
			cp ~/centrixOS/themes/Purple-Swirl/config/starship.toml ~/.config/	

			cp -rf ~/centrixOS/config_basic/wofi ~/.config
			cp -rf ~/centrixOS/config_basic/waybar ~/.config
			cp -rf ~/centrixOS/config_basic/applications ~/.local/share
			cp -rf ~/centrixOS/config_basic/fastfetch ~/.config
			cp ~/centrixOS/config_basic/.zshrc ~/.zshrc
		 exit 0
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
}


while true; do
	clear

cat << "EOF"
 
 ██████████████████████████████████
 ██                              ██
 ██  ██████████████████████████
 ██  ██                      ██
 ██  ██  ██████████████████  ██
 ██  ██  ██              ██  ██
 ██  ██  ██  ██████████████  ██
 ██  ██  ██              ██  ██
 ██  ██  ██████████████  ██  ██
 ██  ██  ██              ██  ██
 ██  ██  ██████████████████  ██
 ██  ██                      ██
 ██  ██████████████████████████
 ██                              ██
 ██████████████████████████████████

*--------------------------------------*
| 1) Install CentrixOS.                |
| 2) Enable Debian Trixie/Backports.   |
| 0) Exit.                             |
*--------------------------------------*
| Code developed by JIRT2007           |
*--------------------------------------*
EOF
	read -p "Enter your order: " opcionMENU
	case $opcionMENU in

		1) 
		  install
		;;

		2)
		  sudo cp ~/centrixOS/config_basic/debian-backports.sources  /etc/apt/sources.list.d/
		  sudo apt-get update
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
