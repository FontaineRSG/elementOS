name: "libxcrypt"
author: "eworm"
arch: "x86_64"
version: 4.4.38
build_deps: []
description: "Modern library for one-way hashing of passwords"
license: "LGPL"
sources: ["https://github.com/besser82/libxcrypt//releases/download/v4.4.38/libxcrypt-4.4.38.tar.xz"]
build_script: "build.sh"
anemo_script: ""

# anemo metadata
provides: ["libcrypt.so=2-64"]
conflicts: []
replaces: []
protected: true
deps: ["glibc"]

splits:
  libxcrypt-compat:
    name: "libxcrypt-compat"
    author: ""
    arch: ""
    version: 4.4.38
    build_deps: []
    description: "Modern library for one-way hashing of passwords - legacy API functions"
    license: "LGPL"
    build_script: "build-compat.sh"
    anemo_script: ""
    # anemo metadata
    provides: []
    conflicts: []
    replaces: []
    protected: true
    deps: ["libxcrypt"]
