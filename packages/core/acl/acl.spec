name: "acl"
author: "eworm"
arch: "x86_64"
version: 2.3.2
build_deps: [attr]
description: "Access control list utilities, libraries and headers"
license: "LGPL"
sources: ["tar+https://download.savannah.gnu.org/releases/acl/acl-2.3.2.tar.gz", "git+https://gitlab.archlinux.org/archlinux/packaging/packages/acl"]
build_script: "build.sh"
anemo_script: ""

# anemo metadata
provides: ["libacl.so=1-64", "xfsacl"]
conflicts: ["xfsacl"]
replaces: ["xfsacl"]
protected: true
deps: ["glibc"]
