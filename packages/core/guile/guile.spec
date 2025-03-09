name: "guile"
author: "freswa"
arch: "x86_64"
version: 3.0.10
build_deps: []
description: "Portable, embeddable Scheme implementation written in C"
license: "GPL"
sources: ["tar+https://ftp.gnu.org/pub/gnu/guile/guile-3.0.10.tar.gz"]
build_script: "build.sh"
anemo_script: ""

# anemo metadata
provides: []
conflicts: []
replaces: []
protected: true
deps: ["gc", "gmp", "libffi", "libunistring", "libxcrypt", "ncurses"]
