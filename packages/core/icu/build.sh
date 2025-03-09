prepare() {
  cd $dendro_buildroot/icu/source
  # Required fix for thunderbird 115 to show Calendar and sidebar properly
  # https://bugzilla.mozilla.org/show_bug.cgi?id=1843007
  # https://unicode-org.atlassian.net/browse/ICU-22132
  patch -Np1 < $dendro_buildroot/"icu76.1/ICU-22132.patch"
}

build() {
  cd $dendro_buildroot/icu/source
  ./configure --prefix=/usr \
	--sysconfdir=/etc \
	--mandir=/usr/share/man \
	--sbindir=/usr/bin
  make -j$(nproc)
}

install() {
  cd $dendro_buildroot/icu/source
  make DESTDIR="${dendro_installloc}" install
}

