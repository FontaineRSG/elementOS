name: "gzip"
author: "eworm"
arch: "x86_64"
version: 1.13
build_deps: [less]
description: "GNU compression utility"
license: "GPL-3.0-or-later"
sources: ["https://ftp.gnu.org/pub/gnu/gzip/gzip-1.13.tar.xz"]
build_script: "build.sh"
anemo_script: ""

# anemo metadata
provides: []
conflicts: []
replaces: []
protected: true
deps: ["bash", "coreutils", "glibc", "grep", "sed"]
