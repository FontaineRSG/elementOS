name: "iproute2"
author: "eworm"
arch: "x86_64"
version: 6.13.0
build_deps: [db5.3, linux-atm, iptables]
description: "IP Routing Utilities"
license: "GPL-2.0-or-later"
sources: ["tar+https://www.kernel.org/pub/linux/utils/net/iproute2/iproute2-6.13.0.tar.xz", "git+https://gitlab.archlinux.org/archlinux/packaging/packages/iproute2"]
build_script: "build.sh"
anemo_script: ""

# anemo metadata
provides: ["iproute"]
conflicts: []
replaces: []
protected: true
deps: ["glibc", "libbpf", "libbpf.so=1-64", "libcap", "libcap.so=2-64", "libelf", "libxtables.so=12-64"]
