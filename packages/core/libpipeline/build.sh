build() {
  cd $dendro_buildroot
  ./configure --prefix=/usr
  make -j$(nproc)
}

install() {
  cd $dendro_buildroot
  make DESTDIR="$dendro_installloc/" install
}

prepare(){
  echo "debian's package names are giving me a headache"
}
