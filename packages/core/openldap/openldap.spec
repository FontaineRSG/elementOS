name: "openldap"
author: "freswa"
arch: "x86_64"
version: 2.6.9
build_deps: [libtool, libsasl, util-linux, chrpath, unixodbc, libsodium, systemd]
description: "Lightweight Directory Access Protocol (LDAP) client and server"
license: "custom"
sources: ["https://www.openldap.org/software/download/OpenLDAP/openldap-release/openldap-2.6.9.tgz"]
build_script: "build.sh"
anemo_script: ""

# anemo metadata
provides: []
conflicts: []
replaces: []
protected: true
deps: ["libldap>=2.6.9", "libsodium", "libtool", "perl", "systemd-libs", "unixodbc"]

splits:
  libldap:
    name: "libldap"
    author: ""
    arch: ""
    version: 2.6.9
    build_deps: [libtool, libsasl, util-linux, chrpath, unixodbc, libsodium, systemd]
    description: "Lightweight Directory Access Protocol (LDAP) client libraries"
    license: "custom"
    build_script: "build-libldap.sh"
    anemo_script: ""
    # anemo metadata
    provides: []
    conflicts: []
    replaces: []
    protected: true
    deps: ["libsasl"]
