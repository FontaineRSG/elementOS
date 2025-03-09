prepare(){
	echo "nothing to prepare"
}

build() {
  cd $dendro_buildroot
  # configure option --without-included-regex removed in 3.7
  # see: https://lists.gnu.org/archive/html/bug-grep/2021-08/msg00028.html
  ./configure --prefix=/usr
  make -j$(nproc)
}

check() {
  cd $dendro_buildroot
  make check
}

install() {
  cd $dendro_buildroot
  make DESTDIR="$dendro_installloc" install
}

