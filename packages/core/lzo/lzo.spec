name: "lzo"
author: "felixonmars"
arch: "x86_64"
version: 2.10
build_deps: []
description: "Portable lossless data compression library"
license: "GPL"
sources: ["tar+https://www.oberhumer.com/opensource/lzo/download/lzo-2.10.tar.gz"]
build_script: "build.sh"
anemo_script: ""

# anemo metadata
provides: ["liblzo2.so=2-64", "libminilzo.so=0-64"]
conflicts: []
replaces: []
protected: true
deps: ["glibc"]
