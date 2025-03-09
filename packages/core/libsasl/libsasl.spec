name: "libsasl"
author: "dvzrv"
arch: "x86_64"
version: 2.1.28
build_deps: []
description: "Cyrus Simple Authentication Service Layer (SASL) library"
license: "BSD-3-Clause-Attribution"
sources: ["git+https://github.com/cyrusimap/cyrus-sasl.git#tag=cyrus-sasl-2.1.28"]
build_script: "build.sh"
anemo_script: ""

# anemo metadata
provides: ["libsasl2.so=3-64"]
conflicts: []
replaces: []
protected: true
deps: ["gdbm", "glibc", "libcrypto.so=3-64", "libgdbm.so=6-64", "openssl"]
