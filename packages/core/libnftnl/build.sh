build() {
  cd $dendro_buildroot
  ./configure --prefix=/usr
  make -j$(nproc)
}

prepare(){
  echo "sometimes i dream about cheese"
}

install() {
  cd $dendro_buildroot
  make DESTDIR="$dendro_installloc" install
}

