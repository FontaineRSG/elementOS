build() {
  cd $dendro_buildroot
  ./configure --prefix=/usr --libexecdir=/usr/lib --sysconfdir=/etc --without-libsigsegv
  make -j$(nproc)
}

prepare(){
  echo "nothing to prepare"
}

install() {
  cd $dendro_buildroot
  make DESTDIR="${dendro_installloc}" install
}

