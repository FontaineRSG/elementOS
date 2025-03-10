prepare() {
  cd $dendro_buildroot
  autoreconf -fiv
}

build() {
  cd $dendro_buildroot
  ./configure --prefix=/usr
  # prevent excessive overlinking due to libtool
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make -j$(nproc)
}

install() {
  cd $dendro_buildroot
  make DESTDIR="$dendro_installloc" install
}

