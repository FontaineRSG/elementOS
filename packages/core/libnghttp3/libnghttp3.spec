name: "libnghttp3"
author: "eworm"
arch: "x86_64"
version: 1.8.0
build_deps: []
description: "HTTP/3 library written in C"
license: "MIT"
sources: ["https://github.com/ngtcp2/nghttp3/releases/download/v1.8.0/nghttp3-1.8.0.tar.xz"]
build_script: "build.sh"
anemo_script: ""

# anemo metadata
provides: ["libnghttp3.so=9-64"]
conflicts: []
replaces: []
protected: true
deps: ["glibc"]
