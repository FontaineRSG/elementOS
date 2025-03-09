prepare() {
  cd "${dendro_buildroot}"
  ./bootstrap
}

build() {
  cd "${dendro_buildroot}"

  # Don't build or install locate because we use mlocate,
  # which is a secure version of locate.
  sed -e '/^SUBDIRS/s/locate//' -e 's/frcode locate updatedb//' -i Makefile.in

  ./configure --prefix=/usr
  # don't build locate, but the docs want a file in there.
  make -C locate dblocation.texi
  make -j$(nproc)
}

check() {
  cd "${dendro_buildroot}"
  make check
}

install() {
  cd "${dendro_buildroot}"
  make DESTDIR="${dendro_installloc}" install
}

