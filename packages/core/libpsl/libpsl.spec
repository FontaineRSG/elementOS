name: "libpsl"
author: "anthraxx"
arch: "x86_64"
version: 0.21.5
build_deps: []
description: "Public Suffix List library"
license: "MIT"
sources: ["https://github.com/rockdaboot/libpsl/releases/download/0.21.5/libpsl-0.21.5.tar.gz"]
build_script: "build.sh"
anemo_script: ""

# anemo metadata
provides: ["libpsl.so=5-64"]
conflicts: []
replaces: []
protected: true
deps: ["libidn2", "libidn2.so=0-64", "libunistring", "libunistring.so=5-64"]
