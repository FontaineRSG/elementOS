build() {
  cd $dendro_buildroot/lz41.10.0/build/meson
  meson setup --prefix=/usr --buildtype=plain build 
  meson configure build -Dcontrib=true -Dexamples=true -Dprograms=true
  meson compile -C build
}

install() {
  cd $dendro_buildroot/lz41.10.0/build/meson
  meson install -C build --destdir "$dendro_installloc"
}

prepare(){
  echo "imanu helps me through this"
}
