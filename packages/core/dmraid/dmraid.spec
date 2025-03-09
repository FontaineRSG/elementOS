name: "dmraid"
author: "tpowa"
arch: "x86_64"
version: 1.0.0.rc16.3
build_deps: []
description: "Device mapper RAID interface"
license: "GPL-2.0-only"
sources: ["tar+https://people.redhat.com/~heinzm/sw/dmraid/src/dmraid-1.0.0.rc16-3.tar.bz2", "git+https://gitlab.archlinux.org/archlinux/packaging/packages/dmraid"]
build_script: "build.sh"
anemo_script: "anemo.sh"

# anemo metadata
provides: []
conflicts: []
replaces: []
protected: true
deps: ["device-mapper>=2.0.54"]

