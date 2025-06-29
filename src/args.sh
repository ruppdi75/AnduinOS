#!/bin/bash

# ==============================================================================
#                 !!! IMPORTANT NOTE ON CONFIGURATION !!!
#
# The values in this file are DEFAULT values and will be DYNAMICALLY
# OVERWRITTEN by the build script (build_all.sh) using the configurations
# from the JSON files in the ../config/ directory for each language build.
#
# Do not edit these values directly to change a specific language build.
# Instead, modify the corresponding JSON file in the ../config/ directory.
# ==============================================================================

#==========================
# Builder Environment Variables
#==========================
export DEBIAN_FRONTEND=noninteractive
export SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"
export HOME=/root

# Set if build in an interactive way.
# Can be: "-y" or ""
export INTERACTIVE="-y"

#==========================
# Language Information
#==========================

# Set the language environment. Can be: en_US, en_GB, de_AT, de_DE, zh_CN, zh_TW, zh_HK, ja_JP, ko_KR, vi_VN, th_TH, fr_FR, es_ES, ru_RU, it_IT, pt_BR, pt_PT, ar_SA, nl_NL, sv_SE, pl_PL, tr_TR
export LANG_MODE="de_AT"
# Set the language pack code. Can be: zh, en, ja, ko, vi, th, de, fr, es, ru, it, pt, pt, ar, nl, sv, pl, tr
export LANG_PACK_CODE="de"

export LANGUAGE_PACKS="language-pack-$LANG_PACK_CODE* language-pack-gnome-$LANG_PACK_CODE*"

#==========================
# OS system information
#==========================
export TARGET_UBUNTU_VERSION="noble"
export BUILD_UBUNTU_MIRROR="http://at.archive.ubuntu.com/ubuntu/"
export TARGET_NAME="lumios"
export TARGET_BUSINESS_NAME="LumiOS"
export TARGET_BUILD_VERSION="1.0.0"
export TARGET_BUILD_BRANCH=$(git rev-parse --abbrev-ref HEAD)

#===========================
# Installer customization
#===========================
export TARGET_PACKAGE_REMOVE="gnome-terminal gedit ubiquity casper discover laptop-detect os-prober"

#============================
# Store experience customization
#============================
export STORE_PROVIDER="flatpak"
export FLATHUB_MIRROR="https://mirror.selfnet.de/flathub/"
export FLATHUB_GPG=""

#============================
# Input method configuration
#============================
# Packages will be installed during the installation process
# Can be:
# * ibus-rime
# * ibus-libpinyin
# * ibus-chewing
# * ibus-table-cangjie
# * ibus-mozc
# * ibus-hangul
# * ibus-unikey
# * ibus-libthai
export INPUT_METHOD_INSTALL=""

# Boolean indicator for whether to install anduinos-ibus-rime
export CONFIG_IBUS_RIME="false"
if [[ "$CONFIG_IBUS_RIME" == "true" && "$INPUT_METHOD_INSTALL" != *"ibus-rime"* ]]; then
    echo "Error: CONFIG_IBUS_RIME is set to true, but INPUT_METHOD_INSTALL is not set to ibus-rime"
    exit 1
fi

# The default keyboard layout. Can be:
# * [('xkb', 'us')]
# * [('xkb', 'us'), ('ibus', 'rime')]
# * [('xkb', 'us'), ('ibus', 'chewing')]
# * [('xkb', 'us'), ('xkb', 'fr')]
export CONFIG_INPUT_METHOD="[('xkb', 'us'), ('xkb', 'at')]"


#============================
# Software properties configuration
#============================

# To install software-properties-gtk, set to "true" or "false"
export INSTALL_MODIFIED_SOFTWARE_PROPERTIES_GTK="true"

#============================
# Time zone configuration
#============================

# The timezone for the new OS being built (In chroot environment)
# To view available options, run: `ls /usr/share/zoneinfo/`
export TIMEZONE="Europe/Vienna"

#============================
# Weather plugin configuration
#============================
export CONFIG_WEATHER_LOCATION="[(uint32 0, 'Wien, Österreich', uint32 0, '48.208174,16.373819')]"

#============================
# Live system configuration
#============================
export LIVE_UBUNTU_MIRROR="http://at.archive.ubuntu.com/ubuntu/"

#============================
# System apps configuration
#============================
# The default apps to be installed.
export DEFAULT_APPS="
    gnome-chess \
    gnome-clocks \
    gnome-weather \
    gnome-nettool \
    gnome-text-editor \
    seahorse \
    evince \
    shotwell \
    remmina remmina-plugin-rdp \
    rhythmbox rhythmbox-plugins \
    totem totem-plugins \
    transmission-gtk transmission-common \
    ffmpegthumbnailer \
    libgdk-pixbuf2.0-bin \
    usb-creator-gtk \
    baobab \
    file-roller \
    gnome-sushi \
    qalculate-gtk \
    yelp \
    gnome-shell-extension-prefs \
    gnome-user-docs \
    gnome-disk-utility \
    gnome-logs \
    gnome-screenshot \
    gnome-system-monitor \
    gnome-sound-recorder \
    gnome-characters \
    gnome-bluetooth \
    gnome-power-manager \
    gnome-snapshot \
    gnome-maps \
    gnome-font-viewer \
    gnome-browser-connector \
    gnome-control-center-faces \
    gnome-startup-applications \
    policykit-desktop-privileges \
    xserver-xorg-input-all \
    xorg \
    xserver-xorg-legacy \
    xserver-xorg-video-intel \
    xserver-xorg-video-qxl \
    libpam-gnome-keyring \
    libfuse2t64 \
    libfuse3-3 \
    libopengl0
"

export DEFAULT_CLI_TOOLS="
    curl \
    vim \
    nano \
    git \
    build-essential \
    make \
    gcc \
    g++ \
    dpkg-dev \
    net-tools \
    htop \
    httping \
    iputils-ping \
    iputils-tracepath \
    dnsutils \
    smartmontools \
    traceroute \
    whois \
    nmap
    "

export DEFAULT_FLATPAK_TOOLS=""
# export DEFAULT_FLATPAK_TOOLS="
#     chat.revolt.RevoltDesktop \
#     com.discordapp.Discord \
#     com.google.EarthPro \
#     com.jetbrains.Rider \
#     com.obsproject.Studio \
#     com.spotify.Client \
#     com.tencent.WeChat \
#     com.valvesoftware.Steam \
#     io.github.shiftey.Desktop \
#     net.agalwood.Motrix \
#     org.musescore.MuseScore \
#     org.qbittorrent.qBittorrent \
#     org.signal.Signal \
#     org.gnome.Boxes \
#     org.kde.krita \
#     io.missioncenter.MissionCenter \
#     com.getpostman.Postman \
#     org.shotcut.Shotcut \
#     org.blender.Blender \
#     org.videolan.VLC \
#     com.wps.Office \
#     org.chromium.Chromium \
#     com.dosbox_x.DOSBox-X \
#     com.mojang.Minecraft \
#     org.codeblocks.codeblocks
#     "