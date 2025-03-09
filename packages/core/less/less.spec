name: "less"
author: "arojas"
arch: "x86_64"
version: 668
build_deps: []
description: "A terminal based program for viewing text files"
license: "BSD-2-Clause, GPL-3.0-or-later"
sources: ["https://www.greenwoodsoftware.com/less/less-668.tar.gz"]
build_script: "build.sh"
anemo_script: ""

# anemo metadata
provides: []
conflicts: []
replaces: []
protected: true
deps: ["glibc", "ncurses", "pcre2"]
