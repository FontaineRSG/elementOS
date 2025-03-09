name: "autoconf"
author: "arojas"
arch: "any"
version: 2.72
build_deps: []
description: "A GNU tool for automatically configuring source code"
license: "GPL2, GPL3, custom"
sources: ["tar+https://ftp.gnu.org/pub/gnu/autoconf/autoconf-2.72.tar.xz"]
build_script: "build.sh"
anemo_script: ""

# anemo metadata
provides: []
conflicts: []
replaces: []
protected: true
deps: ["awk", "diffutils", "m4", "perl", "sh"]
