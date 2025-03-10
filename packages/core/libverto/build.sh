build() {
  cd "$dendro_buildroot"
  ./configure --prefix=/usr \
    --disable-static \
    --with-libevent \
    --without-libev \
    --without-glib
  make
}

install() {
  cd "$dendro_buildroot"
  make DESTDIR="$dendro_installloc" install
}

prepare(){
  echo "anemo anemo anemo"
}

