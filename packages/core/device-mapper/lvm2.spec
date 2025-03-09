name: "lvm2"
author: "eworm"
arch: "x86_64"
version: 2.03.30
build_deps: [git, systemd, libaio, thin-provisioning-tools]
description: "Logical Volume Manager 2 utilities"
license: "GPL2, LGPL2.1"
sources: ["git+https://gitlab.com/lvmteam/lvm2.git", "tar+https://gitlab.archlinux.org/archlinux/packaging/packages/lvm2"]
build_script: "build.sh"
anemo_script: ""

# anemo metadata
provides: []
conflicts: ["lvm", "mkinitcpio<38-1"]
replaces: []
protected: true
deps: ["bash", "device-mapper>=2.03.30", "libaio", "libaio.so=1-64", "libblkid.so=1-64", "libreadline.so=8-64", "libudev.so=1-64", "readline", "systemd-libs", "thin-provisioning-tools", "util-linux-libs"]

splits:
  device-mapper:
    name: "device-mapper"
    author: ""
    arch: ""
    version: 2.03.30
    build_deps: [git, systemd, libaio, thin-provisioning-tools]
    description: "Device mapper userspace library and tools"
    license: "GPL2, LGPL2.1"
    build_script: "device-mapper_build.sh"
    anemo_script: ""
    # anemo metadata
    provides: ["libdevmapper.so", "libdevmapper-event.so"]
    conflicts: []
    replaces: []
    protected: true
    deps: ["glibc", "systemd-libs", "libudev.so"]
