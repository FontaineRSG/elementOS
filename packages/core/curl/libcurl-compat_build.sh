package_libcurl-compat() {
  pkgdesc='command line tool and library for transferring data with URLs (no versioned symbols)'
  depends=('curl')
  provides=('libcurl-compat.so')

	cd "$dendro_buildroot"/curl8.12.1/build-curl-compat

  make -C lib DESTDIR="${pkgdir}" install

  mv "${pkgdir}"/usr/lib/libcurl{,-compat}.so.4.8.0
  rm "${pkgdir}"/usr/lib/libcurl.{a,so}*
  for version in 3 4.0.0 4.1.0 4.2.0 4.3.0 4.4.0 4.5.0 4.6.0 4.7.0; do
    ln -s libcurl-compat.so.4.8.0 "${pkgdir}"/usr/lib/libcurl.so.${version}
    ln -s libcurl-compat.so.4.8.0 "${pkgdir}"/usr/lib/libcurl-compat.so.${version}
  done

  /usr/bin/install -dm 0755 "${pkgdir}"/usr/share/licenses
  ln -s curl "${pkgdir}"/usr/share/licenses/libcurl-compat
}
