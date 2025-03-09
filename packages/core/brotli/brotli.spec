name: "brotli"
author: "jelle"
arch: "x86_64"
version: 1.1.0
build_deps: []
description: "Generic-purpose lossless compression algorithm"
license: "MIT"
sources: ["git+https://github.com/google/brotli", "git+https://gitlab.archlinux.org/archlinux/packaging/packages/brotli"]
build_script: "build.sh"
anemo_script: ""

# anemo metadata
provides: ["libbrotlicommon.so=1-64", "libbrotlidec.so=1-64", "libbrotlienc.so=1-64"]
conflicts: []
replaces: []
protected: true
deps: ["glibc"]

splits:
  python-brotli:
    name: "python-brotli"
    author: ""
    arch: ""
    version: 1.1.0
    build_deps: []
    description: "Generic-purpose lossless compression algorithm - python library"
    license: "MIT"
    sources: ["git+https://github.com/google/brotli"]
    build_script: "python-brotli_build.sh"
    anemo_script: ""
    # anemo metadata
    provides: []
    conflicts: []
    replaces: []
    protected: true
    deps: ["python"]
  brotli-testdata:
    name: "brotli-testdata"
    author: ""
    arch: ""
    version: 1.1.0
    build_deps: []
    description: "Generic-purpose lossless compression algorithm - test data"
    license: "MIT"
    sources: ["git+https://github.com/google/brotli"]
    build_script: "brotli-testdata_build.sh"
    anemo_script: ""
    # anemo metadata
    provides: []
    conflicts: []
    replaces: []
    protected: true
    deps: []
