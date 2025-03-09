name: "libnfnetlink"
author: "eworm"
arch: "x86_64"
version: 1.0.2
build_deps: []
description: "Low-level library for netfilter related kernel/userspace communication"
license: "GPL"
sources: ["tar+https://www.netfilter.org/projects/libnfnetlink/files/libnfnetlink-1.0.2.tar.bz2"]
build_script: "build.sh"
anemo_script: ""

# anemo metadata
provides: []
conflicts: []
replaces: []
protected: true
deps: ["glibc"]
