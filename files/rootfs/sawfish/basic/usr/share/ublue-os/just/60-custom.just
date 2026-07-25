# Use mimalloc globally
[group("system")]
use-mimalloc-globally:
    #!/usr/bin/env bash
    if [ ! -f /etc/environment ] || printf "INFO: /etc/environment file not found ...\nINFO: Creating New /etc/environment file...\n" && sudo touch /etc/environment
    printf "INFO: Adding Environment variable for mimalloc to be used globally.\n"
    printf "LD_PRELOAD=/usr/lib64/libmimalloc.so.2" | sudo tee -a /etc/environment

# Remove global mimalloc
[group("system")]
remove-global-mimalloc:
    #!/usr/bin/env bash
    printf "Removing global mimalloc\n"
    sudo sed 'LD_PRELOAD=/usr/lib64/libmimalloc.so.2' /etc/environment

# Use the recommended Light theme
use-arc-light-theme:
    #!/usr/bin/env bash
    printf "Setting the arc theme to Arc-lighter\n"
    gsettings set org.gnome.desktop.interface gtk-theme 'Arc-Lighter'

# Use the recommended Dark theme
use-arc-dark-theme:
    #!/usr/bin/env bash
    printf "Setting the arc theme to Arc-Dark\n"
    gsettings set org.gnome.desktop.interface gtk-theme 'Arc-Dark'
