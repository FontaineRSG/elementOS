name: "libbpf"
author: "arojas"
arch: "x86_64"
version: 1.5.0
build_deps: []
description: "Library for loading eBPF programs and reading and manipulating eBPF objects from user-space"
license: "LGPL-2.1-or-later"
sources: ["tar+https://github.com/libbpf/libbpf/archive/v1.5.0/libbpf-1.5.0.tar.gz"]
build_script: "build.sh"
anemo_script: ""

# anemo metadata
provides: ["libbpf.so=1-64"]
conflicts: []
replaces: []
protected: true
deps: ["glibc", "libelf", "linux-api-headers", "zlib"]
