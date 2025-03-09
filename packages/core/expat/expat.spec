name: "expat"
author: "dvzrv"
arch: "x86_64"
version: 2.6.4
build_deps: []
description: "An XML parser library"
license: "MIT"
sources: ["git+https://github.com/libexpat/libexpat?signed#tag=R_2_6_4"]
build_script: "build.sh"
anemo_script: ""

# anemo metadata
provides: ["libexpat.so=1-64"]
conflicts: []
replaces: []
protected: true
deps: ["glibc"]
