prepare() {
  # remove the nfs entries from /etc/xattr.conf
  # http://lists.gnu.org/archive/html/bug-coreutils/2019-03/msg00008.html
  sed -i '/nfs/d' $dendro_buildroot/xattr.conf
}

build() {
  cd $dendro_buildroot

  ./configure \
    --libdir=/usr/lib \
    --libexecdir=/usr/lib \
    --prefix=/usr \
    --sysconfdir=/etc
  make -j$(nproc)
}

install() {
  cd $dendro_buildroot

  make DESTDIR="${dendro_installloc}" install
}

