name: "libgcrypt"
author: "andyrtr"
arch: "x86_64"
version: 1.11.0
build_deps: []
description: "General purpose cryptographic library based on the code from GnuPG"
license: "BSD-3-Clause, BSD-3-Clause OR GPL-2.0-only, GPL-2.0-or-later, LGPL-2.0-or-later, LGPL-2.1-or-later, LicenseRef-OCB1, LicenseRef-scancode-public-domain, X11"
sources: ["tar+https://gnupg.org/ftp/gcrypt/libgcrypt/libgcrypt-1.11.0.tar.bz2"]
build_script: "build.sh"
anemo_script: ""

# anemo metadata
provides: []
conflicts: []
replaces: []
protected: true
deps: ["glibc", "libgpg-error"]
