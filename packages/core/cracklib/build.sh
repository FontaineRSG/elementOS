build() {
  cd $dendro_buildroot
  ./configure --prefix=/usr --sbindir=/usr/bin --without-python
  make -j$(nproc)
}

check() {
  cd $dendro_buildroot
  make check
}

install() {
  cd $dendro_buildroot
  make DESTDIR="$dendro_installloc" install
  # symlink cracklib-small #34778
  mkdir -p "$dendro_installloc"/usr/share/dict
  ln -sf /usr/share/cracklib/cracklib-small "$dendro_installloc"/usr/share/dict/cracklib-small
  sh ./util/cracklib-format dicts/cracklib-small \
    | sh ./util/cracklib-packer "$dendro_installloc"/usr/share/cracklib/pw_dict
}

prepare() {
	echo "Do not take crack"
}
