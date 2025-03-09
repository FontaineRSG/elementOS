build() {
  cd "$dendro_buildroot"
  CFLAGS+=' -ffat-lto-objects' \
  ./configure --prefix=/usr
  make -j$(nproc)
}

prepare() {
  echo "warm hello cv2"
}

install() {
  cd "$dendro_buildroot"
  make DESTDIR="$dendro_installloc" install
  /usr/bin/install -Dm644 LICENSE "$dendro_installloc/usr/share/licenses/$pkgname/LICENSE"
}

