build() {
  cd $dendro_buildroot
  ./configure --prefix=/usr
  CODE_COVERAGE_LDFLAGS=${LDFLAGS} make -j$(nproc)
}

install() {
  cd $dendro_buildroot
  make DESTDIR="${dendro_installloc}" install
  make -C doc/reference DESTDIR="${dendro_installloc}" install-data-local
}

prepare(){
  echo "fontaine is beautiful"
}
