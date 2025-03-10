name: "libusb"
author: "dvzrv"
arch: "x86_64"
version: 1.0.27
build_deps: []
description: "Library that provides generic access to USB devices"
license: "LGPL-2.1-or-later"
sources: ["tar+https://github.com/libusb/libusb/releases/download/v1.0.27/libusb-1.0.27.tar.bz2"]
build_script: "build.sh"
anemo_script: ""

# anemo metadata
provides: ["libusb-1.0.so=0-64"]
conflicts: []
replaces: []
protected: true
deps: ["glibc", "libudev.so=1-64", "systemd-libs"]
