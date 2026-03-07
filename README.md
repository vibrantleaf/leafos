# os
<img src="https://upload.wikimedia.org/wikipedia/commons/3/35/Tux.svg" alt="It's Tux, Linux's Penguin Mascot" width="75"/>

Hello, This repository is for building my own for fun custom personal operating system.

<img src="https://blue-build.org/_astro/logo-round-dark.t-xMSly5.svg" alt="It's Blue Build's Duck Mascot" width="60"/> Built Using Blue Build.

![GitHub Actions Workflow Status](https://img.shields.io/github/actions/workflow/status/vibrantleaf/os/build.yaml)  ![GitHub License](https://img.shields.io/github/license/vibrantleaf/os)

## Changes from upstream.
Here is the changes that I have made in this os image derived from bazzite with gnome.
- Added: [<img src="https://github.githubassets.com/favicons/favicon.png" alt="The github Logo" width="11"/> Microsoft](https://github.com/microsoft/)/[mimalloc](https://github.com/microsoft/mimalloc/)
  - Added: `ujust` script to enable and disable mimalloc globally via `LD_PRELOAD` in `/etc/environment`
- Added: [<img src="https://github.githubassets.com/favicons/favicon.png" alt="The github Logo" width="11"/> root0emir](https://github.com/root0emir)/[ArchLinux-GamingPerformanceTuning's](https://github.com/root0emir/ArchLinux-GamingPerformanceTuning/) [sysctl.conf](https://github.com/root0emir/ArchLinux-GamingPerformanceTuning/blob/main/Settings/sysctl.conf)
- Added: [<img src="https://github.githubassets.com/favicons/favicon.png" alt="The github Logo" width="11"/> Feral Interactive](https://github.com/FeralInteractive/)/[gamemode](https://github.com/FeralInteractive/gamemode)
- Added: [<img src="https://gitlab.com/assets/favicon-72a2cad5025aa931d6ea56c3201d1f18e68a8cd39788c7c80d5b2b82aa5143ef.png" alt="The gitlab logo" width="11"/> vibrantleaf](https://gitlab.com/vibrantleaf/)/[systemd-curfew](https://gitlab.com/vibrantleaf/systemd-curfew)
- Added (deck image only): [<img src="https://kodi.tv/favicon.svg" alt="The Kodi logo" width="11"/> kodi](https://kodi.tv)
- Enabled: NTSYNC Kernel Module by default

## Installation Guide.
>Unfortunately due to the size of the `.iso`s an installer cannot be provided.

Inorder to install this os you will need to rebase from a already installed [<img src="https://universal-blue.org/content/favicon-new.png" alt="It's Universal Blue's U Logo" width="11"/> Universal Blue](https://universal-blue.org/) Image Such as [<img src="https://getaurora.dev/aurora-logo.svg" alt="It's Aurora's A Logo" width="11"/> Aurrora](https://getaurora.dev/en/), [<img src="https://bazzite.gg/favicon.ico" alt="It's Bazzite's B logo" width="11"/> Bazzite](https://bazzite.gg/) or [<img src="https://projectbluefin.io/favicons/favicon.svg" alt="It's Bluefin's Dinosaur Logo" width="11"/> Bluefin](https://projectbluefin.io/) Then follow the [rebase helper](https://github.com/vibrantleaf/os/blob/main/README.md#rebase-helper) and run the supplyed commands in the terminal from with in your Universal Blue Image Installation. after the commands hsve finnished next time you reboot your installation will switch over as if it was a just a normal over-the-air update.

> WARNING: Do not use a CentOS Stream based image such as Bluefin LTS as rebassing between Fedora Atomic and CentOS Stream is unsupported.
### Rebase Helper.
Sellect Your formfactor:
<details>
<summary>Desktop or Laptop</summary>
Select Your Video Card's Vendor:
<details>
<summary>AMD</summary>
<code>
cosign verify --key https://raw.githubusercontent.com/vibrantleaf/os/refs/heads/main/cosign.pub ghcr.io/vibrantleaf/os:stable
</code>
<code>
pkexec bootc switch --enforce-container-sigpolicy ghcr.io/vibrantleaf/os:stable
</code>
</details>
<details>
<summary>INTEL</summary>
<code>
cosign verify --key https://raw.githubusercontent.com/vibrantleaf/os/refs/heads/main/cosign.pub ghcr.io/vibrantleaf/os:stable
</code>
<code>
pkexec bootc switch --enforce-container-sigpolicy ghcr.io/vibrantleaf/os:stable
</code>
</details>
<details>
<summary>NVida</summary>
Select Your Prefered Video Driver:
<details>
<summary>NEW Proprietary Open-Module Driver.</summary>
<code>
cosign verify --key https://raw.githubusercontent.com/vibrantleaf/os/refs/heads/main/cosign.pub ghcr.io/vibrantleaf/os-nvidia-open:stable
</code>
<code>
pkexec bootc switch --enforce-container-sigpolicy ghcr.io/vibrantleaf/os-nvidia-open:stable
</code>
</details>
<details>
<summary>OLD Proprietary Closed-Module Driver.</summary>
<code>
cosign verify --key https://raw.githubusercontent.com/vibrantleaf/os/refs/heads/main/cosign.pub ghcr.io/vibrantleaf/os-nvidia:stable
</code>
<code>
pkexec bootc switch --enforce-container-sigpolicy ghcr.io/vibrantleaf/os-nvidia:stable
</code>
</details>
<details>
<summary>OPEN SOURCE NVK or Nouveau Driver.</summary>
<code>
cosign verify --key https://raw.githubusercontent.com/vibrantleaf/os/refs/heads/main/cosign.pub ghcr.io/vibrantleaf/os:stable
</code>
<code>
pkexec bootc switch --enforce-container-sigpolicy ghcr.io/vibrantleaf/os:stable
</code>
</details>
</details>
</details>
<details>
<summary>Handheld or HTPC</summary>
<div class="alert">
  <span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span> 
  Note. Only Handhelds and HTPCs with either an AMD or Intel Video Card is supported by this image.
</div>
<br>
The Handheld / HTPC Image fetures both automaticly starting into the <a href="http://steamdeck.com/"> SteamDeck</a> UI and <a href="https://kodi.tv"> Kodi</a> preinstalled.
<br>
<code>
cosign verify --key https://raw.githubusercontent.com/vibrantleaf/os/refs/heads/main/cosign.pub ghcr.io/vibrantleaf/os-deck:stable
</code>
<code>
pkexec bootc switch --enforce-container-sigpolicy ghcr.io/vibrantleaf/os-deck:stable
</code>
</details>

## Source Code Mirrors.
The Source Code for this is made aviable via the following mirrors:
- On [<img src="https://github.githubassets.com/favicons/favicon.png" alt="The github Logo" width="11"/> GitHub](https:/github.com/vibrantleaf/os)
- ~~On [<img src="https://gitlab.com/assets/favicon-72a2cad5025aa931d6ea56c3201d1f18e68a8cd39788c7c80d5b2b82aa5143ef.png" alt="The gitlab logo" width="11"/> GitLab](https://gitlab.com/vibrantleaf/os)~~ (Soon!)
- ~~On [<img src="https://codeberg.org/assets/img/favicon.svg" alt="The codeberg Logo" width="11"/> Codebrg](https://codeberg/vibrantleaf/os )~~ (Soon!)



## Thanks.
Thank you to the [<img src="https://universal-blue.org/content/favicon-new.png" alt="It's Universal Blue's U Logo" width="11"/> Unversial Blue](https://universal-blue.org/) and the [<img src="https://blue-build.org/favicon.svg" alt="It's Blue Build's Duck Mascot" width="11"/> Blue Build](https://blue-build.org/) Teams for making custom personal operating system images possible.
