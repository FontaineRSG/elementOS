name: "bison"
author: "tpowa"
arch: "x86_64"
version: 3.8.2
build_deps: []
description: "The GNU general-purpose parser generator"
license: "GPL-3.0-or-later"
sources: ["tar+https://ftp.gnu.org/gnu/bison/bison-3.8.2.tar.xz", "git+https://gitlab.archlinux.org/archlinux/packaging/packages/bison"]
build_script: "build.sh"
anemo_script: ""

# anemo metadata
provides: []
conflicts: []
replaces: []
protected: true
deps: ["gettext", "glibc", "m4", "sh"]
