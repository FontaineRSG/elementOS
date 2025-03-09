name: "libedit"
author: "tpowa"
arch: "x86_64"
version: 20250104_3.1
build_deps: []
description: "Command line editor library providing generic line editing, history, and tokenization functions"
license: "BSD-3-Clause"
sources: ["tar+https://thrysoee.dk/editline//libedit-20250104-3.1.tar.gz"]
build_script: "build.sh"
anemo_script: ""

# anemo metadata
provides: ["libedit.so=0-64"]
conflicts: []
replaces: []
protected: true
deps: ["glibc", "libncursesw.so=6-64", "ncurses"]
