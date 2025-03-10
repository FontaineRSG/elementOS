name: "libtasn1"
author: "andyrtr"
arch: "x86_64"
version: 4.20.0
build_deps: []
description: "The ASN.1 library used in GNUTLS"
license: "GFDL-1.3-or-later, GPL-3.0-or-later, LGPL-2.1-or-later"
sources: ["https://ftp.gnu.org/gnu/libtasn1/libtasn1-4.20.0.tar.gz"]
build_script: "build.sh"
anemo_script: ""

# anemo metadata
provides: []
conflicts: []
replaces: []
protected: true
deps: ["glibc"]
