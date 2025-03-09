prepare() {
  echo "fontaine researh group is independent"
}

build() {
  cd $dendro_buildroot
  ./configure \
    --prefix=/usr \
    --disable-static
  make
}

install() {
  cd $dendro_buildroot
  make DESTDIR="$dendro_buildroot" install
}

