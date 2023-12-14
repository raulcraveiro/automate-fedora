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

# Instalar o Google Chrome (e remover o aviso de gerenciado pela organização)
sudo dnf install fedora-workstation-repositories -y
sudo dnf config-manager --set-enabled google-chrome
sudo dnf install google-chrome-stable -y
sudo dnf remove fedora-chromium-config -y

# Instalar ferramentas para jogos
sudo dnf install steam -y
sudo dnf install goverlay -y
flatpak install flathub com.vysp3r.ProtonPlus
flatpak install flathub com.steamgriddb.steam-rom-manager
flatpak install flathub org.yuzu_emu.yuzu
flatpak install flathub info.cemu.Cemu
flatpak install flathub com.usebottles.bottles
flatpak install flathub com.heroicgameslauncher.hgl

# Instalar aplicativos em flatpak
flatpak install flathub com.discordapp.Discord
flatpak install flathub com.spotify.Client
flatpak install flathub org.gimp.GIMP
flatpak install flathub com.obsproject.Studio
flatpak install flathub org.videolan.VLC
flatpak install flathub org.gnome.Boxes
flatpak install flathub com.mattjakeman.ExtensionManager
flatpak install flathub com.github.tchx84.Flatseal
flatpak install flathub net.davidotek.pupgui2
flatpak install flathub io.github.mimbrero.WhatsAppDesktop
flatpak install flathub io.gitlab.news_flash.NewsFlash
flatpak install flathub io.gitlab.adhami3310.Converter

# Baixar fontes e instalar
wget -O Fontes.zip "https://fonts.google.com/download?family=Open%20Sans|Playfair%20Display|Oswald|Poppins|PT%20Mono|PT%20Sans|PT%20Serif|Bebas%20Neue|DM%20Serif%20Display|Raleway|Fira%20Code|Fira%20Mono|Fira%20Sans|Fira%20Sans%20Condensed|Fira%20Sans%20Extra%20Condensed|Roboto|Roboto%20Mono|Roboto%20Serif|Rubik|Source%20Code%20Pro|IBM%20Plex%20Sans|IBM%20Plex%20Serif|IBM%20Plex%20Mono|IBM%20Plex%20Sans%20Condensed|Ubuntu|Ubuntu%20Condensed|Ubuntu%20Mono|Work%20Sans|Inter|Lato|Merriweather|Merriweather%20Sans|Libre%20Baskerville|Montserrat|Nunito|Nunito%20Sans"
sudo mkdir -p /user/share/fonts/googlefonts
cd /user/share/fonts/googlefonts
sudo unzip -d . ~/Downloads/Fontes.zip
sudo fc-cache -fv
