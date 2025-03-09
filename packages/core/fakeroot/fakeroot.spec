name: "fakeroot"
author: "eworm"
arch: "x86_64"
version: 1.37
build_deps: [git, systemd, po4a]
description: "Tool for simulating superuser privileges"
license: "GPL-3.0-or-later"
sources: ["git+https://salsa.debian.org/clint/fakeroot.git", "git+https://gitlab.archlinux.org/archlinux/packaging/packages/fakeroot"]
build_script: "build.sh"
anemo_script: "anemo.sh"

# anemo metadata
provides: []
conflicts: []
replaces: []
protected: true
deps: ["filesystem", "glibc", "sed", "sh", "util-linux"]
