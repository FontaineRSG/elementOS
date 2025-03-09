build() {
  cd $dendro_buildroot
  local cmake_options=(
    -B build
    -D CMAKE_BUILD_TYPE=None
    -D CMAKE_INSTALL_PREFIX=/usr
    -S expat2.6.4/expat
    -W no-dev
  )

  cmake "${cmake_options[@]}"
  cmake --build build --verbose
}

install() {
  cd $dendro_buildroot
  DESTDIR="$dendro_installloc" cmake --install build
  /usr/bin/install -vDm 644 expat2.6.4/expat/COPYING -t "$dendro_installloc/usr/share/licenses/expat/"
  /usr/bin/install -vDm 644 expat2.6.4/expat/{AUTHORS,Changes,README.md} -t "$dendro_installloc/usr/share/doc/expat/"
}

prepare(){
  echo "nothing to prepare"
}

