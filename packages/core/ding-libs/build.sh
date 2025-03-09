prepare(){
  echo "nothing to prepare"
}

build() {
  cd $dendro_buildroot
  ./configure --prefix=/usr --disable-static
  make all docs -j$(nproc)
}

install() {
  cd $dendro_buildroot
  make DESTDIR="$dendro_installloc/" install
  libtool --finish $dendro_installloc
} 

