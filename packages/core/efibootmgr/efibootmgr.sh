name: "efibootmgr"
author: "dvzrv"
arch: "x86_64"
version: 18
build_deps: []
description: "Linux user-space application to modify the EFI Boot Manager"
license: "GPL-2.0-or-later"
sources: ["git+https://github.com/rhboot/efibootmgr"]
build_script: "build.sh"
anemo_script: ""

# anemo metadata
provides: []
conflicts: []
replaces: []
protected: true
deps: ["efivar", "glibc", "libefiboot.so=1-64", "libefivar.so=1-64", "popt"]
