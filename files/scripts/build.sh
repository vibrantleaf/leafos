#!/usr/bin/env bash
#set -oue pipefail

mkdir -p tmp/cloned

git clone https://github.com/root0emir/ArchLinux-GamingPerformanceTuning.git /tmp/cloned/om.github.root0emir.ArchLinux-GamingPerformanceTuning
cp -v /tmp/cloned/om.github.root0emir.ArchLinux-GamingPerformanceTuning/Settings/sysctl.conf /usr/lib/sysctl.d/com-github-root0emir.conf

git clone https://gitlab.com/vibrantleaf/systemd-curfew.git /tmp/cloned/com.gitlab.vibrantleaf.systemd-curfew
cp -v /tmp/cloned/com.gitlab.vibrantleaf.systemd-curfew /usr/lib/systemd/system/curfew-midnight.service

git clone https://gist.github.com/vibrantleaf/ef3cd8a31ead32063a745fcc57b8a0de.git /tmp/cloned/com.github.gist.vibrantleaf.ef3cd8a31ead32063a745fcc57b8a0de/
cp -v /tmp/cloned/com.github.gist.vibrantleaf.ef3cd8a31ead32063a745fcc57b8a0de/linux-set_random_windows_style_hostname_via_hostnamectl.sh /usr/bin/set_win10_style_hostname
chmod +x /usr/bin/set_win10_style_hostname

rm -rf /tmp/cloned

dnf repo list