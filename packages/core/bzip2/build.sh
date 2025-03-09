prepare() {
  echo "nothing to prepare."
}

build() {
  cd $dendro_buildroot

  make -f Makefile-libbz2_so CC="gcc $CFLAGS $CPPFLAGS $LDFLAGS"
  make bzip2 bzip2recover CC="gcc $CFLAGS $CPPFLAGS $LDFLAGS"
}

install() {
  cd $dendro_buildroot

  /usr/bin/install -dm755 "$dendro_installloc"/usr/{bin,lib,include,share/man/man1}

  /usr/bin/install -m755 bzip2-shared "$dendro_installloc"/usr/bin/bzip2
  /usr/bin/install -m755 bzip2recover bzdiff bzgrep bzmore "$dendro_installloc"/usr/bin
  ln -sf bzip2 "$dendro_installloc"/usr/bin/bunzip2
  ln -sf bzip2 "$dendro_installloc"/usr/bin/bzcat

  cp -a libbz2.so* "$dendro_installloc"/usr/lib
  ln -s libbz2.so.$pkgver "$dendro_installloc"/usr/lib/libbz2.so
  ln -s libbz2.so.$pkgver "$dendro_installloc"/usr/lib/libbz2.so.1 # For compatibility with some other distros

  /usr/bin/install -m644 bzlib.h "$dendro_installloc"/usr/include/

  /usr/bin/install -m644 bzip2.1 "$dendro_installloc"/usr/share/man/man1/
  ln -sf bzip2.1 "$dendro_installloc"/usr/share/man/man1/bunzip2.1
  ln -sf bzip2.1 "$dendro_installloc"/usr/share/man/man1/bzcat.1
  ln -sf bzip2.1 "$dendro_installloc"/usr/share/man/man1/bzip2recover.1

  /usr/bin/install -Dm644 bzip2.pc -t "$dendro_installloc"/usr/lib/pkgconfig
  /usr/bin/install -Dm644 LICENSE "$dendro_installloc"/usr/share/licenses/${pkgname}/LICENSE
}
