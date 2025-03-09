name: "libassuan"
author: "dvzrv"
arch: "x86_64"
version: 3.0.0
build_deps: []
description: "IPC library used by some GnuPG related software"
license: "FSFULLR, GPL-2.0-or-later, LGPL-2.1-or-later"
sources: ["tar+https://gnupg.org/ftp/gcrypt/libassuan/libassuan-3.0.1.tar.bz2"]
build_script: "build.sh"
anemo_script: ""

# anemo metadata
provides: ["libassuan.so=9-64"]
conflicts: []
replaces: []
protected: true
deps: ["glibc", "libgpg-error", "sh"]
