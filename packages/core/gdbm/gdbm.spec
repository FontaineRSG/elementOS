name: "gdbm"
author: "dvzrv"
arch: "x86_64"
version: 1.24
build_deps: []
description: "GNU database library"
license: "GPL-3.0-or-later"
sources: ["git+https://git.gnu.org.ua/gdbm.git#tag=v1.24", "https://translationproject.org/PO-files/da/gdbm-1.23.90.da.po", "https://translationproject.org/PO-files/de/gdbm-1.23.90.de.po", "https://translationproject.org/PO-files/eo/gdbm-1.23.90.eo.po", "https://translationproject.org/PO-files/es/gdbm-1.23.90.es.po", "https://translationproject.org/PO-files/fi/gdbm-1.23.90.fi.po", "https://translationproject.org/PO-files/fr/gdbm-1.23.90.fr.po", "https://translationproject.org/PO-files/ja/gdbm-1.23.90.ja.po", "https://translationproject.org/PO-files/ka/gdbm-1.23.90.ka.po", "https://translationproject.org/PO-files/pl/gdbm-1.23.90.pl.po", "https://translationproject.org/PO-files/pt_BR/gdbm-1.23.90.pt_BR.po", "https://translationproject.org/PO-files/ro/gdbm-1.23.90.ro.po", "https://translationproject.org/PO-files/ru/gdbm-1.23.90.ru.po", "https://translationproject.org/PO-files/sr/gdbm-1.23.90.sr.po", "https://translationproject.org/PO-files/sv/gdbm-1.23.90.sv.po", "https://translationproject.org/PO-files/uk/gdbm-1.23.90.uk.po", "https://translationproject.org/PO-files/vi/gdbm-1.23.90.vi.po"]
build_script: "build.sh"
anemo_script: ""

# anemo metadata
provides: ["libgdbm.so=6-64", "libgdbm_compat.so=4-64"]
conflicts: []
replaces: []
protected: true
deps: ["glibc", "libreadline.so=8-64", "readline", "sh"]
