name: "libtirpc"
author: "andyrtr"
arch: "x86_64"
version: 1.3.6
build_deps: []
description: "Transport Independent RPC library (SunRPC replacement)"
license: "BSD-3-Clause, SISSL"
sources: ["tar+https://downloads.sourceforge.net/sourceforge/libtirpc/libtirpc-1.3.6.tar.bz2"]
build_script: "build.sh"
anemo_script: ""

# anemo metadata
provides: []
conflicts: []
replaces: []
protected: true
deps: ["glibc", "krb5"]
