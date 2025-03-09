prepare() {
  cd $dendro_buildroot

  # Fix Firefox build
  patch -Np1 -i libevent2.1.12/EVENT__SIZEOF_TIME_T.patch

  # Fix build with OpenSSL 3.0
  patch -Np1 -i libevent2.1.12/libevent-2.1.12-openssl-compat.patch
}

build() {
  cmake -S $dendro_buildroot -B build -G Ninja \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_SKIP_INSTALL_RPATH=TRUE \
    -DEVENT__LIBRARY_TYPE=SHARED \
    -DEVENT__DISABLE_REGRESS=OFF \
    -DEVENT__DOXYGEN=ON
  cmake --build build
}

install() {

  DESTDIR="$dendro_installloc" cmake --install build

  mkdir -p doc/usr/share

}

