build() {
  cd $dendro_buildroot
  ./configure \
    --prefix=/usr
  make -j$(nproc)
}

install() {
  cd $dendro_buildroot
  make DESTDIR="$dendro_installloc" install
  mv "$dendro_installloc"/usr/share/info/{mpc,libmpc}.info
}

prepare(){
  echo "do we need to patch this or na? -cv2 :wq"
}
