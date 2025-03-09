name: "libmpc"
author: "arojas"
arch: "x86_64"
version: 1.3.1
build_deps: []
description: "Library for the arithmetic of complex numbers with arbitrarily high precision"
license: "LGPL-3.0-only"
sources: ["https://ftp.gnu.org/gnu/mpc/mpc-1.3.1.tar.gz"]
build_script: "build.sh"
anemo_script: ""

# anemo metadata
provides: []
conflicts: []
replaces: []
protected: true
deps: ["glibc", "gmp", "mpfr"]
