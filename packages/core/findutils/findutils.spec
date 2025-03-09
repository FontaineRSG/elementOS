name: "findutils"
author: "tpowa"
arch: "x86_64"
version: 4.10.0
build_deps: [git, wget, python]
description: "GNU utilities to locate files"
license: "GPL-3.0-or-later"
sources: ["git+https://git.savannah.gnu.org/git/findutils.git?signed#tag=v4.10.0"]
build_script: "build.sh"
anemo_script: ""

# anemo metadata
provides: []
conflicts: []
replaces: []
protected: true
deps: ["glibc", "sh"]
