build() {
	cd $dendro_buildroot
	./configure --build=$CHOST --prefix=/usr
	make -j$(nproc)
}

install() {
	cd $dendro_buildroot
	make DESTDIR="${dendro_installloc}" install
}

prepare(){
  echo "nothing to prepare"
}

