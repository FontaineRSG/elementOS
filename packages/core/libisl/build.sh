build() {
  cd "$dendro_buildroot"
  ./configure --prefix=/usr
  make -j$(nproc)
}

install() {
  cd "$dendro_buildroot"

  make DESTDIR="$dendro_installloc" install

  /usr/bin/install -dm755 "${dendro_installloc}"/usr/share/gdb/auto-load/usr/lib/
  mv "${dendro_installloc}"/usr/lib/libisl.so.*-gdb.py "${dendro_installloc}"/usr/share/gdb/auto-load/usr/lib/

  /usr/bin/install -Dm644 LICENSE "${dendro_installloc}"/usr/share/licenses/libisl/LICENSE
}

prepare(){
  echo "i am tired"
}
