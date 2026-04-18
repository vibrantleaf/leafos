#!/usr/bin/env bash
set -o nounset
set -o pipefail
set -o xtrace
set -o errexit
mkdir -p /tmp/cloned

dnf -y --refresh install binutils coreutils curl tar zstd cmake make gcc g++

git clone https://github.com/ptitSeb/box64.git /tmp/cloned/org.box86.box64
mkdir -p /tmp/cloned/org.box86.box64/build

(cd /tmp/cloned/org.box86.box64/build && exec \
  cmake  -D ARM_DYNAREC=ON \
  -D CMAKE_BUILD_TYPE=RelWithDebInfo \
  -D BOX32=ON \
  -D BOX32_BINFMT=ON \
  /tmp.cloned/org.box86.box64 \
)

(cd /tmp/cloned/org.box86.box64/build && exec \
  make \
)

(cd /tmp/cloned/org.box86.box64/build && exec \
  make install \
)

(cd /tmp/cloned/org.box86.box64 && exec \
  box64-bundle-x86-libs.sh \
)

(cd /tmp/cloned/org.box86.box64 && exec \
  tar --extract --no-same-owner --file box64-bundle-x86-libs.tar.gz --directory / \
)

