name: "cryptsetup"
author: "eworm"
arch: "x86_64"
version: 2.7.5
build_deps: [util-linux, asciidoctor]
description: "Userspace setup tool for transparent encryption of block devices using dm-crypt"
license: "GPL-2.0-or-later"
sources: ["tar+https://www.kernel.org/pub/linux/utils/cryptsetup/v2.7/cryptsetup-2.7.5.tar.xz", "git+https://gitlab.archlinux.org/archlinux/packaging/packages/cryptsetup"]
build_script: "build.sh"
anemo_script: ""

# anemo metadata
provides: ["libcryptsetup.so=12-64"]
conflicts: ["mkinitcpio<38-1"]
replaces: []
protected: true
deps: ["device-mapper", "glibc", "json-c", "libblkid.so=1-64", "libcrypto.so=3-64", "libdevmapper.so=1.02-64", "libjson-c.so=5-64", "libuuid.so=1-64", "openssl", "popt", "util-linux-libs"]
