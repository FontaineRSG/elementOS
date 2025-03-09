name: "diffutils"
author: "tpowa"
arch: "x86_64"
version: 3.11
build_deps: []
description: "Utility programs used for creating patch files"
license: "GPL-3.0-or-later"
sources: ["https://ftp.gnu.org/gnu/diffutils/diffutils-3.11.tar.xz"]
build_script: "build.sh"
anemo_script: ""

# anemo metadata
provides: []
conflicts: []
replaces: []
protected: true
deps: ["bash", "glibc"]
