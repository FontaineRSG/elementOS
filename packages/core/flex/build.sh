prepare() {
  cd "$dendro_buildroot"
  patch -p1 -i "$srcdir"/flex-pie.patch
  autoreconf -fiv
}

build() {
  cd "$dendro_buildroot"
  ./configure --prefix=/usr
  # prevent excessive overlinking due to libtool
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make -j$(nproc)
}

check() {
  make -k check -C $dendro_buildroot
}

install() {
  cd "$dendro_buildroot"

  make DESTDIR="$dendro_installloc" install
  ln -s flex "${dendro_installloc}/usr/bin/lex"

  /usr/bin/install -Dm644 COPYING "$dendro_installloc/usr/share/licenses/$pkgname/license.txt"
}

