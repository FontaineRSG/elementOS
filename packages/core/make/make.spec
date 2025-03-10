name: "make"
author: "dvzrv"
arch: "x86_64"
version: 4.4.1
build_deps: []
description: "GNU make utility to maintain groups of programs"
license: "GPL3"
sources: ["tar+https://ftp.gnu.org/gnu/make/make-4.4.1.tar.lz"]
build_script: "build.sh"
anemo_script: ""

# anemo metadata
provides: []
conflicts: []
replaces: []
protected: true
deps: ["glibc", "guile"]
