build() {
  mkdir "${dendro_buildroot}/build-libxcrypt/"
  cd "${dendro_buildroot}/build-libxcrypt/"
  "$dendro_buildroot"/configure \
    --prefix=/usr \
    --disable-static \
    --enable-hashes=strong,glibc \
    --enable-obsolete-api=no \
    --disable-failure-tokens
  make -j$(nproc)
}

install() {
  cd $dendro_buildroot/build-libxcrypt/
  make DESTDIR="${dendro_installloc}" install
}

prepare(){
  echo "yay! new edge-case for dendro xD"
}
