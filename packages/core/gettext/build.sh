build() {
  cd ${dendro_buildroot}/gettext-0.24
  ./configure \
    --prefix=/usr \
    --libexecdir=/usr/lib \
    --enable-csharp \
    --enable-nls \
    --with-xz \
    --without-included-gettext \
    --without-included-libunistring
  sed -e 's/ -shared / -Wl,-O1,--as-needed\0/g' \
      -i gettext-{tools,runtime,runtime/libasprintf}/libtool 
	make -j$(nproc)
}

prepare() {
	echo "DPROG - GREAT MAN!"
}

check() {
  cd ${dendro_buildroot}
  make check
}

install() {
  cd ${dendro_buildroot}/gettext-0.24
  make DESTDIR="$dendro_installloc" install
}

