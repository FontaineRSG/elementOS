build() {
  cd "$dendro_buildroot"
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --sbindir=/usr/bin \
    --disable-static
  make -j$(nproc)
}

install() {
  cd "$dendro_buildroot"
  make DESTDIR="${dendro_installloc}" install
}

prepare(){
  echo "we should automate this"
}

