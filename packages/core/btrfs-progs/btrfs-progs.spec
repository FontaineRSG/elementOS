name: "btrfs-progs"
author: "tpowa"
arch: "x86_64"
version: 6.13
build_deps: []
description: "Btrfs filesystem utilities"
license: "GPL-2.0-only"
sources: ["git+https://gitlab.archlinux.org/archlinux/packaging/packages/btrfs-progs","git+https://git.kernel.org/pub/scm/linux/kernel/git/kdave/btrfs-progs.git#tag=v6.13"]
build_script: "build.sh"
anemo_script: ""

# anemo metadata
provides: ["btrfs-progs-unstable"]
conflicts: ["btrfs-progs-unstable"]
replaces: ["btrfs-progs-unstable"]
protected: true
deps: ["glibc", "libgcrypt", "lzo", "systemd-libs", "util-linux-libs", "zlib", "zstd"]
