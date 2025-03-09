build() {
  local configure_options=(
    # remove --disable-exec-static-tramp once ghc and gobject-introspection
    # work fine with it enabled (https://github.com/libffi/libffi/pull/647)
    --disable-exec-static-tramp
    --disable-multi-os-directory
    --disable-static
    --enable-pax_emutramp
    --prefix=/usr
  )

  cd $dendro_buildroot
  ./configure "${configure_options[@]}"
  make
}

install() {
  cd $dendro_buildroot
  make DESTDIR="$dendro_installloc" install
}

prepare(){
  echo "dendro builds trees"
}
