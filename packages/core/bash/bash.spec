name: "bash"
author: "tpowa"
arch: "x86_64"
version: 5.2.037
build_deps: []
description: "The GNU Bourne Again shell"
license: "GPL-3.0-or-later"
sources: ["tar+https://ftp.gnu.org/gnu/bash/bash-5.2.tar.gz", "git+https://gitlab.archlinux.org/archlinux/packaging/packages/bash"]
build_script: "build.sh"
anemo_script: "anemo.sh"

# anemo metadata
provides: ["sh"]
conflicts: []
replaces: []
protected: true
deps: ["glibc", "libreadline.so=8-64", "ncurses", "readline"]
