name: "binutils"
author: "freswa"
arch: "x86_64"
version: 2.44
build_deps: []
description: "A set of programs to assemble and manipulate binary and object files"
license: "FSFAP, GFDL-1.3, GPL-2.0-or-later, GPL-3.0-or-later, LGPL-2.0-or-later, LGPL-3.0-or-later"
sources: ["git+https://sourceware.org/git/binutils-gdb.git", "git+https://gitlab.archlinux.org/archlinux/packaging/packages/binutils"]
build_script: "build.sh"
anemo_script: ""

# anemo metadata
provides: ["libctf.so=0-64", "libgprofng.so=0-64", "libsframe.so=1-64"]
conflicts: ["binutils-multilib"]
replaces: ["binutils-multilib"]
protected: true
deps: ["glibc", "jansson", "libelf", "zlib", "zstd"]
