name: "linux"
author: "Linux Foundation"
arch: "x86_64"
version: 6.13.5.arch1
build_deps: []
description: "The Linux kernel and modules"
license: "GPL-2.0-only"
sources: ["https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-6.13.5.tar.xz"]
build_script: "build.sh"
anemo_script: ""

# anemo metadata
provides: ["KSMBD-MODULE", "VIRTUALBOX-GUEST-MODULES", "WIREGUARD-MODULE"]
conflicts: []
replaces: ["virtualbox-guest-modules-arch", "wireguard-arch"]
protected: true
deps: ["coreutils", "initramfs", "kmod"]

splits:
  linux-headers:
    name: "linux-headers"
    author: ""
    arch: ""
    version: 6.13.5
    build_deps: []
    description: "Headers and scripts for building modules for the Linux kernel"
    license: "GPL-2.0-only"
    build_script: "build-headers.sh"
    anemo_script: ""
    # anemo metadata
    provides: []
    conflicts: []
    replaces: []
    protected: true
    deps: ["pahole"]
  linux-docs:
    name: "linux-docs"
    author: ""
    arch: ""
    version: 6.13.5
    build_deps: []
    description: "Documentation for the Linux kernel"
    license: "GPL-2.0-only"
    build_script: "build-docs.sh"
    anemo_script: ""
    # anemo metadata
    provides: []
    conflicts: []
    replaces: []
    protected: true
    deps: []
