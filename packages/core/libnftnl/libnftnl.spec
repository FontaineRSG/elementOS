name: "libnftnl"
author: "eworm"
arch: "x86_64"
version: 1.2.8
build_deps: []
description: "Netfilter library providing interface to the nf_tables subsystem"
license: "GPL2"
sources: ["tar+https://netfilter.org/projects/libnftnl/files/libnftnl-1.2.8.tar.xz"]
build_script: "build.sh"
anemo_script: ""

# anemo metadata
provides: []
conflicts: []
replaces: []
protected: true
deps: ["libmnl"]
