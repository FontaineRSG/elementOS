name: "ldns"
author: "eworm"
arch: "x86_64"
version: 1.8.4
build_deps: [libpcap]
description: "Fast DNS library supporting recent RFCs"
license: "custom:BSD"
sources: ["tar+https://www.nlnetlabs.nl/downloads/ldns/ldns-1.8.4.tar.gz"]
build_script: "build.sh"
anemo_script: ""

# anemo metadata
provides: ["drill", "libldns.so=3-64"]
conflicts: []
replaces: []
protected: true
deps: ["dnssec-anchors", "openssl"]
