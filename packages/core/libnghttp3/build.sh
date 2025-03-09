prepare() {
  cd $dendro_buildroot
  autoreconf -i
}

build() {
  cd $dendro_buildroot
  ./configure \
    --prefix=/usr
  make
}

install() {
  cd $dendro_buildroot
  make DESTDIR="${dendro_installloc}" install
}

