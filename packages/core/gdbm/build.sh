prepare() {
  local po_file new_po
  cd $dendro_buildroot
  # prepare translations
  touch gdbm/po/LINGUAS
  for po_file in *.po; do
    new_po="${po_file/$pkgname-$_translation_version./}"
    cp -v $po_file $pkgname/po/$new_po
    printf "%s\n" ${new_po/.po/} >> $pkgname/po/LINGUAS
  done
  autoreconf -fiv
}

build() {
  local configure_options=(
    --prefix=/usr
    --enable-libgdbm-compat
  )

  cd $dendro_buildroot
  ./configure "${configure_options[@]}"
  make -j$(nproc)
}

install() {
  cd $dendro_buildroot
  make DESTDIR="$dendro_installloc" install 
  /usr/bin/install -vDm 644 gdbm/{NOTE-WARNING,AUTHORS,NEWS,README} -t "$dendro_buildroot/usr/share/doc/gdbm"
  libtool --finish $dendro_installloc
}
