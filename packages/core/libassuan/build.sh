build() {
  cd $dendro_buildroot
  ./configure --prefix=/usr
  make -j$(nproc)
}

prepare(){
  echo "nothing to prepare"
}

install() {
  cd $dendro_buildroot
  make DESTDIR="$dendro_installloc" install
}

