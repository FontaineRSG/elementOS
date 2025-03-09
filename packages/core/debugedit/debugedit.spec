name: "debugedit"
author: "Foxboron"
arch: "x86_64"
version: 5.1
build_deps: []
description: "Tool to mangle source locations in .debug files"
license: "GPL-2.0-or-later, GPL-3.0-or-later, LGPL-2.0-or-later"
sources: ["tar+https://sourceware.org/ftp/debugedit/5.1/debugedit-5.1.tar.xz", "git+https://gitlab.archlinux.org/archlinux/packaging/packages/debugedit"]
build_script: "build.sh"
anemo_script: ""

# anemo metadata
provides: []
conflicts: []
replaces: []
protected: true
deps: ["glibc", "libelf", "xxhash"]
