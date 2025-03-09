prepare() {
  cd "$dendro_buildroot"

  # set correct fhs structure
  patch -Np1 -i iproute26.13.0/0001-make-iproute2-fhs-compliant.patch

  # use Berkeley DB 5.3
  patch -Np1 -i iproute26.13.0/0002-bdb-5-3.patch
}

build() {
  cd "$dendro_buildroot"

  ./configure
  make DBM_INCLUDE='/usr/include/db5.3' -j$(nproc)
}

install() {
  cd "$dendro_buildroot"

  make DESTDIR="${dendro_installloc}" SBINDIR="/usr/bin" install
}

