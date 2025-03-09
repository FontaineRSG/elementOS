name: "libgpg-error"
author: "andyrtr"
arch: "x86_64"
version: 1.51
build_deps: []
description: "Support library for libgcrypt"
license: "BSD-3-Clause OR LGPL-2.1-or-later, FSFULLR, GPL-2.0-or-later, LGPL-2.1-or-later"
sources: ["tar+https://www.gnupg.org/ftp/gcrypt/libgpg-error/libgpg-error-1.51.tar.bz2"]
build_script: "build.sh"
anemo_script: ""

# anemo metadata
provides: []
conflicts: []
replaces: []
protected: true
deps: ["glibc", "sh"]
