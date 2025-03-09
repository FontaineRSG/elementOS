name: "libnetfilter_conntrack"
author: "eworm"
arch: "x86_64"
version: 1.0.9
build_deps: []
description: "Library providing an API to the in-kernel connection tracking state table"
license: "GPL"
sources: ["tar+https://www.netfilter.org/projects/libnetfilter_conntrack/files/libnetfilter_conntrack-1.0.9.tar.bz2"]
build_script: "build.sh"
anemo_script: ""

# anemo metadata
provides: []
conflicts: []
replaces: []
protected: true
deps: ["libmnl", "libnfnetlink"]
