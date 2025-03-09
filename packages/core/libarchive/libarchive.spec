name: "libarchive"
author: "eworm"
arch: "x86_64"
version: 3.7.7
build_deps: [git]
description: "Multi-format archive and compression library"
license: "BSD"
sources: ["git+https://github.com/libarchive/libarchive.git#tag=v3.7.7"]
build_script: "build.sh"
anemo_script: ""

# anemo metadata
provides: ["libarchive.so=13-64"]
conflicts: []
replaces: []
protected: true
deps: ["acl", "bzip2", "libacl.so=1-64", "libbz2.so=1.0-64", "libcrypto.so=3-64", "liblzma.so=5-64", "libxml2", "libxml2.so=2-64", "libz.so=1-64", "libzstd.so=1-64", "lz4", "openssl", "xz", "zlib", "zstd"]
