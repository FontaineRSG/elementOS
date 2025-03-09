name: "gettext"
author: "tpowa"
arch: "x86_64"
version: 0.24
build_deps: []
description: "GNU internationalization library"
license: "GFDL-1.2-only, GPL-2.0-only, GPL-2.0-or-later, LGPL-2.0-only"
sources: ["git+https://gitlab.archlinux.org/archlinux/packaging/packages/gettext", "tar+https://ftp.gnu.org/pub/gnu/gettext/gettext-0.24.tar.gz"]
build_script: "build.sh"
anemo_script: ""

# anemo metadata
provides: []
conflicts: []
replaces: []
protected: true
deps: ["acl", "attr", "gcc-libs", "gnulib-l10n", "libunistring", "libxml2", "ncurses", "sh"]
