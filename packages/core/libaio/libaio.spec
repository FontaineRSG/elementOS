name: "libaio"
author: "dvzrv"
arch: "x86_64"
version: 0.3.113
build_deps: []
description: "The Linux-native asynchronous I/O facility (aio) library"
license: "LGPL-2.0-or-later"
sources: ["https://pagure.io/libaio/archive/libaio-0.3.113/libaio-libaio-0.3.113.tar.gz"]
build_script: "build.sh"
anemo_script: ""

# anemo metadata
provides: ["libaio.so=1-64"]
conflicts: []
replaces: []
protected: true
deps: ["glibc"]
