name: "libseccomp"
author: "jelle"
arch: "x86_64"
version: 2.5.5
build_deps: []
description: "Enhanced seccomp library"
license: "LGPL2.1"
sources: ["tar+https://github.com/seccomp/libseccomp/releases/download/v2.5.6/libseccomp-2.5.6.tar.gz"]
build_script: "build.sh"
anemo_script: ""

# anemo metadata
provides: ["libseccomp.so=2-64"]
conflicts: []
replaces: []
protected: true
deps: ["glibc"]

splits:
  python-libseccomp:
    name: "python-libseccomp"
    author: ""
    arch: ""
    version: 2.5.5
    build_deps: []
    description: ""
    license: "LGPL2.1"
    build_script: "build-py.sh"
    anemo_script: ""
    # anemo metadata
    provides: []
    conflicts: []
    replaces: []
    protected: true
    deps: ["python", "glibc"]
