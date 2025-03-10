build() {
  cd $dendro_buildroot
  autoreconf -fiv
  ./configure --prefix=/usr --sysconf=/etc
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make -j
}

install() {
  cd $dendro_buildroot
  make DESTDIR="${dendro_installloc}" install
}

prepare(){
  echo "it's so sad that sun microsystems gone defunct :("
}

