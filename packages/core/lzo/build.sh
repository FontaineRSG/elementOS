build() {
  cd $dendro_buildroot
  ./configure --prefix=/usr --enable-shared
  make -j$(nproc)

  # build minilzo
  gcc $CPPFLAGS $CFLAGS -fpic -Iinclude/lzo -o minilzo/minilzo.o -c minilzo/minilzo.c
  gcc $LDFLAGS -shared -o libminilzo.so.0 -Wl,-soname,libminilzo.so.0 minilzo/minilzo.o
}

install() {
  cd $dendro_buildroot
  make DESTDIR="${dendro_installloc}" install

  # install minilzo
  /usr/bin/install -m 755 libminilzo.so.0 "${dendro_installloc}"/usr/lib
  /usr/bin/install -p -m 644 minilzo/minilzo.h ${dendro_installloc}/usr/include/lzo
  cd "${dendro_installloc}"/usr/lib
  ln -s libminilzo.so.0 libminilzo.so
}

prepare(){
  echo "shut up and listen to deep house"
}
