prepare() {
  cd $dendro_buildroot
  # apply patch from the source array (should be a pacman feature)
  patch -Np1 < 0001-PR-579-net147-Fix-stack-overrun.patch
  patch -Np1 < 0002-PR-571-jschleus-Some-zip-files-are-misclassified-as-data.patch
}

build() {
  cd $dendro_buildroot

  # Fix linking libmagic (vfork needs libpthread)
  CFLAGS+=" -pthread"

  ./configure \
    --prefix=/usr \
    --datadir=/usr/share/file \
    --enable-fsect-man5 \
    --enable-libseccomp
  make
}

check() {
  cd $dendro_buildroot
  make check
}

install() {
  cd $dendro_buildroot
  make DESTDIR="$dendro_installloc" install
  /usr/bin/install -Dm644 COPYING "$dendro_installloc/usr/share/licenses/file/COPYING"
  libtool --finish $dendro_installloc
}

