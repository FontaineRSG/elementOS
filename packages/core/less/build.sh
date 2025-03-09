prepare() {
  echo "nothing to prepare"
}

build() {
  cd $dendro_buildroot
  ./configure --prefix=/usr --sysconfdir=/etc --with-regex=pcre2
  make -j$(nproc)
}

install() {
  cd $dendro_buildroot
  make DESTDIR="$dendro_installloc" install
}


