name: "m4"
author: "dvzrv"
arch: "x86_64"
version: 1.4.19
build_deps: []
description: "The GNU macro processor"
license: "GPL3"
sources: ["https://ftp.gnu.org/gnu/m4/m4-1.4.19.tar.xz"]
build_script: "build.sh"
anemo_script: ""

# anemo metadata
provides: []
conflicts: []
replaces: []
protected: true
deps: ["bash", "glibc"]
