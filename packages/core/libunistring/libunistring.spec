name: "libunistring"
author: "tpowa"
arch: "x86_64"
version: 1.3
build_deps: []
description: "Library for manipulating Unicode strings and C strings"
license: "GPL-2.0-or-later, LGPL-3.0-or-later"
sources: ["https://ftp.gnu.org/gnu/libunistring/libunistring-1.3.tar.xz"]
build_script: "build.sh"
anemo_script: ""

# anemo metadata
provides: ["libunistring.so=5-64"]
conflicts: []
replaces: []
protected: true
deps: ["glibc"]
