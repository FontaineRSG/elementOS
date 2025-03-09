prepare() {
  echo "no patches found"
}

build() {
  cd "$dendro_buildroot"
  ./autogen.sh
  ./configure --prefix=/usr --with-crypto=libgcrypt
  make -j$(nproc)
}

install() {
  cd "$dendro_buildroot"
  echo "installing with make"
  make DESTDIR="$dendro_installloc" install install_python
  echo "installing serivce"
  # install scrub service/timer
  /usr/bin/install -Dm644 "$dendro_buildroot"/btrfs-scrub@.service "${dendro_installloc}/usr/lib/systemd/system/btrfs-scrub@.service"
  echo "installing timer"
  /usr/bin/install -Dm644 "$dendro_buildroot"/btrfs-scrub@.timer "${dendro_installloc}/usr/lib/systemd/system/btrfs-scrub@.timer"
}

