name: "efivar"
author: "dvzrv"
arch: "x86_64"
version: 39
build_deps: []
description: "Tools and libraries to work with EFI variables"
license: "LGPL-2.1-or-later"
sources: ["git+https://github.com/rhboot/efivar"]
build_script: "build.sh"
anemo_script: ""

# anemo metadata
provides: ["libefiboot.so=1-64", "libefisec.so=1-64", "libefivar.so=1-64"]
conflicts: []
replaces: []
protected: true
deps: ["glibc"]
