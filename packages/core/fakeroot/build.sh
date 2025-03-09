prepare() {
  cd "${dendro_buildroot}/fakeroot1.37"

  autoreconf -fi
}

build() {
  cd "${dendro_buildroot}/fakeroot1.37"

  ./configure \
    --prefix=/usr \
    --libdir=/usr/lib/libfakeroot \
    --disable-static \
    --with-ipc=sysv
	  make -j$(nproc)

  cd "${dendro_buildroot}/fakeroot1.37/doc"
  po4a -k 0 --rm-backups --variable 'srcdir=../doc/' po4a/po4a.cfg
}

check() {
  cd "${dendro_buildroot}/fakeroot1.37"

  make check
}

install() {
  cd "${dendro_buildroot}/fakeroot1.37"

  make DESTDIR="${dendro_installloc}" install

  /usr/bin/install -dm0755 "${dendro_installloc}/usr/lib/ld.so.conf.d/"
  echo '/usr/lib/libfakeroot' > "${dendro_installloc}/usr/lib/ld.so.conf.d/fakeroot.conf"

  # install README for sysv/tcp usage
  /usr/bin/install -Dm0644 README "${dendro_installloc}/usr/share/doc/fakeroot/README"
}

