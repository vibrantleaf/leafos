#!/usr/bin/env bash
set -o nounset
set -o pipefail
set -o xtrace
set -o errexit
mkdir -p /tmp/cloned


# fex-emu's build dependanys
dnf install -y --refresh \
  git \
  cmake \
  ninja-build \
  pkg-config \
  ccache \
  clang \
  lld \
  llvm \
  llvm-devel \
  openssl-devel \
  nasm \
  python3-clang \
  python3-setuptools \
  squashfs-tools \
  squashfuse \
  erofs-fuse \
  erofs-utils \
  qt6-qtdeclarative-devel

git clone --recurse-submodules https://github.com/FEX-Emu/FEX.git /tmp/cloned/com.fex-emu.fex

# checkout LATEST tag
#(cd /tmp/cloned/com.fex-emu.fex && exec \
#  git checkout \
#  $(git describe --tags \
#  $(git rev-list --tags --max-count=1) \
#  ) \
#  )

# build FEX
mkdir -p /tmp/cloned/com.fex-emu.fex/Build
(cd /tmp/cloned/com.fex-emu.fex/Build && exec \
  env CC=clang CXX=clang++ \
  cmake \
  -DCMAKE_INSTALL_PREFIX=/usr \
  -DCMAKE_BUILD_TYPE=Release \
  -DUSE_LINKER=lld \
  -DENABLE_LTO=True \
  -DBUILD_TESTING=False \
  -DENABLE_ASSERTIONS=False \
  -G Ninja \
  /tmp/cloned/com.fex-emu.fex && \
  ninja && \
  ninja install \
  )

rm -rfv /tmp/cloned