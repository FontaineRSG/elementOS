name: "libverto"
author: "andyrtr"
arch: "x86_64"
version: 0.3.2
build_deps: []
description: "Main event loop abstraction library"
license: "MIT"
sources: ["tar+https://github.com/latchset/libverto/releases/download/0.3.2/libverto-0.3.2.tar.gz"]
build_script: "build.sh"
anemo_script: ""

# anemo metadata
provides: ["libverto-libevent.so=1-64", "libverto-module-base", "libverto.so=1-64"]
conflicts: ["krb5<1.19.3-2", "libverto-libevent<0.3.2-4"]
replaces: ["libverto-libevent<0.3.2-4"]
protected: true
deps: ["glibc", "libevent"]
