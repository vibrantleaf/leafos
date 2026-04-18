#!/usr/bin/env bash
set -o nounset
set -o pipefail
set -o xtrace
set -o errexit

mkdir -p tmp/cloned

git clone https://gitlab.com/vibrantleaf/systemd-curfew.git /tmp/cloned/com.gitlab.vibrantleaf.systemd-curfew
cp -v /tmp/cloned/com.gitlab.vibrantleaf.systemd-curfew/curfew-midnight.service /usr/lib/systemd/system/curfew-midnight.service

git clone https://gist.github.com/vibrantleaf/ef3cd8a31ead32063a745fcc57b8a0de.git /tmp/cloned/com.github.gist.vibrantleaf.ef3cd8a31ead32063a745fcc57b8a0de/
cp -v /tmp/cloned/com.github.gist.vibrantleaf.ef3cd8a31ead32063a745fcc57b8a0de/linux-set_random_windows_style_hostname_via_hostnamectl.sh /usr/bin/set_win10_style_hostname
chmod +x /usr/bin/set_win10_style_hostname

rm -rf /tmp/cloned

#dnf repo list --all


tee /etc/yum.repos.d/cloudflare-warp.repo <<EOF
[cloudflare-warp]
name=Cloudflare WARP
baseurl=https://pkg.cloudflareclient.com/rpm
enabled=0
gpgcheck=1
gpgkey=https://pkg.cloudflareclient.com/pubkey.gpg
EOF

