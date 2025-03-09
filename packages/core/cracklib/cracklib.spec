name: "cracklib"
author: "tpowa"
arch: "x86_64"
version: 2.10.3
build_deps: []
description: "Password Checking Library"
license: "GPL-2.0-or-later"
sources: ["tar+https://github.com/cracklib/cracklib/releases/download/v2.10.3/cracklib-2.10.3.tar.gz", "git+https://gitlab.archlinux.org/archlinux/packaging/packages/cracklib"]
build_script: "build.sh"
anemo_script: ""

# anemo metadata
provides: []
conflicts: []
replaces: []
protected: true
deps: ["glibc", "zlib"]
