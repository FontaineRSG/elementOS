build() {
  cd $dendro_buildroot/
  elementOS-meson libinih58 build \
    -Ddefault_library=shared \
    -Ddistro_install=true \
    -Dwith_INIReader=true
  meson compile -C build
}

install() {
  cd $dendro_buildroot
  DESTDIR="$dendro_installloc" meson install -C build
}

prepare(){
  echo "meson!!! xD"
}

