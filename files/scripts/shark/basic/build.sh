#!/usr/bin/env bash

# boilerplate
set -o nounset
set -o pipefail
set -o xtrace
set -o errexit

mkdir -p /tmp/cloned

# get set_win10_style_hostname
git clone https://gist.github.com/vibrantleaf/ef3cd8a31ead32063a745fcc57b8a0de.git /tmp/cloned/com.github.gist.vibrantleaf.ef3cd8a31ead32063a745fcc57b8a0de/
cp -v /tmp/cloned/com.github.gist.vibrantleaf.ef3cd8a31ead32063a745fcc57b8a0de/linux-set_random_windows_style_hostname_via_hostnamectl.sh /usr/bin/set_win10_style_hostname
chmod +x /usr/bin/set_win10_style_hostname

# clean up /tmp/cloned
rm -rf /tmp/cloned

# link htop to btop
ln -s /usr/bin/btop /usr/bin/htop

# cleanup backgrounds dir
rm -rfv /usr/share/backgrounds/*
rm -rfv /usr/share/gnome-background-properties/*

# remove default gnome extensions
rm -rfv '/usr/share/gnome-shell/extensions/*'