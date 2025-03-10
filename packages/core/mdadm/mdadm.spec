name: "mdadm"
author: "tpowa"
arch: "x86_64"
version: 4.4
build_deps: [git]
description: "A tool for managing/monitoring Linux md device arrays, also known as Software RAID"
license: "GPL-2.0-or-later"
sources: ["git+https://git.kernel.org/pub/scm/utils/mdadm/mdadm.git#tag=mdadm-4.4"]
build_script: "build.sh"
anemo_script: ""

# anemo metadata
provides: []
conflicts: ["mkinitcpio<38"]
replaces: ["raidtools"]
protected: true
deps: ["glibc", "systemd"]
