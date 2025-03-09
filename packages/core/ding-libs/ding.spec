name: "ding-libs"
author: "andyrtr"
arch: "x86_64"
version: 0.6.2
build_deps: [doxygen]
description: "DING is not GNU helper libraries for SSSD and FreeIPA"
license: "GPL-3.0-or-later, LGPL-3.0-or-later"
sources: ["https://github.com/SSSD/ding-libs/releases/download/0.6.2/ding-libs-0.6.2.tar.gz"]
build_script: "build.sh"
anemo_script: ""

# anemo metadata
provides: []
conflicts: []
replaces: []
protected: true
deps: ["glibc"]
