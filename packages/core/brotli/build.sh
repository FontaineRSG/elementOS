pkgname=('brotli' 'python-brotli' 'brotli-testdata')

build() {
  cd ${dendro_buildroot}/brotli1.1.0
	ls
  python3 -m build --wheel --no-isolation
  cmake -S . -B build \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_SHARED_LIBS=True \
    -DCMAKE_C_FLAGS="$CFLAGS -ffat-lto-objects"
  cmake --build build -v
}

check() {
  cd ${dendro_buildroot}/brotli1.1.0
  local python_version=$(python -c 'import sys; print("".join(map(str, sys.version_info[:2])))')
  PYTHONPATH="$PWD/bin/lib.linux-$CARCH-cpython-${python_version}" python -m unittest discover python "*_test.py"
  cd build
  ctest --output-on-failure --stop-on-failure -j$(nproc)
}

install() {
  depends=('glibc')
  provides=(libbrotlicommon.so libbrotlidec.so libbrotlienc.so)

  cd ${dendro_buildroot}/brotli1.1.0
  DESTDIR="$dendro_installloc" cmake --install build
  local man
  for man in docs/*.?; do
  /usr/bin/install -Dm 644 "$man" "$dendro_installloc/usr/share/man/man${man##*.}/${man##*/}"
  done
  /usr/bin/install -Dm 644 LICENSE -t "$dendro_installloc/usr/share/licenses/$pkgname"
}


prepare() {
	echo "JUST FOR FUN!"
}
