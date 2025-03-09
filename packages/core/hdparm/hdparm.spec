name: "hdparm"
author: "tpowa"
arch: "x86_64"
version: 9.65
build_deps: []
description: "A shell utility for manipulating Linux IDE drive/driver parameters"
license: "LicenseRef-BSD"
sources: ["tar+https://downloads.sourceforge.net/sourceforge/hdparm/hdparm-9.65.tar.gz", "git+https://gitlab.archlinux.org/archlinux/packaging/packages/hdparm"]
build_script: "build.sh"
anemo_script: ""

# anemo metadata
provides: []
conflicts: []
replaces: []
protected: true
deps: ["glibc"]
