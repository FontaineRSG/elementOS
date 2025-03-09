prepare() {
  cd "${dendro_buildroot}"

  # tests fail due to systemd+libseccomp preventing memory syscalls when building in chroots
  #  t-secmem: line 176: gcry_control (GCRYCTL_INIT_SECMEM, pool_size, 0) failed: General error
  #  FAIL: t-secmem
  #  t-sexp: line 1174: gcry_control (GCRYCTL_INIT_SECMEM, 16384, 0) failed: General error
  #  FAIL: t-sexp
  sed -i "s:t-secmem::" tests/Makefile.am
  sed -i "s:t-sexp::" tests/Makefile.am

  # fix version - due to autoreconf
  sed -i 's/beta=yes/beta=no/; s/tmp="-unknown"/tmp=""/' autogen.sh

  autoreconf -vfi
}

build() {
  cd "${dendro_buildroot}"
  ./configure --prefix=/usr \
	--disable-static \
	--disable-padlock-support
  make
}

install() {
  cd "${dendro_buildroot}"
  make DESTDIR="${dendro_installloc}" install
}

