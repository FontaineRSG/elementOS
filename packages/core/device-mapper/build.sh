build() {
  # build system requires bash:
  # https://www.redhat.com/archives/linux-lvm/2020-January/msg00004.html
  # https://www.gnu.org/software/autoconf/manual/autoconf-2.69/html_node/Defining-Variables.html
  export CONFIG_SHELL=/bin/bash

  cd ${dendro_buildroot}

  ./configure \
    CONFIG_SHELL=/bin/bash \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --enable-cmdlib \
    --enable-dmeventd \
    --enable-lvmpolld \
    --enable-pkgconfig \
    --enable-readline \
    --enable-udev_rules \
    --enable-udev_sync \
    --enable-write_install \
    --with-cache=internal \
    --with-default-dm-run-dir=/run \
    --with-default-locking-dir=/run/lock/lvm \
    --with-default-pid-dir=/run \
    --with-default-run-dir=/run/lvm \
    --with-libexecdir=/usr/lib/lvm2 \
    --with-systemdsystemunitdir=/usr/lib/systemd/system \
    --with-thin=internal \
    --with-udev-prefix=/usr

  make -j$(nproc)

}

install() {

  cd ${dendro_buildroot}

  make DESTDIR="${dendro_installloc}" install_lvm2
  # /etc directories
  /usr/bin/install -d "${dendro_installloc}"/etc/lvm/{archive,backup}
  # extra udev rule for non-systemd initramfs
  /usr/bin/install -D -m0644 udev/69-dm-lvm-initcpio.rules "${dendro_installloc}/usr/lib/initcpio/udev/69-dm-lvm.rules"
  # systemd support
  make DESTDIR="${dendro_installloc}" install_systemd_units
  rm -f "${dendro_installloc}/usr/lib/systemd/system/"dm-*
  /usr/bin/install -d -m0755 "${dendro_installloc}/usr/lib/systemd/system/sysinit.target.wants"
  ln -sf ../lvm2-lvmpolld.socket "${dendro_installloc}/usr/lib/systemd/system/sysinit.target.wants/lvm2-lvmpolld.socket"
  ln -sf ../lvm2-monitor.service "${dendro_installloc}/usr/lib/systemd/system/sysinit.target.wants/lvm2-monitor.service"
  make DESTDIR="${dendro_installloc}" install_systemd_generators
}

prepare() {
	echo "i belive in u"
}

