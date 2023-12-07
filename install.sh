#!/bin/bash

# Instalar o RPM Fusion
sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# Instalar o driver da NVIDIA e CUDA
sudo dnf install akmod-nvidia xorg-x11-drv-nvidia-cuda -y

# Instalar o 1Password
sudo rpm --import https://downloads.1password.com/linux/keys/1password.asc
sudo sh -c 'echo -e "[1password]\nname=1Password Stable Channel\nbaseurl=https://downloads.1password.com/linux/rpm/stable/\$basearch\nenabled=1\ngpgcheck=1\nrepo_gpgcheck=1\ngpgkey=\"https://downloads.1password.com/linux/keys/1password.asc\"" > /etc/yum.repos.d/1password.repo'
sudo dnf install 1password -y

# Instalar o Piper para gerenciar o MX Master 3
sudo dnf install piper -y

# Instalar o GNOME Tweaks para configurar o botão de minimizar
sudo dnf install gnome-tweaks -y

# Instalar aplicativos em flatpak
flatpak install flathub org.yuzu_emu.yuzu
flatpak install flathub com.discordapp.Discord
flatpak install flathub com.spotify.Client
flatpak install flathub org.gimp.GIMP
flatpak install flathub com.obsproject.Studio
flatpak install flathub org.videolan.VLC
flatpak install flathub org.gnome.Boxes
flatpak install flathub com.mattjakeman.ExtensionManager
flatpak install flathub com.github.tchx84.Flatseal
flatpak install flathub net.davidotek.pupgui2
flatpak install flathub com.usebottles.bottles
flatpak install flathub io.github.mimbrero.WhatsAppDesktop
flatpak install flathub io.gitlab.news_flash.NewsFlash
flatpak install flathub com.heroicgameslauncher.hgl
