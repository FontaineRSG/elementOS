name: "libpcap"
author: "dvzrv"
arch: "x86_64"
version: 1.10.5
build_deps: []
description: "A system-independent interface for user-level packet capture"
license: "BSD-3-Clause"
sources: ["git+https://github.com/the-tcpdump-group/libpcap#tag=libpcap-1.10.5"]
build_script: "build.sh"
anemo_script: ""

# anemo metadata
provides: ["libpcap.so=1-64"]
conflicts: []
replaces: []
protected: true
deps: ["glibc", "libdbus-1.so=3-64", "libnl", "sh"]
