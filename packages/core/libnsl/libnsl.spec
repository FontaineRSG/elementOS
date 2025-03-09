name: "libnsl"
author: "dvzrv"
arch: "x86_64"
version: 2.0.1
build_deps: []
description: "Public client interface library for NIS(YP)"
license: "LGPL-2.1-only"
sources: ["https://github.com/thkukuk/libnsl/archive/v2.0.1/libnsl-v2.0.1.tar.gz"]
build_script: "build.sh"
anemo_script: ""

# anemo metadata
provides: ["libnsl.so=3-64"]
conflicts: []
replaces: []
protected: true
deps: ["glibc", "libtirpc"]
