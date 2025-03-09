name: "flex"
author: "dvzrv"
arch: "x86_64"
version: 2.6.4
build_deps: [help2man]
description: "A tool for generating text-scanning programs"
license: "custom"
sources: ["tar+https://github.com/westes/flex/releases/download/v2.6.4/flex-2.6.4.tar.gz", "git+https://gitlab.archlinux.org/archlinux/packaging/packages/flex"]
build_script: "build.sh"
anemo_script: ""

# anemo metadata
provides: []
conflicts: []
replaces: []
protected: true
deps: ["glibc", "m4", "sh"]
