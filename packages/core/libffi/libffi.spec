name: "libffi"
author: "dvzrv"
arch: "x86_64"
version: 3.4.7
build_deps: []
description: "Portable foreign function interface library"
license: "MIT"
sources: ["tar+https://github.com/libffi/libffi/releases/download/v3.4.7/libffi-3.4.7.tar.gz"]
build_script: "build.sh"
anemo_script: ""

# anemo metadata
provides: ["libffi.so=8-64"]
conflicts: []
replaces: []
protected: true
deps: ["glibc"]
