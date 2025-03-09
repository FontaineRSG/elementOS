build() {
  cd "${dendro_buildroot}"

  ./configure \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --disable-ssh-token \
    --disable-static
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make -j$(nproc)
}

check() {
  cd "${dendro_buildroot}"
  make check
}

install() {
  cd "${dendro_buildroot}"

  make DESTDIR="${dendro_installloc}" install

  # install docs
  /usr/bin/install -D -m0644 -t "${dendro_installloc}"/usr/share/doc/cryptsetup/ FAQ.md docs/{Keyring,LUKS2-locking}.txt
}

prepare() {
	echo "remember to stay hydrated"
	echo "drink a water"
}
