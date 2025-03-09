build() {
  cd $dendro_buildroot
  make -C src -j$(nproc)
}

install() {
  cd $dendro_buildroot
  make -C src DESTDIR="${dendro_installloc}" LIBSUBDIR=lib install install_headers
}

prepare(){
  echo "nothing to prepare"
}

