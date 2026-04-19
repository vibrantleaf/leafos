#!/usr/bin/env bash
set -o nounset
set -o pipefail
set -o xtrace
set -o errexit
mkdir -p /tmp/cloned

# box64 build deps
dnf -y --refresh install binutils coreutils curl tar zstd cmake make gcc g++

# cloone the box64 sorce code
git clone https://github.com/ptitSeb/box64.git /tmp/cloned/org.box86.box64
mkdir -p /tmp/cloned/org.box86.box64/build

# build box64 with box86 support
(cd /tmp/cloned/org.box86.box64/build && exec \
  cmake  -D ARM_DYNAREC=ON \
  -D CMAKE_BUILD_TYPE=RelWithDebInfo \
  -D BOX32=ON \
  -D BOX32_BINFMT=ON \
  /tmp/cloned/org.box86.box64 \
)

# build box64
(cd /tmp/cloned/org.box86.box64/build && exec \
  make -j4 \
)

# install box64
(cd /tmp/cloned/org.box86.box64/build && exec \
  make install \
)

# download box64's x86 and x86_64 compat libs
(cd /tmp/cloned/org.box86.box64 && exec \
  /tmp/cloned/org.box86.box64/box64-bundle-x86-libs.sh
  #curl -s https://api.github.com/repos/ptitSeb/box64/releases/latest \
  #  | grep "browser_download_url.*box64-bundle-x86-libs*" \
  #  | cut -d : -f 2,3 \
  #  | tr -d \" \
  #  | wget -qi -
)

# install box64's x86 and x86_64 ompat libs
(cd /tmp/cloned/org.box86.box64 && exec \
  tar --extract --no-same-owner --file box64-bundle-x86-libs.tar.gz --directory / \
)

# steam

# get rpmfusion repos
dnf install -y --refresh dnf-plugins-core
dnf install -y --refresh --nogpgcheck \
  https://mirrors.rpmfusion.org/free/el/rpmfusion-free-release-$(rpm -E %rhel).noarch.rpm \
  https://mirrors.rpmfusion.org/nonfree/el/rpmfusion-nonfree-release-$(rpm -E %rhel).noarch.rpm
subscription-manager repos --enable "codeready-builder-for-rhel-$(rpm -E %{rhel})-$(uname -m)-rpms"

# download rpmfusion steam rpm
mkdir -p /tmp/cloned/org.box86.box64/steam
dnf download steam --resolve --destdir /tmp/cloned/org.box86.box64/steam

# extract rpmfusion steam rpm
mkdir -p /tmp/cloned/org.box86.box64/steam/root_dir
(cd /tmp/cloned/org.box86.box64/steam && exec \
  for file in *.rpm
  do
  mv $file /tmp/cloned/org.box86.box64/steam/root_dir/
  rpm2cpio /tmp/cloned/org.box86.box64/steam/root_dir/$file | cpio -idmv \
  rm /tmp/cloned/org.box86.box64/steam/root_dir/$file
)
ls -l /tmp/cloned/org.box86.box64/steam
rm -v /tmp/cloned/org.box86.box64/steam/*.rpm

# install steam
cp -r /tmp/cloned/org.box86.box64/steam/root_dir/* /

# create steam launcher script
tee /usr/local/bin/steam <<EOF
#!/usr/bin/bash
export STEAM_RUNTIME=1
export PROTON_USE_WOW64=1
export DBUS_FATAL_WARNINGS=0
~/steam/bin/steam $@
EOF
chmod +x /usr/local/bin/

# clean up
rm -rf /tmp/cloned