name: "libisl"
author: "freswa"
arch: "x86_64"
version: 0.27
build_deps: []
description: "Library for manipulating sets and relations of integer points bounded by linear constraints"
license: "MIT"
sources: ["tar+https://libisl.sourceforge.io/isl-0.27.tar.xz"]
build_script: "build.sh"
anemo_script: ""

# anemo metadata
provides: ["isl", "libisl.so=23-64"]
conflicts: []
replaces: ["isl"]
protected: true
deps: ["gmp"]
