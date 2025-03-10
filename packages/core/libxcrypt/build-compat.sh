build() {
  mkdir "${dendro_buildroot}/build-libxcrypt-compat/"
  cd "${dendro_buildroot}/build-libxcrypt-compat/"
    ../configure \
      --prefix=/usr \
      --disable-static \
      --enable-hashes=strong,glibc \
      --enable-obsolete-api=glibc \
      --disable-failure-tokens
    make
}

install() {
  cd $dendro_buildroot/build-libxcrypt-compat/
  make DESTDIR="${dendro_installloc}" install
  
  rm -rf "${dendro_installloc}"/usr/{include,lib/{lib*.so,pkgconfig},share}
}

prepare(){
  echo "yay! new edge-case for dendro xD"
}
