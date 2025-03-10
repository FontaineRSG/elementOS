name: "libssh2"
author: "tpowa"
arch: "x86_64"
version: 1.11.1
build_deps: []
description: "A library implementing the SSH2 protocol as defined by Internet Drafts"
license: "BSD"
sources: ["https://www.libssh2.org/download/libssh2-1.11.1.tar.gz"]
build_script: "build.sh"
anemo_script: ""

# anemo metadata
provides: ["libssh2.so=1-64"]
conflicts: []
replaces: []
protected: true
deps: ["openssl", "zlib"]
