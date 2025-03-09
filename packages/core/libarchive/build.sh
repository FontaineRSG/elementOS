prepare() {
  cd "$dendro_buildroot/libarchive3.7.7"
  autoreconf -fiv
}

build() {
  cd "$dendro_buildroot/libarchive3.7.7"

  ./configure \
      --prefix=/usr \
      --without-nettle \
      --disable-static
	make -j$(nproc)
}

install() {
  cd "$dendro_buildroot/libarchive3.7.7"
  make DESTDIR="$dendro_installloc" install
}

