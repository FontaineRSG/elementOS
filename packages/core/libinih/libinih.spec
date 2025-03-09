name: "libinih"
author: "alucryd"
arch: "x86_64"
version: 58
build_deps: []
description: "A simple .INI file parser written in C"
license: "BSD"
sources: ["git+https://github.com/benhoyt/inih.git"]
build_script: "build.sh"
anemo_script: ""

# anemo metadata
provides: ["libINIReader.so=0-64", "libinih.so=0-64"]
conflicts: []
replaces: []
protected: true
deps: ["gcc-libs", "glibc"]
