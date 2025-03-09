name: "jansson"
author: "freswa"
arch: "x86_64"
version: 2.14
build_deps: []
description: "C library for encoding, decoding and manipulating JSON data"
license: "MIT"
sources: ["tar+https://github.com/akheron/jansson/releases/download/v2.14/jansson-2.14.tar.gz", "git+https://gitlab.archlinux.org/archlinux/packaging/packages/jansson"]
build_script: "build.sh"
anemo_script: ""

# anemo metadata
provides: []
conflicts: []
replaces: []
protected: true
deps: ["glibc"]
