name: "file"
author: "eworm"
arch: "x86_64"
version: 5.46
build_deps: []
description: "File type identification utility"
license: "custom"
sources: ["tar+https://astron.com/pub/file/file-5.46.tar.gz", "git+https://gitlab.archlinux.org/archlinux/packaging/packages/file"]
build_script: "build.sh"
anemo_script: ""

# anemo metadata
provides: ["libmagic.so=1-64"]
conflicts: []
replaces: []
protected: true
deps: ["bzip2", "glibc", "libseccomp", "libseccomp.so=2-64", "libzstd.so=1-64", "xz", "zlib", "zstd"]
