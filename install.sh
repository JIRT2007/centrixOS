#!/bin/bash

install() {
	while true; do
		clear

cat << "EOF"

 ██╗███╗   ██╗███████╗████████╗ █████╗ ██╗     ██╗     
 ██║████╗  ██║██╔════╝╚══██╔══╝██╔══██╗██║     ██║     
 ██║██╔██╗ ██║███████╗   ██║   ███████║██║     ██║     
 ██║██║╚██╗██║╚════██║   ██║   ██╔══██║██║     ██║     
 ██║██║ ╚████║███████║   ██║   ██║  ██║███████╗███████╗
 ╚═╝╚═╝  ╚═══╝╚══════╝   ╚═╝   ╚═╝  ╚═╝╚══════╝╚══════╝                   
*-----------------------------------------------------*
| Do you want to install the customization layer?     |
*-----------------------------------------------------*
| 1) Yes, install CentrixCL.                          |
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

			sudo pacman -S --needed --noconfirm hyprland \
			       	hyprpaper \
				kitty \
				fastfetch \
				fuzzel \
				zsh \
				starship \
				alsa-utils \
				ranger \
				chromium \
				ttf-jetbrains-mono-nerd \
				qemu-system-x86 \
				qemu-desktop \
				waybar \
				playerctl \
				hyprshot \
				vim \
				otf-libertinus

			REAL_USER=${SUDO_USER:-$USER}
			sudo chsh -s /usr/bin/zsh "$REAL_USER"
			
			cp -rf ~/CentrixCL/themes/Retro-Punch/hypr ~/.config/
 			cp -rf ~/CentrixCL/themes/Retro-Punch/kitty ~/.config/
			cp -rf ~/CentrixCL/themes/Retro-Punch/waybar ~/.config/
			cp -rf ~/CentrixCL/themes/Retro-Punch/fuzzel ~/.config/
			cp ~/CentrixCL/themes/Retro-Punch/starship.toml ~/.config/	

			cp -rf ~/CentrixCL/config_basic/applications ~/.local/share
			cp -rf ~/CentrixCL/config_basic/fastfetch ~/.config

			cp ~/CentrixCL/config_basic/.zshrc ~/.zshrc
			cp ~/CentrixCL/config_basic/.zprofile ~/.zprofile
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

  ██████╗███████╗███╗   ██╗████████╗██████╗ ██╗██╗  ██╗     ██████╗██╗     
 ██╔════╝██╔════╝████╗  ██║╚══██╔══╝██╔══██╗██║╚██╗██╔╝    ██╔════╝██║     
 ██║     █████╗  ██╔██╗ ██║   ██║   ██████╔╝██║ ╚███╔╝     ██║     ██║     
 ██║     ██╔══╝  ██║╚██╗██║   ██║   ██╔══██╗██║ ██╔██╗     ██║     ██║     
 ╚██████╗███████╗██║ ╚████║   ██║   ██║  ██║██║██╔╝ ██╗    ╚██████╗███████╗
  ╚═════╝╚══════╝╚═╝  ╚═══╝   ╚═╝   ╚═╝  ╚═╝╚═╝╚═╝  ╚═╝     ╚═════╝╚══════╝                         
*--------------------------------------*
| 1) Install CentrixCL.                |
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
