prepare() {
  cd $dendro_buildroot/libpcap1.10.5
  autoreconf -fiv
}

build() {
  local configure_options=(
    --prefix=/usr
    --enable-ipv6
    --enable-bluetooth
    --enable-usb
    --with-libnl
  )

  cd $dendro_buildroot/libpcap1.10.5
  ./configure "${configure_options[@]}"
  make -j$(nproc)
}

install() {
  cd $dendro_buildroot/libpcap1.10.5
  make DESTDIR="$dendro_installloc" install
}

