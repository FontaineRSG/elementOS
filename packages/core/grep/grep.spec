name: "grep"
author: "seblu"
arch: "x86_64"
version: 3.11
build_deps: [texinfo]
description: "A string search utility"
license: "GPL3"
sources: ["tar+https://ftp.gnu.org/gnu/grep/grep-3.11.tar.xz"]
build_script: "build.sh"
anemo_script: ""

# anemo metadata
provides: []
conflicts: []
replaces: []
protected: true
deps: ["glibc", "pcre2"]
