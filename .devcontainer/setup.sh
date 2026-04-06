#!/bin/bash
export DEBIAN_FRONTEND=noninteractive
echo "[1/3] Cài đặt Dependencies..."
sudo apt-get update -y && sudo apt-get install -y python3-pip wget gcc nodejs npm
pip install --no-cache-dir gdown flask requests
npm install cluster colors axios discord.js user-agents puppeteer-real-browser colorama crypto gradient-string header-generator hpack socks

echo "[2/3] Tải Scripts & Compile..."
mkdir -p /workspaces/bot-core && cd /workspaces/bot-core
wget -q https://raw.githubusercontent.com/ErcinDedeoglu/proxies/main/proxies/https.txt -O proxy.txt
gdown 1l7XemuQ4MuxYYzmzLYnXTF9tXw_mutgV -O hieu.js
gdown 1Kpe6qSbsNaS-z0f9BMCyJsi3ooVouPLh -O raw.js
gdown 1Nr_mkvx54ih7esfpFd8QheaVvGL8O2J6 -O vps.py
gdown 1Vq9T9WkLJdMDQf9s2mL4w32cRsxr6lPk -O bot.js
gdown 1ICGS7OQEsc4nbMWEVNU7OM9manNl-OAU -O data.json
gdown 1MuaBraso20I73ixepu6SQWDq0GMnlU05 -O udpbypass.c
gdown 1Q2VYSvBdeclp6A1f8xePFrT6Yt7ZB2gX -O ovh.c

gcc udpbypass.c -o udpbypass && gcc ovh.c -o ovhbypass && chmod +x udpbypass ovhbypass

echo "[3/3] Cấu hình Public Port 5000..."
gh codespace ports visibility 5000:public -c $CODESPACE_NAME

nohup python3 vps.py > vps.log 2>&1 &
echo "H2 SYSTEM READY."