#!/bin/bash

# Instalar o RPM Fusion
sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# Instalar o driver da NVIDIA e CUDA
sudo dnf install akmod-nvidia xorg-x11-drv-nvidia-cuda xorg-x11-drv-nvidia-cuda-libs -y
sudo dnf install nvidia-vaapi-driver -y

# Corrigir os problemas de codec
sudo dnf swap ffmpeg-free ffmpeg --allowerasing -y
sudo dnf groupupdate multimedia --setop="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin -y
sudo dnf groupupdate sound-and-video -y
sudo dnf install amrnb amrwb faad2 flac gpac-libs lame libde265 libfc14audiodecoder mencoder x264 x265 -y

# Instalar o 1Password
sudo rpm --import https://downloads.1password.com/linux/keys/1password.asc
sudo sh -c 'echo -e "[1password]\nname=1Password Stable Channel\nbaseurl=https://downloads.1password.com/linux/rpm/stable/\$basearch\nenabled=1\ngpgcheck=1\nrepo_gpgcheck=1\ngpgkey=\"https://downloads.1password.com/linux/keys/1password.asc\"" > /etc/yum.repos.d/1password.repo'
sudo dnf install 1password -y

# Instalar o Piper para gerenciar o MX Master 3
sudo dnf install piper -y

# Instalar o GNOME Tweaks para configurar o botão de minimizar
sudo dnf install gnome-tweaks -y

# Instalar o GUFW pra gerenciar o firewall
sudo dnf install gufw -y

# Instalar o Google Chrome (e remover o aviso de gerenciado pela organização)
sudo dnf install fedora-workstation-repositories -y
sudo dnf config-manager --set-enabled google-chrome
sudo dnf install google-chrome-stable -y
sudo dnf remove fedora-chromium-config -y

# Instalar as fontes da Microsoft
sudo dnf install https://downloads.sourceforge.net/project/mscorefonts2/rpms/msttcore-fonts-installer-2.6-1.noarch.rpm -y

# Instalar ferramentas para jogos
sudo dnf install steam -y
sudo dnf install goverlay -y
flatpak install flathub com.vysp3r.ProtonPlus
flatpak install flathub com.steamgriddb.steam-rom-manager
flatpak install flathub info.cemu.Cemu
flatpak install flathub com.usebottles.bottles
flatpak install flathub com.heroicgameslauncher.hgl

# Instalar aplicativos em flatpak
flatpak install flathub com.discordapp.Discord
flatpak install flathub com.spotify.Client
flatpak install flathub tech.feliciano.pocket-casts
flatpak install flathub org.gimp.GIMP
flatpak install flathub com.obsproject.Studio
flatpak install flathub io.github.celluloid_player.Celluloid
flatpak install flathub org.gnome.Boxes
flatpak install flathub com.mattjakeman.ExtensionManager
flatpak install flathub com.github.tchx84.Flatseal
flatpak install flathub io.github.mimbrero.WhatsAppDesktop
flatpak install flathub io.gitlab.news_flash.NewsFlash
flatpak install flathub io.gitlab.adhami3310.Converter
flatpak install flathub org.freedownloadmanager.Manager
flatpak install flathub org.nickvision.tubeconverter
flatpak install flathub org.gnome.NetworkDisplays

# Outras fontes para ajustar depois
#font-open-sans
#font-playfair-display
#font-oswald
#font-poppins
#font-pt-mono
#font-pt-sans	
#font-pt-serif	
#font-raleway		
#font-roboto		
#font-roboto-mono		
#font-roboto-serif
#font-rubik
#font-source-code-pro	
#font-ubuntu
#font-ubuntu-condensed
#font-ubuntu-mono
#font-work-sans
#font-open-sans
#font-playfair-display
#font-oswald
#font-poppins
#font-pt-mono
#font-pt-sans
#font-bebas-neue			
#font-pt-serif
#font-dm-serif-display		
#font-raleway
#font-fira-code			
#font-roboto
#font-fira-mono			
#font-roboto-mono
#font-fira-sans			
#font-roboto-serif
#font-fira-sans-condensed	
#font-rubik
#font-fira-sans-extra-condensed
#font-source-code-pro
#font-ibm-plex			
#font-ubuntu
#font-ibm-plex-mono		
#font-ubuntu-condensed
#font-ibm-plex-sans		
#font-ubuntu-mono
#font-ibm-plex-sans-condensed	
#font-work-sans
#font-ibm-plex-serif	
#font-inter	
#font-lato		
#font-libre-baskerville	
#font-merriweather		
#font-merriweather-sans	
#font-montserrat	
#font-noto-mono	
#font-noto-sans	
#font-noto-serif	
#font-nunito
#font-nunito-sans	

# O que adicionar como webapp depois: Notion, Figma
