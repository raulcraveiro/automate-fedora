#!/bin/bash


# Colaboração: Fernando Souza - https://www.youtube.com/@fernandosuporte/
# Data: 17/01/2025

# -----------------------------------------------------------------------------------------------------------------------

clear

echo "
Verificando o acesso à internet..."


ping -c 5 www.google.com.br  1> /dev/null 2> /dev/null


if [ "$?" -eq "0" ];
then 

      echo -e "\e[1;32m\n[VERIFICADO] - Conexão com à internet funcionando normalmente.\n\e[0m"

      sleep 20
else 

     echo -e "\e[1;31m\n[ERRO] - Seu sistema não tem conexão com à internet. Verifique os cabos e o modem.\n\e[0m"

     exit

fi

# -----------------------------------------------------------------------------------------------------------------------


# Instalar o RPM Fusion
sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# Instalar o driver da NVIDIA e CUDA
sudo dnf install akmod-nvidia xorg-x11-drv-nvidia-cuda xorg-x11-drv-nvidia-cuda-libs -y
sudo dnf install nvidia-vaapi-driver -y

# Corrigir os problemas de codec
sudo dnf swap ffmpeg-free ffmpeg --allowerasing -y
sudo dnf install amrnb amrwb faad2 flac gpac-libs lame libde265 libfc14audiodecoder mencoder x264 x265 ffmpegthumbnailer -y

# Instalar o 1Password
sudo rpm --import https://downloads.1password.com/linux/keys/1password.asc
sudo sh -c 'echo -e "[1password]\nname=1Password Stable Channel\nbaseurl=https://downloads.1password.com/linux/rpm/stable/\$basearch\nenabled=1\ngpgcheck=1\nrepo_gpgcheck=1\ngpgkey=\"https://downloads.1password.com/linux/keys/1password.asc\"" > /etc/yum.repos.d/1password.repo'
sudo dnf install 1password -y

# Instalar o Piper para gerenciar o MX Master 3
sudo dnf install piper -y

# Instalar o GNOME Tweaks para configurar o botão de minimizar
sudo dnf install gnome-tweaks -y

# Instalar o Google Chrome (e remover o aviso de gerenciado pela organização)
sudo dnf install google-chrome-stable -y
sudo dnf remove fedora-chromium-config -y

# Instalar as fontes da Microsoft
sudo dnf install https://downloads.sourceforge.net/project/mscorefonts2/rpms/msttcore-fonts-installer-2.6-1.noarch.rpm -y

# Instalar ferramentas para jogos
sudo dnf install steam -y
flatpak install flathub com.vysp3r.ProtonPlus
flatpak install flathub com.steamgriddb.steam-rom-manager
flatpak install flathub com.steamgriddb.SGDBoop
flatpak install flathub info.cemu.Cemu
flatpak install flathub com.usebottles.bottles
flatpak install flathub com.heroicgameslauncher.hgl
flatpak install flathub dev.lizardbyte.app.Sunshine

# Instalar aplicativos em flatpak
flatpak install flathub com.discordapp.Discord
flatpak install flathub com.spotify.Client
flatpak install flathub tech.feliciano.pocket-casts
flatpak install flathub com.obsproject.Studio
flatpak install flathub io.github.celluloid_player.Celluloid
flatpak install flathub org.gnome.Boxes
flatpak install flathub com.mattjakeman.ExtensionManager
flatpak install flathub com.github.tchx84.Flatseal
flatpak install flathub org.nickvision.tubeconverter
flatpak install flathub org.localsend.localsend_app
flatpak install flathub page.codeberg.libre_menu_editor.LibreMenuEditor
flatpak install flathub de.haeckerfelix.Fragments
flatpak install flathub com.rtosta.zapzap
flatpak install flathub com.todoist.Todoist

# Instalar as fontes que estão na pasta: Fontes
# Aplicativos para instalar depois manualmente: DaVinci Resolve, Insync
# O que adicionar como webapp depois: Trello
# Ajustar os problemas do DaVinci Resolve segundo esse tutorial: https://github.com/H3rz3n/Davinci-Resolve-Fedora-38-39-40-Fix


exit 0
