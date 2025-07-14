!#/bin/bash

#menu_loop
while true; do
	echo "choose your wanted distro"
	echo "1) ubuntu "
	echo "2) open-SUSE/open-SUSE tumbleweed "
	echo "3) void linux "
	echo "4) kde neon "
	echo "5) arch-linux "
	echo "q) exit this script "
	read -p "select one of the distros above: " CHOICE
	case "$CHOICE" in
	1)
	apt update
	apt install bcmwl-kernel-source
	echo "blacklist b43" | tee -a /etc/modprobe.d/blacklist-broadcom.conf
	echo "blacklist bcma" | tee -a /etc/modprobe.d/blacklist-broadcom.conf
	echo "blacklist ssb" | tee -a /etc/modprobe.d/blacklist-broadcom.conf
	echo "blacklist brcmsmac" | tee -a /etc/modprobe.d/blacklist-broadcom.conf
	echo "blacklist ndiswrapper" | tee -a /etc/modprobe.d/blacklist-broadcom.conf
	update-initramfs -u
	reboot
	;;
	2)
	zypper ar -cfp 90 https://ftp.gwdg.de/pub/linux/packman/suse/openSUSE_Tumbleweed/ packman 
	zypper ref
	zypper install broadcom-wl broadcom-wl-kmp-default 
	reboot
	;;
	3)
	xbps-install -S
	sudo xbps-install -y broadcom-wl-dkms linux$(uname -r | cut -d '_' -f 1)-headers dkms 
	echo "blacklist b43/nblacklist" | tee -a /etc/modprobe.d/blacklist-broadcom.conf
	echo "blacklist bcma/nblacklist" | tee -a /etc/modprobe.d/blacklist-broadcom.conf
	echo "blacklist ssb/nblacklist" | tee -a /etc/modprobe.d/blacklist-broadcom.conf
	echo "blacklist brcmsmac/nblacklist" | tee -a /etc/modprobe.d/blacklist-broadcom.conf
	echo "blacklist ndiswrapper/nblacklist" | tee -a /etc/modprobe.d/blacklist-broadcom.conf
	;;
	4)
	apt update
	apt install bcmwl-kernel-source
	echo "blacklist b43" | tee -a /etc/modprobe.d/blacklist-broadcom.conf
	echo "blacklist bcma" | tee -a /etc/modprobe.d/blacklist-broadcom.conf
	echo "blacklist ssb" | tee -a /etc/modprobe.d/blacklist-broadcom.conf
	echo "blacklist brcmsmac" | tee -a /etc/modprobe.d/blacklist-broadcom.conf
	echo "blacklist ndiswrapper" | tee -a /etc/modprobe.d/blacklist-broadcom.conf
	update-initramfs -u
	reboot
	;;
	5)
	pacman -Syu
	pacman -S dkms linux-headers broadcom-wl
	echo "blacklist b43/nblacklist" | tee -a /etc/modprobe.d/blacklist-broadcom.conf
	echo "blacklist bcma/nblacklist" | tee -a /etc/modprobe.d/blacklist-broadcom.conf
	echo "blacklist ssb/nblacklist" | tee -a /etc/modprobe.d/blacklist-broadcom.conf
	echo "blacklist brcmsmac/nblacklist" | tee -a /etc/modprobe.d/blacklist-broadcom.conf
	echo "blacklist ndiswrapper/nblacklist" | tee -a /etc/modprobe.d/blacklist-broadcom.conf
	modprobe wl
	reboot
	;;
	q)
	echo "hope everything worked out :> have a great day  "
	exit 0
	;;

	esac
done
