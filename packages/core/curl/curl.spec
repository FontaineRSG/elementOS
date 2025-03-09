name: "curl"
author: "eworm"
arch: "x86_64"
version: 8.12.1
build_deps: [git, patchelf]
description: "command line tool and library for transferring data with URLs"
license: "MIT"
sources: ["git+https://github.com/curl/curl.git#tag=curl-8_12_1", "git+https://gitlab.archlinux.org/archlinux/packaging/packages/curl"]
build_script: "build.sh"
anemo_script: ""

# anemo metadata
provides: ["libcurl.so=4"]
conflicts: []
replaces: []
protected: true
deps: ["brotli", "ca-certificates", "krb5", "libbrotlidec.so=1", "libcrypto.so=3", "libgssapi_krb5.so=2", "libidn2", "libidn2.so=0", "libnghttp2", "libnghttp2.so=14", "libnghttp3", "libnghttp3.so=9", "libpsl", "libpsl.so=5", "libssh2", "libssh2.so=1", "libssl.so=3", "libz.so=1", "libzstd.so=1", "openssl", "zlib", "zstd"]

splits:
  libcurl-compat:
    name: "libcurl-compat"
    author: ""
    arch: ""
    version: 8.12.1
    build_deps: [git, patchelf]
    description: "command line tool and library for transferring data with URLs (no versioned symbols)"
    license: "MIT"
    sources: ["git+https://github.com/curl/curl.git#tag=curl-8_12_1"]
    build_script: "libcurl-compat_build.sh"
    anemo_script: ""
    # anemo metadata
    provides: ["libcurl-compat.so"]
    conflicts: []
    replaces: []
    protected: true
    deps: ["curl"]
  libcurl-gnutls:
    name: "libcurl-gnutls"
    author: ""
    arch: ""
    version: 8.12.1
    build_deps: [git, patchelf]
    description: "command line tool and library for transferring data with URLs (no versioned symbols, linked against gnutls)"
    license: "MIT"
    sources: ["git+https://github.com/curl/curl.git#tag=curl-8_12_1"]
    build_script: "libcurl-gnutls_build.sh"
    anemo_script: ""
    # anemo metadata
    provides: ["libcurl-gnutls.so"]
    conflicts: []
    replaces: []
    protected: true
    deps: ["curl", "gnutls"]
