build() {
  cd "${dendro_buildroot}"

  CFLAGS+=' -ffat-lto-objects' \
  ./configure --prefix=/usr --datadir=/usr/share
	make -j$(nproc)
}

check() {
  cd "${dendro_buildroot}"
  make check
}

install() {
  cd "${dendro_buildroot}"
  make DESTDIR="${dendro_installloc}" install
}

prepare() {
	echo "TUI > GUI"
}
