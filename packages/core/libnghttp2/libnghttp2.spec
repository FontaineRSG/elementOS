name: "libnghttp2"
author: "eworm"
arch: "x86_64"
version: 1.65.0
build_deps: [git]
description: "Framing layer of HTTP/2 is implemented as a reusable C library"
license: "MIT"
sources: ["git+https://github.com/nghttp2/nghttp2.git#tag=v1.65.0", "git+https://github.com/ngtcp2/munit.git", "git+https://github.com/mruby/mruby.git", "git+https://github.com/tatsuhiro-t/neverbleed.git"]
build_script: "build.sh"
anemo_script: ""

# anemo metadata
provides: ["libnghttp2.so=14-64"]
conflicts: ["nghttp2<1.20.0-2"]
replaces: []
protected: true
deps: ["glibc"]
