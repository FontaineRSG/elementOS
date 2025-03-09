prepare(){
	echo "nothing to prepare"
}

build() {
  cd $dendro_buildroot
  ./configure --prefix=/usr \
    --disable-static  \
    --disable-error-on-warning
      make -j$(nproc)
}

install() {
  cd $dendro_buildroot
  make DESTDIR="$dendro_installloc" install
  rm "$dendro_installloc"/usr/lib/libguile-3.?.so.*-gdb.scm
  libtool --finish $dendro_installloc
}

