build() {
  cd $dendro_buildroot
  ./configure \
    --prefix=/usr
  make V=1
}

install() {
  cd $dendro_buildroot
  make DESTDIR="${dendro_installloc}" install
}

prepare(){
  echo "nothing to prepare"
}
