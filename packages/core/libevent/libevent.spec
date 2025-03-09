name: "libevent"
author: "foutrelis"
arch: "x86_64"
version: 2.1.12
build_deps: []
description: "Event notification library"
license: "BSD"
sources: ["tar+https://github.com/libevent/libevent/releases/download/release-2.1.12-stable/libevent-2.1.12-stable.tar.gz", "git+https://gitlab.archlinux.org/archlinux/packaging/packages/libevent"]
build_script: "build.sh"
anemo_script: ""

# anemo metadata
provides: ["libevent-2.1.so=7-64", "libevent_core-2.1.so=7-64", "libevent_extra-2.1.so=7-64", "libevent_openssl-2.1.so=7-64", "libevent_pthreads-2.1.so=7-64"]
conflicts: []
replaces: []
protected: true
deps: ["openssl"]
