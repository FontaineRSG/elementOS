name: "logrotate"
author: "pierre"
arch: "x86_64"
version: 3.22.0
build_deps: []
description: "Rotates system logs automatically"
license: "GPL"
sources: ["tar+https://github.com/logrotate/logrotate/releases/download/3.22.0/logrotate-3.22.0.tar.xz"]
build_script: "build.sh"
anemo_script: ""

# anemo metadata
provides: []
conflicts: []
replaces: []
protected: true
deps: ["acl", "gzip", "popt"]
