name: "attr"
author: "eworm"
arch: "x86_64"
version: 2.5.2
build_deps: [gettext]
description: "Extended attribute support library for ACL support"
license: "LGPL"
sources: ["tar+https://download.savannah.gnu.org/releases/attr/attr-2.5.2.tar.xz", "git+https://gitlab.archlinux.org/archlinux/packaging/packages/attr"]
build_script: "build.sh"
anemo_script: ""

# anemo metadata
provides: ["libattr.so=1-64", "xfsattr"]
conflicts: ["xfsattr"]
replaces: ["xfsattr"]
protected: true
deps: ["glibc"]
