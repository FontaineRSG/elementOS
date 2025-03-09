build() {
	cd $dendro_buildroot
	./configure --prefix=/usr
	make
}

prepare(){
  echo "nothing to prepare"
}

install() {
	cd "$dendro_buildroot"
	make DESTDIR="${dendro_installloc}" install
	# remove unwanted file
	rm -f "$dendro_installloc"/usr/share/info/standards.info
}

