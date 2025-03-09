prepare() {
  cd "$dendro_buildroot/1.0.0.rc16-3/dmraid"
  patch -Np1 -i "$dendro_buildroot"/dmraid-format-security.patch
}

build() {
  cd "$dendro_buildroot/1.0.0.rc16-3/dmraid"
  ./configure --enable-led --enable-intel_led
  make -j$(nproc) 
}

install() {
  cd "$dendro_buildroot/1.0.0.rc16-3/dmraid"
  make DESTDIR="$dendro_installloc" prefix=/usr sbindir=/usr/bin libdir=/usr/lib mandir=/usr/share/man includedir=/usr/include install
  /usr/bin/install -D -m644 "$dendro_buildroot"/dmraid_install "$dendro_installloc"/usr/lib/initcpio/install/dmraid
  /usr/bin/install -D -m644 "$dendro_buildroot"/dmraid_hook "$dendro_installloc"/usr/lib/initcpio/hooks/dmraid
  /usr/bin/install -D -m644 "$dendro_buildroot"/dmraid_tmpfiles "$dendro_installloc"/usr/lib/tmpfiles.d/dmraid.conf

  # fix permissions
  chmod 644 "$dendro_installloc"/usr/include/dmraid/* "$dendro_installloc"/usr/lib/libdmraid.a

  /usr/bin/install -Dm644 "$dendro_buildroot/dmraid.service" "$dendro_installloc/usr/lib/systemd/system/dmraid.service"
}

