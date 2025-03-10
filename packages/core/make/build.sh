build() {
	cd "$dendro_buildroot"
	./configure --prefix=/usr
	make -j$(nproc)
}

prepare(){
  echo "make love and packages -cv2"
}

install() {
	cd "$dendro_buildroot"
	make DESTDIR="${dendro_installloc}" install
}

