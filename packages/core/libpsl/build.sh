prepare() {
  cd $dendro_buildroot
  rm -frv list
  autoreconf -fiv
}

build() {
  cd $dendro_buildroot
  ./configure \
    --prefix=/usr \
    --disable-static \
    --disable-dependency-tracking \
    --enable-man \
    --enable-gtk-doc \
    --enable-{builtin,runtime}=libidn2 \
    --with-psl-file=/usr/share/publicsuffix/effective_tld_names.dat \
    --with-psl-testfile=/usr/share/publicsuffix/test_psl.txt
  LC_CTYPE=en_US.UTF-8 make -j$(nproc)
}

install() {
  cd $dendro_buildroot
  make DESTDIR="${dendro_installloc}" install
}

