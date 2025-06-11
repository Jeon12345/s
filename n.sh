#!/bin/bash

# === CONFIG ===
NGROK_TOKEN="2yMCukUmuN2VdA6ZsOR5NrZJJSu_6C8UNqAT2QDxSqjiuLM1U"
NGROK_PORT=22
NGROK_BIN="./ngrok"

# === DOWNLOAD NGROK ===
if [ ! -f "$NGROK_BIN" ]; then
    echo "[*] Downloading ngrok..."
    wget -q https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-linux-amd64.tgz -O ngrok.zip
    unzip -o ngrok.zip
    chmod +x ngrok
    rm ngrok.zip
fi

# === SET AUTHTOKEN ===
echo "[*] Configuring ngrok with authtoken..."
$NGROK_BIN config add-authtoken "$NGROK_TOKEN"

# === START TUNNEL ===
echo "[*] Starting ngrok tunnel on TCP port $NGROK_PORT..."
$NGROK_BIN tcp $NGROK_PORT
