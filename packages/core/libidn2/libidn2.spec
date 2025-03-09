name: "libidn2"
author: "foutrelis"
arch: "x86_64"
version: 2.3.7
build_deps: [ruby-ronn-ng]
description: "Free software implementation of IDNA2008, Punycode and TR46"
license: "GPL2, LGPL3"
sources: ["https://ftp.gnu.org/gnu/libidn/libidn2-2.3.7.tar.gz"]
build_script: "build.sh"
anemo_script: ""

# anemo metadata
provides: ["libidn2.so=0-64"]
conflicts: []
replaces: []
protected: true
deps: ["libunistring", "libunistring.so=5-64"]
