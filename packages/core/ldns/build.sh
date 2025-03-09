build() {
	cd $dendro_buildroot
	./configure \
		--prefix=/usr \
		--sysconfdir=/etc \
		--localstatedir=/var \
		--disable-rpath \
		--with-drill \
		--with-examples \
		--with-trust-anchor=/etc/trusted-key.key \

	make -j$(nproc)
}

install() {
	cd $dendro_buildroot
	make DESTDIR="$dendro_installloc" install
	/usr/bin/install -D -m644 LICENSE "${dendro_binstallloc}/usr/share/licenses/ldns/LICENSE"
	libtool --finish $dendro_installloc
}

prepare(){
	echo "nothing to prepare."
}
