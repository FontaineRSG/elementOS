prepare() {
  echo "nothing to prepare"
}

build() {
  cd $dendro_buildroot
  ./configure --prefix=/usr
  make -j$(nproc)
}

install() {
  cd $dendro_buildroot
  make prefix="$dendro_installloc/usr" install
}

