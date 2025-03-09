name: "bzip2"
author: "eworm"
arch: "x86_64"
version: 1.0.8
build_deps: []
description: "A high-quality data compression program"
license: "BSD"
sources: ["tar+https://sourceware.org/pub/bzip2/bzip2-1.0.8.tar.gz", "git+https://gitlab.archlinux.org/archlinux/packaging/packages/bzip2"]
build_script: "build.sh"
anemo_script: ""

# anemo metadata
provides: ["libbz2.so=1.0-64"]
conflicts: []
replaces: []
protected: true
deps: ["glibc", "sh"]
