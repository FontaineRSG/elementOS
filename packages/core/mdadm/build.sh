build() {
  cp mdadm.conf $dendro_buildroot/mdadm4.4
  cd $dendro_buildroot/mdadm4.4
  make CXFLAGS="$CFLAGS" BINDIR=/usr/bin UDEVDIR=/usr/lib/udev -j$(nproc)
}

install() {
  cd $dendro_buildroot/mdadm4.4

  make INSTALL=/usr/bin/install BINDIR=/usr/bin DESTDIR="$dendro_installloc" UDEVDIR=/usr/lib/udev install
  make SYSTEMD_DIR="$dendro_installloc"/usr/lib/systemd/system install-systemd
  /usr/bin/install -D -m644 mdadm.conf "$dendro_installloc"/etc/mdadm.conf
  /usr/bin/install -D -m755 misc/mdcheck "$dendro_installloc"/usr/share/mdadm/mdcheck
}

prepare(){
  echo "Excuse me? You're saying even some members of The Seven don a counterfeit Vision before mingling with their people? *wheeze*  My apologies — I was just caught off guard by the absurdity of the situation."
}
