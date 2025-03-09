name: "gawk"
author: "tpowa"
arch: "x86_64"
version: 5.3.1
build_deps: []
description: "GNU version of awk"
license: "GPL-3.0-or-later"
sources: ["https://ftp.gnu.org/pub/gnu/gawk/gawk-5.3.1.tar.gz"]
build_script: "build.sh"
anemo_script: ""

# anemo metadata
provides: ["awk"]
conflicts: []
replaces: []
protected: true
deps: ["glibc", "mpfr", "sh"]
