prepare(){
  echo "nothing to prepare"
}

build() {
  cd $dendro_buildroot/efivar39
  # disable -Werror by default by setting ERRORS to empty string
  make ERRORS='' all
}

install() {
  cd $dendro_buildroot/efivar39
  local make_options=(
    V=1
    DESTDIR="$dendro_installloc/"
    libdir=/usr/lib/
    bindir=/usr/bin/
    mandir=/usr/share/man/
    includedir=/usr/include/
    install
  )

  make "${make_options[@]}"
  /usr/bin/install -vDm 644 {README.md,TODO} -t "$dendro_installloc/usr/share/doc/efivar/"
}

