build() {
  cd $dendro_buildroot/efibootmgr18
  make libdir=/usr/lib sbindir=/usr/bin EFIDIR=element -j$(nproc)
}

install() {
  cd $dendro_buildroot/efibootmgr18
  make DESTDIR="$dendro_installloc" libdir=/usr/lib sbindir=/usr/bin EFIDIR=element install -C efibootmgr
  /usr/bin/install -vDm 644 {AUTHORS,README,README.md,TODO} -t "$dendro_installloc/usr/share/doc/efibootmgr/"
}

prepare(){
  echo "nothing to prepare"
}
