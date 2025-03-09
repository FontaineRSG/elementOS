name: "libnl"
author: "eworm"
arch: "x86_64"
version: 3.11.0
build_deps: []
description: "Library for applications dealing with netlink sockets"
license: "GPL"
sources: ["tar+https://github.com/thom311/libnl/releases/download/libnl3_11_0/libnl-3.11.0.tar.gz"]
build_script: "build.sh"
anemo_script: ""

# anemo metadata
provides: ["libnl-3.so=200-64", "libnl-cli-3.so=200-64", "libnl-genl-3.so=200-64", "libnl-idiag-3.so=200-64", "libnl-nf-3.so=200-64", "libnl-route-3.so=200-64", "libnl-xfrm-3.so=200-64"]
conflicts: []
replaces: []
protected: true
deps: ["gcc-libs", "glibc"]
