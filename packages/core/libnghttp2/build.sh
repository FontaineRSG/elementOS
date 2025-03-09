prepare() {
  cd $dendro_buildroot
  cd libnghttp21.65.0

  git config --file=.gitmodules submodule.tests/munit.url ../munit/
  git config --file=.gitmodules submodule.third-party/mruby.url ../mruby/
  git config --file=.gitmodules submodule.tests/neverbleed.url ../neverbleed/

  git submodule init
  git -c protocol.file.allow=always submodule update

  autoreconf -i
}

build() {
  cd $dendro_buildroot
  cd libnghttp21.65.0

  ./configure \
    --prefix=/usr \
    --disable-examples \
    --disable-python-bindings \
    --enable-lib-only
  make -j$(nproc)
}

install() {
  cd $dendro_buildroot
  cd libnghttp21.65.0/lib

  make DESTDIR="$dendro_installloc" install
  /usr/bin/install -Dm644 ../COPYING "$pkgdir/usr/share/licenses/libnghttp2/COPYING"
}

