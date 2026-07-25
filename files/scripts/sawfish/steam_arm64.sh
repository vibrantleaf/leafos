#!/usr/bin/env bash
set -o nounset
set -o pipefail
set -o xtrace
set -o errexit
mkdir -p /tmp/cloned

dnf install -y --refresh python3

git clone https://github.com/chaitan3/steam_installer_linuxarm64.git /tmp/cloned/com.github.chaitan3.steam_installer_linuxarm64

chmod +x  /tmp/cloned/com.github.chaitan3.steam_installer_linuxarm64/download_steam_manifest.py
chmod +x /tmp/cloned/com.github.chaitan3.steam_installer_linuxarm64/run_steam.sh

(cd /tmp/cloned/com.github.chaitan3.steam_installer_linuxarm64 && exec \
  ./download_steam_manifest.py
)