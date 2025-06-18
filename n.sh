#!/bin/bash

# Set your Ngrok authtoken here
# NGROK_TOKEN="1pEQhvizMarEn9dwdgrTw6imo07_3dAuarJwJNztGS4BqbueD"
NGROK_TOKEN="2Y1IOhGOtQjVSv8DafQ42D0Mhn0_6yhuzCqh1Myo24noVn2d8"

echo "[+] Installing ngrok..."

# Download and install ngrok if not found
if ! command -v ngrok &> /dev/null; then
  wget -q https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-linux-amd64.tgz
  tar -xzf ngrok-v3-stable-linux-amd64.tgz
  sudo mv ngrok /usr/local/bin/
  rm ngrok-v3-stable-linux-amd64.tgz
else
  echo "[+] ngrok is already installed."
fi

echo "[+] Setting authtoken..."
ngrok config add-authtoken "$NGROK_TOKEN"

echo "[+] Starting ngrok tunnel on port 22..."
ngrok tcp 22
