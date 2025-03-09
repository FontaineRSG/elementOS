build() {
  cd $dendro_buildroot

  ./configure \
    --libdir=/usr/lib \
    --libexecdir=/usr/lib \
    --prefix=/usr
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make -j$(nproc)
}

install() {
  cd $dendro_buildroot

  make DESTDIR="${dendro_installloc}" install
}

prepare() {
	echo "lets make some fun"
}

