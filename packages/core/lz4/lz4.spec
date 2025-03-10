name: "lz4"
author: "svenstaro"
arch: "x86_64"
version: 1.10.0
build_deps: [git, meson, ninja]
description: "Extremely fast compression algorithm"
license: "GPL-2.0-or-later"
sources: ["git+https://github.com/lz4/lz4.git#tag=v1.10.0"]
build_script: "build.sh"
anemo_script: ""

# anemo metadata
provides: ["liblz4.so=1-64"]
conflicts: []
replaces: []
protected: true
deps: ["glibc"]
