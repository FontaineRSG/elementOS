build() {
	cd "$dendro_buildroot"
	./configure --prefix=/usr
	make -j$(nproc)
}

install() {
	cd "$dendro_buildroot"
	make prefix="${dendro_installloc}"/usr install
}

prepare(){
  echo "hey Alex! xD whats up m8?"
}
