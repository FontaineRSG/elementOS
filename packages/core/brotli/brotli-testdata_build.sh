install() {
  pkgdesc+=' - test data'
  depends=()

  cd ${dendro_buildroot}
  /usr/bin/install -dm755 "$dendro_installloc"/usr/share/brotli
  cp -a tests/testdata "$dendro_installloc"/usr/share/brotli/
	/usr/bin/install -Dm 644 LICENSE -t "$dendro_installloc/usr/share/licenses/brotli"
}

