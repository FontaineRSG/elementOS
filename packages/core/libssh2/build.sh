build() {
  cd "$dendro_buildroot"
  ./configure --prefix=/usr --disable-docker-tests
  make -j$(nproc)
}

prepare(){
  echo "package 70. i am losing my mind - cv2"
}

install() {
  cd "$dendro_buildroot"
  make DESTDIR="$dendro_installloc" install
}

