name: "audit"
author: "dvzrv"
arch: "x86_64"
version: 4.0.3
build_deps: []
description: "Userspace components of the audit framework"
license: "GPL-2.0-or-later, LGPL-2.0-or-later"
sources: ["tar+https://github.com/linux-audit/audit-userspace/archive/v4.0.3/audit-userspace-v4.0.3.tar.gz", "git+https://gitlab.archlinux.org/archlinux/packaging/packages/audit"]
build_script: "build.sh"
anemo_script: ""

# anemo metadata
provides: ["libaudit.so=1-64", "libauparse.so=0-64"]
conflicts: []
replaces: []
protected: true
deps: ["glibc", "krb5", "libcap-ng", "libcap-ng.so=0-64", "libgssapi_krb5.so=2-64", "libkrb5.so=3-64"]

splits:
  python-audit:
    name: "python-audit"
    author: ""
    arch: ""
    version: 4.0.3
    build_deps: []
    description: "Userspace components of the audit framework - Python bindings"
    license: "GPL-2.0-or-later, LGPL-2.0-or-later"
    sources: ["https://github.com/linux-audit/audit-userspace/archive/v4.0.3/audit-userspace-v4.0.3.tar.gz", "audit.tmpfiles", "audit-4.0-executable_paths.patch"]
    build_script: "build-python-audit.sh"
    anemo_script: ""
    # anemo metadata
    provides: []
    conflicts: []
    replaces: []
    protected: true
    deps: ["audit", "libaudit.so", "libauparse.so", "glibc", "python"]
