# os
<img src="https://upload.wikimedia.org/wikipedia/commons/3/35/Tux.svg" alt="It's Tux, Linux's Penguin Mascot" width="75"/>

Hello, This repository is for building my own custom personal operating system, for fun.

## Changes from upstream.
Here is the changes that I have made in this os image derived from bazzite with gnome.
- Added: [Microsoft](https://github.com/microsoft/)/[mimalloc](https://github.com/microsoft/mimalloc/)
  - Added: `ujust` script to enable and disable mimalloc globally via `LD_PRELOAD` in `/etc/environment`
- Added: [root0emir](https://github.com/root0emir)/[ArchLinux-GamingPerformanceTuning's](https://github.com/root0emir/ArchLinux-GamingPerformanceTuning/) [sysctl.conf](https://github.com/root0emir/ArchLinux-GamingPerformanceTuning/blob/main/Settings/sysctl.conf)
- Added: [Feral Interactive](https://github.com/FeralInteractive/)/[gamemode](https://github.com/FeralInteractive/gamemode)
- Added: [vibrantleaf](https://gitlab.com/vibrantleaf/)/[systemd-curfew](https://gitlab.com/vibrantleaf/systemd-curfew)
- Enabled: NTSYNC Kernel Module by default

## How to Rebase.
<details>
<summary>Basic</summary>
<code>
cosign verify --key https://raw.githubusercontent.com/vibrantleaf/os/refs/heads/main/cosign.pub ghcr.io/vibrantleaf/os:stable
</code>
<code>
pkexec bootc switch ghcr.io/vibrantleaf/os:stable
</code>
</details>
<details>
<summary>Deck</summary>
<code>
cosign verify --key https://raw.githubusercontent.com/vibrantleaf/os/refs/heads/main/cosign.pub ghcr.io/vibrantleaf/os-deck:stable
</code>
<code>
pkexec bootc switch ghcr.io/vibrantleaf/os-deck:stable
</code>
</details>
<details>
<summary>NVida</summary>
<code>
cosign verify --key https://raw.githubusercontent.com/vibrantleaf/os/refs/heads/main/cosign.pub ghcr.io/vibrantleaf/os-nvidia:stable
</code>
<code>
pkexec bootc switch ghcr.io/vibrantleaf/os-nvidia:stable
</code>
</details>
<details>
<summary>NVidia Open Driver</summary>
<code>
cosign verify --key https://raw.githubusercontent.com/vibrantleaf/os/refs/heads/main/cosign.pub ghcr.io/vibrantleaf/os-nvidia-open:stable
</code>
<code>
pkexec bootc switch ghcr.io/vibrantleaf/os-nvidia-open:stable
</code>
<details>
