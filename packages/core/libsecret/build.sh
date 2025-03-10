prepare() {
  cd $dendro_buildroot/libsecret0.21.6/

  # Use our test dbus-run-session; needed for communication with Tabrmd
  git revert -n 8ab88d18af05d2c9c79244166f8e4ff3d6cae051
  git revert -n 35381ee638ed9c7e01cdacd24230ca39a6e6b96c

  # Secure memory tests fail in containers
  sed -i '/test-secmem/d' egg/meson.build
}

build() {
  cd $dendro_buildroot/libsecret0.21.6/
  local meson_options=(
    -D tpm2=true
  )

  elementOS-meson build "${meson_options[@]}"
  meson compile -C build
}

install() {
  cd $dendro_buildroot/libsecret0.21.6
  meson install -C build --destdir "$dendro_installloc"
}

