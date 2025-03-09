name: "automake"
author: "lfleischer"
arch: "any"
version: 1.17
build_deps: [autoconf]
description: "A GNU tool for automatically creating Makefiles"
license: "GPL"
sources: ["https://ftp.gnu.org/gnu/automake/automake-1.17.tar.xz"]
build_script: "build.sh"
anemo_script: ""

# anemo metadata
provides: []
conflicts: []
replaces: []
protected: true
deps: ["bash", "perl"]
