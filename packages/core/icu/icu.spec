name: "icu"
author: "andyrtr"
arch: "x86_64"
version: 76.1
build_deps: [python]
description: "International Components for Unicode library"
license: "BSD-2-Clause, BSD-3-Clause, LicenseRef-Unicode-3.0, NAIST-2003"
sources: ["tar+https://github.com/unicode-org/icu/releases/download/release-76-1/icu4c-76_1-src.tgz", "git+https://gitlab.archlinux.org/archlinux/packaging/packages/icu"]
build_script: "build.sh"
anemo_script: ""

# anemo metadata
provides: ["libicudata.so=76-64", "libicui18n.so=76-64", "libicuio.so=76-64", "libicutest.so=76-64", "libicutu.so=76-64", "libicuuc.so=76-64"]
conflicts: []
replaces: []
protected: true
deps: ["gcc-libs", "glibc", "sh"]
