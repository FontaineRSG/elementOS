name: "libsecret"
author: "heftig"
arch: "x86_64"
version: 0.21.6
build_deps: []
description: "Library for storing and retrieving passwords and other secrets"
license: "LGPL-2.1-or-later"
sources: ["git+https://gitlab.gnome.org/GNOME/libsecret.git#tag=0.21.6"]
build_script: "build.sh"
anemo_script: ""

# anemo metadata
provides: ["libsecret-1.so=0-64"]
conflicts: []
replaces: []
protected: true
deps: ["glib2", "glibc", "libgcrypt", "tpm2-tss"]
