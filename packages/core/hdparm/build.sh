prepare() {
  cd $dendro_buildroot
  # Enable FULL RELRO
  patch -Np1 -i hdparm9.65/pass-ldflags.patch
}

build() {
  cd $dendro_buildroot
  make -j$(nproc)
}

install() {
  cd $dendro_buildroot
  # install
  mkdir -p "${dendro_installloc}"/usr/bin
  make DESTDIR="${dendro_installloc}" sbindir=/usr/bin install
  /usr/bin/install -m755 contrib/idectl "${dendro_installloc}"/usr/bin
  /usr/bin/install -m755 contrib/ultrabayd "${dendro_installloc}"/usr/bin

  /usr/bin/install -D -m 0644 wiper/README.txt "$dendro_installloc"/usr/share/doc/wiper/README.txt
  /usr/bin/install -D -m 0755 wiper/wiper.sh "$dendro_installloc"/usr/bin/wiper.sh

  #install license file
  /usr/bin/install -D -m 644 LICENSE.TXT "$dendro_installloc"/usr/share/licenses/hdparm/LICENSE.TXT
}

