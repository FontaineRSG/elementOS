name: "libpipeline"
author: "andyrtr"
arch: "x86_64"
version: 1.5.8
build_deps: []
description: "a C library for manipulating pipelines of subprocesses in a flexible and convenient way"
license: "GPL-3.0-or-later"
sources: ["tar+https://download.savannah.gnu.org/releases/libpipeline/libpipeline-1.5.8.tar.gz"]
build_script: "build.sh"
anemo_script: ""

# anemo metadata
provides: []
conflicts: []
replaces: []
protected: true
deps: ["glibc"]
