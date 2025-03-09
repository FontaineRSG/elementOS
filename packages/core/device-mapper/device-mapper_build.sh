install(){
  pkgdesc="Device mapper userspace library and tools"
  url="http://sourceware.org/dm/"
  depends=('glibc' 'systemd-libs' 'libudev.so')
  provides=('libdevmapper.so'
  'libdevmapper-event.so')

  cd ${dendro_buildroot}

  make DESTDIR="${dendro_installloc}" install_device-mapper
  # extra udev rule for device-mapper in initramfs
  /usr/bin/install -D -m0644 "${srcdir}/11-dm-initramfs.rules" "${dendro_installloc}/usr/lib/initcpio/udev/11-dm-initramfs.rules"
  # Install dmeventd socket and service
  make DESTDIR="${dendro_installloc}" install_systemd_units
  rm -f "${dendro_installloc}/usr/lib/systemd/system/"{blk-availability.service,lvm*}
  /usr/bin/install -d -m0755 "${dendro_installloc}/usr/lib/systemd/system/sockets.target.wants"
  ln -sf ../dm-event.socket "${dendro_installloc}/usr/lib/systemd/system/sockets.target.wants/dm-event.socket"
}

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

prepare() {
	echo "fuck nvide"
}
