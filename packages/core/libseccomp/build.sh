prepare() {
  cd $dendro_buildroot
  autoreconf -fiv
}

build() {
  cd $dendro_buildroot
  ./configure --prefix=/usr
  make -j$(nproc)
  cd src/python
  env VERSION_RELEASE=2.5.6 python3 setup.py build
}

install() {
  cd $dendro_buildroot
  make DESTDIR="${dendro_installloc}" install
}

